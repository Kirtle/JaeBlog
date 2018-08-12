package cn.jaeblog.entity;

import java.sql.Timestamp;

public class Ucomment {
	private int articleid;//文章主键
	private int commentId;//评论主键
	private String ccontent;//评论内容
	private String username;//评论用户
	private String title;//评论的文章标题
	private Timestamp atime;//评论的发布时间
	private int acount;
	private String summary;
	private String acontent;
	public int getArticleid() {
		return articleid;
	}
	public void setArticleid(int articleid) {
		this.articleid = articleid;
	}
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getAtime() {
		return atime;
	}
	public void setAtime(Timestamp atime) {
		this.atime = atime;
	}
	public int getAcount() {
		return acount;
	}
	public void setAcount(int acount) {
		this.acount = acount;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}

}
