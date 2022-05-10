package com.petcare.web.test;

import java.io.IOException;
import java.io.Reader;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.junit.Test;

public class testSMS {
	
	String api_key ; 
    String api_secret; 
	
    public testSMS() {
    	Reader reader;
    	try {
    		Properties properties = new Properties();
    		reader = Resources.getResourceAsReader("config/sms.properties");
    		properties.load(reader);
    		
    		this.api_key = properties.getProperty("sms.APIKey");
    	    this.api_secret = properties.getProperty("sms.APISecret");

    	} catch (IOException e) {
    		
    		e.printStackTrace();
    	}
    }
	@Test
	public void testProperties() {

		System.out.println(api_key);
		System.out.println(api_secret);
	}
	
	
}
