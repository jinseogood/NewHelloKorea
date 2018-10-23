package com.kh.hello.admin.model.service;
      
import java.io.File;
import java.util.ArrayList;
import java.util.Map;


import org.springframework.transaction.annotation.Transactional;

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
@Transactional   
public interface AdminService {

	int getReservationListCount();
	ArrayList<Reservation> selectReservationList(PageInfo pi);
	int getSearchDateReservationListCount(DatePick d);
	ArrayList<Reservation> selectSearchDateReservationList(DatePick d, PageInfo pi);
	int getSearchWordReservationListCount(Reservation r);
	ArrayList<Reservation> selectSearchWordReservationList(Reservation r, PageInfo pi);

	int getReportListCount();
	ArrayList<Report> selectReportList(PageInfo pi);
	int getSearchDateReportListCount(DatePick d);
	ArrayList<Report> selectSearchDateReportList(DatePick d, PageInfo pi);
	int getSearchWordReportListCount(Report r);
	ArrayList<Report> selectSearchWordReportList(Report r, PageInfo pi);
	ArrayList<Report> selectBoardReportOne(int refId);
	ArrayList<Report> selectReplyReportOne(int refId);
	ArrayList<Report> selectMessageReportOne(int refId);
	
	int updateReportResult(Report r);
	int updateBlacklist(Report r, Blacklist b);
	
	int getBlacklistCount();
	ArrayList<Blacklist> selectBlacklist(PageInfo pi);
	int getSearchRDateBlacklistCount(DatePick d);
	ArrayList<Blacklist> selectSearchRDateBlacklist(DatePick d, PageInfo pi);
	int getSearchTDateBlacklistCount(DatePick d);
	ArrayList<Blacklist> selectSearchTDateBlacklist(DatePick d, PageInfo pi);
	int getnoTBlacklistCount();
	ArrayList<Blacklist> selectnoTBlacklist(PageInfo pi);
	int getSearchWordBlacklistCount(Blacklist b);
	ArrayList<Blacklist> selectSearchWordBlacklist(Blacklist b, PageInfo pi);
	
	int getQuestionListCount();
	ArrayList<Question> selectQuestionList(PageInfo pi);
	int getSearchDateQuestionListCount(DatePick d);
	ArrayList<Question> selectSearchDateQuestionList(DatePick d, PageInfo pi);
	int getSearchWordQuestionListCount(Question q);
	ArrayList<Question> selectSearchWordQuestionList(Question q, PageInfo pi);
	
	int insertAnswerMsg(Message m);
	
	int getCompanyListCount();
	ArrayList<Approval> selectCompanyList(PageInfo pi);
	int getSearchcrDateCompanyListCount(DatePick d);
	ArrayList<Approval> selectSearchcrDateCompanyList(DatePick d, PageInfo pi);
	int getSearchapDateCompanyListCount(DatePick d);
	ArrayList<Approval> selectSearchapDateCompanyList(DatePick d, PageInfo pi);
	int getSearchWordCompanyListCount(Approval a);
	ArrayList<Approval> selectSearchWordCompanyList(Approval a, PageInfo pi);
	ArrayList<CompanyDetails> selectOneCompany(int crId);
	
	ArrayList<Attachment> selectCompanyFiles(int refId);
	Map<String, Object> selectFileInfo(int fId) throws Exception;
	int updateCompanyRegist(CompanyDetails cd);
	int terminateCompany(String crId, String content);
	
	int getDepositListCount();
	ArrayList<Deposit> selectDepositList(PageInfo pi);
	int getSearchWordDepositListCount(Deposit d);
	ArrayList<Deposit> selectSearchWordDepositList(Deposit d, PageInfo pi);
	int insertDepositHistory(Deposit d);
	
	int getDepositHistoryListCount();
	ArrayList<Deposit> selectDepositHistoryList(PageInfo pi);
	int getSearchDateDepositHistoryListCount(DatePick d);
	ArrayList<Deposit> selectSearchDateDepositHistoryList(DatePick d, PageInfo pi);
	int getSearchWordDepositHistroyListCount(Deposit d);
	ArrayList<Deposit> selectSearchWordDepositHistoryList(Deposit d, PageInfo pi);
	
	ArrayList<NationalStatistics> selectNationalStatistics();
	ArrayList<InterestStatistics> selectInterestStatistics();
	ArrayList<PlatformStatistics> selectPlatformStatistics(int row);
	ArrayList<CompanyAreaStatistics> selectCompanyAreaStatistics();
	ArrayList<CompanyPeriodStatistics> selectCompanyPeriodStatistics();
	ArrayList<CompanyRegistStatistics> selectCompanyRegistStatistics(int row);
	int selectSalesStatisticsListCount();
	ArrayList<SalesStatistics> selectSalesStatisticsList(PageInfo pi);
	
	ArrayList<SalesStatistics> selectMainSalesStatistics();
	ArrayList<SalesStatistics> selectMainProfit();
	int selectUnapprovedCompanyCount();
	ArrayList<CompanyDetails> selectExpirationList();
	
	ArrayList<Deposit> listExcelDownload();
	void excelUpload(File destFile) throws Exception;

	
}
