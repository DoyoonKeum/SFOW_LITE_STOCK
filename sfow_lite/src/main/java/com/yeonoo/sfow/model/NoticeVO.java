package com.yeonoo.sfow.model;

import java.sql.Date;
import java.sql.Timestamp;
import org.springframework.stereotype.Repository;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class NoticeVO {
	private int no;
	private String title;
	private String content;
	private String writername;
	private String regdate;
	private String modidate;
	private int readcnt;
	private PageMaker pageMaker;


}

	