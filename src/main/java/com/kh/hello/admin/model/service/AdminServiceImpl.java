package com.kh.hello.admin.model.service;
       
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.hello.admin.controller.ExcelRead;
import com.kh.hello.admin.controller.ExcelReadOption;
import com.kh.hello.admin.model.dao.AdminDao;
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
@Service
@Transactional
public class AdminServiceImpl implements AdminService{
	@Autowired
    private SqlSessionTemplate sqlSession;
    @Autowired
    private AdminDao ad;
    @Autowired
	private DataSourceTransactionManager transactionManager;
    
    //예약 리스트 카운트용
	@Override
	public int getReservationListCount() {
		return ad.getReservationListCount(sqlSession);
	}
	
	//예약 리스트
	@Override
	public ArrayList<Reservation> selectReservationList(PageInfo pi) {
		return ad.selectReservationList(sqlSession, pi);
	}

    //예약 리스트 날짜 검색 카운트
	@Override
	public int getSearchDateReservationListCount(DatePick d) {
		return ad.getSearchDateReservationListCount(sqlSession, d);
	}
    //예약 리스트 날짜 검색
	@Override
	public ArrayList<Reservation> selectSearchDateReservationList(DatePick d, PageInfo pi) {
		return ad.selectSearchDateReservationList(sqlSession, d, pi);
	}

	//예약 리스트 검색 카운트용
	@Override
	public int getSearchWordReservationListCount(Reservation r) {
		return ad.getSearchWordReservationListCount(sqlSession, r);
	}

	//예약 리스트 검색
	@Override
	public ArrayList<Reservation> selectSearchWordReservationList(Reservation r, PageInfo pi) {
		return ad.selectSearchWordReservationList(sqlSession, r, pi);
	}

	//신고 리스트 카운트용
	@Override
	public int getReportListCount() {
		return ad.getReportListCount(sqlSession);
	}
    
	//신고 리스트
	@Override
	public ArrayList<Report> selectReportList(PageInfo pi) {
		return ad.selectReportList(sqlSession, pi);
	}

	//신고일 검색 카운트
	@Override
	public int getSearchDateReportListCount(DatePick d) {
		return ad.getSearchDateReportListCount(sqlSession, d);
	}

	//신고일 검색
	@Override
	public ArrayList<Report> selectSearchDateReportList(DatePick d, PageInfo pi) {
		return ad.selectSearchDateReportList(sqlSession, d, pi);
	}

	//신고 리스트 검색 카운트
	@Override
	public int getSearchWordReportListCount(Report r) {
		return ad.getSearchWordReportListCount(sqlSession, r);
	}

	//신고 리스트 검색
	@Override
	public ArrayList<Report> selectSearchWordReportList(Report r, PageInfo pi) {
		return ad.selectSearchWordReportList(sqlSession, r, pi);
	}

	//신고 상세 게시글
	@Override
	public ArrayList<Report> selectBoardReportOne(int refId) {
		return ad.selectBoardReportOne(sqlSession, refId);
	}

	//신고 상세 댓글
	@Override
	public ArrayList<Report> selectReplyReportOne(int refId) {
		return ad.selectReplyReportOne(sqlSession, refId);
	}

	//신고 상세 메세지
	@Override
	public ArrayList<Report> selectMessageReportOne(int refId) {
		return ad.selectMessageReportOne(sqlSession, refId);
	}

	//신고 반려 시 업데이트
	@Override
	public int updateReportResult(Report r) {
		return ad.updateReportResult(sqlSession, r);
	}

	//신고 블랙리스트 등록
	@Override
	@Transactional
	public int updateBlacklist(Report r, Blacklist b) {
        int result = -99;
		
		int result1 = ad.updateReportResult(sqlSession, r);
		int result2 = ad.insertBlacklist(sqlSession, b);
		int result3 = ad.updateMemberStatus(sqlSession, b);
		int result4 = 0;
		if(r.getrLevel()==0){
			result4 = ad.updateBoardStatus(sqlSession, r.getRefId());
		}else if(r.getrLevel()==1){
			result4 = ad.updateReplyStatus(sqlSession, r.getRefId());
		}else{
			result4 = ad.updateMessageStatus(sqlSession, r.getRefId());
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0){
			result = 1;
		}else{
			result = 0;
		}
		return result;
	}

