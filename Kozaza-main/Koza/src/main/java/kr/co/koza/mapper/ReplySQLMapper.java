package kr.co.koza.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.koza.vo.ReplyVO;

public interface ReplySQLMapper {

	// 글 Index에 따라 댓글 가져오기
	@Select("SELECT * FROM REPLY WHERE contentIndex = #{contentIndex}")
	public ArrayList<ReplyVO> selectByContentIndex(int contentIndex);
	
	// 댓글 추가
	@Insert("INSERT INTO REPLY VALUES(#{contentIndex},REPLY_SEQ.NEXTVAL,#{memberNick},#{replyContent}, TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') )")
	public void insert(ReplyVO vo);
	
	//댓글 하나 삭제
	@Delete("DELETE FROM REPLY WHERE replyIndex = #{replyIndex}")
	public void deleteByIdx(ReplyVO requestParam);
	
	// 댓글 Index로 댓글 가져오기
	@Select("SELECT * FROM REPLY WHERE replyIndex = #{replyIndex}")
	public ReplyVO selectByR_Idx(ReplyVO requestParam);
	
	// 댓글 내용 수정
	@Update("UPDATE REPLY SET replyContent = #{replyContent} WHERE replyIndex = #{replyIndex}")
	public void updateByIdx(ReplyVO vo);
	
	// 댓글 갯수 증가
	@Update("UPDATE CONTENT SET contentReplyNum = contentReplyNum + 1 WHERE contentIndex = #{contentIndex}")
	public void updateReplyNumUp(ReplyVO requestParam);
	
	// 댓글 갯수 감소
	@Update("UPDATE CONTENT SET contentReplyNum = contentReplyNum - 1 WHERE contentIndex = #{contentIndex}")
	public void updateReplyNumDown(ReplyVO requestParam);
	
	
	// 글 Index에 따라 댓글 개수 가져오기
	@Select("SELECT COUNT(*) FROM REPLY WHERE contentIndex = #{contentIndex}")
	public int selectCountByContentIndex(int contentIndex);
	
}
