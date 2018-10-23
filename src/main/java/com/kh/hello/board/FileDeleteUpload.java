package com.kh.hello.board;

import java.io.File;

public class FileDeleteUpload {
	

    public String process(String changeFileName, String root) {

                    String newFile = root+ "\\uploadFiles\\board\\" + changeFileName;
                    
                    File deleteFile = new File(newFile);
                    try {
                        deleteFile.delete();
                        return changeFileName + " 삭제완료";
                    } catch (IllegalStateException e) {
                        return changeFileName + " 삭제실패";
                    }
                
    }

}
