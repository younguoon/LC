package com.lottecard.fgs.global.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        // 로그인 여부 체크
        // 예시: 세션에서 사용자 정보를 확인하고, 로그인되지 않은 경우 로그인 페이지로 리다이렉트
        // if (request.getSession().getAttribute("user") == null) {
        //     response.sendRedirect("/login");
        //     return false; // 요청을 중단
        // }
        return true; // 요청을 계속 진행
    }
    
}
