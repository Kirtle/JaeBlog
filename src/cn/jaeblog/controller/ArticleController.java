package cn.jaeblog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jaeblog.entity.Article;
import cn.jaeblog.entity.Comment;
import cn.jaeblog.entity.Page;
import cn.jaeblog.entity.Sys_category;
import cn.jaeblog.mapper.ArticleMapper;
import cn.jaeblog.mapper.CommentMapper;
import cn.jaeblog.mapper.Sys_categoryMapper;

@Controller
@RequestMapping("")
public class ArticleController {
	private ArticleMapper articleMapper;
	private Sys_categoryMapper sys_categoryMapper; 
	private CommentMapper commentMapper;
	@Autowired
	public void setArticleMapper(ArticleMapper articleMapper){
		this.articleMapper = articleMapper;
	}
	@Autowired
	public void setSys_categoryMapper(Sys_categoryMapper sys_categoryMapper){
		this.sys_categoryMapper = sys_categoryMapper;
	}
	@Autowired
	public void setCommentMapper(CommentMapper commentMapper){
		this.commentMapper = commentMapper;
	}
	
	
	@RequestMapping("")
	public String findArticle(ModelMap map,Page page,HttpServletRequest request){
		//查询数据
				if(page == null)
					page = new Page();
				String pageNo = request.getParameter("pageNo");
				if(pageNo != null){
					Integer pageno = Integer.parseInt(pageNo);
					page.setPageNo(pageno);
				}
				List<Article> articles1 = articleMapper.findArticleByCount1();
				List<Article> articles2 = articleMapper.findArticleByTime(page);
				Long totalPage = articleMapper.getCount1();
				//将数据带到页面
				map.addAttribute("articles1", articles1);
				map.addAttribute("articles2", articles2);
				map.addAttribute("totalPage", totalPage);
				map.addAttribute("page", page);
				
				List<Sys_category> sys_category = sys_categoryMapper.findSc();
				map.addAttribute("sys_category", sys_category);
				List<Article> articleTop = articleMapper.findArticleByCount2();
				map.addAttribute("articleTop", articleTop);
				
				return "index";
	}
	@RequestMapping("/article")
	public String findArticleById(ModelMap map,HttpServletRequest request){
		String Id = request.getParameter("id");
		if (Id!=null) {
			Integer id = Integer.parseInt(Id);
			Article article = articleMapper.findArticleById(id);
			map.addAttribute("article", article);
			List<Comment> comment = commentMapper.findCommentById(id);
			map.addAttribute("comment", comment);
			articleMapper.updateArticleCountById(id);

			List<Sys_category> sys_category = sys_categoryMapper.findSc();
			map.addAttribute("sys_category", sys_category);
			List<Article> articleTop = articleMapper.findArticleByCount2();
			map.addAttribute("articleTop", articleTop);
			
		}
		return "article";
	}
	
	@RequestMapping("/articleBySc")
	public String findArticleByScid(ModelMap map,Page page,Integer sys_category_id,HttpServletRequest request){
		if(page == null)
			page = new Page();
		String pageNo = request.getParameter("pageNo");
		if(pageNo != null){
			Integer pageno = Integer.parseInt(pageNo);
			page.setPageNo(pageno);
		}
		String id = request.getParameter("id");
		if(id != "" && id != null ){
			sys_category_id = Integer.parseInt(id);
			map.addAttribute("sys_category_id", sys_category_id);
		}
		
		List<Article> articles = articleMapper.findArticleByScid(sys_category_id ,page.getStart(),page.getPageSize());
		Long totalPage = articleMapper.getCount2(sys_category_id);
		//将数据带到页面
		map.addAttribute("articles", articles);
		map.addAttribute("totalPage", totalPage);
		map.addAttribute("page", page);

		List<Sys_category> sys_category = sys_categoryMapper.findSc();
		map.addAttribute("sys_category", sys_category);
		List<Article> articleTop = articleMapper.findArticleByCount2();
		map.addAttribute("articleTop", articleTop);
		
		return "articleBySc";
	}
	
