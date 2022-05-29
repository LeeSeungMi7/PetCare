package com.petcare.web.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.petcare.web.user.service.FileUploadService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EditorPhotoUploadController {

	   @Autowired
	   private FileUploadService fileUploadService;
	   
	    @ResponseBody
	    @RequestMapping(value = "/fileUpload.do", method = RequestMethod.POST)
	    public FileUploadService.FileUploadResult multipartUpload(MultipartHttpServletRequest request) {

	            List<MultipartFile> fileList = request.getFiles("filedata");
	            MultipartFile file = fileList.get(0);
	            FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "Editor/", file.getOriginalFilename());
	            fileResult.getUrl();

	            return fileResult;

	    }
	
}
