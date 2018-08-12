package cn.jaeblog.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jaeblog.entity.Article;
import cn.jaeblog.entity.Sys_category;
import cn.jaeblog.mapper.ArticleMapper;
import cn.jaeblog.mapper.Sys_categoryMapper;

@Controller
@RequestMapping("")
public class Sys_categoryController {
	private Sys_categoryMapper sys_categoryMapper;
	private ArticleMapper articleMapper;
	@Autowired
	public void setSys_categoryMapper(Sys_categoryMapper sys_categoryMapper){
		this.sys_categoryMapper = sys_categoryMapper;
	}
	@Autowired
	public void setArticleMapper(ArticleMapper articleMapper){
		this.articleMapper = articleMapper;
	}
	@RequestMapping("sc")
	public String Sys_categoryList(ModelMap map){
		List<Sys_category> sys_category = sys_categoryMapper.findSc();
		map.addAttribute("sys_category", sys_category);
		
		List<Article> articleTop = articleMapper.findArticleByCount2();
		map.addAttribute("articleTop", articleTop);
		return "sc";
		
	}
	@RequestMapping("updateSc")
	@ResponseBody
	public void updateSc(Sys_category sys_category){
		try {
					
			sys_categoryMapper.updateSc(sys_category);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
	}
	@RequestMapping("addSc")
	@ResponseBody
	public void addSc(Sys_category sys_category){
		try {
			sys_categoryMapper.addSc(sys_category);
				} catch (Exception e) {
					e.printStackTrace();
				}
	}
	@RequestMapping("delSc")
	@ResponseBody
	public void delSc(Sys_category sys_category){
		try {
			sys_categoryMapper.delSc(sys_category);
				} catch (Exception e) {
					e.printStackTrace();
				}
	}
}
