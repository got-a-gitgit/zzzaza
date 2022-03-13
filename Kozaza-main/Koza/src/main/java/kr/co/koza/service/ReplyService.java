package kr.co.koza.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.co.koza.vo.ReplyVO;

@Service
public interface ReplyService {
	//댓글 목록
	public ArrayList<ReplyVO> getReplyList(int contentIndex);
	//댓글 입력
	public void writeReply(ReplyVO vo);
	//댓글 하나 삭제
	public void deleteReply(ReplyVO requestParam);
	//댓글 삭제(R_idx로)
	public ReplyVO selectByReplyIndex(ReplyVO requestParam);
	//댓글 수정
	public void updateReply(ReplyVO requestParam);
	//댓글 갯수 증가
	public void updateReplyNumUp(ReplyVO requestParam);
	//댓글 갯수 감소
	public void updateReplyNumDown(ReplyVO requestParam);
	
}
