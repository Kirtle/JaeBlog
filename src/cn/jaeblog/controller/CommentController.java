package cn.jaeblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jaeblog.entity.Comment;
import cn.jaeblog.mapper.CommentMapper;

@Controller
@RequestMapping("/comment")
public class CommentController {
	private CommentMapper commentMapper;
	
	@Autowired
	public void setCommentMapper(CommentMapper commentMapper){
		this.commentMapper = commentMapper;
	}
	
	/*@ModelAttribute("/comment")
	public void setComment(Comment comment){
		if(comment==null){
			comment = new Comment();
		}
	}*/
	@RequestMapping("/addComment.do")
	@ResponseBody
	public void addComment(Comment comment){
		try {
			System.out.println(comment.getUser_id());
			System.out.println(comment.getArticle_id());
			System.out.println(comment.getContent());
			commentMapper.addComment(comment.getUser_id(),comment.getArticle_id(),comment.getContent());
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
	}
}
