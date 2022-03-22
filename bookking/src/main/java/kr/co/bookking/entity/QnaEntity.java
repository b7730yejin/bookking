package kr.co.bookking.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="BK_QNA")
public class QnaEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="QNA_ID")
	Integer qnaId;
	
	@Column(name="QNA_USER_ID")
	String qnaUserId;
	
	@Column(name="QNA_BOOK_ID")
	Integer qnaBookId;
	
	@Column(name="QNA_TITLE")
	String qnaTitle;
	
	@Column(name="QNA_CONTENTS")
	String qnaContents;

	public Integer getQnaId() {
		return qnaId;
	}

	public void setQnaId(Integer qnaId) {
		this.qnaId = qnaId;
	}

	public String getQnaUserId() {
		return qnaUserId;
	}

	public void setQnaUserId(String qnaUserId) {
		this.qnaUserId = qnaUserId;
	}

	public Integer getQnaBookId() {
		return qnaBookId;
	}

	public void setQnaBookId(Integer qnaBookId) {
		this.qnaBookId = qnaBookId;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContents() {
		return qnaContents;
	}

	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}
	
	
	
}
