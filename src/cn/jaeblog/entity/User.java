package cn.jaeblog.entity;

import java.util.Date;

public class User {
	private Integer id;
	private String username;
	private String userpwd;
	private Integer userpermission;
	private Date userregDate;
	private String userinfo;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public Integer getUserpermission() {
		return userpermission;
	}
	public void setUserpermission(Integer userpermission) {
		this.userpermission = userpermission;
	}
	public Date getUserregDate() {
		return userregDate;
	}
	public void setUserregDate(Date userregDate) {
		this.userregDate = userregDate;
	}
	
	public String getUserinfo() {
		return userinfo;
	}
	public void setUserinfo(String userinfo) {
		this.userinfo = userinfo;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", userpwd=" + userpwd + ", userpermission="
				+ userpermission + ", userregDate=" + userregDate + "]";
	}
	
}
