package com.petcare.test;

import java.io.File;

public class Main {
	public AwsS3 aws3 = AwsS3.getInstance();
	
	public static void main(String[] args) {
		
		Main main = new Main();
		
		File file = new File("C:\\Users\\LSM\\Desktop\\»çÁø\\K-001.png");
		String key = "img/mainlogo.png";
		String copyKey = "img/my-img-copy.png";
		
		main.upload(file, key);
	}

	public void upload(File file, String key) {
		aws3.upload(file, key);	
	}
	
	public void copy(String orgKey, String copyKey) {
		aws3.copy(orgKey, copyKey);
	}
	
	public void delete(String key) {
		aws3.delete(key);
	}
}
