package com.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.entity.User;

@Controller
public class FileUploadController {
	@PostMapping("/upload")
	public String fielUp(@RequestParam("submitFile") CommonsMultipartFile uploadFile, HttpSession session) {

		// 获取文件名
		String fileName = uploadFile.getOriginalFilename();
		//判断是否是jpg,png,gif格式
		if (fileName.endsWith("jpg") || fileName.endsWith("png") || fileName.endsWith("gif")) {
			//获得upload目录
			String leftPath = session.getServletContext().getRealPath("/upload");
			File filePath=new File(leftPath);
			if(!filePath.exists()) {
				filePath.mkdirs();
			}
			// 进行路径拼接
			User u = (User) session.getAttribute("user");
			//以.分割字符串需要加\\做转译
			String []s=fileName.split("\\.");
			fileName=u.getName()+"."+s[s.length-1];
			File file = new File(leftPath, fileName);
			try {
				uploadFile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "userSpace";
		} else {
			return "loginFailed";
		}
	}
}
