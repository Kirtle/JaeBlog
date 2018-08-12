package cn.jaeblog.mapper;

import org.apache.ibatis.annotations.Param;

import cn.jaeblog.annotation.MyBatisRepository;
import cn.jaeblog.entity.User;
@MyBatisRepository
public interface UserMapper {
	public User login(@Param("username")String username,@Param("userpwd")String userpwd);
	
	public void register(@Param("username")String username,@Param("userpwd")String userpwd);
	
	public void upUserInfo(User user);

	public User findUserInfo(Integer id);
}
