package com.kh.hello.admin.controller;
       
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.kh.hello.admin.model.service.AdminService;
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
import com.kh.hello.common.Pagination;
import com.kh.hello.common.Pagination3;
import com.kh.hello.message.model.vo.Message;
@Controller
public class AdminController {
   
	@Autowired
	private AdminService as;

	//관리자 마이페이지	
	@RequestMapping("myPageView.ad")
	public String myPageView(){
		return "admin/adminMain";
	}
	
    //업체 통계
	@RequestMapping("companyStatisticsView.ad")
	public String companyStatisticsView(){
		return "admin/companyStatistics";
	}
	
	//회원 통계
	@RequestMapping("memberStatisticsView.ad")
	public String memberStatisticsView(){
		return "admin/memberStatistics";
	}
	//예약내역조회
	@RequestMapping("selectReservationList.ad")
	public String selectReservationList(String searchParam, String searchWord, String fromDate, String toDate, PageInfo p, Model model){

		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}

		ArrayList<Reservation> list = null;
		PageInfo pi = null;
		
		//전체 리스트
		if(searchParam == null && searchWord == null){

			int listCount = as.getReservationListCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			list = as.selectReservationList(pi);

		//숙박일 검색
		}else if(searchParam.equals("datePick")){

			DatePick d = new DatePick();
			d.setFromDate(fromDate.replaceAll("-", ""));
			d.setToDate(toDate.replaceAll("-", ""));
			
			
			int listCount = as.getSearchDateReservationListCount(d);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchDateReservationList(d, pi);
			
		}else{
			Reservation r = new Reservation();
			r.setoId(-99);
			//예약번호 검색
			if(searchParam.equals("oId")){
				r.setoId(Integer.parseInt(searchWord));
			//예약처 검색	
			}else if(searchParam.equals("cName")){
				r.setcName(searchWord);
			//예약자 검색
			}else if(searchParam.equals("paName")){
				r.setPaName(searchWord);
			}
			
			int listCount = as.getSearchWordReservationListCount(r);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchWordReservationList(r, pi);
		}
		if(searchParam != null){
			if(searchParam.equals("oId")){
				model.addAttribute("category", "예약번호");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("cName")){
				model.addAttribute("category", "예약처");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("paName")){
				model.addAttribute("category", "예약자");
				model.addAttribute("word", searchWord);
			}else{
				model.addAttribute("category", "숙박일");
				model.addAttribute("word", fromDate + " ~ " + toDate);
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/reservation";
	}

	//신고 내역 조회
	@RequestMapping("selectReportList.ad")
	public String selectReportList(String searchParam, String searchWord, String fromDate, String toDate, PageInfo p, Model model){
		
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		ArrayList<Report> list = null;
		PageInfo pi = null;

		//전체 리스트
		if(searchParam == null && searchWord == null){

			int listCount = as.getReportListCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			list = as.selectReportList(pi);
			
		//신고일 검색
		 }else if(searchParam.equals("datePick")){

			DatePick d = new DatePick();
			d.setFromDate(fromDate.replaceAll("-", ""));
			d.setToDate(toDate.replaceAll("-", ""));
			int listCount = as.getSearchDateReportListCount(d);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchDateReportList(d, pi);
			
		}else{
			Report r = new Report();
			r.setrRecordId(-99);
			r.setrTarget(-99);
			//신고번호 검색
			if(searchParam.equals("rRecordId")){
				r.setrRecordId(Integer.parseInt(searchWord));
			//신고 대상 검색	
			}else if(searchParam.equals("rTarget")){
				r.setrTarget(Integer.parseInt(searchWord));
			}
			//미처리건 검색은 mapper에서
			int listCount = as.getSearchWordReportListCount(r);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchWordReportList(r, pi);
		}
		
		for(int i = 0; i < list.size(); i++){
			//구분
			if(list.get(i).getrLevel() == 0){
				list.get(i).setrLevelText("게시글");
			}else if(list.get(i).getrLevel() == 1){
				list.get(i).setrLevelText("댓글");
			}else{
				list.get(i).setrLevelText("메세지");
			}
			//처리상황
			if(list.get(i).getResult() == null){
				list.get(i).setResultText("미처리");
			}else{
				if(list.get(i).getResult().equals("Y")){
					list.get(i).setResultText("블랙리스트");
				}else{
					list.get(i).setResultText("반려");
				}
			}
		}
		
		if(searchParam != null){
			if(searchParam.equals("rRecordId")){
				model.addAttribute("category", "신고번호");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("rTarget")){
				model.addAttribute("category", "신고대상");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("noResult")){
				model.addAttribute("category", "미처리건");
				model.addAttribute("word", "");
			}else{
				model.addAttribute("category", "신고일");
				model.addAttribute("word", fromDate + " ~ " + toDate);
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/report";
	}

	//신고 상세조회
	@RequestMapping("selectReportOne.ad")
	public @ResponseBody HashMap<String, Object> selectReportOne(@RequestParam String rLevel, @RequestParam String refId){

		ArrayList<Report> list = null;
		
		if(Integer.parseInt(rLevel)==0){
			list = as.selectBoardReportOne(Integer.parseInt(refId));
		}else if(Integer.parseInt(rLevel)==1){
			list = as.selectReplyReportOne(Integer.parseInt(refId));
		}else{
			list = as.selectMessageReportOne(Integer.parseInt(refId));
		}
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		for(int i = 0; i < list.size(); i++){

			Format formatter = new SimpleDateFormat("yyyy-MM-dd");
			
			hmap.put("rRecordId" + i, list.get(i).getrRecordId());
			hmap.put("mId" + i, list.get(i).getmId());
			hmap.put("rDate" + i, formatter.format(list.get(i).getrDate()));
			hmap.put("reason" + i, list.get(i).getReason());
			
		}
		hmap.put("result", list.get(0).getResult());
		hmap.put("rLevel", rLevel);
		hmap.put("refId", refId);
		hmap.put("rTarget", list.get(0).getrTarget());
		hmap.put("rContent", list.get(0).getrContent());
		return hmap;
		
	}
	
	//신고 후 블랙리스트 입력
	@RequestMapping("insertBlacklist.ad")
	public String insertBlackList(String rLevel, String refId, String rTarget, String period, String reason, Model model){
		
		Report r = new Report();
		r.setResult("Y");
		r.setrLevel(Integer.parseInt(rLevel));
		r.setRefId(Integer.parseInt(refId));
		
		Blacklist b = new Blacklist();
		b.setmId(Integer.parseInt(rTarget));
		b.setPeriod(Integer.parseInt(period));
		b.setReason(reason);
		int result = as.updateBlacklist(r,b);
		
		if(result > 0){
			int listCount = as.getReportListCount();
			PageInfo pi = Pagination.getPageInfo(1, listCount);		
			ArrayList<Report> list = as.selectReportList(pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			for(int i = 0; i < list.size(); i++){
				//구분
				if(list.get(i).getrLevel() == 0){
					list.get(i).setrLevelText("게시글");
				}else if(list.get(i).getrLevel() == 1){
					list.get(i).setrLevelText("댓글");
				}else{
					list.get(i).setrLevelText("메세지");
				}
				//처리상황
				if(list.get(i).getResult() == null){
					list.get(i).setResultText("미처리");
				}else{
					if(list.get(i).getResult().equals("Y")){
						list.get(i).setResultText("블랙리스트");
					}else{
						list.get(i).setResultText("반려");
					}
				}
			}
			return "admin/report";
		}else{
			model.addAttribute("msg","블랙리스트 등록 실패");
			return "common/errorPage";
		}
		
		
	}
	
	//신고 반려
	@RequestMapping("refuseReport.ad")
	public String refuseReport(String rLevel, String refId, Model model){
		Report r = new Report();
		r.setResult("N");
		r.setrLevel(Integer.parseInt(rLevel));
		r.setRefId(Integer.parseInt(refId));
		
		int result = as.updateReportResult(r);
		
		if(result > 0){
			int listCount = as.getReportListCount();
			PageInfo pi = Pagination.getPageInfo(1, listCount);		
			ArrayList<Report> list = as.selectReportList(pi);
			for(int i = 0; i < list.size(); i++){
				//구분
				if(list.get(i).getrLevel() == 0){
					list.get(i).setrLevelText("게시글");
				}else if(list.get(i).getrLevel() == 1){
					list.get(i).setrLevelText("댓글");
				}else{
					list.get(i).setrLevelText("메세지");
				}
				//처리상황
				if(list.get(i).getResult() == null){
					list.get(i).setResultText("미처리");
				}else{
					if(list.get(i).getResult().equals("Y")){
						list.get(i).setResultText("블랙리스트");
					}else{
						list.get(i).setResultText("반려");
					}
				}
			}

			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "admin/report";
		}else{
			model.addAttribute("msg","신고 반려 실패");
			return "common/errorPage";
		}
		
	}
	
	//문의 내역 조회
	@RequestMapping("selectQuestionList.ad")
	public String selectQuestionList(String searchParam, String searchWord, String fromDate, String toDate, PageInfo p, Model model){
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		ArrayList<Question> list = null;
		PageInfo pi = null;
        int listCount;
		//전체 리스트
		if(searchParam == null && searchWord == null){

			listCount = as.getQuestionListCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			list = as.selectQuestionList(pi);
			
		//문의일 검색
		 }else if(searchParam.equals("datePick")){
			DatePick d = new DatePick();
			d.setFromDate(fromDate.replaceAll("-", ""));
			d.setToDate(toDate.replaceAll("-", ""));
			listCount = as.getSearchDateQuestionListCount(d);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchDateQuestionList(d, pi);
			
		}else{
			Question q = new Question();
			q.setqRecordId(-99);
			q.setSendId(-99);
			//문의번호 검색
			if(searchParam.equals("qRecordId")){
				q.setqRecordId(Integer.parseInt(searchWord));
			//문의자 검색	
			}else if(searchParam.equals("sendId")){
				q.setSendId(Integer.parseInt(searchWord));
			}
			//미처리건 검색은 mapper에서
			listCount = as.getSearchWordQuestionListCount(q);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchWordQuestionList(q, pi);
		}
		
		for(int i = 0; i < list.size(); i++){
			//처리상황
			if(list.get(i).getpDate() == null){
				list.get(i).setStatus("미처리");
			}else{
				list.get(i).setStatus("처리완료");
			}
			
		}
		if(searchParam != null){
			if(searchParam.equals("qRecordId")){
				model.addAttribute("category", "문의번호");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("sendId")){
				model.addAttribute("category", "문의자");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("noP")){
				model.addAttribute("category", "미처리건");
				model.addAttribute("word", "");
			}else{
				model.addAttribute("category", "문의일");
				model.addAttribute("word", fromDate + " ~ " + toDate);
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/question";
	}

	//문의 답변하기
	@RequestMapping("answerQuestion.ad")
	public String insertAnswerMsg(String receiveId, String content, String msgId, Model model){
		Message m = new Message();
		m.setReceiveId(Integer.parseInt(receiveId));
		m.setContent(content);
	    m.setMsgId(Integer.parseInt(msgId));
	    
		int result = as.insertAnswerMsg(m);
		
		if(result > 0){
			int listCount = as.getQuestionListCount();
			PageInfo pi = Pagination.getPageInfo(1, listCount);		
			ArrayList<Question> list = as.selectQuestionList(pi);
			for(int i = 0; i < list.size(); i++){
				//처리상황
				if(list.get(i).getpDate() == null){
					list.get(i).setStatus("미처리");
				}else{
					list.get(i).setStatus("처리완료");
				}

			}
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "admin/question";
		}else{
			model.addAttribute("msg","문의 답변 발송 실패");
			return "common/errorPage";
		}
	}
	
	//블랙리스트 내역 조회
	@RequestMapping("selectBlacklist.ad")
	public String selectBlacklist(String searchParam, String searchWord, String fromDate, String toDate, PageInfo p, Model model){
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}

		ArrayList<Blacklist> list = null;
		PageInfo pi = null;
		int listCount = 0;
		
		//전체 리스트
		if(searchParam == null && searchWord == null){

			listCount = as.getBlacklistCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			list = as.selectBlacklist(pi);

		//숙박일 검색
		}else if(searchParam.equals("datePick") || searchParam.equals("datePick2")){

			DatePick d = new DatePick();
			d.setFromDate(fromDate.replaceAll("-", ""));
			d.setToDate(toDate.replaceAll("-", ""));
			//등록일 검색
			if(searchParam.equals("datePick")){
				listCount = as.getSearchRDateBlacklistCount(d);
				pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
				list = as.selectSearchRDateBlacklist(d, pi);
			}else{ //해지일 검색
				listCount = as.getSearchTDateBlacklistCount(d);
				pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
				list = as.selectSearchTDateBlacklist(d, pi);
			}
			
		}else if(searchParam.equals("noT")){
			listCount = as.getnoTBlacklistCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectnoTBlacklist(pi);
		}else{
			
			Blacklist b = new Blacklist();
			b.setbRecordId(-99);
			//블랙리스트번호 검색
			if(searchParam.equals("bRecordId")){
				b.setbRecordId(Integer.parseInt(searchWord));
			//블랙리스트 대상 검색
			}else if(searchParam.equals("mId")){
				b.setmId(Integer.parseInt(searchWord));
			}
			
			listCount = as.getSearchWordBlacklistCount(b);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchWordBlacklist(b, pi);
		}
		if(searchParam != null){
			if(searchParam.equals("bRecordId")){
				model.addAttribute("category", "블랙리스트 번호");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("mId")){
				model.addAttribute("category", "대상");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("noT")){
				model.addAttribute("category", "미처리건");
				model.addAttribute("word", "");
			}else if(searchParam.equals("datePick")){
				model.addAttribute("category", "등록일자");
				model.addAttribute("word", fromDate + " ~ " + toDate);
			}else{
				model.addAttribute("category", "해지일자");
				model.addAttribute("word", fromDate + " ~ " + toDate);
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/blacklist";
	}

	//업체신청 이력조회
	@RequestMapping("selectCompanyList.ad")
	public String selectCompanyList(String searchParam, String searchWord, String fromDate, String toDate, PageInfo p, Model model){
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}

		ArrayList<Approval> list = null;
		PageInfo pi = null;
		int listCount = 0;
		
		//전체 리스트
		if(searchParam == null && searchWord == null){

			listCount = as.getCompanyListCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			list = as.selectCompanyList(pi);

		//신청일,승인일 검색
		}else if(searchParam.equals("datePick") || searchParam.equals("datePick2")){

			DatePick d = new DatePick();
			d.setFromDate(fromDate.replaceAll("-", ""));
			d.setToDate(toDate.replaceAll("-", ""));
			//등록일 검색
			if(searchParam.equals("datePick")){
				listCount = as.getSearchcrDateCompanyListCount(d);
				pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
				list = as.selectSearchcrDateCompanyList(d, pi);
			}else{ //해지일 검색
				listCount = as.getSearchapDateCompanyListCount(d);
				pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
				list = as.selectSearchapDateCompanyList(d, pi);
			}
			
		}else{
			Approval a = new Approval();
			a.setCrId(-99);
			//등록이력번호 검색
			if(searchParam.equals("crId")){
				a.setCrId(Integer.parseInt(searchWord));
			//업체명 검색
			}else if(searchParam.equals("cName")){
				a.setcName(searchWord);
		    //대표자명
			}else if(searchParam.equals("cPhone")){
				a.setcPhone(searchWord);
			}
			
			listCount = as.getSearchWordCompanyListCount(a);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchWordCompanyList(a, pi);
		}
		
		if(searchParam != null){
			if(searchParam.equals("crId")){
				model.addAttribute("category", "등록번호");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("cName")){
				model.addAttribute("category", "업체명");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("cPhone")){
				model.addAttribute("category", "연락처");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("noA")){
				model.addAttribute("category", "미승인건");
				model.addAttribute("word", "");
			}else if(searchParam.equals("datePick")){
				model.addAttribute("category", "신청일");
				model.addAttribute("word", fromDate + " ~ " + toDate);
			}else{
				model.addAttribute("category", "승인일");
				model.addAttribute("word", fromDate + " ~ " + toDate);
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/approval";
	}

	//업체 디테일 조회
	@RequestMapping("selectOneCompany.ad")
	public String selectOneCompany(String crId, Model model){
		ArrayList<CompanyDetails> list = as.selectOneCompany(Integer.parseInt(crId));
		model.addAttribute("list", list);
		return "admin/companyDetails";
	}
	
	//업체 첨부 파일 이름 가져가기
	@RequestMapping("selectCompanyFiles.ad")
	public @ResponseBody HashMap<String, Object> selectCompanyFiles(@RequestParam String refId){
		ArrayList<Attachment> list = as.selectCompanyFiles(Integer.parseInt(refId));
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		for(int i = 0; i < list.size(); i++){
		hmap.put("fileList" + i, list.get(i));
		}
		return hmap;
	}
	
	//업체 첨부 파일 다운로드
	@RequestMapping(value="downloadFile.ad")
	public void downloadFile(String fId, HttpServletResponse response) throws Exception{
		
		Map<String,Object> map = as.selectFileInfo(Integer.parseInt(fId));
	    String changeName = (String)map.get("CHANGE_NAME");
	    String originName = (String)map.get("ORIGIN_NAME");
	    
	    byte fileByte[] = FileUtils.readFileToByteArray(new File("D:\\git\\HelloKorea\\src\\main\\webapp\\resources\\uploadFiles\\seller\\"+changeName));
	     
	    response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originName,"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}

	//업체 승인
	@RequestMapping("updateCompanyRegist.ad")
	public String updateCompanyRegist(String crId, String crTerm, String cId, Model model){
		CompanyDetails cd = new CompanyDetails();
		cd.setCrId(Integer.parseInt(crId));
		cd.setCrTerm(Integer.parseInt(crTerm));
		int result = as.updateCompanyRegist(cd);
		
		if(result > 0){
			ArrayList<CompanyDetails> list = as.selectOneCompany(Integer.parseInt(crId));
			model.addAttribute("list", list);
			return "admin/companyDetails";
		}else{
			model.addAttribute("msg","제휴 승인 실패");
			return "common/errorPage";
		}
		
		
	}
	
	//업체 제휴 해지
	@RequestMapping("terminateCompany.ad")
	public String terminateCompany(String crId, String content, Model model){
		
		int result = as.terminateCompany(crId, content);
		
		if(result > 0){
			ArrayList<CompanyDetails> list = as.selectOneCompany(Integer.parseInt(crId));
			model.addAttribute("list", list);
			return "admin/companyDetails";
		}else{
			model.addAttribute("msg","제휴 해지 실패");
			return "common/errorPage";
		}
	}
	
	//입금처리 조회
	@RequestMapping("selectDepositList.ad")
	public String selectDepositList(String searchParam, String searchWord, PageInfo p, Model model){
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}

		ArrayList<Deposit> list = null;
		PageInfo pi = null;
		int listCount = 0;
		
		//전체 리스트
		if(searchParam == null && searchWord == null){

			listCount = as.getDepositListCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			list = as.selectDepositList(pi);
		}else{
			Deposit d = new Deposit();
			d.setcId(-99);
			//등록이력번호 검색
			if(searchParam.equals("cId")){
				d.setcId(Integer.parseInt(searchWord));
			//업체명 검색
			}else if(searchParam.equals("cName")){
				d.setcName(searchWord);
		    //입금액순은 mapper에서
			}
			listCount = as.getSearchWordDepositListCount(d);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchWordDepositList(d, pi);
		}
		
		if(searchParam != null){
			if(searchParam.equals("cId")){
				model.addAttribute("category", "업체번호");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("cName")){
				model.addAttribute("category", "업체명");
				model.addAttribute("word", searchWord);
			}else{
				model.addAttribute("category", "입금액순");
				model.addAttribute("word", "");
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/deposit";
	}

/*	//업체에 입금하기
	@RequestMapping("makeDeposit.ad")
	public String makeDeposit(String cId, String dAmount, Model model){
		System.out.println("오니");
		
		Deposit d = new Deposit();
		d.setcId(Integer.parseInt(cId));
		d.setdAmount(Integer.parseInt(dAmount));
		int result = as.insertDepositHistory(d);
		
		//if(result > 0){
			int listCount = as.getDepositListCount();
			PageInfo pi = Pagination.getPageInfo(1, listCount);		
			ArrayList<Deposit> list = as.selectDepositList(pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "admin/deposit";
		}else{
			model.addAttribute("msg","업체 입금 실패");
			return "common/errorPage";
		}
		
	}*/
	
	//업체 입금 내역 보기
	@RequestMapping("selectDepositHistoryList.ad")
	public String selectDepositHistroyList(String searchParam, String searchWord, String fromDate, String toDate, PageInfo p, Model model){
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}

		ArrayList<Deposit> list = null;
		PageInfo pi = null;
		int listCount = 0;
		
		//전체 리스트
		if(searchParam == null && searchWord == null){

			listCount = as.getDepositHistoryListCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			list = as.selectDepositHistoryList(pi);
		
		}else if(searchParam.equals("datePick")){
			
			DatePick d = new DatePick();
			d.setFromDate(fromDate.replaceAll("-", ""));
			d.setToDate(toDate.replaceAll("-", ""));
			listCount = as.getSearchDateDepositHistoryListCount(d);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchDateDepositHistoryList(d, pi);
			
		}else{
			Deposit d = new Deposit();
			d.setcId(-99);
			//업체번호 검색
			if(searchParam.equals("cId")){
				d.setcId(Integer.parseInt(searchWord));
			//업체명 검색
			}else if(searchParam.equals("cName")){
				d.setcName(searchWord);
		    //입금액순은 mapper에서
			}
			listCount = as.getSearchWordDepositHistroyListCount(d);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchWordDepositHistoryList(d, pi);
		}
		
		if(searchParam != null){
			if(searchParam.equals("cId")){
				model.addAttribute("category", "업체번호");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("cName")){
				model.addAttribute("category", "업체명");
				model.addAttribute("word", searchWord);
			}else if(searchParam.equals("descD")){
				model.addAttribute("category", "입금액순");
				model.addAttribute("word", "");
			}else{
				model.addAttribute("category", "입금일");
				model.addAttribute("word", fromDate + " ~ " + toDate);
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/depositHistory";
	}
	
	//국가별 가입자 수 통계
	@RequestMapping("selectNationalStatistics.ad")
	public @ResponseBody HashMap<String, Object> selectNationalStatistics(){
	    
		ArrayList<NationalStatistics> list = as.selectNationalStatistics();
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("nationalList", list);
		
	    return hmap;
	}
	
	//회원 관심분야 통계
	@RequestMapping("selectInterestStatistics.ad")
    public @ResponseBody HashMap<String, Object> selectInterestStatistics(){
	    
		ArrayList<InterestStatistics> list = as.selectInterestStatistics();
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("interestList", list);
		
	    return hmap;
	}
	
	//플랫폼 타입별 통계
	@RequestMapping("selectPlatformStatistics.ad")
    public @ResponseBody HashMap<String, Object> selectPlatformStatistics(@RequestParam String row){
	    
		ArrayList<PlatformStatistics> list = as.selectPlatformStatistics(Integer.parseInt(row));
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("platformList", list);
		
	    return hmap;
	}
	
	//등록업체 지역별 통계
	@RequestMapping("selectCompanyAreaStatistics.ad")
    public @ResponseBody HashMap<String, Object> selectCompanyAreaStatistics(){
	    
		ArrayList<CompanyAreaStatistics> list = as.selectCompanyAreaStatistics();
		
		for(CompanyAreaStatistics c : list){
			if(c.getArea().equals("서울특")) c.setArea("서울");
			else if(c.getArea().equals("인천광")) c.setArea("인천");
			else if(c.getArea().equals("대전광")) c.setArea("대전");
			else if(c.getArea().equals("대구광")) c.setArea("대구");
			else if(c.getArea().equals("광주광")) c.setArea("광주");
			else if(c.getArea().equals("부산광")) c.setArea("부산");
			else if(c.getArea().equals("울산광")) c.setArea("울산");
			else if(c.getArea().equals("세종특")) c.setArea("세종시");
			else if(c.getArea().equals("경기도")) c.setArea("경기도");
			else if(c.getArea().equals("강원도")) c.setArea("강원도");
			else if(c.getArea().equals("충청북")) c.setArea("충청북도");
			else if(c.getArea().equals("충청남")) c.setArea("충청남도");
			else if(c.getArea().equals("경상북")) c.setArea("경상북도");
			else if(c.getArea().equals("경상남")) c.setArea("경상남도");
			else if(c.getArea().equals("전라북")) c.setArea("전라북도");
			else if(c.getArea().equals("전라남")) c.setArea("전라남도");
			else if(c.getArea().equals("제주도")) c.setArea("제주");
		}
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("companyAreaList", list);
	    return hmap;
	}
	
	//업체 등록 기간 통계
	@RequestMapping("selectCompanyPeriodStatistics.ad")
    public @ResponseBody HashMap<String, Object> selectCompanyPeriodStatistics(){
	    
		ArrayList<CompanyPeriodStatistics> list = as.selectCompanyPeriodStatistics();
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("companyPeriodList", list);
	    return hmap;
	}
	
	//업체 등록/승인 건수 통계
	@RequestMapping("selectCompanyRegistStatistics.ad")
    public @ResponseBody HashMap<String, Object> selectCompanyRegistStatistics(@RequestParam String row){
	    
		ArrayList<CompanyRegistStatistics> list = as.selectCompanyRegistStatistics(Integer.parseInt(row));
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("companyRegistList", list);
		
	    return hmap;
	}
	
	//매출 통계
	@RequestMapping("selectSalesStatistics.ad")
    public String selectSalesStatistics(PageInfo p, Model model){
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		int listCount = as.selectSalesStatisticsListCount();
		PageInfo pi = Pagination3.getPageInfo(p.getCurrentPage(), listCount);
		
		ArrayList<SalesStatistics> list = as.selectSalesStatisticsList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/salesStatistics";
	}

	
	//업체 등록 기간 통계
	@RequestMapping("selectMainSalesStatistics.ad")
	public @ResponseBody HashMap<String, Object> selectMainSalesStatistics(){
		ArrayList<SalesStatistics> list = as.selectMainSalesStatistics();
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("salesList", list);
		return hmap;
	}
	
	//메인 4개 정보
	@RequestMapping("selectMain.ad")
	public @ResponseBody HashMap<String, Object> selectMainProfit(){
		//미해결 신고 수
		Report r = new Report();
		r.setrRecordId(-99);
		r.setrTarget(-99);
		int reportCount = as.getSearchWordReportListCount(r);
		//미해결 문의 수
		Question q = new Question();
		q.setqRecordId(-99);
		q.setSendId(-99);
		int questionCount = as.getSearchWordQuestionListCount(q);;
		//이번달 수익
		ArrayList<SalesStatistics> list = as.selectMainProfit();
		//미승인 업체 수
		int companyCount = as.selectUnapprovedCompanyCount();
		
		//업체 만료 알림
		ArrayList<CompanyDetails> expirationList = as.selectExpirationList();
		SimpleDateFormat dt = new SimpleDateFormat("YYYY-MM-dd");
		for(CompanyDetails c: expirationList){
			c.setStartDate(dt.format(c.getApDate()));
			c.setEndDate(dt.format(c.getCrEDate()));
		}
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("reportCount", reportCount);
		hmap.put("questionCount", questionCount);
		if(list.size()==0){
			hmap.put("profit", 0);
		}else{
			hmap.put("profit", list.get(0).getProfit());
		}
		
		hmap.put("companyCount", companyCount);
		hmap.put("expirationList", expirationList);
		return hmap;
	}
	
	//입금처리 엑셀파일 다운로드용
	@RequestMapping(value = "/excelDownload")
    public View excelDownload(HttpServletRequest request, HttpServletResponse response, Model model)
            throws Exception {
         
        ArrayList<Deposit> list = as.listExcelDownload();
        model.addAttribute("list", list);

        return new listExcelDownload();
    }
	
	    @RequestMapping(value = "/excelUpload.ad", method = RequestMethod.POST)
	    public String excelUploadAjax(MultipartHttpServletRequest request, Model model)  throws Exception{
	        MultipartFile excelFile =request.getFile("excelFile");
	        //System.out.println("엑셀 파일 업로드 컨트롤러");
	        if(excelFile==null || excelFile.isEmpty()){
	            throw new RuntimeException("엑셀파일을 선택 해 주세요.");
	        }
	        
	        File destFile = new File("D:\\"+excelFile.getOriginalFilename());
	        try{
	            excelFile.transferTo(destFile);
	        }catch(IOException e){
	            throw new RuntimeException(e.getMessage(),e);
	        }
	        
	        as.excelUpload(destFile);
	        
	        //FileUtils.delete(destFile.getAbsolutePath());
	        
	        int listCount = as.getDepositHistoryListCount();
			PageInfo pi = Pagination.getPageInfo(1, listCount);		
			ArrayList<Deposit> list = as.selectDepositHistoryList(pi);
				
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "admin/depositHistory";
	    }


}
