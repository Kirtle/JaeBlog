package cn.jaeblog.entity;

import java.sql.Timestamp;

public class Article {
	private int articleid;//文章id
	private String title;
	private int user_id;//用户id
	private int sys_category_id;// 系统分类编号
	private int category_id;//个人分类编号
	private String content; //内容
	private String summary;//文章摘要
	private Timestamp publish_time;
	private int is_top;
	private int is_delete;
	private int count;//文章点击数
	private String username="";//以下三个属性用户多表查询
	private String category_name="";//系统分类名
	
	
	public int getArticleid() {
		return articleid;
	}
	public void setArticleid(int articleid) {
		this.articleid = articleid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getSys_category_id() {
		return sys_category_id;
	}
	public void setSys_category_id(int sys_category_id) {
		this.sys_category_id = sys_category_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getPublish_time() {
		return publish_time.toString().substring(0, 16);
	}
	public void setPublish_time(Timestamp publish_time) {
		this.publish_time = publish_time;
	}
	public int getIs_top() {
		return is_top;
	}
	public void setIs_top(int is_top) {
		this.is_top = is_top;
	}
	public int getIs_delete() {
		return is_delete;
	}
	public void setIs_delete(int is_delete) {
		this.is_delete = is_delete;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	
	
}
