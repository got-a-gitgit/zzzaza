package kr.co.koza.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.koza.vo.ThumbsupVO;

public interface ThumbsupSQLMapper {
	
	/*====== 게시글 관련 좋아요 시작 ======*/
	// 멤버 좋아요 확인
	@Select("SELECT isThumbsup FROM THUMBSUP WHERE contentIndex = #{contentIndex} AND memberIndex = #{memberIndex}")
	public String getIsThumbsupInfo(ThumbsupVO thumbsupVO);
	
	// 멤버 좋아요 추가
	@Insert("INSERT INTO THUMBSUP VALUES(#{contentIndex}, #{memberIndex}, 1)")
	public void insertThumbsup(ThumbsupVO thumbsupVO);
	
	// 글 Index에 따라 좋아요 개수 가져오기
	@Select("SELECT COUNT(*) FROM THUMBSUP WHERE contentIndex = #{contentIndex}")
	public int getCountByContentIndex(int contentIndex);
	
	/*====== 게시글 관련 좋아요 끝 ======*/

	
	
	
	/*====== 댓글 관련 좋아요 시작 ======*/
	
	
	/*====== 댓글 관련 좋아요 끝 ======*/
	
}
