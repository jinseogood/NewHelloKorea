package com.kh.hello.payment.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hello.common.Email;
import com.kh.hello.common.EmailSender;
import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.member.model.vo.Member;
import com.kh.hello.payment.model.service.PaymentService;
import com.kh.hello.payment.model.vo.PayDetail;
import com.kh.hello.payment.model.vo.Payment;
import com.kh.hello.seller.model.vo.SellerReservation;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService ps;
	
	@Autowired
	private EmailSender es;
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	private static String URL_PAYPAL_VALIDATE; // PDT데이터를 페이팔로 보낼 서버주소
	private static String PARAM_AT_VALUE;
	static
	{
		URL_PAYPAL_VALIDATE = "https://www.sandbox.paypal.com/cgi-bin/webscr";
		PARAM_AT_VALUE = "p7Hy0ZXi_EUdtMCi0MwQG8PTrbJUnK4KbhtazB7r9RPniS9YsBQZ0nlI5Sm";
	}

	// PDT 첫번째 응답 변수 선언
	private static final String PARAM_CMD = "cmd";
	private static final String PARAM_CMD_VALUE = "_notify-synch";
	private static final String PARAM_AT = "at";
	
	private static final String RESPONSE_SUCCESS = "SUCCESS";
	private static final String RESPONSE_FAIL = "FAIL";

	private static final String PARAM_CUSTOM = "custom";     // 주문자 정보 및 주문 상세정보
	
	//결제 페이지 이동
	@RequestMapping(value="paymentDetailView.pay")
	public String paymentDetailView(){
		return "payment/detailPayment";
	}
	
	//결제 완료 페이지 이동
	@RequestMapping(value="paymentConfirm.pay")
	public String paymentConfirm(HttpServletRequest request, Model model){
		
		int result=-99;

		try{
			// PayPal로부터온 파라미터를 표시한다.
			Enumeration en = request.getParameterNames();
			String readString = "";
			while (en.hasMoreElements()) {
				String paramName = (String) en.nextElement();
				String paramValue = request.getParameter(paramName);
				readString = readString + "&" + paramName + "=" + URLDecoder.decode(paramValue, "UTF-8");
			}
			logger.info("Received PDT from PayPal:" + readString);

			// 다시 PayPal로 게시하기 위해 파라미터를 구성한다.
			String str = PARAM_CMD + "=" + PARAM_CMD_VALUE;
			en = request.getParameterNames();
			while (en.hasMoreElements()) {
				String paramName = (String) en.nextElement();
				String paramValue = request.getParameter(paramName);
				str = str + "&" + paramName + "=" + URLEncoder.encode(paramValue, "UTF-8");
			}
			str = str + "&" + PARAM_AT + "=" + PARAM_AT_VALUE;
			logger.info("Sending PDT to PayPal:" + str);

			// 유효성을 검사하기 위해 PayPal로 다시 전송시작.
			URL u = new URL(URL_PAYPAL_VALIDATE);
			HttpURLConnection uc = (HttpURLConnection) u.openConnection();
			uc.setDoOutput(true);
			uc.setRequestMethod("POST");
			uc.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			PrintWriter pw = new PrintWriter(uc.getOutputStream());
			pw.println(str);
			pw.close();

			BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream(), "UTF8"));

			String res = in.readLine();
			int mId=0;
			
			if (res.equals(RESPONSE_SUCCESS)) {

				logger.info("페이팔서버로 부터 PDT유효성 요청이 성공했습니다.");

				String[] temp;
				HashMap vars = new HashMap();

				while ((res = in.readLine()) != null) {
					temp = res.split("=");
					if (temp.length == 2) {
						vars.put(temp[0], URLDecoder.decode(temp[1], "UTF-8"));
						System.out.println("decode : " + URLDecoder.decode(temp[1], "EUC-KR"));
						logger.info("{}{}{}",new Object[]{temp[0],":",temp[1]});
					}
				}

				//주문자 정보 및 주문 상세 정보
				String custom = (String) vars.get(PARAM_CUSTOM);
				
				String[] orderInfo=custom.split(",");
				
				mId=Integer.parseInt(orderInfo[0]);
				
				Payment p=new Payment();
				p.setmId(Integer.parseInt(orderInfo[0]));
				p.setPaName(orderInfo[1]);
				p.setPaPhone(orderInfo[2]);
				p.setPaEmail(orderInfo[3]);
				
				ArrayList<PayDetail> pdList=new ArrayList<PayDetail>();
				
				if(orderInfo[4].equals("pc")){
					PayDetail pd=new PayDetail();
					pd.setPdType("P");
					pd.setPrice(Integer.parseInt(orderInfo[7]));
					pd.setPdMethod("C");
					
					PayDetail pd2=new PayDetail();
					pd2.setPdType("P");
					pd2.setPrice(Integer.parseInt(orderInfo[5]));
					pd2.setPdMethod("P");
					
					pdList.add(pd);
					pdList.add(pd2);
					
				}
				else{
					PayDetail pd=new PayDetail();
					pd.setPdType("P");
					pd.setPrice(Integer.parseInt(orderInfo[7]));
					pd.setPdMethod("C");
					
					pdList.add(pd);
				}
				
				int rInsert=ps.insertAllPayment(p, pdList);
				
				if(rInsert > 0){
					int rUpdate=ps.updateReservation(Integer.parseInt(orderInfo[6]));
					
					if(rUpdate > 0){
						if(pdList.size() == 2){
							int rPoint=ps.insertPoint(Integer.parseInt(orderInfo[0]), Integer.parseInt(orderInfo[5]));
							
							if(rPoint > 0){
								result=1;
							}
							else{
								result=0;
							}
						}
						else{
							result=1;
						}
					}
					else{
						result=0;
					}
				}
				else{
					result=0;
				}
				
			}
			else if (res.equals(RESPONSE_FAIL)) {
				logger.warn("페이팔서버로 부터 PDT유효성 요청이 실패했습니다. 상태:"+res);
				
				result=-88;
			}
			else {
				logger.error("페이팔서버로 부터 PDT유효성 요청이 실패했습니다. 상태:"+res);
				
				result=-77;
			}
			
			if(result > 0){
				Payment p=ps.selectPayInfo(mId);
				ArrayList<PayDetail> pdList=ps.selectPayDetailInfo(p.getPaId());
				
				Reservation2 r=ps.selectReservation(p.getPaId());
				
				//예약확인 메일 전송
				Email email=new Email();
				email.setMailFrom("hellokoreamailservice@gmail.com");
				email.setMailTo(p.getPaEmail());
				email.setMailSubject("To. " + p.getPaName() + " Hello Korea !");
				
				String content="";
				content+="<h2>Dear." + p.getPaName() + "</h2><br>";
				content+="<h3>Thank you for Reservation.</h3><br>";
				content+="The item you have reserved is the  <b>" + r.getcName() + "</b>  and is a  <b>";
				content+=r.getRoomName() + "</b>  from <b>" + r.getrSdate() + " to " + r.getrEdate() + "</b> .<br><br>";
				
				content+="<font style='font-weight:bold; font-size:18px;'>Notice</font><br>";
				content+="<ul><li>Check-in time starts at 3 PM</li>";
				content+="<li>Cancellation is possible up to 2 days before Check-in date.</li></ul><br>";
				content+="For questions, please contact <a href='mailto:hellokoreamailservice@gmail.com'>hellokoreamailservice@gmail.com</a><br>";
				content+="Enjoy your trip! Thanks.<br><br>";
				content+="<hr/>";
				content+="Best Regards<br>";
				content+="Hello Korea";
				
				email.setMailContent(content);
				es.sendMail(email);
				
				model.addAttribute("p", p);
				model.addAttribute("pdList", pdList);
				model.addAttribute("r", r);
				
				return "payment/confirmPayment";
			}
			else{
				String errorMSG="";
				
				if(result == -88){
					errorMSG="페이팔서버로 부터 PDT유효성 요청이 실패했습니다. 상태:"+res;
				}
				else{
					errorMSG="페이팔서버로 부터 PDT유효성 요청이 실패했습니다. 상태:"+res;
				}
				
				model.addAttribute("msg", errorMSG);
				
				return "common/errorPage";
			}
		}
		catch (Exception e){
			model.addAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}

	}
	
	//회원 포인트 조회
	@RequestMapping(value="selectUserPoint.pay")
	public void selectUserPoint(HttpServletRequest request, HttpServletResponse response){
		Member m=(Member) request.getSession().getAttribute("loginUser");
		
		int rPoint=ps.selectUserPoint(m.getmId());
		
		try {
			PrintWriter out = response.getWriter();
			
			out.print(rPoint);
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
