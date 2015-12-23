package cn.edu.zjut.util;

import cn.edu.zjut.service.MenuService;
import cn.edu.zjut.service.RoleService;
import cn.edu.zjut.service.UserService;

/**
 * 
 * description:获取Spring容器中的service bean
 * @author HZL
 * @date 2015年12月3日 下午8:50:26
 *
 */
public final class ServiceHelper {
	
	public static Object getService(String serviceName){
		//WebApplicationContextUtils.
		return Const.WEB_APP_CONTEXT.getBean(serviceName);
	}
	
	public static UserService getUserService(){
		return (UserService) getService("userService");
	}
	
	public static RoleService getRoleService(){
		return (RoleService) getService("roleService");
	}
	
	public static MenuService getMenuService(){
		return (MenuService) getService("menuService");
	}
}
