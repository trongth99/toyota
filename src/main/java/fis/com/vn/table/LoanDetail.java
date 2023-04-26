package fis.com.vn.table;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "loan_detail")
@Data
public class LoanDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	String goc;
	String lai;
	String phatTreHan;
	String tienDu;
	int soNgayTreHan;
	Date ngayHetHan;
	String tienTToan;

	String duNoConLai;
}
