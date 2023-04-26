package fis.com.vn.table;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "loan")
@Data
public class Loan {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	String soHopDong;
	String bienSoXe;
	Date ngayHLuc;
	Date ngayKThuc;
	String soTienVay;
	String duNoConLai;
	String soCmt;
	String hinhXe;
	Long idLoan;
	String trangThai;

}
