package com.strustrenting.action;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class UploadAction extends ActionSupport{
	//private String title;
	private File upload;
	private String uploadCotentType;
	private String uploadFileName;
	//private String savePath;
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadCotentType() {
		return uploadCotentType;
	}
	public void setUploadCotentType(String uploadCotentType) {
		this.uploadCotentType = uploadCotentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	@Override
	public String execute() throws Exception  {
		// TODO Auto-generated method stub
		File file = new File ("F:\\eclipse\\main\\StrustRenting\\WebContent\\images");
		if (!file.exists()) {
			file.mkdirs();
		}
		ActionContext.getContext().getSession().put("filename", uploadFileName);
		FileUtils.copyFile(upload, new File (file, uploadFileName));
		return SUCCESS;
	}
}
