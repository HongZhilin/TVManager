package cn.edu.zjut.service;

import java.util.List;

import cn.edu.zjut.entity.Menu;

public interface MenuService {
	
	List<Menu> listAllMenu();
	List<Menu> listAllParentMenu();
	List<Menu> listSubMenuByParentId(Integer parentId);
	List<Menu> listAllSubMenu();
	
	Menu getMenuById(Integer menuId);
	void saveMenu(Menu menu);
	void deleteMenuById(Integer menuId);
}
