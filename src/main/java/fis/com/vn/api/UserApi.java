package fis.com.vn.api;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import fis.com.vn.common.CommonUtils;
import fis.com.vn.component.Language;
import fis.com.vn.controller.BaseController;
import fis.com.vn.controller.LoanController;
import fis.com.vn.entities.Car;
import fis.com.vn.entities.ListCar;
import fis.com.vn.entities.PayLoadCar;
import fis.com.vn.entities.PayLoadFox;
import fis.com.vn.entities.PayLoadLoi;
import fis.com.vn.entities.PayLoadSearch;
import fis.com.vn.entities.PaymentResponse;
import fis.com.vn.entities.ReturnRest;
import fis.com.vn.entities.TransactionResponse;
import fis.com.vn.entities.UserDTO;
import fis.com.vn.exception.CheckException;
import fis.com.vn.exception.ValidException;
import fis.com.vn.repository.LoanDetailRepository;
import fis.com.vn.repository.LoanRepository;
import fis.com.vn.repository.UserInfoRepository;
import fis.com.vn.table.Loan;
import fis.com.vn.table.LoanDetail;
import fis.com.vn.table.UserInfo;

@RestController
@RequestMapping("/api")
public class UserApi extends BaseController {
	@Autowired
	UserInfoRepository userInfoRepository;

	@Autowired
	LoanRepository loanRepository;

	@Autowired
	LoanDetailRepository detailRepository;

	@Autowired
	LoanController loanController;

	@Autowired
	Language language;

	@PostMapping("/login")

	public String login(@RequestBody UserDTO userDTO) throws ValidException, Exception, CheckException {

		System.err.println("userDTO: " + userDTO);

		UserInfo userInfo = userInfoRepository.findBySoCmt(userDTO.getSoCmt());
		System.err.println("jkdhas:" + userInfo);
		if (userInfo == null) {
			return ReturnRest.error(null, "SoCmt or Mst is incorrect");
		}

		System.err.println("pas: " + CommonUtils.getMD5(userDTO.getPassword()));

		if (!userInfo.getPassword().equals(CommonUtils.getMD5(userDTO.getPassword()))) {
			return ReturnRest.error(null, "Password is incorrect");
		}

		return ReturnRest.success(userInfo);
	}

	@GetMapping(value = { "/user" })

	public String getUser(@RequestParam(name = "soCmt") String soCmt) throws ValidException, Exception, CheckException {
		UserInfo userInfo = userInfoRepository.findBySoCmt(soCmt);

		if (userInfo == null)
			return ReturnRest.error(userInfo, "user does not exist");

		return ReturnRest.success(userInfo);
	}

	@GetMapping(value = { "/listLoan" })

	public String getAllLoan(@RequestParam(name = "soCmt") String soCmt)
			throws ValidException, Exception, CheckException {
		System.err.println("soCmt: " + soCmt);
		List<Loan> loans = (List<Loan>) loanRepository.listLoan(soCmt);
		System.err.println("soCmt: " + loans);
		if (loans.size() == 0)
			return ReturnRest.error(loans, "loan  does not exist");
		return ReturnRest.success(loans);
	}

	@GetMapping(value = { "/loan/detail" }, produces = MediaType.APPLICATION_JSON_VALUE)

	public String getLoanDetail(@RequestParam(name = "id") Long id, HttpServletRequest req)
			throws ValidException, Exception, CheckException {

		LoanDetail loanDetail = detailRepository.findById(id).get();
		Loan loan = loanRepository.findByIdLoan(id);
		if (loanDetail == null) {
			return ReturnRest.error(loan, "Không tồn tại bản ghi");
		}
		if (loan == null)
			return ReturnRest.error(loan, "Không tồn tại bản ghi");

		Map<String, String> data = new LinkedHashMap<>();
		data.put("soHopDong", loan.getSoHopDong());
		data.put("bienSoXe", loan.getBienSoXe());
		data.put("goc", loanDetail.getGoc());
		data.put("lai", loanDetail.getLai());
		data.put("phatTreHan", loanDetail.getPhatTreHan());
		data.put("soNgayTreHan", String.valueOf(loanDetail.getSoNgayTreHan()));
		data.put("ngayHetHan", loanDetail.getNgayHetHan().toString());
		data.put("tienTToan", loanDetail.getTienTToan());
		data.put("trangThai", loan.getTrangThai());
		req.getSession().setAttribute("orderId", loan.getSoHopDong());
		return ReturnRest.success(data);
	}

