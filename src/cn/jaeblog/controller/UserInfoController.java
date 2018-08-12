package cn.jaeblog.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jaeblog.entity.Article;
import cn.jaeblog.entity.Sys_category;
import cn.jaeblog.entity.User;
import cn.jaeblog.mapper.ArticleMapper;
import cn.jaeblog.mapper.Sys_categoryMapper;
import cn.jaeblog.mapper.UserMapper;
@Controller
public class UserInfoController {
	private ArticleMapper articleMapper;
	private Sys_categoryMapper sys_categoryMapper;
	private UserMapper userMapper;
	@Autowired
	public void setArticleMapper(ArticleMapper articleMapper){
		this.articleMapper = articleMapper;
	}
	@Autowired
	public void setSys_categoryMapper(Sys_categoryMapper sys_categoryMapper){
		this.sys_categoryMapper = sys_categoryMapper;
	}
	@Autowired
	public void setUserMapper(UserMapper userMapper){
		this.userMapper = userMapper;
	}
	
	@RequestMapping("/toUpUserInfo.do")
	public String toUpUserInfo(ModelMap map){

		List<Sys_category> sys_category = sys_categoryMapper.findSc();
		map.addAttribute("sys_category", sys_category);
		List<Article> articleTop = articleMapper.findArticleByCount2();
		map.addAttribute("articleTop", articleTop);
		
			return "toUpUserInfo";
		}
	
	@RequestMapping("/upUserInfo.do")
	@ResponseBody
	public void upUserInfo(@ModelAttribute("user")User user,HttpSession session){
		
		try {
			System.out.println(user.getId());
			userMapper.upUserInfo(user);
			user=userMapper.findUserInfo(user.getId());
			session.removeAttribute("user");
			session.setAttribute("user", user);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@RequestMapping("/userInfo")
	public String upUserInfo(HttpServletRequest request,ModelMap map){
		Integer id = Integer.parseInt(request.getParameter("id"));
		User u =userMapper.findUserInfo(id);
		map.addAttribute("u", u);

		List<Sys_category> sys_category = sys_categoryMapper.findSc();
		map.addAttribute("sys_category", sys_category);
		List<Article> articleTop = articleMapper.findArticleByCount2();
		map.addAttribute("articleTop", articleTop);
		
		return "userInfo";
		}
}
