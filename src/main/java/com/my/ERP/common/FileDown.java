package com.my.ERP.common;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.ERP.myInfo.model.vo.Notice;

public class FileDown {
	
	public static void fileDown(Notice notice, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		String originalFileName = notice.getOrg_file_name();
		String storedFileName = notice.getStored_file_name();
		
		// 공백이 +로 처리되는 점을 막기 위한 정규식 처리
		originalFileName = URLEncoder.encode(originalFileName, "UTF-8");
		originalFileName = originalFileName.replaceAll("\\+", "%20");
		
		// root : /webapp/resources/
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 실제로 저장되어있는 폴더 위치
		String savePath = root + "\\attach-file";
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(savePath+ "\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName="+ originalFileName +";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
}
