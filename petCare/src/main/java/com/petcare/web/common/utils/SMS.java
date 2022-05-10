package com.petcare.web.common.utils;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.json.simple.JSONObject;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Configuration
public class SMS {
	
	String api_key ; 
    String api_secret;
    String mynumber;

    public SMS() {
    	Reader reader;
    	try {
    		Properties properties = new Properties();
    		reader = Resources.getResourceAsReader("config/sms.properties");
    		properties.load(reader);
    		
    		this.api_key = properties.getProperty("sms.APIKey");
    	    this.api_secret = properties.getProperty("sms.APISecret");
    	    this.mynumber = properties.getProperty("sms.mynumber");
    	} catch (IOException e) {
    		
    		e.printStackTrace();
    	}
    }
	

	public void certifiedPhoneNumber(String phoneNumber, String mas) {
   
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber);    
        params.put("from", mynumber);    
        params.put("type", "SMS");
        params.put("text", mas);
        params.put("app_version", "test app 1.2"); 

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

    }
}
