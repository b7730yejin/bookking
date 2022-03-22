package kr.co.bookking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.co.bookking.entity.QnaEntity;
import kr.co.bookking.entity.UserEntity;

@Repository
public interface QnaRepository extends JpaRepository<QnaEntity, Integer>{
	
}
