package kr.co.bookking.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.bookking.VO.QnaVO;
import kr.co.bookking.dao.QnaDAO;
import kr.co.bookking.entity.QnaEntity;
import kr.co.bookking.repository.QnaRepository;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	QnaDAO dao;
	
	@Autowired
	QnaRepository qr;
	 
	@Override
	public List<QnaVO> getQnaListByBookId(int bookId) throws Exception{
		return dao.getQnaListByBookId(bookId);
	}
	
	@Override
	public String getQnaContentByQnaId(int qnaId) throws Exception{
		return qr.getById(qnaId).getQnaContents();
		//return dao.getQnaContentByQnaId(qnaId);
	}
	
	@Transactional
	@Override
	public int insertQnaContent(QnaVO qnaVO) throws Exception {
		QnaEntity qe = new QnaEntity();
		qe.setQnaUserId(qnaVO.getQnaUserId());
		qe.setQnaBookId(qnaVO.getQnaBookId());
		qe.setQnaTitle(qnaVO.getQnaTitle());
		qe.setQnaContents(qnaVO.getQnaContents());
		qe = qr.save(qe);
		if(qe != null) return 1;
		return 0;
		//return dao.insertQnaContent(qnaVO);
	}	

}
