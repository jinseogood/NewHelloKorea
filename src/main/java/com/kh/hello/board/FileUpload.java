package com.kh.hello.board;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import com.kh.hello.common.CommonUtils;

public class FileUpload {
	private static final String[] ALLOWED_FILE_TYPES = {"image/jpeg", "image/jpg", "image/gif", "image/png"};
    private static final Long MAX_FILE_SIZE = 1048576L; //1MB
    private String originalName;
    private String changeName;
    
    public String process(MultipartFile file,String root) {
        if (!file.isEmpty()) {
            String contentType = file.getContentType().toString().toLowerCase();
            if (isValidContentType(contentType)) {
                if (belowMaxFileSize(file.getSize())) {
                	String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
                	originalName = file.getOriginalFilename();
                	changeName = CommonUtils.getRandomString() + ext;
                    String newFile = root+ "\\uploadFiles\\board\\" + changeName;
                    try {
                        file.transferTo(new File(newFile));
                        return changeName;
                    } catch (IllegalStateException e) {
                        return "There was an error uploading " + file.getOriginalFilename() + " => " + e.getMessage();
                    } catch (IOException e) {
                        return "There was an error uploading " + file.getOriginalFilename() + " => " + e.getMessage();
                    }
                } else {
                    return "Error. " + file.getOriginalFilename() + " file size (" + file.getSize() + ") exceeds " + MAX_FILE_SIZE + " limit.";
                }
            } else {
                return "Error. " + contentType + " is not a valid content type.";
            }
        } else {
            return "Error. No file choosen.";
        }
    }
    
    public String changeName(){
    	return changeName;
    }
    
    public String originalName(){
    	return originalName;
    }
    
    private Boolean isValidContentType(String contentType) {
        if (!Arrays.asList(ALLOWED_FILE_TYPES).contains(contentType)) {
            return false;
        }
        
        return true;
    }
    
    private Boolean belowMaxFileSize(Long fileSize) {
        if (fileSize > MAX_FILE_SIZE) {
            return false;
        }
        
        return true;
    }
}
