package cn.edu.zjut.mapper;

import java.util.List;

import cn.edu.zjut.entity.Menu;

public interface MenuMapper {
	List<Menu> listAllParentMenu();
	List<Menu> listSubMenuByParentId(Integer parentId);
	Menu getMenuById(Integer menuId);
	List<Menu> listAllSubMenu();
	
	void insertMenu(Menu menu);
	void updateMenu(Menu menu);
	void deleteMenuById(Integer menuId);
}
