package com.petcare.web.common.utils;

import org.springframework.context.annotation.Configuration;

import lombok.Data;

@Configuration
@Data
public class Email {
	private String subject;
	private String content;
	private String receiver;
}
