package fis.com.vn.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import fis.com.vn.entities.PayLoadFox;
import fis.com.vn.entities.PaymentResponse;
import fis.com.vn.entities.TransactionResponse;
import fis.com.vn.exception.ErrorException;
import fis.com.vn.repository.LoanDetailRepository;
import fis.com.vn.repository.LoanRepository;
import fis.com.vn.repository.UserInfoRepository;
import fis.com.vn.repository.UserModuleRepository;
import fis.com.vn.table.Loan;
import fis.com.vn.table.LoanDetail;
import fis.com.vn.table.UserInfo;
import fis.com.vn.table.UserModule;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Controller
public class LoanController extends BaseController {

	@Autowired
	LoanRepository loanRepository;

	@Autowired
	LoanDetailRepository detailRepository;

	@Autowired
	UserInfoRepository userInfoRepository;
	@Autowired
	UserModuleRepository userModuleRepository;

	@GetMapping(value = "/loan")
	public String getLoan(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams) {
		List<Loan> loans = (List<Loan>) loanRepository
				.findAllLoanBySoCmt(req.getSession().getAttribute("soCmt").toString());
		if (loans.isEmpty()) {
			return "loan/loan";
		}

		model.addAttribute("loans", loans);

		return "loan/loan";
	}

	@GetMapping(value = "/loan/detail")
	public String getLoanDetail(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams)
			throws Exception {

		if (StringUtils.isEmpty(allParams.get("id"))) {
			throw new Exception(language.getMessage("Không tồn tại bản ghi"));
		}
		LoanDetail LoanDetail = detailRepository.findById(Long.valueOf(allParams.get("id"))).get();
		Loan Loan = loanRepository.findByIdLoan(Long.valueOf(allParams.get("id")));
		if (LoanDetail == null) {
			throw new Exception(language.getMessage("khong_ton_tai_ban_ghi"));
		}
		System.err.println("loandetail: " + LoanDetail.toString());

		model.addAttribute("Loan", Loan);
		model.addAttribute("LoanDetail", LoanDetail);

		return "loan/chiTietHopDong";

	}

	@GetMapping(value = "/loan/thanhToan")
	public String getLoanThanhToan(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams)
			throws Exception {

		if (StringUtils.isEmpty(allParams.get("id"))) {
			throw new Exception(language.getMessage("Không tồn tại bản ghi"));
		}
		LoanDetail LoanDetail = detailRepository.findById(Long.valueOf(allParams.get("id"))).get();
		Loan Loan = loanRepository.findByIdLoan(Long.valueOf(allParams.get("id")));
		if (LoanDetail == null) {
			throw new Exception(language.getMessage("khong_ton_tai_ban_ghi"));
		}
		System.err.println("loandetail: " + LoanDetail.toString());

		model.addAttribute("Loan", Loan);
		model.addAttribute("LoanDetail", LoanDetail);

		return "loan/chiTietHopDong";

	}

	@GetMapping(value = "/loan/kieuTT")

	public String getChiTietTT(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams)
			throws Exception {

		if (StringUtils.isEmpty(allParams.get("id"))) {
			throw new Exception(language.getMessage("Không tồn tại bản ghi"));
		}
		LoanDetail LoanDetail = detailRepository.findById(Long.valueOf(allParams.get("id"))).get();
		Loan Loan = loanRepository.findByIdLoan(Long.valueOf(allParams.get("id")));
		if (LoanDetail == null) {
			throw new Exception(language.getMessage("khong_ton_tai_ban_ghi"));
		}
		System.err.println("loandetail: " + LoanDetail.toString());

		model.addAttribute("Loan", Loan);
		model.addAttribute("LoanDetail", LoanDetail);
		req.getSession().setAttribute("orderId", Loan.getSoHopDong());
		return "loan/thanhToanKhoanVay";

	}

