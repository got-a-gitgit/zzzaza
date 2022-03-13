package kr.co.koza.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.koza.vo.ContentVO;
import kr.co.koza.vo.MemberVO;

public interface MemberSQLMapper {
	// 여기에 들어올 타입은 MemberObject 타입
		
		//회원가입
		@Insert("INSERT INTO MEMBER VALUES "
				+ "(MEMBER_SEQ.NEXTVAL, #{memberID}, #{memberPW}, #{memberNick}, "
				+ "#{memberName}, #{memberPhone}, "
				+ "#{memberEmail}, TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS'), null,'비인증', 25)")
		public void insert(MemberVO vo);
		
		// 회원가입한 아이디에 인증키 삽입
		@Update("UPDATE MEMBER SET memberAuthKey = #{param2} WHERE memberID = #{param1}")
		public int getAuthKey(String memberID, String memberAuthKey);
		
		@Update("UPDATE MEMBER SET memberAuthKey = 'Y' WHERE memberID = #{param1} and memberAuthKey = #{param2}")
		public int updateAuthKey(String memberID, String memberAuthKey);
		

		// 아이디로 검색하기
		@Select("SELECT * FROM MEMBER WHERE memberID = #{memberID}")
		public MemberVO selectById(@Param("memberID") String memberID);
		
		@Select("SELECT * FROM MEMBER WHERE memberIndex = #{memberIndex}")
		public MemberVO selectByIdx(@Param("memberIndex") int memberIndex); // @param 이름을 바꾸고 싶을 경우
		
		// 닉네임으로 찾기
		@Select("SELECT * FROM MEMBER WHERE memberNick = #{memberNick}")
		public MemberVO selectByNick(@Param("memberNick") String memberNick); // @param 이름을 바꾸고 싶을 경우
		
		// 아이디 찾기
		@Select("SELECT memberID FROM MEMBER WHERE memberName = #{memberName} and memberPhone = #{memberPhone}")
		public MemberVO findId(MemberVO requestParam);
		
		// 비밀번호 찾기
		@Select("SELECT memberPW FROM MEMBER WHERE memberID = #{memberID} and memberEmail = #{memberEmail}")
		public MemberVO findPw(MemberVO requestParam);
		
		// 회원정보 수정
		@Update("UPDATE MEMBER SET memberPW = #{memberPW}, memberPhone = #{memberPhone}, memberEmail = #{memberEmail} WHERE memberID = #{memberID}")
		public void update(MemberVO vo);
		
		// 회원정보 삭제
		@Delete("DELETE * FROM MEMBER WHERE memberIndex = #{memberIndex}")
		public void deletebyIdx(@Param("memberIndex") String memberIndex);
		
		// 회원 강등
		@Update("UPDATE MEMBER SET memberRank = '강등' WHERE memberID = #{memberID}")
		public void updateRankDown(@Param("memberID") String memberID);
		
		// 회원 강등 해제 및 인증 회원화
		@Update("UPDATE MEMBER SET memberRank = '인증' WHERE memberID = #{memberID}")
		public void updateRankUp(@Param("memberID") String memberID);
		
		// 회원 등급 체크
		@Select("SELECT MEMBERRANK FROM MEMBER WHERE memberNick = #{memberNick}")
		public String checkMemberRank(@Param("memberNick") String memberNick);
		
		// ID로 index 가져오기
		@Select("SELECT MEMBERINDEX FROM MEMBER WHERE memberID = #{memberID}")
		public int getMemberIndexByID(@Param("memberID") String memberID);
		
		
		
		/* 임시 관리자용 - 나중에 따로 뺄 수도*/
		@Select("SELECT * FROM MEMBER ORDER BY MEMBERINDEX DESC")
		public ArrayList<MemberVO> getMemberDataForAdmin();

		
		@Select("SELECT * FROM MEMBER WHERE ${searchTarget} LIKE #{searchWord} ORDER BY memberIndex DESC")
		public ArrayList<MemberVO> selectBySearchWord(@Param("searchTarget")String searchTarget, @Param("searchWord")String searchWord);
		/* 임시 관리자용 끝*/
}
