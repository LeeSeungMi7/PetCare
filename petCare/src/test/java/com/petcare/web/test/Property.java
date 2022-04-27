package com.petcare.web.test;

import java.io.IOException;
import java.io.Reader;
import java.util.Properties;
import org.apache.ibatis.io.Resources;

import org.junit.Test;

public class Property {
	
	@Test
	public void testProperties() {

	Reader reader;
	try {
		Properties properties = new Properties();
		reader = Resources.getResourceAsReader("config/s3key.properties");
		properties.load(reader);
		
		System.out.println(properties.getProperty("aws.s3.accessKey"));
	    System.out.println(properties.getProperty("aws.s3.secretKey"));
	    System.out.println(properties.getProperty("aws.s3.bucket"));
	} catch (IOException e) {
		
		e.printStackTrace();
	}
	}


}
