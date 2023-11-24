package com.jh.ssm.pojo;

import java.io.Serializable;
import java.util.Date;
/**
 * 用户信息
 */
public class User implements Serializable{
	
	private static final long serialVersionUID = -91639731130801489L;
	private Integer id;
	private String name;
	private String phone;
	private String email;
	private String password;
	private String headImg;
	private String gender;
	private Integer age;
	private Integer ban;
	private String mark;
	private Date createTime;
	private Date updateTime;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(Integer id, String name, String phone, String email, String password, String headImg, String gender,
			Integer age, Integer ban, String mark, Date createTime, Date updateTime) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.headImg = headImg;
		this.gender = gender;
		this.age = age;
		this.ban = ban;
		this.mark = mark;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getBan() {
		return ban;
	}

	public void setBan(Integer ban) {
		this.ban = ban;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", phone=" + phone + ", email=" + email + ", password=" + password
				+ ", headImg=" + headImg + ", gender=" + gender + ", age=" + age + ", ban=" + ban + ", mark=" + mark
				+ ", createTime=" + createTime + ", updateTime=" + updateTime + "]";
	}

}
