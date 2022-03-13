package kr.co.koza.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.koza.mapper.MemberSQLMapper;
import kr.co.koza.mapper.ReplySQLMapper;
import kr.co.koza.service.ReplyService;
import kr.co.koza.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplySQLMapper replySQLMapper;
	
	//댓글 목록
	@Override
	public ArrayList<ReplyVO> getReplyList(int contentIndex){
		ArrayList<ReplyVO> replylist = replySQLMapper.selectByContentIndex(contentIndex);
		
		return replylist;
	}

	@Override
	public void writeReply(ReplyVO requestParam) {
		// TODO Auto-generated method stub
		replySQLMapper.insert(requestParam);
		updateReplyNumUp(requestParam);
	}

	@Override
	public void deleteReply(ReplyVO requestParam) {
		// TODO Auto-generated method stub
		replySQLMapper.deleteByIdx(requestParam);
		updateReplyNumDown(requestParam);
	}

	@Override
	public ReplyVO selectByReplyIndex(ReplyVO requestParam) {
		ReplyVO vo = replySQLMapper.selectByR_Idx(requestParam);
		return vo;
	}
	@Override
	public void updateReply(ReplyVO requestParam) {
		String changedReplyContent = requestParam.getReplyContent() + "[댓글 내용이 수정되었습니다.]";
		requestParam.setReplyContent(changedReplyContent);
		replySQLMapper.updateByIdx(requestParam);
	}

	@Override
	public void updateReplyNumUp(ReplyVO requestParam) {
		replySQLMapper.updateReplyNumUp(requestParam);
	}

	@Override
	public void updateReplyNumDown(ReplyVO requestParam) {
		replySQLMapper.updateReplyNumDown(requestParam);
	}
}
