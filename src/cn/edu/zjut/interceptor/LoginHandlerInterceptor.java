package cn.edu.zjut.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.edu.zjut.entity.User;
import cn.edu.zjut.util.Const;

/**
 * 
 * description:登陆认证拦截器
 * @author HZL
 * @date 2015年12月2日 下午8:45:18
 *
 */
public class LoginHandlerInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		String path = request.getServletPath();
		if(path.matches(Const.NO_INTERCEPTOR_PATH)){
			return true;
		}else{
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);//sessionUser
			if(user!=null){
				return true;
			}else{
				response.sendRedirect(request.getContextPath()+"/login.html");
				return false;  
			}
		}
	}
	
}
