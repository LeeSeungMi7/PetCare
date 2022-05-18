package com.petcare.web.common.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.Properties;

import javax.annotation.PostConstruct;

import org.apache.ibatis.io.Resources;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.petcare.web.user.vo.S3KeyVO;

@Component
public class AwsS3{
	
	private AmazonS3 s3Client;

	private String access_key;
	private String secret_accessKey;
	private Regions regions=Regions.AP_NORTHEAST_2;
	private String bucket;
	
	private AwsS3() {
    }
	
	@PostConstruct
	private void init() {
		createS3Client();
	}
	
  
    //키 받아와서 생성
    private void createS3Client() {
    	Reader reader;
    	try {
    		Properties properties = new Properties();
    		reader = Resources.getResourceAsReader("config/aws.properties");
    		properties.load(reader);
    		
    		this.access_key = properties.getProperty("aws.access_key");
    	    this.secret_accessKey = properties.getProperty("aws.secret_accessKey");  
    	    this.bucket = properties.getProperty("aws.bucket");  
    	    AWSCredentials credentials = new BasicAWSCredentials(access_key, secret_accessKey);
    		this.s3Client = AmazonS3ClientBuilder.standard().withCredentials(
    				new AWSStaticCredentialsProvider(credentials)).withRegion(regions).build();
    	} catch (IOException e) {
    		
    		e.printStackTrace();
    	}
    	
    }

    public void upload(File file, String key) {
        uploadToS3(new PutObjectRequest(this.bucket, key, file));
    }

    public void upload(InputStream is, String key, String contentType, long contentLength) {
        ObjectMetadata objectMetadata = new ObjectMetadata();
        objectMetadata.setContentType(contentType);
        objectMetadata.setContentLength(contentLength);

        uploadToS3(new PutObjectRequest(this.bucket, key, is, objectMetadata));
    }

    //PutObjectRequest는 Aws S3 버킷에 업로드할 객체 메타 데이터와 파일 데이터로 이루어져있다.
    private void uploadToS3(PutObjectRequest putObjectRequest) {

        try {
            this.s3Client.putObject(putObjectRequest);
//            System.out.println(String.format("[%s] upload complete", putObjectRequest.getKey()));

        } catch (AmazonServiceException e) {
            e.printStackTrace();
        } catch (SdkClientException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    public void delete(String key) {
        try {
            //Delete 객체 생성
            DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);
            //Delete
            this.s3Client.deleteObject(deleteObjectRequest);
            System.out.println(String.format("[%s] deletion complete", key));

        } catch (AmazonServiceException e) {
            e.printStackTrace();
        } catch (SdkClientException e) {
            e.printStackTrace();
        }
    }

}
