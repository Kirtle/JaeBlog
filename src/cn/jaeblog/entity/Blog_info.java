package cn.jaeblog.entity;

public class Blog_info {
	private int id;
	private int user_id;
	private String blog_name;
	private String description;
	private String annoucement;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getBlog_name() {
		return blog_name;
	}
	public void setBlog_name(String blog_name) {
		this.blog_name = blog_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAnnoucement() {
		return annoucement;
	}
	public void setAnnoucement(String annoucement) {
		this.annoucement = annoucement;
	}

}
