package cn.jaeblog.mapper;

import java.util.List;

import cn.jaeblog.annotation.MyBatisRepository;
import cn.jaeblog.entity.Sys_category;
@MyBatisRepository
public interface Sys_categoryMapper {
	public List<Sys_category> findSc();
	
	public void updateSc(Sys_category sc);
	
	public void addSc(Sys_category sc);

	public void delSc(Sys_category sc);
}