	@RequestMapping("/toAddArticle")
	public String toAddArticle(ModelMap map){

		List<Sys_category> sys_category = sys_categoryMapper.findSc();
		map.addAttribute("sys_category", sys_category);
		List<Article> articleTop = articleMapper.findArticleByCount2();
		map.addAttribute("articleTop", articleTop);
		
		return "toAddArticle";
	}
	@RequestMapping("/addArticle")
	@ResponseBody
	public void addArticle(Article article ){
		try {
			articleMapper.addArticleByUserid(article);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@RequestMapping("/toUpdateArticle")
	public String toUpdateArticle(Article article,HttpServletRequest request,ModelMap map){
		Integer id = Integer.parseInt(request.getParameter("id"));
		article =articleMapper.findArticleById(id);
		map.addAttribute("article", article);

		List<Sys_category> sys_category = sys_categoryMapper.findSc();
		map.addAttribute("sys_category", sys_category);
		List<Article> articleTop = articleMapper.findArticleByCount2();
		map.addAttribute("articleTop", articleTop);
		
		return "toUpdateArticle";
	}
	@RequestMapping("/updateArticle")
	@ResponseBody
	public void updateArticle(Article article ){
		try {
			
			articleMapper.upArticleByArticleid(article);;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@ModelAttribute("scnames")
	public Map<Integer,String> getSys_categorynames(){
		Map<Integer,String> map = new HashMap<Integer,String>();
		List<Sys_category> scnames = sys_categoryMapper.findSc();
		for(Sys_category scname : scnames){
			map.put(scname.getId(), scname.getCategory_name());
		}
		return map;
	}
	
	@RequestMapping("/articleByKw")
	public String findArticleByKw(ModelMap map,Page page,String keyword,HttpServletRequest request){
		if(page == null)
			page = new Page();
		String pageNo = request.getParameter("pageNo");
		if(pageNo != null){
			Integer pageno = Integer.parseInt(pageNo);
			page.setPageNo(pageno);
		}
		keyword = request.getParameter("keyword");
		map.addAttribute("keyword", keyword);
		List<Article> articles = articleMapper.findArticleByKeyword(keyword,page.getStart(),page.getPageSize());
		Long totalPage = articleMapper.getCount3(keyword);
		//将数据带到页面
		map.addAttribute("articles", articles);
		map.addAttribute("totalPage", totalPage);
		map.addAttribute("page", page);

		List<Sys_category> sys_category = sys_categoryMapper.findSc();
		map.addAttribute("sys_category", sys_category);
		List<Article> articleTop = articleMapper.findArticleByCount2();
		map.addAttribute("articleTop", articleTop);
		
		return "articleByKw";
	}
	@RequestMapping("/aboutWebsite")
	public String aboutWebsite(ModelMap map){

		List<Sys_category> sys_category = sys_categoryMapper.findSc();
		map.addAttribute("sys_category", sys_category);
		List<Article> articleTop = articleMapper.findArticleByCount2();
		map.addAttribute("articleTop", articleTop);
		
		return "aboutWebsite";
	}
	@RequestMapping("/myArticle")
	public String myArticle(ModelMap map,Page page,Integer id,HttpServletRequest request){
		if(page == null)
			page = new Page();
			page.setPageSize(10);
		String pageNo = request.getParameter("pageNo");
		if(pageNo != null){
			Integer pageno = Integer.parseInt(pageNo);
			page.setPageNo(pageno);
			
		}
		id = Integer.parseInt(request.getParameter("id"));
		List<Article> articles = articleMapper.findArticleByUserid(id,page.getStart(),page.getPageSize());
		Long totalPage = articleMapper.getCount4(id);
		//将数据带到页面
		map.addAttribute("articles", articles);
		map.addAttribute("totalPage", totalPage);
		map.addAttribute("page", page);

		List<Sys_category> sys_category = sys_categoryMapper.findSc();
		map.addAttribute("sys_category", sys_category);
		List<Article> articleTop = articleMapper.findArticleByCount2();
		map.addAttribute("articleTop", articleTop);
		
		return "myArticle";
	}
}
