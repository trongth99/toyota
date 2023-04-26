package fis.com.vn.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.Calendar;
import java.util.Random;
import java.util.UUID;


public class CommonUtils {
	
	public static String layMaGiaoDich(int day) {
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, day);
			String timeStr = String.valueOf(calendar.getTimeInMillis());
			String timeStrOne = timeStr.substring(0, 4);
			String timeStrTwo = timeStr.substring(4, 8);
			String timeStrThree = timeStr.substring(8, timeStr.length());
			String maGiaDich = ranDomChar(timeStrTwo)+"-"+UUID.randomUUID().toString()+"-"+ranDomChar(timeStrOne)+"-"+ranDomChar(timeStrThree);
			
			return maGiaDich;
		} catch (Exception e) {
		}
		return null;
	}
	private static String ranDomChar(String timeStr) {
		Random r = new Random();
		char c = (char)(r.nextInt(26) + 'a');
		char c1 = (char)(r.nextInt(26) + 'a');
		return String.valueOf(c1)+timeStr+String.valueOf(c);
	}
	
	public static String getMD5(String data) {
		try {
			data = "abc1234"+data;
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.update(data.getBytes());
			byte[] digest = messageDigest.digest();
			StringBuffer sb = new StringBuffer();
			for (byte b : digest) {
				sb.append(Integer.toHexString((int) (b & 0xff)));
			}
			return sb.toString();
		} catch (Exception e) {
			return "";
		}
	}
	
	public static String getBase64Img(String pathFile) {
		String base64Img = "";
		try {
			if(!StringUtils.isEmpty(pathFile)) {
				base64Img = encodeFileToBase64Binary(new File(pathFile));
			}
		} catch (Exception e) {
		}
		return base64Img;
	}
	
	@SuppressWarnings("resource")
	public static String encodeFileToBase64Binary(File file){
        try {
        	FileInputStream fileInputStreamReader = new FileInputStream(file);
            byte[] bytes = new byte[(int)file.length()];
            fileInputStreamReader.read(bytes);
            return new String(Base64.getEncoder().encode(bytes));
		} catch (Exception e) {
			// TODO: handle exception
		}
        return null;
    }
	
	public static void copyFile(String pathFileCopy, String pathFileTo){
		InputStream inStream = null;
        OutputStream outStream = null;
		try {
			if(!StringUtils.isEmpty(pathFileCopy)) {
				inStream = new FileInputStream(new File(pathFileCopy));
	            outStream = new FileOutputStream(new File(pathFileTo));
	            int length;
	            byte[] buffer = new byte[1024];
	 
	            // copy the file content in bytes
	            while ((length = inStream.read(buffer)) > 0) {
	                outStream.write(buffer, 0, length);
	            }
			}
		} catch (Exception e) {
		}
    }
}
