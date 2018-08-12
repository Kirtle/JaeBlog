package cn.jaeblog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.jaeblog.annotation.MyBatisRepository;
import cn.jaeblog.entity.Comment;

@MyBatisRepository
public interface CommentMapper {
	
	public List<Comment> findCommentById(Integer articleid);
	
	public void addComment(@Param("user_id")Integer user_id,@Param("article_id")Integer article_id,@Param("content")String content);
}
