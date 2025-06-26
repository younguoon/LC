package com.lottecard.fgs.global.interceptor;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.lottecard.fgs.global.config.view.ViewPage;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class ViewPageInterceptor implements HandlerInterceptor{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
            
        String uri = request.getRequestURI();
        if(!uri.startsWith("/static") && !uri.endsWith(".css") && !uri.endsWith(".js")) {
            String viewPage = ViewPage.resolve(uri);
            request.setAttribute("viewPage", viewPage);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
        
        String uri = request.getRequestURI();
        if(!uri.startsWith("/static") && !uri.endsWith(".css") && !uri.endsWith(".js")) {
            String viewPage = ViewPage.resolve(uri);
            request.setAttribute("viewPage", viewPage);
        }
    }
}