	//블랙리스트 전체 리스트 카운트
	@Override
	public int getBlacklistCount() {
		return ad.getBlacklistCount(sqlSession);
	}
    
	//블랙리스트 전체 리스트
	@Override
	public ArrayList<Blacklist> selectBlacklist(PageInfo pi) {
		return ad.selectBlacklist(sqlSession, pi);
	}

	//블랙리스트 등록일 검색 리스트 카운트
	@Override
	public int getSearchRDateBlacklistCount(DatePick d) {
		return ad.getSearchRDateBlacklistCount(sqlSession, d);
	}
     
	//블랙리스트 등록일 검색 리스트
	@Override
	public ArrayList<Blacklist> selectSearchRDateBlacklist(DatePick d, PageInfo pi) {
		return ad.selectSearchRDateBlacklist(sqlSession, d, pi);
	}
    
	//블랙리스트 해지일 검색 리스트 카운트
	@Override
	public int getSearchTDateBlacklistCount(DatePick d) {
		return ad.getSearchTDateBlacklistCount(sqlSession, d);
	}

	//블랙리스트 해지일 검색 리스트
	@Override
	public ArrayList<Blacklist> selectSearchTDateBlacklist(DatePick d, PageInfo pi) {
		return ad.selectSearchTDateBlacklist(sqlSession, d, pi);
	}
	
	//블랙리스트 미해지건 검색 리스트 카운트
	@Override
	public int getnoTBlacklistCount() {
		return ad.getnoTBlacklistCount(sqlSession);
	}

	//블랙리스트 미해지건 검색 리스트
	@Override
	public ArrayList<Blacklist> selectnoTBlacklist(PageInfo pi) {
		return ad.selectnoTBlacklist(sqlSession, pi);
	}
	
	//블랙리스트 검색 리스트 카운트
	@Override
	public int getSearchWordBlacklistCount(Blacklist b) {
		return ad.getSearchWordBlacklistCount(sqlSession, b);
	}

	//블랙리스트 검색 리스트
	@Override
	public ArrayList<Blacklist> selectSearchWordBlacklist(Blacklist b, PageInfo pi) {
		return ad.selectSearchWordBlacklist(sqlSession, b, pi);
	}

	//문의 리스트 카운트
	@Override
	public int getQuestionListCount() {
		return ad.getQuestionListCount(sqlSession);
	}

	//문의 리스트
	@Override
	public ArrayList<Question> selectQuestionList(PageInfo pi) {
		// TODO Auto-generated method stub
		return ad.selectQuestionList(sqlSession, pi);
	}

	//문의일 검색 리스트 카운트
	@Override
	public int getSearchDateQuestionListCount(DatePick d) {
		return ad.getSearchDateQuestionListCount(sqlSession, d);
	}

	//문의일 검색 리스트
	@Override
	public ArrayList<Question> selectSearchDateQuestionList(DatePick d, PageInfo pi) {
		return ad.selectSearchDateQuestionList(sqlSession, d, pi);

	}

	//문의 검색 리스트 카운트
	@Override
	public int getSearchWordQuestionListCount(Question q) {
		return ad.getSearchWordQuestionListCount(sqlSession, q);
	}

	//문의 검색 리스트
	@Override
	public ArrayList<Question> selectSearchWordQuestionList(Question q, PageInfo pi) {
		return ad.selectSearchWordQuestionList(sqlSession, q, pi);
	}

	//문의 답변 발송
	@Override
	@Transactional
	public int insertAnswerMsg(Message m) {
		int result= -99;
		int result1 = ad.insertAnswerMsg(sqlSession, m);
		int result2 = ad.updatepDate(sqlSession, m);
		
		if(result1 > 0 && result2 > 0){
			result = 1;
		}else{
			result = 0;
		}
		return result;
	}

	//회사 등록 이력 리스트 카운트
	@Override
	public int getCompanyListCount() {
		return ad.getCompanyListCount(sqlSession);
	}

	//회사 등록 이력 리스트
 	@Override
	public ArrayList<Approval> selectCompanyList(PageInfo pi) {
		return ad.selectCompanyList(sqlSession, pi);
	}

