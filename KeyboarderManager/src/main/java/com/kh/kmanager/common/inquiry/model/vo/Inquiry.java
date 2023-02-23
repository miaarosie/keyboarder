package com.kh.kmanager.common.inquiry.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Inquiry {

	private int inquiryNo;
	private String inquiryName;
	private String inquiryContent;
	private Date inquiryDate;
	private String inquiryReply;
	private Date replyDate;
	private int sellerNo;
	private String sellerName;
	
}
