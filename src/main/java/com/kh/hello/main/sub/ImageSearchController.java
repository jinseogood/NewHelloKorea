package com.kh.hello.main.sub;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImageSearchController {
	
	@RequestMapping(value="imageSearch")
	public void imageSearch(File imageFile){
		System.out.println("controller imageFile : " + imageFile);
	}
	
}
