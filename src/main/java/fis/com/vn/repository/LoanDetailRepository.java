package fis.com.vn.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fis.com.vn.entities.LoanDetailDTO;
import fis.com.vn.table.Loan;
import fis.com.vn.table.LoanDetail;

@Repository
public interface LoanDetailRepository extends CrudRepository<LoanDetail, Long> {
	
	
	@Query(value ="select * from loan_detail as ld where ld.id = :id" ,nativeQuery=true)
	 LoanDetail findByIdLoan(@Param("id") Long id);
	 
	
}
