package com.kh.hello.admin.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

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
       
public interface AdminDao {

	int getReservationListCount(SqlSessionTemplate sqlSession);
	ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, PageInfo pi);
	int getSearchDateReservationListCount(SqlSessionTemplate sqlSession, DatePick d);
	ArrayList<Reservation> selectSearchDateReservationList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi);
	int getSearchWordReservationListCount(SqlSessionTemplate sqlSession, Reservation r);
	ArrayList<Reservation> selectSearchWordReservationList(SqlSessionTemplate sqlSession, Reservation r, PageInfo pi);

	int getReportListCount(SqlSessionTemplate sqlSession);
	ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi);
	int getSearchDateReportListCount(SqlSessionTemplate sqlSession, DatePick d);
	ArrayList<Report> selectSearchDateReportList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi);
	int getSearchWordReportListCount(SqlSessionTemplate sqlSession, Report r);
	ArrayList<Report> selectSearchWordReportList(SqlSessionTemplate sqlSession, Report r, PageInfo pi);
	ArrayList<Report> selectBoardReportOne(SqlSessionTemplate sqlSession, int refId);
	ArrayList<Report> selectReplyReportOne(SqlSessionTemplate sqlSession, int refId);
	ArrayList<Report> selectMessageReportOne(SqlSessionTemplate sqlSession, int refId);
	
	int updateReportResult(SqlSessionTemplate sqlSession, Report r);
	int insertBlacklist(SqlSessionTemplate sqlSession, Blacklist b);
	int updateMemberStatus(SqlSessionTemplate sqlSession, Blacklist b);
	int updateBoardStatus(SqlSessionTemplate sqlSession, int refId);
	int updateReplyStatus(SqlSessionTemplate sqlSession, int refId);
	int updateMessageStatus(SqlSessionTemplate sqlSession, int refId);
	
	int getBlacklistCount(SqlSessionTemplate sqlSession);
	ArrayList<Blacklist> selectBlacklist(SqlSessionTemplate sqlSession, PageInfo pi);
	int getSearchRDateBlacklistCount(SqlSessionTemplate sqlSession, DatePick d);
	ArrayList<Blacklist> selectSearchRDateBlacklist(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi);
	int getSearchTDateBlacklistCount(SqlSessionTemplate sqlSession, DatePick d);
	ArrayList<Blacklist> selectSearchTDateBlacklist(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi);
	int getnoTBlacklistCount(SqlSessionTemplate sqlSession);
	ArrayList<Blacklist> selectnoTBlacklist(SqlSessionTemplate sqlSession, PageInfo pi);
	int getSearchWordBlacklistCount(SqlSessionTemplate sqlSession, Blacklist b);
	ArrayList<Blacklist> selectSearchWordBlacklist(SqlSessionTemplate sqlSession, Blacklist b, PageInfo pi);
	
	int getQuestionListCount(SqlSessionTemplate sqlSession);
	ArrayList<Question> selectQuestionList(SqlSessionTemplate sqlSession, PageInfo pi);
	int getSearchDateQuestionListCount(SqlSessionTemplate sqlSession, DatePick d);
	ArrayList<Question> selectSearchDateQuestionList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi);
	int getSearchWordQuestionListCount(SqlSessionTemplate sqlSession, Question q);
	ArrayList<Question> selectSearchWordQuestionList(SqlSessionTemplate sqlSession, Question q, PageInfo pi);
	
	int insertAnswerMsg(SqlSessionTemplate sqlSession, Message m);
	int updatepDate(SqlSessionTemplate sqlSession, Message m);
	
	int getCompanyListCount(SqlSessionTemplate sqlSession);
	ArrayList<Approval> selectCompanyList(SqlSessionTemplate sqlSession, PageInfo pi);
	int getSearchcrDateCompanyListCount(SqlSessionTemplate sqlSession, DatePick d);
	ArrayList<Approval> selectSearchcrDateCompanyList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi);
	int getSearchapDateCompanyListCount(SqlSessionTemplate sqlSession, DatePick d);
	ArrayList<Approval> selectSearchapDateCompanyList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi);
	int getSearchWordCompanyListCount(SqlSessionTemplate sqlSession, Approval a);
	ArrayList<Approval> selectSearchWordCompanyList(SqlSessionTemplate sqlSession, Approval a, PageInfo pi);
	ArrayList<CompanyDetails> selectOneCompany(SqlSessionTemplate sqlSession, int crId);
	
	ArrayList<Attachment> selectCompanyFiles(SqlSessionTemplate sqlSession, int refId);
	Map<String, Object> selectFileInfo(SqlSessionTemplate sqlSession, int fId);
	int updateCompanyRegist(SqlSessionTemplate sqlSession, CompanyDetails cd);
	int updateCompanyStatus(SqlSessionTemplate sqlSession, String crId);
	Message selectReceiveId(SqlSessionTemplate sqlSession, String crId);
	int insertTerminateMsg(SqlSessionTemplate sqlSession, Message m);
	
	int getDepositListCount(SqlSessionTemplate sqlSession);
	ArrayList<Deposit> selectDepositList(SqlSessionTemplate sqlSession, PageInfo pi);
	int getSearchWordDepositListCount(SqlSessionTemplate sqlSession, Deposit d);
	ArrayList<Deposit> selectSearchWordDepositList(SqlSessionTemplate sqlSession, Deposit d, PageInfo pi);
	int insertDepositHistory(SqlSessionTemplate sqlSession, Deposit d);
	
	int getDepositHistoryListCount(SqlSessionTemplate sqlSession);
	ArrayList<Deposit> selectDepositHistoryList(SqlSessionTemplate sqlSession, PageInfo pi);
	int getSearchDateDepositHistoryListCount(SqlSessionTemplate sqlSession, DatePick d);
	ArrayList<Deposit> selectSearchDateDepositHistoryList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi);
	int getSearchWordDepositHistroyListCount(SqlSessionTemplate sqlSession, Deposit d);
	ArrayList<Deposit> selectSearchWordDepositHistoryList(SqlSessionTemplate sqlSession, Deposit d, PageInfo pi);
	
	ArrayList<NationalStatistics> selectNationalStatistics(SqlSessionTemplate sqlSession);
	ArrayList<InterestStatistics> selectInterestStatistics(SqlSessionTemplate sqlSession);
	ArrayList<PlatformStatistics> selectPlatformStatistics(SqlSessionTemplate sqlSession, int row);
	ArrayList<CompanyAreaStatistics> selectCompanyAreaStatistics(SqlSessionTemplate sqlSession);
	ArrayList<CompanyPeriodStatistics> selectCompanyPeriodStatistics(SqlSessionTemplate sqlSession);
	ArrayList<CompanyRegistStatistics> selectCompanyRegistStatistics(SqlSessionTemplate sqlSession, int row);
	int selectSalesStatisticsListCount(SqlSessionTemplate sqlSession);
	ArrayList<SalesStatistics> selectSalesStatisticsList(SqlSessionTemplate sqlSession, PageInfo pi);
	
	ArrayList<SalesStatistics> selectMainSalesStatistics(SqlSessionTemplate sqlSession);
	ArrayList<SalesStatistics> selectMainProfit(SqlSessionTemplate sqlSession);
	int selectUnapprovedCompanyCount(SqlSessionTemplate sqlSession);
	ArrayList<CompanyDetails> selectExpirationList(SqlSessionTemplate sqlSession);
	
	
	ArrayList<Deposit> listExcelDownload(SqlSessionTemplate sqlSession);
	void excelUpload(SqlSessionTemplate sqlSession, ArrayList<Deposit> list);
	
	
	
	
}
