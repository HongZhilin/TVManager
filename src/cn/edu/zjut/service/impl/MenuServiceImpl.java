package cn.edu.zjut.service.impl;

import java.util.List;

import cn.edu.zjut.entity.Menu;
import cn.edu.zjut.mapper.MenuMapper;
import cn.edu.zjut.service.MenuService;

public class MenuServiceImpl implements MenuService{

	private MenuMapper menuMapper;
	
	public void deleteMenuById(Integer menuId) {
		menuMapper.deleteMenuById(menuId);
	}

	public Menu getMenuById(Integer menuId) {
		return menuMapper.getMenuById(menuId);
	}

	public List<Menu> listAllParentMenu() {
		return menuMapper.listAllParentMenu();
	}

	public void saveMenu(Menu menu) {
		if(menu.getMenuId()!=null && menu.getMenuId().intValue()>0){
			menuMapper.updateMenu(menu);
		}else{
			menuMapper.insertMenu(menu);
		}
	}

	public List<Menu> listSubMenuByParentId(Integer parentId) {
		return menuMapper.listSubMenuByParentId(parentId);
	}
	
	public List<Menu> listAllMenu() {
		List<Menu> rl = this.listAllParentMenu();
		for(Menu menu : rl){
			List<Menu> subList = this.listSubMenuByParentId(menu.getMenuId());
			menu.setSubMenu(subList);
		}
		return rl;
	}

	public List<Menu> listAllSubMenu(){
		return menuMapper.listAllSubMenu();
	}
	
	public MenuMapper getMenuMapper() {
		return menuMapper;
	}

	public void setMenuMapper(MenuMapper menuMapper) {
		this.menuMapper = menuMapper;
	}

}
