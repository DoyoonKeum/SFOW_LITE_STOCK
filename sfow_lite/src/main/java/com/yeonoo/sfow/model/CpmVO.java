package com.yeonoo.sfow.model;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Getter
@Setter
@ToString
public class CpmVO {
	private int		no;				//번호
    private String client_Code;    //거래코드
    private String company_code;	//회사코드
    private String client_Name;    //거래처명
    private String ceo_Name;    //대표자
    private String client_Phone;    //전화번호
    private String client_Email;    //E-mail
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd-hh-mm")
    private Date create_Date;    //등록
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd-hh-mm")
    private Date update_Date;    //수정

  



	

	public boolean isEmailValid() {
        // 이메일 주소 정규 표현식
        String emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        Pattern pattern = Pattern.compile(emailPattern);
        Matcher matcher = pattern.matcher(client_Email);
        return matcher.matches();
    }


	public CpmVO() {
	}


	public CpmVO(int no,  String client_Code,String company_code, String client_Name, String ceo_Name,
			String client_Phone, String client_Email, Date create_Date, Date update_Date) {
		this.no = no;
		this.company_code = company_code;
		this.client_Code = client_Code;
		this.client_Name = client_Name;
		this.ceo_Name = ceo_Name;
		this.client_Phone = client_Phone;
		this.client_Email = client_Email;
		this.create_Date = create_Date;
		this.update_Date = update_Date;
	}

	
	
	
}