 	//회사 등록일 검색 카운트
	@Override
	public int getSearchcrDateCompanyListCount(DatePick d) {
		return ad.getSearchcrDateCompanyListCount(sqlSession, d);
	}

	//회사 등록일 검색
	@Override
	public ArrayList<Approval> selectSearchcrDateCompanyList(DatePick d, PageInfo pi) {
		return ad.selectSearchcrDateCompanyList(sqlSession, d, pi);
	}

	//회사 등록승인일 검색 리스트
	@Override
	public int getSearchapDateCompanyListCount(DatePick d) {
		return ad.getSearchapDateCompanyListCount(sqlSession, d);

	}

	//회사 등록승인일 검색
	@Override
	public ArrayList<Approval> selectSearchapDateCompanyList(DatePick d, PageInfo pi) {
		return ad.selectSearchapDateCompanyList(sqlSession, d, pi);

	}

	//회사 등록 이력 검색 카운트
	@Override
	public int getSearchWordCompanyListCount(Approval a) {
		return ad.getSearchWordCompanyListCount(sqlSession, a);
	}

	//회사 등록 이력 검색 리스트
	@Override
	public ArrayList<Approval> selectSearchWordCompanyList(Approval a, PageInfo pi) {
		return ad.selectSearchWordCompanyList(sqlSession, a, pi);
	}

	//업체 디테일 화면
	@Override
	public ArrayList<CompanyDetails> selectOneCompany(int crId) {
		return ad.selectOneCompany(sqlSession, crId);
	}

	//업체 첨부파일
	@Override
	public ArrayList<Attachment> selectCompanyFiles(int refId) {
		return ad.selectCompanyFiles(sqlSession, refId);
	}

	@Override
	public Map<String, Object> selectFileInfo(int fId) throws Exception {
		 return ad.selectFileInfo(sqlSession, fId);
	}

	//업체 승인
	@Override
	public int updateCompanyRegist(CompanyDetails cd) {
		return ad.updateCompanyRegist(sqlSession, cd);
	}

	//업체 해지
	@Override
	@Transactional
	public int terminateCompany(String crId, String content) {
		int result= -99;
		int result1 = ad.updateCompanyStatus(sqlSession, crId);
		Message m = ad.selectReceiveId(sqlSession, crId);
		m.setContent(content);
		int result2 = ad.insertTerminateMsg(sqlSession, m);
		if(result1 > 0 && result2 > 0){
			result = 1;
		}else{
			result = 0;
		}
		return result;
	}

	//입금처리리스트 카운트
	@Override
	public int getDepositListCount() {
		return ad.getDepositListCount(sqlSession);
	}

	//입금처리 리스트
	@Override
	public ArrayList<Deposit> selectDepositList(PageInfo pi) {
		return ad.selectDepositList(sqlSession, pi);
	}

	//입금처리 리스트 검색 카운트
	@Override
	public int getSearchWordDepositListCount(Deposit d) {
		return ad.getSearchWordDepositListCount(sqlSession, d);
	}

	//입급처리 리스트 검색
	@Override
	public ArrayList<Deposit> selectSearchWordDepositList(Deposit d, PageInfo pi) {
		return ad.selectSearchWordDepositList(sqlSession, d, pi);
	}

	//업체 입금해주기
	@Override
	public int insertDepositHistory(Deposit d) {
		return ad.insertDepositHistory(sqlSession, d);
	}

	//입금내역 리스트 카운트
	@Override
	public int getDepositHistoryListCount() {
		return ad.getDepositHistoryListCount(sqlSession);
	}

	//입금내역 리스트
	@Override
	public ArrayList<Deposit> selectDepositHistoryList(PageInfo pi) {
		return ad.selectDepositHistoryList(sqlSession, pi);
	}

	//입금내역 입금일 검색 카운트
	@Override
	public int getSearchDateDepositHistoryListCount(DatePick d) {
		return ad.getSearchDateDepositHistoryListCount(sqlSession,d);
	}

