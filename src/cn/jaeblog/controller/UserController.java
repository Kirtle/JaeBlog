package cn.jaeblog.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jaeblog.entity.User;
import cn.jaeblog.mapper.UserMapper;

@Controller
@RequestMapping("/user")
public class UserController {
	private UserMapper userMapper;
	@Autowired
	public void setUserMapper(UserMapper userMapper){
		this.userMapper = userMapper;
	}
	
	@ModelAttribute("user")
	public void setUser(User user){
		if(user==null){
			user = new User();
		}
	}
	
	@RequestMapping("/register.do")
	@ResponseBody
	public void register(HttpServletRequest request){
		try {
			String username =request.getParameter("username"); 
			String userpwd =request.getParameter("userpwd");
			userMapper.register(username,userpwd);   
		} catch (Exception e) {		
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/login.do")
	@ResponseBody
    public User login(@ModelAttribute("user")User user,HttpServletRequest request){
    	try {
    		HttpSession session = request.getSession(false);
    			System.out.println("username:  "+user.getUsername());       		  
    			System.out.println("userpwd:   "+user.getUserpwd());
        		User user1=userMapper.login(user.getUsername(), user.getUserpwd());
        		if(user1.getUsername() !=null&& user1.getUserpwd() != null){
        			session.setAttribute("user",user1);
        			System.out.println("userid:   "+user1.getId());
            		return user1;
        		}else{
        			return null; 
        		}
		} catch (Exception e) {		
			e.printStackTrace();
			return null;
		}
    }
	
	@RequestMapping("/logout.do")
	@ResponseBody
	public void logout(HttpServletRequest request){
		
		try {
			HttpSession session = request.getSession(false);
			System.out.println(session.getAttribute("user"));
			
			if (null != session) {
				session.removeAttribute("user");
				session.invalidate();
			}
			System.out.println("ok");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		}
	
	
}
