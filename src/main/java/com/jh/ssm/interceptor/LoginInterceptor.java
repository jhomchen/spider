package com.jh.ssm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
 
//        String url = httpServletRequest.getRequestURI();
//        if(url.toLowerCase().indexOf("login")>=0){
//            return true;
//        }
// 
        HttpSession session = httpServletRequest.getSession();
        if(session.getAttribute("user")!=null){
            return true;
        }
        httpServletResponse.sendRedirect("/");
        return false;
    }
 
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
 
    }
 
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
 
    }
}