	@PostMapping(value = { "/loan/thanhToan" })

	public String thanhToan(@RequestBody PayLoadFox payLoadFox) throws ValidException, Exception, CheckException {

		Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
		PaymentResponse paymentResponse = gson.fromJson(
				loanController.initiatePaymentApp(payLoadFox.getOrder_id(), payLoadFox.getAmount()).toString(),
				PaymentResponse.class);

		if (paymentResponse.getPaymentUrl() == null) {

			PayLoadLoi payLoadLoi = gson.fromJson(
					loanController.initiatePaymentApp(payLoadFox.getOrder_id(), payLoadFox.getAmount()).toString(),
					PayLoadLoi.class);
			Map<String, String> data1 = new LinkedHashMap<>();
			data1.put("code", payLoadLoi.getError().getCode());
			data1.put("description", payLoadLoi.getError().getDescription());
			data1.put("error", payLoadLoi.getError().getError());

			System.err.println("payLoadLoi: " + data1);
			return ReturnRest.error1(data1);

		} else if (paymentResponse.getPaymentUrl() != null) {
			System.err.println("paymentResponse.paymentUrl: " + paymentResponse.toString());
			return ReturnRest.success(paymentResponse);
		}

		return null;

	}

	@PostMapping(value = "/loan/truyvanGd")
	public String getTruyVanGd(Model model, HttpServletRequest req, @RequestParam("orderId") String orderId)
			throws Exception {

		Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();

		// System.err.println("giaodich:
		// "+truyVanGdich(req.getSession().getAttribute("orderId").toString()));
		System.err.println("giaodich: " + req.getSession().getAttribute("orderId"));

		TransactionResponse transactionResponse = gson.fromJson(loanController.truyVanGdich(orderId),
				TransactionResponse.class);
		if (transactionResponse.getOrder() != null || transactionResponse.getTxn() != null) {
			System.err.println("transactionResponse: " + transactionResponse.toString());
			String soHd = transactionResponse.getOrder().getId().replace("MID_", "");
			System.err.println("soHd:" + soHd.toString());
			return ReturnRest.success(transactionResponse);
		} else if (transactionResponse.getOrder() == null || transactionResponse.getTxn() == null) {
			Error error = gson.fromJson(loanController.truyVanGdich(orderId), Error.class);
			loanController.truyVanGdich(orderId).replaceAll("/", "");
			return ReturnRest.error1(error);
		}

		return null;

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

	@PostMapping(value = "/loan/loanDetail", produces = MediaType.APPLICATION_JSON_VALUE)

	public String loanDetail(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams)
			throws Exception {

		System.err.println("idloan: " + allParams.get("id").toString());

		Loan loan = loanRepository.findById(Long.valueOf(allParams.get("id").toString())).get();
		LoanDetail loanDetail = detailRepository.findByIdLoan(loan.getIdLoan());

		JSONObject jObject = new JSONObject();
		jObject.put("id", loan.getId());
		jObject.put("soHopDong", loan.getSoHopDong());

		jObject.put("goc", loanDetail.getGoc());
		jObject.put("lai", loanDetail.getLai());
		jObject.put("phatTreHan", loanDetail.getPhatTreHan());
		jObject.put("soNgayTreHan", String.valueOf(loanDetail.getSoNgayTreHan()));
		jObject.put("ngayHetHan", loanDetail.getNgayHetHan().toString());
		jObject.put("tienTToan", loanDetail.getTienTToan());
		jObject.put("trangThai", loan.getTrangThai());
		jObject.put("duNoConLai", loanDetail.getDuNoConLai());
		System.err.println("jObject: " + jObject.toString());
		req.getSession().setAttribute("id", jObject.get("id").toString());
		return jObject.toString();
	}

	@PostMapping(value = "/loan/soTienTT", produces = MediaType.APPLICATION_JSON_VALUE)

	public String soTienTT(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams)
			throws Exception {

		System.err.println("soTienTT: " + allParams.get("soTienTT").toString());
//		System.err.println("soTienTT: " + allParams.get("id").toString());
//		Loan loan = loanRepository.findById(Long.valueOf(allParams.get("id").toString())).get();
//		LoanDetail loanDetail = detailRepository.findByIdLoan(loan.getIdLoan());
		// 980.959 vnd

		Long soTTT = Long.valueOf(allParams.get("soTienTT").toString());
		// Long duNoConLai = Long.valueOf(allParams.get("duNoConLai").toString());

		Long tongSoTienTT = 980 + soTTT + 298;
		JSONObject jObject = new JSONObject();
		jObject.put("tongSTTT", tongSoTienTT);

//		loanDetail.setTienTToan(tongSoTienTT.toString());
//		detailRepository.save(loanDetail);

		System.err.println("jObject: " + jObject.toString());
		req.getSession().setAttribute("tongSTTT", jObject.get("tongSTTT").toString());
//		return jObject.toString();
		return jObject.toString();
	}

	@GetMapping(value = "/listTypeCar", produces = MediaType.APPLICATION_JSON_VALUE)

	public ListCar listCar(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams)
			throws Exception {
		String respose = "{\"data\":[{\"id\":1,\"type\":\"VIOS1.5ECVT\",\"idCar\":1,\"img\":\"viosden.png\",\"price\":500000000},{\"id\":2,\"type\":\"VIOS1.5EMT\",\"idCar\":1,\"img\":\"viosdo.png\",\"price\":590000000},{\"id\":3,\"type\":\"VIOS1.5GCVT\",\"idCar\":1,\"img\":\"viostrang.png\",\"price\":650000000},{\"id\":4,\"type\":\"Camry2.0G\",\"idCar\":2,\"img\":\"camryden.png\",\"price\":1200000000},{\"id\":5,\"type\":\"Camry2.0Q\",\"idCar\":2,\"img\":\"camrydo.png\",\"price\":1350000000},{\"id\":6,\"type\":\"Camry2.5Q\",\"idCar\":2,\"img\":\"camrytrang.png\",\"price\":1400000000}]}";
		JSONObject jObject = new JSONObject(respose);

		JSONArray jsonArray = jObject.getJSONArray("data");

		ListCar listCar = new ListCar();
		for (int i = 0; i < jsonArray.length(); i++) {
			Long idcar = Long.valueOf(jsonArray.getJSONObject(i).get("idCar").toString());
			System.err.println("idcar:" + idcar);
			System.err.println("jsonArray:" + allParams.get("id").toString());
			if (idcar == Long.valueOf(allParams.get("id").toString())) {
				Car car = new Car();
				car.setId(Long.valueOf(jsonArray.getJSONObject(i).getLong("id")));
				car.setType(jsonArray.getJSONObject(i).getString("type"));
				car.setIdCar(Long.valueOf(jsonArray.getJSONObject(i).getLong("idCar")));
				// car.setImg(jsonArray.getJSONObject(i).getString("img"));
				car.setPrice(jsonArray.getJSONObject(i).getLong("price"));

				listCar.add(car);
			}
		}

		return listCar;
	}

	@PostMapping(value = "/getCar", produces = MediaType.APPLICATION_JSON_VALUE)

	public Car getCar(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams,
			@RequestBody String data) throws Exception {
		Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
		String respose = "{\"data\":[{\"id\":1,\"type\":\"VIOS1.5ECVT\",\"idCar\":1,\"img\":\"viosden.png\",\"price\":500000000},{\"id\":2,\"type\":\"VIOS1.5EMT\",\"idCar\":1,\"img\":\"viosdo.png\",\"price\":590000000},{\"id\":3,\"type\":\"VIOS1.5GCVT\",\"idCar\":1,\"img\":\"viostrang.png\",\"price\":650000000},{\"id\":4,\"type\":\"Camry2.0G\",\"idCar\":2,\"img\":\"camryden.png\",\"price\":1200000000},{\"id\":5,\"type\":\"Camry2.0Q\",\"idCar\":2,\"img\":\"camrydo.png\",\"price\":1350000000},{\"id\":6,\"type\":\"Camry2.5Q\",\"idCar\":2,\"img\":\"camrytrang.png\",\"price\":1400000000}]}";
		JSONObject jObject = new JSONObject(respose);

		JSONArray jsonArray = jObject.getJSONArray("data");

		PayLoadCar payLoadCar = gson.fromJson(data.toString(), PayLoadCar.class);
		Car car = new Car();
		for (int i = 0; i < jsonArray.length(); i++) {
			Long idCar = Long.valueOf(jsonArray.getJSONObject(i).get("idCar").toString());
			String type = jsonArray.getJSONObject(i).get("type").toString();
			System.err.println("idCar:" + idCar);
			System.err.println("payLoadCar.getType():" + payLoadCar.getType());

			if (payLoadCar.getId() == idCar && payLoadCar.getType().equals(type)) {

				car.setId(Long.valueOf(jsonArray.getJSONObject(i).getLong("id")));
				car.setType(jsonArray.getJSONObject(i).getString("type"));
				car.setIdCar(Long.valueOf(jsonArray.getJSONObject(i).getLong("idCar")));
				car.setImg(jsonArray.getJSONObject(i).getString("img"));
				car.setPrice(jsonArray.getJSONObject(i).getLong("price"));

			}
		}
		System.err.println("car: " + car.toString());
		return car;
	}

	@PostMapping(value = "/searchCar", produces = MediaType.APPLICATION_JSON_VALUE)
	public ListCar searchCar(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams,
			@RequestBody String data) {
		Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
		String respose = "{\"data\":[{\"id\":1,\"type\":\"VIOS1.5ECVT\",\"idCar\":1,\"img\":\"viosden.png\",\"price\":500000000,\"pay\":7000000},{\"id\":2,\"type\":\"VIOS1.5EMT\",\"idCar\":1,\"img\":\"viosdo.png\",\"price\":590000000,\"pay\":7900000},{\"id\":3,\"type\":\"VIOS1.5GCVT\",\"idCar\":1,\"img\":\"viostrang.png\",\"price\":650000000,\"pay\":8000000},{\"id\":4,\"type\":\"Camry2.0G\",\"idCar\":2,\"img\":\"camryden.png\",\"price\":1200000000,\"pay\":8500000},{\"id\":5,\"type\":\"Camry2.0Q\",\"idCar\":2,\"img\":\"camrydo.png\",\"price\":1350000000,\"pay\":9000000},{\"id\":6,\"type\":\"Camry2.5Q\",\"idCar\":2,\"img\":\"camrytrang.png\",\"price\":1400000000,\"pay\":9000000}]}";
		JSONObject jObject = new JSONObject(respose);

		JSONArray jsonArray = jObject.getJSONArray("data");

		PayLoadSearch payLoadSearch = gson.fromJson(data.toString(), PayLoadSearch.class);
		ListCar listCar = new ListCar();
		for (int i = 0; i < jsonArray.length(); i++) {
			Long price = jsonArray.getJSONObject(i).getLong("pay");

			if (Long.valueOf(payLoadSearch.getFromPrice()) < price
					&& price < Long.valueOf(payLoadSearch.getToPrice())) {
				Car car = new Car();
				car.setId(Long.valueOf(jsonArray.getJSONObject(i).getLong("id")));
				car.setType(jsonArray.getJSONObject(i).getString("type"));
				car.setIdCar(Long.valueOf(jsonArray.getJSONObject(i).getLong("idCar")));
				car.setImg(jsonArray.getJSONObject(i).getString("img"));
				car.setPrice(jsonArray.getJSONObject(i).getLong("price"));
				car.setPay(jsonArray.getJSONObject(i).getLong("pay"));
				listCar.add(car);
			}
		}
		System.err.println("listCar:" + listCar.toString());
		return listCar;
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
}