	@GetMapping(value = "/loan/truyvanGd/{orderId}/{cmt}")
	public String getTruyVanGd(Model model, HttpServletRequest req, @PathVariable("orderId") String orderId,
			@PathVariable("cmt") String cmt) throws Exception {

		Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();

		System.err.println("orderId: " + orderId);

		UserInfo userInfo = userInfoRepository.findBySoCmt(cmt);
		if (userInfo == null)
			throw new ErrorException("orderId is incorrect");

		String[] groupIds = userInfo.getGroupId().split(",");

		List<UserModule> userModules = userModuleRepository.selectGroupId(groupIds);

		TransactionResponse transactionResponse = gson.fromJson(truyVanGdich(orderId), TransactionResponse.class);
		System.err.println("transactionResponse: " + transactionResponse.toString());
		String soHd = transactionResponse.getOrder().getId().replace("MID_", "");
		System.err.println("soHd:" + soHd.toString());
		Loan loan = loanRepository.findBySoHopDong(soHd);
		if (transactionResponse.getTxn().getResult_code().equals("200")) {
			loan.setTrangThai("success");
			loanRepository.save(loan);
		}

		LoanDetail loanDetail = detailRepository.findByIdLoan(loan.getIdLoan());

		req.getSession().setAttribute("userModuleMenus", userModules);
		req.getSession().setAttribute("username", userInfo.getUsername());

		req.getSession().setAttribute("emailUser", userInfo.getEmail());
		req.getSession().setAttribute("userid", userInfo.getId());
		req.getSession().setAttribute("khuVuc", userInfo.getKhuVuc());
		req.getSession().setAttribute("cmt", userInfo.getSoCmt());

		model.addAttribute("userModuleMenus", userModules);
		model.addAttribute("Loan", loan);
		model.addAttribute("LoanDetail", loanDetail);
		model.addAttribute("giaodich", transactionResponse.getTxn().getMessage());
		model.addAttribute("result_code", transactionResponse.getTxn().getResult_code());

		return "loan/chiTietHopDong";

	}

	@PostMapping(value = "/loan/truyvanGd/{orderId}/{cmt}")
	public String postTruyVanGd(Model model, HttpServletRequest req, @PathVariable("orderId") String orderId,
			@PathVariable("cmt") String cmt) throws Exception {

		Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();

		System.err.println("orderId: " + orderId);

		UserInfo userInfo = userInfoRepository.findBySoCmt(cmt);
		if (userInfo == null)
			throw new ErrorException("orderId is incorrect");

		String[] groupIds = userInfo.getGroupId().split(",");

		List<UserModule> userModules = userModuleRepository.selectGroupId(groupIds);

		TransactionResponse transactionResponse = gson.fromJson(truyVanGdich(orderId), TransactionResponse.class);
		System.err.println("transactionResponse: " + transactionResponse.toString());
		String soHd = transactionResponse.getOrder().getId().replace("MID_", "");
		System.err.println("soHd:" + soHd.toString());
		Loan loan = loanRepository.findBySoHopDong(soHd);
		if (transactionResponse.getTxn().getResult_code().equals("200")) {
			loan.setTrangThai("success");
			loanRepository.save(loan);
		}

		LoanDetail loanDetail = detailRepository.findByIdLoan(loan.getIdLoan());

		req.getSession().setAttribute("userModuleMenus", userModules);
		req.getSession().setAttribute("username", userInfo.getUsername());

		req.getSession().setAttribute("emailUser", userInfo.getEmail());
		req.getSession().setAttribute("userid", userInfo.getId());
		req.getSession().setAttribute("khuVuc", userInfo.getKhuVuc());
		req.getSession().setAttribute("cmt", userInfo.getSoCmt());

		model.addAttribute("userModuleMenus", userModules);
		model.addAttribute("Loan", loan);
		model.addAttribute("LoanDetail", loanDetail);
		model.addAttribute("giaodich", transactionResponse.getTxn().getMessage());
		model.addAttribute("result_code", transactionResponse.getTxn().getResult_code());

		return "loan/chiTietHopDong";

	}

	@PostMapping(value = "/loan/trangthaiGd/{orderId}")
	public String postTrangthaiGd(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams,
			@PathVariable("orderId") String orderId) throws Exception {

		Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();

		System.err.println("giaodich: " + truyVanGdich(orderId));

		TransactionResponse transactionResponse = gson.fromJson(truyVanGdich(orderId), TransactionResponse.class);
		System.err.println("transactionResponse: " + transactionResponse.toString());
		String soHd = transactionResponse.getOrder().getId().replace("MID_", "");
		System.err.println("soHd:" + soHd.toString());
		Loan loan = loanRepository.findBySoHopDong(soHd);
		if (transactionResponse.getTxn().getResult_code().equals("200")) {
			loan.setTrangThai("success");
			loanRepository.save(loan);
		}
		model.addAttribute("message", transactionResponse.getTxn().getMessage());
		model.addAttribute("txn", transactionResponse.getTxn());

		return "loan/sussces";

	}

