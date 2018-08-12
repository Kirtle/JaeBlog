package cn.jaeblog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.jaeblog.annotation.MyBatisRepository;
import cn.jaeblog.entity.Article;
import cn.jaeblog.entity.Page;

@MyBatisRepository
public interface ArticleMapper {
	public List<Article> findArticleByTime(Page page);
	//统计查询结果
	public Long getCount1();
	
	public List<Article> findArticleByCount1();
	
	public Article findArticleById(Integer id);
	
	public void updateArticleCountById(Integer id);
	
	public List<Article> findArticleByScid(@Param("sys_category_id")Integer sys_category_id,@Param("start")Integer start,@Param("pageSize")Integer pageSize);
	
	public Long getCount2(@Param("sys_category_id")Integer sys_category_id);
	
	public void addArticleByUserid(Article article);
	
	public void upArticleByArticleid(Article article);
	
	public List<Article> findArticleByCount2();
	
	public List<Article> findArticleByKeyword(@Param("keyword")String keyword,@Param("start")Integer start,@Param("pageSize")Integer pageSize); 

	public Long getCount3(@Param("keyword")String keyword);
	
	public List<Article> findArticleByUserid(@Param("user_id")Integer userid,@Param("start")Integer start,@Param("pageSize")Integer pageSize); 

	public Long getCount4(@Param("user_id")Integer userid);
}
