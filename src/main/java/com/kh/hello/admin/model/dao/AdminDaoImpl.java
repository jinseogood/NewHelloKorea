package com.kh.hello.admin.model.dao;
    
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.admin.model.vo.Approval;
import com.kh.hello.admin.model.vo.Blacklist;
import com.kh.hello.admin.model.vo.CompanyAreaStatistics;
import com.kh.hello.admin.model.vo.CompanyDetails;
import com.kh.hello.admin.model.vo.CompanyPeriodStatistics;
import com.kh.hello.admin.model.vo.CompanyRegistStatistics;
import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.Deposit;
import com.kh.hello.admin.model.vo.InterestStatistics;
import com.kh.hello.admin.model.vo.NationalStatistics;
import com.kh.hello.admin.model.vo.PlatformStatistics;
import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;
import com.kh.hello.admin.model.vo.Question;
import com.kh.hello.admin.model.vo.Report;
import com.kh.hello.admin.model.vo.Reservation;
import com.kh.hello.admin.model.vo.SalesStatistics;
import com.kh.hello.message.model.vo.Message;
@Repository
public class AdminDaoImpl implements AdminDao{
   
	//예약 리스트 카운트용
	@Override
	public int getReservationListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Reservation.selectReservationListCount");
	}
	
	//예약 리스트
	@Override
	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Reservation> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Reservation.selectReservationList", null, rowBounds);
		return list;
	}

	//예약 리스트 검색 카운트용
	@Override
	public int getSearchWordReservationListCount(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.selectOne("Reservation.selectSearchWordReservationListCount",r);
	}
	
    //예약 리스트 검색
	@Override
	public ArrayList<Reservation> selectSearchWordReservationList(SqlSessionTemplate sqlSession, Reservation r, PageInfo pi) {
		ArrayList<Reservation> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Reservation.selectSearchReservationList", r, rowBounds);
		return list;
	}

	//예약 리스트 날짜 검색 카운트용
	@Override
	public int getSearchDateReservationListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("Reservation.selectSearchDateReservationListCount",d);
	}

	//예약 리스트 날짜 검색
	@Override
	public ArrayList<Reservation> selectSearchDateReservationList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Reservation> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Reservation.selectSearchDateReservationList", d, rowBounds);
		return list;
	}

	//신고 리스트 카운트용
	@Override
	public int getReportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Report.selectReportListCount");
	}

	//신고 리스트
	@Override
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Report> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Report.selectReportList", null, rowBounds);
		return list;
	}

	//신고일 리스트 카운트
	@Override
	public int getSearchDateReportListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("Report.selectSearchDateReportListCount",d);
	}

	//신고일 검색
	@Override
	public ArrayList<Report> selectSearchDateReportList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Report> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Report.selectSearchDateReportList", d, rowBounds);
		return list;
	}

	//신고 검색 리스트 카운트
	@Override
	public int getSearchWordReportListCount(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.selectOne("Report.selectSearchWordReportListCount",r);
	}

	//신고 검색 리스트
	@Override
	public ArrayList<Report> selectSearchWordReportList(SqlSessionTemplate sqlSession, Report r, PageInfo pi) {
		ArrayList<Report> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Report.selectSearchReportList", r, rowBounds);
		return list;
	}

	//신고 상세 게시글
	@Override
	public ArrayList<Report> selectBoardReportOne(SqlSessionTemplate sqlSession, int refId) {
		return (ArrayList)sqlSession.selectList("Report.selectBoardReportOne", refId);
	}
	
    //신고 상세 댓글
	@Override
	public ArrayList<Report> selectReplyReportOne(SqlSessionTemplate sqlSession, int refId) {
		return (ArrayList)sqlSession.selectList("Report.selectReplyReportOne", refId);
	}

	//신고 상세 메세지
	@Override
	public ArrayList<Report> selectMessageReportOne(SqlSessionTemplate sqlSession, int refId) {
		return (ArrayList)sqlSession.selectList("Report.selectMessageReportOne", refId);
	}

	//신고 결과 업데이트
	@Override
	public int updateReportResult(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.update("Report.updateReportResult", r);
	}

	//블랙리스트 insert
	@Override
	public int insertBlacklist(SqlSessionTemplate sqlSession, Blacklist b) {
		return sqlSession.insert("Blacklist.insertBlacklist",b);
	}
	
	//멤버 상태 업데이트
	@Override
	public int updateMemberStatus(SqlSessionTemplate sqlSession, Blacklist b) {
		return sqlSession.update("Blacklist.updateMemberStatus", b);
	}

	//블랙리스트 해당 글 삭제
	@Override
	public int updateBoardStatus(SqlSessionTemplate sqlSession, int refId) {
		return sqlSession.update("Blacklist.updateBoardStatus", refId);
	}
	
	//블랙리스트 해당 댓글 삭제
	@Override
	public int updateReplyStatus(SqlSessionTemplate sqlSession, int refId) {
		return sqlSession.update("Blacklist.updateReplyStatus", refId);
	}

	//블랙리스트 해당 메세지 삭제
	@Override
	public int updateMessageStatus(SqlSessionTemplate sqlSession, int refId) {
		return sqlSession.update("Blacklist.updateMessageStatus", refId);
	}

	//블랙리스트 전체리스트 카운트
	@Override
	public int getBlacklistCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Blacklist.selectBlacklistCount");
	}
    
	//블랙리스트 전체리스트
	@Override
	public ArrayList<Blacklist> selectBlacklist(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Blacklist> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Blacklist.selectBlacklist", null, rowBounds);
		return list;
	}
	
	//블랙리스트 등록일 검색 카운트용
	@Override
	public int getSearchRDateBlacklistCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("Blacklist.selectSearchRDateBlacklistCount",d);
	}

	//블랙리스트 등록일 검색 리스트
	@Override
	public ArrayList<Blacklist> selectSearchRDateBlacklist(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Blacklist> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Blacklist.selectSearchRDateBlacklist", d, rowBounds);
		return list;
	}

	//블랙리스트 해지일 검색 카운트용
	@Override
	public int getSearchTDateBlacklistCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("Blacklist.selectSearchTDateBlacklistCount",d);

	}

	//블랙리스트 해지일 검색 리스트
	@Override
	public ArrayList<Blacklist> selectSearchTDateBlacklist(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Blacklist> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Blacklist.selectSearchTDateBlacklist", d, rowBounds);
		return list;
	}
	
    //블랙리스트 미해지건 검색 리스트 카운트
	@Override
	public int getnoTBlacklistCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Blacklist.selectnoTBlacklistCount");

	}
	//블랙리스트 미해지건 검색 리스트
	@Override
	public ArrayList<Blacklist> selectnoTBlacklist(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Blacklist> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Blacklist.selectnoTBlacklist", null, rowBounds);
		return list;
	}

	//블랙리스트 번호,대상 검색 카운트
	@Override
	public int getSearchWordBlacklistCount(SqlSessionTemplate sqlSession, Blacklist b) {
		return sqlSession.selectOne("Blacklist.selectSearchWordBlacklistCount",b);

	}
	
    //블랙리스트 번호,대상 검색 리스트
	@Override
	public ArrayList<Blacklist> selectSearchWordBlacklist(SqlSessionTemplate sqlSession, Blacklist b, PageInfo pi) {
		ArrayList<Blacklist> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Blacklist.selectSearchWordBlacklist", b, rowBounds);
		return list;
	}

	//문의 리스트 카운트
	@Override
	public int getQuestionListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Question.getQuestionListCount");
	}

	//문의 리스트
	@Override
	public ArrayList<Question> selectQuestionList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Question> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Question.selectQuestionList", null, rowBounds);
		return list;
	}

	//문의일 검색 카운트
	@Override
	public int getSearchDateQuestionListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("Question.getSearchDateQuestionListCount", d);
	}

	//문의일 검색 리스트
	@Override
	public ArrayList<Question> selectSearchDateQuestionList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Question> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Question.selectSearchDateQuestionList", d, rowBounds);
		return list;
	}

	//문의 검색 카운트
	@Override
	public int getSearchWordQuestionListCount(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.selectOne("Question.getSearchWordQuestionListCount", q);
	}

	//문의 검색 리스트
	@Override
	public ArrayList<Question> selectSearchWordQuestionList(SqlSessionTemplate sqlSession, Question q, PageInfo pi) {
		ArrayList<Question> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Question.selectSearchWordQuestionList", q, rowBounds);
		return list;
	}

	//문의 답변 발송
	@Override
	public int insertAnswerMsg(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.insert("Message.insertAnswerMsg", m);
	}

	//답변 된 문의 pDate 업데이트
	@Override
	public int updatepDate(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.update("Message.updatepDate", m);
	}

	//업체 승인 신청 리스트 카운트
	@Override
	public int getCompanyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Company.selectCompanyListCount");
	}

	//업체 승인 신청 리스트
	@Override
	public ArrayList<Approval> selectCompanyList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Approval> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Company.selectCompanyList", null, rowBounds);
		return list;
	}

	//업체 등록일 검색 리스트 카운트
	@Override
	public int getSearchcrDateCompanyListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("Company.selectSearchcrDateCompanyListCount", d);
	}

	//업체 등록일 검색 리스트
	@Override
	public ArrayList<Approval> selectSearchcrDateCompanyList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Approval> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Company.selectSearchcrDateCompanyList", d, rowBounds);
		return list;
	}
	
	//업체 승인일 검색 리스트 카운트
	@Override
	public int getSearchapDateCompanyListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("Company.selectSearchapDateCompanyListCount", d);

	}
	
	//업체 승인일 검색 리스트
	@Override
	public ArrayList<Approval> selectSearchapDateCompanyList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Approval> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Company.selectSearchapDateCompanyList", d, rowBounds);
		return list;
	}

	//업체 검색 리스트 카운트
	@Override
	public int getSearchWordCompanyListCount(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.selectOne("Company.selectSearchWordCompanyListCount", a);
	}

	//업체 검색 리스트
	@Override
	public ArrayList<Approval> selectSearchWordCompanyList(SqlSessionTemplate sqlSession, Approval a, PageInfo pi) {
		ArrayList<Approval> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Company.selectSearchWordCompanyList", a, rowBounds);
		return list;
	}

	//업체 디테일
	@Override
	public ArrayList<CompanyDetails> selectOneCompany(SqlSessionTemplate sqlSession, int crId) {
		return (ArrayList)sqlSession.selectList("Company.selectOneCompany", crId);
	}

	//업체 첨부파일
	@Override
	public ArrayList<Attachment> selectCompanyFiles(SqlSessionTemplate sqlSession, int refId) {
		return (ArrayList)sqlSession.selectList("Company.selectCompanyFiles", refId);
	}

	//첨부파일 정보 읽어가기
	@Override
	public Map<String, Object> selectFileInfo(SqlSessionTemplate sqlSession, int fId) {
		return (Map<String, Object>)sqlSession.selectOne("Company.selectFileInfo", fId);

	}

	//회사 승인
	@Override
	public int updateCompanyRegist(SqlSessionTemplate sqlSession, CompanyDetails cd) {
		return sqlSession.update("Company.updateCompanyRegist", cd);
	}

	//회사 해지
	@Override
	public int updateCompanyStatus(SqlSessionTemplate sqlSession, String crId) {
		return sqlSession.update("Company.updateCompanyStatus", Integer.parseInt(crId));
	}

	//해지 메세지 발송을 위해 찾아오기
	@Override
	public Message selectReceiveId(SqlSessionTemplate sqlSession, String crId) {
		return sqlSession.selectOne("Message.selectReceiveId", Integer.parseInt(crId));
	}

	//해지 메세지 발송
	@Override
	public int insertTerminateMsg(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.insert("Message.insertTerminateMsg", m);
	}

	//입금 처리를 위한 리스트 카운트
	@Override
	public int getDepositListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Deposit.selectDepositListCount");
	}
	//입금 처리를 위한 리스트
	@Override
	public ArrayList<Deposit> selectDepositList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Deposit> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Deposit.selectDepositList", null, rowBounds);
		return list;
	}

	//입금처리를 위한 리스트 검색 카운트
	@Override
	public int getSearchWordDepositListCount(SqlSessionTemplate sqlSession, Deposit d) {
		return sqlSession.selectOne("Deposit.selectSearchWordDepositListCount",d);
	}

	//입금처리를 위한 리스트 검색
	@Override
	public ArrayList<Deposit> selectSearchWordDepositList(SqlSessionTemplate sqlSession, Deposit d, PageInfo pi) {
		ArrayList<Deposit> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Deposit.selectSearchWordDepositList", d, rowBounds);
		return list;
	}

	//업체 입금해주기
	@Override
	public int insertDepositHistory(SqlSessionTemplate sqlSession, Deposit d) {
		return sqlSession.insert("Deposit.insertDepositHistory",d);
	}

	//입금내역 리스트 카운트
	@Override
	public int getDepositHistoryListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Deposit.selectDepositHistoryListCount");
	}

	//입금내역 리스트
	@Override
	public ArrayList<Deposit> selectDepositHistoryList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Deposit> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Deposit.selectDepositHistoryList", null, rowBounds);
		return list;
	}

	//입금내역 입금일 검색 카운트
	@Override
	public int getSearchDateDepositHistoryListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("Deposit.selectSearchDateDepositHistoryListCount",d);
	}

	//입금내역 입금일 검색
	@Override
	public ArrayList<Deposit> selectSearchDateDepositHistoryList(SqlSessionTemplate sqlSession, DatePick d,
			PageInfo pi) {
		ArrayList<Deposit> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Deposit.selectSearchDateDepositHistoryList", d, rowBounds);
		return list;
	}

	//입금내역 검색 카운트
	@Override
	public int getSearchWordDepositHistroyListCount(SqlSessionTemplate sqlSession, Deposit d) {
		return sqlSession.selectOne("Deposit.selectSearchWordDepositHistroyListCount",d);
	}

	//입금내역 검색
	@Override
	public ArrayList<Deposit> selectSearchWordDepositHistoryList(SqlSessionTemplate sqlSession, Deposit d,
			PageInfo pi) {
		ArrayList<Deposit> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Deposit.selectSearchWordDepositHistoryList", d, rowBounds);
		return list;
	}

	//국가별 가입자수(월별)
	@Override
	public ArrayList<NationalStatistics> selectNationalStatistics(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Statistics.selectNationalStatistics");
	}

	//회원 관심분야 통계
	@Override
	public ArrayList<InterestStatistics> selectInterestStatistics(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Statistics.selectInterestStatistics");
	}

	//회원 플랫폼 통계
	@Override
	public ArrayList<PlatformStatistics> selectPlatformStatistics(SqlSessionTemplate sqlSession, int row) {
		return (ArrayList)sqlSession.selectList("Statistics.selectPlatformStatistics",row);
	}

	//업체 등록 지역 통계
	@Override
	public ArrayList<CompanyAreaStatistics> selectCompanyAreaStatistics(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Statistics.selectCompanyAreaStatistics");
	}

	//업체 등록 기간 통계
	@Override
	public ArrayList<CompanyPeriodStatistics> selectCompanyPeriodStatistics(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Statistics.selectCompanyPeriodStatistics");
	}

	//업체 등록 건수 통계
	@Override
	public ArrayList<CompanyRegistStatistics> selectCompanyRegistStatistics(SqlSessionTemplate sqlSession, int row) {
		return (ArrayList)sqlSession.selectList("Statistics.selectCompanyRegistStatistics",row);
	}

	//매출 통계 리스트 카운트
	@Override
	public int selectSalesStatisticsListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Statistics.selectSalesStatisticsListCount");
	}

	//매출 통계 리스트
	@Override
	public ArrayList<SalesStatistics> selectSalesStatisticsList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<SalesStatistics> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Statistics.selectSalesStatisticsList", null, rowBounds);
		return list;
	}

	//매출 통계(메인)
	@Override
	public ArrayList<SalesStatistics> selectMainSalesStatistics(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Statistics.selectMainSalesStatistics");
	}

	//메인 이번달 수익
	@Override
	public ArrayList<SalesStatistics> selectMainProfit(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Statistics.selectMainProfit");
	}

	//메인 미승인 업체 수
	@Override
	public int selectUnapprovedCompanyCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Company.selectUnapprovedCompanyCount");
	}

	//제휴만료도래 
	@Override
	public ArrayList<CompanyDetails> selectExpirationList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Company.selectExpirationList");
	}

	//엑셀 다운로드
	@Override
	public ArrayList<Deposit> listExcelDownload(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Deposit.listExcelDownload");
	}

	//엑셀 업로드 파일 insert
	@Override
	public void excelUpload(SqlSessionTemplate sqlSession, ArrayList<Deposit> list) {
		for(Deposit d:list){
			sqlSession.insert("insertDepositHistory", d);
		}
	}

}
