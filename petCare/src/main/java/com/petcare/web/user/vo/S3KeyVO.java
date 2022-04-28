package com.petcare.web.user.vo;

import lombok.Data;

@Data
public class S3KeyVO {
	private String Access_key;
	private String Secret_accessKey;
	private String decoding_key;
	private String decoding_iv;
}
