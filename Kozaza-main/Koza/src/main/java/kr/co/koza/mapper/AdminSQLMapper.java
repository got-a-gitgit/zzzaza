package kr.co.koza.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface AdminSQLMapper {

	// 현재 전체 회원 수
	@Select("SELECT COUNT(*) FROM MEMBER")
	public int getCurrentMemberCount();
	
	// 현재 전체 게시글 수
	@Select("SELECT COUNT(*) FROM CONTENT")
	public int getCurrentContentCount();
	
	// 특정 일자 전체 회원수, 게시글 수 DB 삽입
	@Insert("INSERT INTO COUNTTABLE VALUES(TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS'), #{param1}, #{param2})")
	public void putTodayAllCount(int memberCount, int contentCount);
	
	
	// 오늘 가입한 회원 수
	@Select("SELECT COUNT(*) FROM MEMBER WHERE memberJoinDate = TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS')")
	public int getTodayMemberCount();
	
	// 오늘 작성된 게시글 수
	@Select("SELECT COUNT(*) FROM CONTENT WHERE contentWriteDate = TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS')")
	public int getTodayContentCount();
	
	
	// 전날 전체 회원 수
	@Select("SELECT MEMBERCOUNT FROM COUNTTABLE WHERE countDate LIKE (TO_CHAR(SYSDATE-1,'YYYY/MM/DD')||'%')")
	public ArrayList<Integer> getYesterdayMemberCount();
	
	// 전날 전체 게시글 수
	@Select("SELECT CONTENTCOUNT FROM COUNTTABLE WHERE countDate LIKE (TO_CHAR(SYSDATE-1,'YYYY/MM/DD')||'%')")
	public ArrayList<Integer> getYesterdayContentCount();
}
