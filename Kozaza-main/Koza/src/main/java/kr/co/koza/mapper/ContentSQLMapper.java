package kr.co.koza.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.koza.vo.*;


public interface ContentSQLMapper {
	
	@Select("SELECT * FROM CONTENT ORDER BY contentIndex DESC")
	public ArrayList<ContentVO> selectAll();
	
	@Select("SELECT * FROM CONTENT WHERE ${searchTarget} LIKE #{searchWord} ORDER BY contentIndex DESC")
	public ArrayList<ContentVO> selectBySearchWord(@Param("searchTarget")String searchTarget, @Param("searchWord")String searchWord);
	
	@Select("SELECT * FROM CONTENT WHERE contentIndex = #{contentIndex}")
	public ContentVO selectByIdx(int contentIndex);
	
	@Select("SELECT * FROM (SELECT * FROM CONTENT ORDER BY CONTENTINDEX DESC) WHERE ROWNUM <= 5")
	public ArrayList<ContentVO> getTop5Data();
	
	
	// 변수 추가 필요
	@Insert("INSERT INTO CONTENT VALUES(Content_SEQ.NEXTVAL, #{contentType}, #{contentTitle},  #{memberIndex}, #{memberNick}, #{contentContent},TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS'),0,1, 0, 0, '101')")
	public void insert(ContentVO vo);
	@Delete("DELETE FROM CONTENT WHERE contentIndex = #{contentIndex}")
	public void deleteByIdx(int contentIndex);
	@Update("UPDATE CONTENT SET (contentType, contentTitle, contentContent) = (#{contentType}, #{contentTitle}, #{contentContent}) WHERE contentIndex = #{contentIndex}")
	public void updateByIdx(ContentVO vo);
	
	// 조회수 증가
	@Update("UPDATE CONTENT SET contentCount = contentCount + 1 WHERE contentIndex = #{contentIndex}")
	public void readCountUp(ContentVO vo);

	// 게시글 추천수 증가
	@Update("UPDATE CONTENT SET contentRecommend = contentRecommend + 1 WHERE contentIndex = #{contentIndex}")
	public void thumbsupCountUp(@Param("contentIndex") int contentIndex);
	
	// contentIndex Max 값 가져오기
	@Select("SELECT MAX(contentIndex) FROM CONTENT")
	public int getContentSequence();
}