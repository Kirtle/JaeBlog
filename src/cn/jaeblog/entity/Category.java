package cn.jaeblog.entity;

public class Category {
	private int id;
	private int user_id;
	private String category_name;
	private int articles;//文章数量
	private int is_delete;
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
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getArticles() {
		return articles;
	}
	public void setArticles(int articles) {
		this.articles = articles;
	}
	public int getIs_delete() {
		return is_delete;
	}
	public void setIs_delete(int is_delete) {
		this.is_delete = is_delete;
	}

}