	//입금내역 입금일 검색
	@Override
	public ArrayList<Deposit> selectSearchDateDepositHistoryList(DatePick d, PageInfo pi) {
		return ad.selectSearchDateDepositHistoryList(sqlSession,d,pi);
	}

	//입금내역 검색 카운트
	@Override
	public int getSearchWordDepositHistroyListCount(Deposit d) {
		return ad.getSearchWordDepositHistroyListCount(sqlSession,d);
	}

	//입금내역 검색
	@Override
	public ArrayList<Deposit> selectSearchWordDepositHistoryList(Deposit d, PageInfo pi) {
		return ad.selectSearchWordDepositHistoryList(sqlSession,d,pi);
	}

	//국가별 가입자수
	@Override
	public ArrayList<NationalStatistics> selectNationalStatistics() {
		return ad.selectNationalStatistics(sqlSession);
	}

	//회원 관심분야 통계
	@Override
	public ArrayList<InterestStatistics> selectInterestStatistics() {
		return ad.selectInterestStatistics(sqlSession);
	}

	//회원 플랫폼 분포 통계
	@Override
	public ArrayList<PlatformStatistics> selectPlatformStatistics(int row) {
		return ad.selectPlatformStatistics(sqlSession, row);
	}

	//업체 등록 지역별 통계
	@Override
	public ArrayList<CompanyAreaStatistics> selectCompanyAreaStatistics() {
		return ad.selectCompanyAreaStatistics(sqlSession);
	}

	//업체 등록 기간 통계
	@Override
	public ArrayList<CompanyPeriodStatistics> selectCompanyPeriodStatistics() {
		return ad.selectCompanyPeriodStatistics(sqlSession);
	}

	//업체 등록 건수 통계
	@Override
	public ArrayList<CompanyRegistStatistics> selectCompanyRegistStatistics(int row) {
		return ad.selectCompanyRegistStatistics(sqlSession, row);
	}

	//매출 통계 리스트 카운트
	@Override
	public int selectSalesStatisticsListCount() {
		return ad.selectSalesStatisticsListCount(sqlSession);
	}

	//매출 통계 리스트
	@Override
	public ArrayList<SalesStatistics> selectSalesStatisticsList(PageInfo pi) {
		return ad.selectSalesStatisticsList(sqlSession, pi);
	}

	//매출 통계(메인)
	@Override
	public ArrayList<SalesStatistics> selectMainSalesStatistics() {
		return ad.selectMainSalesStatistics(sqlSession);
	}

	//메인 이번달 수익
	@Override
	public ArrayList<SalesStatistics> selectMainProfit() {
		return ad.selectMainProfit(sqlSession);
	}

	//메인 미승인 업체 수
	@Override
	public int selectUnapprovedCompanyCount() {
		return ad.selectUnapprovedCompanyCount(sqlSession);
	}

	//메인 제휴만료도래
	@Override
	public ArrayList<CompanyDetails> selectExpirationList() {
		return ad.selectExpirationList(sqlSession);
	}

	//엑셀 다운로드
	@Override
	public ArrayList<Deposit> listExcelDownload() {
		return ad.listExcelDownload(sqlSession);
	}

	//엑셀 업로드
	@Override
    public void excelUpload(File destFile) throws Exception{
        ExcelReadOption excelReadOption = new ExcelReadOption();
        excelReadOption.setFilePath(destFile.getAbsolutePath());
        excelReadOption.setOutputColumns("A","B","C","D","E","F");
        excelReadOption.setStartRow(2);
        
        List<Map<String, String>>excelContent =ExcelRead.read(excelReadOption);
        ArrayList<Deposit> list = new ArrayList<Deposit>();
        
        for(Map<String, String> article: excelContent){
        	if(article.get("A") != null){
        		
        		Deposit d = new Deposit();
            	
            	d.setcId((int)Double.parseDouble(article.get("A")));
            	d.setcName(article.get("B"));
            	d.setBankNum(article.get("C"));
            	d.setdAmount((int)Double.parseDouble(article.get("D")));
            	d.setdDate(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
            	d.setdStatus(article.get("F"));
            	
            	if(d.getdStatus().equals("Y")){
                	list.add(d);
            	}
        		
        	}
        	
        }
        
        ad.excelUpload(sqlSession, list);
	}
}
