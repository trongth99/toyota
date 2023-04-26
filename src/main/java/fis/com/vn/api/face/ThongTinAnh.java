package fis.com.vn.api.face;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;

import fis.com.vn.api.KhachHang;
import fis.com.vn.api.entities.Params;
import fis.com.vn.common.Utils;
import fis.com.vn.component.ConfigProperties;
import fis.com.vn.component.Language;
import fis.com.vn.exception.CheckException;

@Component
public class ThongTinAnh {
	private static final Logger LOGGER = LoggerFactory.getLogger(ThongTinAnh.class); 
	@Autowired ConfigProperties configProperties;
	@Autowired Language language;
	@Autowired KhachHang khachHang;
	
	int timeOutRequest = 15*1000;
	private RequestConfig.Builder timeout() {
		RequestConfig.Builder requestConfig = RequestConfig.custom();
		requestConfig.setConnectTimeout(timeOutRequest);
		requestConfig.setConnectionRequestTimeout(timeOutRequest);
		requestConfig.setSocketTimeout(timeOutRequest);
		
		return requestConfig;
	}
	
	public ResponseFaceMatch compare(String base64EncodeImg, String base64EncodeImg2, String maToChuc) {
		try {
			CloseableHttpClient httpClient = HttpClients.createDefault();
			HttpPost uploadFile = new HttpPost("http://10.10.11.2:8198/api/match11");
			uploadFile.setConfig(timeout().build());
			
			MultipartEntityBuilder builder = MultipartEntityBuilder.create();

			builder.addBinaryBody(
			    "file1",
			    Utils.convertBase64ImgToJpgByte(base64EncodeImg),
			    ContentType.MULTIPART_FORM_DATA,
			    "abc.jpg"
			);
			
			builder.addBinaryBody(
				    "file2",
				    Utils.convertBase64ImgToJpgByte(base64EncodeImg2),
				    ContentType.MULTIPART_FORM_DATA,
				    "abc2.jpg"
				);
			
			if(khachHang.getKiemTraDeoKhauTrang(maToChuc)) {
				builder.addTextBody("mask_check", "1", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			} else {
				builder.addTextBody("mask_check", "0", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			}
			if(khachHang.getKiemTraDeoKinh(maToChuc)) {
				builder.addTextBody("glasses_check", "1", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			} else {
				builder.addTextBody("glasses_check", "0", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			}
			 
			HttpEntity multipart = builder.build();
			uploadFile.setEntity(multipart);
			CloseableHttpResponse response = httpClient.execute(uploadFile);
			HttpEntity responseEntity = response.getEntity();
			String text = IOUtils.toString(responseEntity.getContent(), StandardCharsets.UTF_8.name());
			LOGGER.info("Compare: "+text);
			ResponseFaceMatch responeAcs = new Gson().fromJson(text, ResponseFaceMatch.class);
			
			return responeAcs;
		} catch (Exception e) {
			LOGGER.error("Compare: {}", e.getMessage());
		}
		return null;
	}
	
	public boolean checkFake(Params params, String maToChuc) throws CheckException {
		try {
			CloseableHttpClient httpClient = HttpClients.createDefault();
		//	HttpPost uploadFile = new HttpPost("http://10.14.122.87:8198/api/check");
			HttpPost uploadFile = new HttpPost("http://10.10.11.2:8198/api/check");
			System.err.println("url liveness: "+uploadFile.toString());
			uploadFile.setConfig(timeout().build());
			
			MultipartEntityBuilder builder = MultipartEntityBuilder.create();
			
			int mid = params.getAnhVideo().size()/2;
			
			builder.addBinaryBody(
			    "file1",
			    Utils.convertBase64ImgToJpgByte(params.getAnhVideo().get(0).getAnh()),
			    ContentType.MULTIPART_FORM_DATA,
			    "abc1.jpg"
			);
			builder.addBinaryBody(
				    "file2",
				    Utils.convertBase64ImgToJpgByte(params.getAnhVideo().get(mid).getAnh()),
				    ContentType.MULTIPART_FORM_DATA,
				    "abc2.jpg"
				);
			builder.addBinaryBody(
				    "file3",
				    Utils.convertBase64ImgToJpgByte(params.getAnhVideo().get(params.getAnhVideo().size()-1).getAnh()),
				    ContentType.MULTIPART_FORM_DATA,
				    "abc3.jpg"
				);
			
			if(khachHang.getKiemTraDeoKhauTrang(maToChuc)) {
				builder.addTextBody("mask_check", "1", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			} else {
				builder.addTextBody("mask_check", "0", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			}
			
			if(khachHang.getKiemTraDeoKinh(maToChuc)) {
				builder.addTextBody("glasses_check", "1", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			} else if(khachHang.getKiemTraDeoKinhTrang(maToChuc)) {
				builder.addTextBody("glasses_check", "2", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			}else {
				builder.addTextBody("glasses_check", "0", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			}
			
			if(khachHang.getKiemTraChuyenDong(maToChuc)) {
				builder.addTextBody("motion_check", "1", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			}
			if(khachHang.getKiemTraNhamMat(maToChuc)) {
				builder.addTextBody("eyes_closed", "1", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			}
			if(khachHang.getKiemTraDoiMu(maToChuc)) {
				builder.addTextBody("hat_check", "1", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			}
			if(maToChuc.equals("demo")) {
				builder.addTextBody("face_match", "0", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			}
			if(khachHang.getKiemTraNhinThang(maToChuc))
				builder.addTextBody("focus_check", "1", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			if(khachHang.getKiemTraMoMom(maToChuc))
				builder.addTextBody("mouth_check", "1", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			
			if(khachHang.getKiemTraAnh1NhinThang(maToChuc)) {
				builder.addTextBody("check_direction", "1", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
				builder.addTextBody("direction_check", "1", ContentType.TEXT_PLAIN.withCharset(Charset.forName("utf-8")));
			}
			
			HttpEntity multipart = builder.build();
			uploadFile.setEntity(multipart);
			CloseableHttpResponse response = httpClient.execute(uploadFile);
			HttpEntity responseEntity = response.getEntity();
			String text = IOUtils.toString(responseEntity.getContent(), StandardCharsets.UTF_8.name());
			LOGGER.info("CheckFake: "+text);
			JSONObject checkFakeJson = new JSONObject(text);
			
			if(checkFakeJson.getInt("code") == 1) throw new CheckException(language.getMessage("There is any movement/ Vui lòng di chuyển khuôn mặt"));
			if(checkFakeJson.getInt("code") == 2) throw new CheckException(language.getMessage("Khuôn mặt không khớp"));
			if(checkFakeJson.getInt("code") == 3) throw new CheckException(language.getMessage("Giả mạo xác thực"));
			if(checkFakeJson.getInt("code") == 4) throw new CheckException(language.getMessage("Không phát hiện thực thể sống trong khung hình"));
			if(checkFakeJson.getInt("code") == 5) throw new CheckException(language.getMessage("Please take off the glasses /Vui lòng tháo mắt kính"));
			if(checkFakeJson.getInt("code") == 6) throw new CheckException(language.getMessage("Please take off the mask/ Vui lòng tháo khẩu trang"));
			if(checkFakeJson.getInt("code") == 7) throw new CheckException(language.getMessage("Please look straight to camera/ Vui lòng nhìn thẳng vào camera"));
			if(checkFakeJson.getInt("code") == 8) throw new CheckException(language.getMessage("Please open your eyes / Vui lòng mở mắt"));
			if(checkFakeJson.getInt("code") == 9) throw new CheckException(language.getMessage("There is more than one face in frame / Phát hiện có nhiều khuôn mặt trong khung hình"));
			if(checkFakeJson.getInt("code") == 10) throw new CheckException(language.getMessage("Please close your month/Vui lòng không mở miệng"));
			if(checkFakeJson.getInt("code") == 11) throw new CheckException(language.getMessage("Không nhìn trực diện vào khung hình"));
			if(checkFakeJson.getInt("code") == 12) throw new CheckException(language.getMessage("Bạn đang đội mũ, vui lòng bỏ mũ"));
			
			return checkFakeJson.getBoolean("result");
		} catch (CheckException e) {
			throw new CheckException(e.getMessage());
		} catch (Exception e) {
			LOGGER.error("CheckFake: {}", e.getMessage());
		}
		return false;
	}
}
