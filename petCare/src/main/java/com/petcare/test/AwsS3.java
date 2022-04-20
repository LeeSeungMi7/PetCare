package com.petcare.test;

import java.io.File;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class AwsS3 {
	private AmazonS3 s3Client;
	final private String accessKey = "AKIAXWJZHIQWLX3G5LAD";
	final private String secretKey = "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";
	private Regions clientRegion = Regions.AP_NORTHEAST_2;
	private String bucket ="petcarebuc";
	
	private AwsS3() {
		createS3Client();
	}

	static private AwsS3 instance = null;
	
	public static AwsS3 getInstance() {
		if(instance == null) {
			return new AwsS3();
		}else {
			return instance;
		}
	}
	
	private void createS3Client() {
		
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey); 
		this.s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials)).withRegion(clientRegion).build();
	}
	
	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}
	
	private void uploadToS3(PutObjectRequest putObjectRequest) {
		
		try {
			this.s3Client.putObject(putObjectRequest);
			System.out.println(String.format("[%s] upload complete", putObjectRequest.getKey()));
		}catch (AmazonServiceException e) {
			e.printStackTrace();
		}catch (SdkClientException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void copy(String orgKey, String copyKey) {
		try {
			CopyObjectRequest copyObjectRequest = new CopyObjectRequest(this.bucket, orgKey, this.bucket, copyKey);
			this.s3Client.copyObject(copyObjectRequest);
			
			System.out.println(String.format("Finish copying [%s] to [%s]", orgKey, copyKey));
		}catch(AmazonServiceException e) {
			e.printStackTrace();
		}catch(SdkClientException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String key) {
		try {
			DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);
			
			this.s3Client.deleteObject(deleteObjectRequest);
			System.out.println(String.format("[%s] deletion complate", key));
		
		}catch(AmazonServiceException e) {
			e.printStackTrace();
		}catch (SdkClientException e) {
			e.printStackTrace();
		}
	}
	
	
}
