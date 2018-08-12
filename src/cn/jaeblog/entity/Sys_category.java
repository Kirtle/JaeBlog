package cn.jaeblog.entity;

public class Sys_category {
	private int id;
	private String category_name;
	private int articles;
	private int is_delete;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getIs_delete() {
		return is_delete;
	}
	public void setIs_delete(int is_delete) {
		this.is_delete = is_delete;
	}
	public int getArticles() {
		return articles;
	}
	public void setArticles(int articals) {
		this.articles = articals;
	}
	
}
