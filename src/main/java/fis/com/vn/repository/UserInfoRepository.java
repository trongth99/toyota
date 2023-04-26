package fis.com.vn.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import fis.com.vn.table.UserInfo;

public interface UserInfoRepository extends CrudRepository<UserInfo, Long> {
	UserInfo findByUsername(String username);

	@Query(value = "SELECT * FROM user_info u  WHERE soCmt =:soCmt", nativeQuery = true)
	UserInfo findBySoCmt(@Param("soCmt") String soCmt);

	long countByUsername(String userName);
}
