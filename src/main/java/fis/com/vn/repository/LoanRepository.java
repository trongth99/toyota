package fis.com.vn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fis.com.vn.table.Loan;

@Repository
public interface LoanRepository extends CrudRepository<Loan, Long> {

	@Query(value = "SELECT * FROM loan as l where l.trangThai = 'fail'", nativeQuery = true)
	List<Loan> getAllLoans();

	/*
	 * @Query(value ="select * from loan as b where b.username = :username "
	 * ,nativeQuery=true) Business findByusername(@Param("username") String
	 * username);
	 */

	@Query(value = "select * from loan as l where l.idLoan = :idLoan", nativeQuery = true)
	Loan findByIdLoan(@Param("idLoan") Long idLoan);

	@Query(value = "select * from loan as l where l.soHopDong = :soHopDong", nativeQuery = true)
	Loan findBySoHopDong(@Param("soHopDong") String soHopDong);

	@Query(value = "SELECT * FROM loan as l where l.soCmt = :soCmt", nativeQuery = true)
	List<Loan> listLoan(@Param("soCmt") String soCmt);

	@Query(value = "SELECT * FROM loan as l where l.soCmt = :soCmt", nativeQuery = true)
	List<Loan> findAllLoanBySoCmt(@Param("soCmt") String soCmt);
}
