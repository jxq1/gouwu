package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * 用户
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2021-01-08 22:38:58
 */
@TableName("yonghu")
public class YonghuEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public YonghuEntity() {
		
	}
	
	public YonghuEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 用户账号
	 */
					
	private String useraccount;
	
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
	 * 积分
	 */
	private Float jifen;
	
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 设置：用户账号
	 */
	public void setuseraccount(String useraccount) {
		this.useraccount = useraccount;
	}
	/**
	 * 获取：用户账号
	 */
	public String getuseraccount() {
		return useraccount;
	}
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