	@GetMapping(value = "/loan/trangthaiGd/{orderId}")
	public String getTrangthaiGd(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams,
			@PathVariable("orderId") String orderId) throws Exception {

		Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();

		System.err.println("giaodich: " + truyVanGdich(orderId));

		TransactionResponse transactionResponse = gson.fromJson(truyVanGdich(orderId), TransactionResponse.class);
		System.err.println("transactionResponse: " + transactionResponse.toString());
		String soHd = transactionResponse.getOrder().getId().replace("MID_", "");
		System.err.println("soHd:" + soHd.toString());
		Loan loan = loanRepository.findBySoHopDong(soHd);
		if (transactionResponse.getTxn().getResult_code().equals("200")) {
			loan.setTrangThai("success");
			loanRepository.save(loan);
		}
		model.addAttribute("message", transactionResponse.getTxn().getMessage());
		model.addAttribute("txn", transactionResponse.getTxn());

		return "loan/sussces";

	}

	@PostMapping(value = "/loan/thanhToan")
	@ResponseBody
	public String thanhToan(Model model, HttpServletRequest req,
			@org.springframework.web.bind.annotation.RequestBody String data) throws Exception {

		Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
		PayLoadFox payLoadFox = gson.fromJson(data, PayLoadFox.class);
		System.err.println("payLoadFox: " + payLoadFox.toString());
		PaymentResponse paymentResponse = gson.fromJson(
				initiatePayment(payLoadFox.getOrder_id(), payLoadFox.getAmount()).toString(), PaymentResponse.class);

		System.err.println("paymentResponse.paymentUrl: " + paymentResponse.toString());
		req.getSession().setAttribute("orderId", payLoadFox.getOrder_id());

		return paymentResponse.getPaymentUrl();

	}

	@GetMapping(value = "/loan/thanhToanSom")
	public String thanhToanSom(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams)
			throws Exception {
		List<Loan> loans = loanRepository.getAllLoans();

		model.addAttribute("loans", loans);

		return "loan/thanhToanSom";

	}

	@GetMapping(value = "/loan/duToanKhoanVay")
	public String duToanKhoanVay(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams)
			throws Exception {

		return "loan/duToanKhoanVay";

	}

	@GetMapping(value = "/loan/kieuTTSom")

	public String thanhToanKhoanVaySom(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams)
			throws Exception {
		req.getSession().getAttribute("id");
		if (StringUtils.isEmpty(allParams.get("soHD"))) {
			throw new Exception(language.getMessage("Không tồn tại bản ghi"));
		}
		Loan Loan = loanRepository.findBySoHopDong(allParams.get("soHD").toString());
		LoanDetail LoanDetail = detailRepository.findById(Loan.getIdLoan()).get();

		if (LoanDetail == null) {
			throw new Exception(language.getMessage("khong_ton_tai_ban_ghi"));
		}
		LoanDetail.setTienTToan(req.getSession().getAttribute("tongSTTT").toString());
		detailRepository.save(LoanDetail);
		System.err.println("loandetail: " + LoanDetail.toString());

		model.addAttribute("Loan", Loan);
		model.addAttribute("LoanDetail", LoanDetail);
		req.getSession().setAttribute("orderId", Loan.getSoHopDong());
		return "loan/thanhToanKhoanVay";

	}

