package kr.co.koza.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.koza.vo.ContentVO;
import kr.co.koza.vo.ScrapVO;

public interface MyPageSQLMapper {
	
	// 회원이 작성한 글 가져오기
	@Select("SELECT * FROM CONTENT WHERE memberIndex = #{memberIndex} ORDER BY CONTENTWRITEDATE DESC")
	public ArrayList<ContentVO> getMyPostList(@Param("memberIndex") int memberIndex);
	
	// 마이페이지에 보여줄 contentIndex 가져감
	@Select("SELECT CONTENTINDEX FROM SCRAP WHERE memberIndex = #{memberIndex} AND isScrapped = 1 ORDER BY scrapTime DESC")
	public ArrayList<Integer> getScrappedIndexesByMemberIndex(@Param("memberIndex") int memberIndex);
	
	// 스크랩 여부 확인
	@Select("SELECT isScrapped FROM SCRAP WHERE contentIndex = #{contentIndex} AND memberIndex = #{memberIndex} ")
	public String getIsScrappedInfo(ScrapVO scrapVO);
		
	
	// 마이페이지에 보여줄 명단에 신규 추가
	@Insert("INSERT INTO SCRAP VALUES(#{contentIndex}, #{memberIndex}, 1, TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS'))")
	public void insertScrap(ScrapVO scrapVO);
	
	// 마이페이지에 보여줄 명단에서 제외
	@Update("UPDATE SCRAP SET isScrapped = 0 WHERE contentIndex = #{contentIndex}")
	public void unScrap(ScrapVO scrapVO);
	
	// 마이페이지에 보여줄 명단 재추가
	@Update("UPDATE SCRAP SET isScrapped = 1, scrapTime = TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') WHERE contentIndex = #{contentIndex}")
	public void reScrap(ScrapVO scrapVO);
	
	

}
