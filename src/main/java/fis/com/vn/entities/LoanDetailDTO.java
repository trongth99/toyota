package fis.com.vn.entities;

import java.sql.Date;

import lombok.Data;

@Data
public class LoanDetailDTO {

	String soHopDong;
	String bienSoXe;
	String goc;
	String lai;
	String phatTreHan;
	String tienDu;
	int soNgayTreHan;
	Date ngayHetHan;
	String tienTToan;
	String trangThai;
}
