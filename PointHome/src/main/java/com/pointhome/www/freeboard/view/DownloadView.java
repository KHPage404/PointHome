package com.pointhome.www.freeboard.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.pointhome.www.freeboard.dto.FreeBoardFile;

public class DownloadView extends AbstractView {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private ServletContext context;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		FreeBoardFile file = (FreeBoardFile) model.get("downFile");
		
		File src = new File(context.getRealPath("upload"), file.getFreeboardfileStored());
		
		
		logger.info("서버에 업로드된 파일 {}", src);
		logger.info("존재 여부 {}", src.exists());
		
		response.setContentType("application/octet-stream");
		response.setContentLengthLong( src.length() );
		response.setCharacterEncoding("UTF-8");
		
		String outputName = URLEncoder.encode(file.getFreeboardfileOrigin(), "UTF-8");

		outputName = outputName.replace("+", "%20");
		logger.info("outputName : {}", outputName);
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName + "\"");
		
		FileInputStream in = new FileInputStream(src);
		OutputStream out = response.getOutputStream();
		
		FileCopyUtils.copy(in, out);
		
	}
	
}