	public String encryptsha256Hex(String originalString) throws NoSuchAlgorithmException {
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] hash = digest.digest(originalString.getBytes(StandardCharsets.UTF_8));
		StringBuilder hexString = new StringBuilder(2 * hash.length);
		for (int i = 0; i < hash.length; i++) {
			String hex = Integer.toHexString(0xff & hash[i]);
			if (hex.length() == 1) {
				hexString.append('0');
			}
			hexString.append(hex);
		}
		return hexString.toString();
	}

	public String initiatePayment(String orderId, String amount) throws IOException {
		String secretKey = "FF541113D1FF51075A4571AD5A59FB4EDC8DA4A6F98128D50E8769FF2DE8C5D2";

		Map<String, String> data1 = new LinkedHashMap<>();
		data1.put("version", "3.0");
		data1.put("merchant_id", "e1f6d22a-dd85-4b67-8a8f-baacf7596e32");
		data1.put("terminal_id", "90f77198-266d-4720-9eb3-a8638cfef244");
		data1.put("order_id", "MID_" + orderId);
		data1.put("payment_method", "");
		data1.put("amount", amount);
		data1.put("currency", "VND");
		data1.put("device_id", "00040000-00000000-00RRXXXX-XXZZZZZZ");
		data1.put("return_token", "true");
		data1.put("token", "");
		data1.put("description", "DES_1659806144");
		data1.put("items", "");
		data1.put("customer", "");
		data1.put("return_url", "https://fpt.aeyes.online/toyota/loan/truyvanGd/" + orderId + "/067345345435");
		data1.put("cancel_url", "https://fpt.aeyes.online/toyota/loan/truyvanGd/" + orderId + "/067345345435");

		System.err.println("data1: " + data1.toString());

		String signature = getSignature(data1, secretKey);
		System.err.println("signature: " + signature.toString());
		OkHttpClient client = new OkHttpClient().newBuilder().build();
		MediaType mediaType = MediaType.parse("application/json");
		RequestBody body = RequestBody.create(mediaType, "{\r\n" + "    \"version\": \"3.0\",\r\n"
				+ "    \"merchant_id\": \"e1f6d22a-dd85-4b67-8a8f-baacf7596e32\",\r\n"
				+ "    \"terminal_id\": \"90f77198-266d-4720-9eb3-a8638cfef244\",\r\n" + "    \"order_id\": \"MID_"
				+ orderId + "\",\r\n" + "    \"payment_method\": \"\",\r\n" + "	\"amount\": \"" + amount + "\",\r\n"
				+ "	\"currency\": \"VND\",\r\n" + "	\"device_id\": \"00040000-00000000-00RRXXXX-XXZZZZZZ\",\r\n"
				+ "    \"return_token\": true,\r\n" + "    \"token\": \"\",\r\n"
				+ "    \"description\": \"DES_1659806144\",\r\n" + "	\"items\": \"\",\r\n"
				+ "	\"customer\": \"\",\r\n" + "    \"return_url\": \"https://fpt.aeyes.online/toyota/loan/truyvanGd/"
				+ orderId + "/067345345435\",\r\n"
				+ "    \"cancel_url\": \"https://fpt.aeyes.online/toyota/loan/truyvanGd/" + orderId
				+ "/067345345435\",\r\n" + "    \"signature\": \"" + signature + "\"\r\n" + "}");
		Request request = new Request.Builder().url("https://portal-staging.foxpay.vn/payment/initiate")
				.method("POST", body).addHeader("Content-Type", "application/json").build();

		Response response = client.newCall(request).execute();
		System.err.println("response: " + response.toString());

		if (response.code() == 200) {
			String text = response.body().string();
			System.err.println("text: " + text.toString());
			response.body().close();
			response.close();
			return text;
		} else {
			return null;
		}
	}

	public String initiatePaymentApp(String orderId, String amount) throws IOException {
		String secretKey = "FF541113D1FF51075A4571AD5A59FB4EDC8DA4A6F98128D50E8769FF2DE8C5D2";

		Map<String, String> data1 = new LinkedHashMap<>();
		data1.put("version", "3.0");
		data1.put("merchant_id", "e1f6d22a-dd85-4b67-8a8f-baacf7596e32");
		data1.put("terminal_id", "90f77198-266d-4720-9eb3-a8638cfef244");
		data1.put("order_id", "MID_" + orderId);
		data1.put("payment_method", "");
		data1.put("amount", amount);
		data1.put("currency", "VND");
		data1.put("device_id", "00040000-00000000-00RRXXXX-XXZZZZZZ");
		data1.put("return_token", "true");
		data1.put("token", "");
		data1.put("description", "DES_1659806144");
		data1.put("items", "");
		data1.put("customer", "");
		data1.put("return_url", "https://fpt.aeyes.online/toyota/loan/trangthaiGd/" + orderId + "");
		data1.put("cancel_url", "https://fpt.aeyes.online/toyota/loan/trangthaiGd/" + orderId + "");
		System.err.println("data1: " + data1.toString());
		String signature = getSignature(data1, secretKey);
		System.err.println("signature: " + signature.toString());
		OkHttpClient client = new OkHttpClient().newBuilder().build();
		MediaType mediaType = MediaType.parse("application/json");
		RequestBody body = RequestBody.create(mediaType, "{\r\n" + "    \"version\": \"3.0\",\r\n"
				+ "    \"merchant_id\": \"e1f6d22a-dd85-4b67-8a8f-baacf7596e32\",\r\n"
				+ "    \"terminal_id\": \"90f77198-266d-4720-9eb3-a8638cfef244\",\r\n" + "    \"order_id\": \"MID_"
				+ orderId + "\",\r\n" + "    \"payment_method\": \"\",\r\n" + "	\"amount\": \"" + amount + "\",\r\n"
				+ "	\"currency\": \"VND\",\r\n" + "	\"device_id\": \"00040000-00000000-00RRXXXX-XXZZZZZZ\",\r\n"
				+ "    \"return_token\": true,\r\n" + "    \"token\": \"\",\r\n"
				+ "    \"description\": \"DES_1659806144\",\r\n" + "	\"items\": \"\",\r\n"
				+ "	\"customer\": \"\",\r\n" + "    \"return_url\": \"https://fpt.aeyes.online/toyota/loan/trangthaiGd/"
				+ orderId + "\",\r\n" + "    \"cancel_url\": \"https://fpt.aeyes.online/toyota/loan/trangthaiGd/"
				+ orderId + "\",\r\n" + "    \"signature\": \"" + signature + "\"\r\n" + "}");
		Request request = new Request.Builder().url("https://portal-staging.foxpay.vn/payment/initiate")
				.method("POST", body).addHeader("Content-Type", "application/json").build();

		Response response = client.newCall(request).execute();
		System.err.println("response: " + response.toString());

		if (response.code() == 200) {
			String text = response.body().string();
			System.err.println("text: " + text.toString());
			response.body().close();
			response.close();
			return text;
		} else {
			return null;
		}
	}

	public String getSignature(Map<String, String> data, String secretKey) {
		StringBuilder stringBuilder = new StringBuilder();
		for (Map.Entry<String, String> entry : data.entrySet()) {
			if (!StringUtils.isBlank(entry.getValue())) {
				stringBuilder.append(entry.getValue());
			}
		}

		stringBuilder.append(secretKey);

		return DigestUtils.sha256Hex(stringBuilder.toString());
	}

	public String truyVanGdich(String orderId) throws IOException {

		String secretKey = "FF541113D1FF51075A4571AD5A59FB4EDC8DA4A6F98128D50E8769FF2DE8C5D2";
		Map<String, String> data = new LinkedHashMap<>();
		data.put("version", "1.0");
		data.put("merchant_id", "e1f6d22a-dd85-4b67-8a8f-baacf7596e32");
		data.put("terminal_id", "90f77198-266d-4720-9eb3-a8638cfef244");
		data.put("order_id", "MID_" + orderId);

		OkHttpClient client = new OkHttpClient().newBuilder().build();
		MediaType mediaType = MediaType.parse("application/json");
		RequestBody body = RequestBody.create(mediaType, "{\r\n" + "    \"version\": \"1.0\",\r\n"
				+ "    \"merchant_id\": \"e1f6d22a-dd85-4b67-8a8f-baacf7596e32\",\r\n"
				+ "    \"terminal_id\": \"90f77198-266d-4720-9eb3-a8638cfef244\",\r\n" + "    \"order_id\": \"MID_"
				+ orderId + "\",\r\n" + "    \"signature\": \"" + getSignature(data, secretKey) + "\"\r\n" + "}");
		Request request = new Request.Builder().url("https://portal-staging.foxpay.vn/payment/get-transaction/")
				.method("POST", body).addHeader("Content-Type", "application/json").build();
		Response response = client.newCall(request).execute();
		String text = response.body().string();
		System.err.println("truyVanGdtext: " + text.toString());

		response.body().close();
		response.close();
		return text;
	}
}
