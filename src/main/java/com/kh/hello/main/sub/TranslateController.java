package com.kh.hello.main.sub;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("tVal")
@Controller
public class TranslateController {

	@RequestMapping(value="translateVal")
	public void translateVal(String tVal, Model model, HttpServletResponse response){
		
		try {
			model.addAttribute("tVal", tVal);
			
			PrintWriter out=response.getWriter();
			out.print("ok");
			
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
