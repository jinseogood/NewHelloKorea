package com.kh.hello.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hello.common.Attachment;
import com.kh.hello.member.model.exception.LoginException;
import com.kh.hello.member.model.vo.BoardAndReply;
import com.kh.hello.member.model.vo.Member;
import com.kh.hello.member.model.vo.MemberGoods;
import com.kh.hello.member.model.vo.MemberPoint;
import com.kh.hello.member.model.vo.MemberReservation;

public interface MemberService {

	
	//
	int insertMember(Member m);
	
	//
	int insertSeller(Member m);

	//
	Member loginMember(Member m) throws LoginException;

	int updateAddUser(Member m);
	
	//회원시퀀스 
	int selectMemberSequence();

	int selectSellerSequence();
	
	
	int updateAddSeller(Member m);


	int uploadprofile(Attachment a);


	
	//페이스북 로그인
	int insertFacebook(Member m);

	//facebook check
	Member selectSnsChceck(HashMap<String, Object> snsInfo);
	
	//마이페이지
	//프로필 수정
	int editProfile(Member m);
	
	//찜목록
	ArrayList<MemberGoods> selectGoodsList(int mId);
	
	//프로필사진
	Attachment selectMemberProfile(int mId);
	

	
	//닉네임체크
	int nicknameCheck(String nickname);
	
	//활동내역
	ArrayList<BoardAndReply> selectboreList(int mId);
	//구글로그인
	int insertGoogole(Member m);
	
	//댓글갯수
	int selectReplyCount(int mId);
	
	
	//예약내역
	ArrayList<MemberReservation> selectReservationHistory(int mId);
	
	
	//포인트내역
	ArrayList<MemberPoint> selectMemberPonit(int mId);
	
	//이메일체크
	int emailCheck(String email);

	
	
}
