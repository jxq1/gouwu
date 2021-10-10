package com.entity.vo;

import com.entity.YonghuEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
 

/**
 * 用户
 * 手机端接口返回实体辅助类 
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email 
 * @date 2021-01-08 22:38:58
 */
public class YonghuVO  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 用户姓名
	 */
	
	private String uusername;
		
	/**
	 * 密码
	 */
	
	private String upassword;
		
	/**
	 * 性别
	 */
	
	private String ugender;
		
	/**
	 * 联系电话
	 */
	
	private String phonecode;
		
	/**
	 * 电子邮箱
	 */
	
	private String uemail;
		
	/**
	 * 余额
	 */
	
	private Float money;

	/**
	 * jifen
	 */

	private Float jifen;
				
	
	/**
	 * 设置：用户姓名
	 */
	 
	public void setuusername(String uusername) {
		this.uusername = uusername;
	}
	
	/**
	 * 获取：用户姓名
	 */
	public String getuusername() {
		return uusername;
	}
				
	
	/**
	 * 设置：密码
	 */
	 
	public void setupassword(String upassword) {
		this.upassword = upassword;
	}
	
	/**
	 * 获取：密码
	 */
	public String getupassword() {
		return upassword;
	}
				
	
	/**
	 * 设置：性别
	 */
	 
	public void setugender(String ugender) {
		this.ugender = ugender;
	}
	
	/**
	 * 获取：性别
	 */
	public String getugender() {
		return ugender;
	}
				
	
	/**
	 * 设置：联系电话
	 */
	 
	public void setphonecode(String phonecode) {
		this.phonecode = phonecode;
	}
	
	/**
	 * 获取：联系电话
	 */
	public String getphonecode() {
		return phonecode;
	}
				
	
	/**
	 * 设置：电子邮箱
	 */
	 
	public void setuemail(String uemail) {
		this.uemail = uemail;
	}
	
	/**
	 * 获取：电子邮箱
	 */
	public String getuemail() {
		return uemail;
	}
				
	
	/**
	 * 设置：余额
	 */
	 
	public void setMoney(Float money) {
		this.money = money;
	}
	
	/**
	 * 获取：余额
	 */
	public Float getMoney() {
		return money;
	}

	public Float getJifen() {
		return jifen;
	}

	public void setJifen(Float jifen) {
		this.jifen = jifen;
	}
}
