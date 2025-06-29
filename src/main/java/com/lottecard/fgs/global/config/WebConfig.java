package com.lottecard.fgs.global.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.lottecard.fgs.global.interceptor.ResourceInterceptor;
import com.lottecard.fgs.global.interceptor.ViewPageInterceptor;

import javax.annotation.Resource;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Resource
    private ViewPageInterceptor viewPageInterceptor;

    @Resource
    private ResourceInterceptor resourceInterceptor;

    private static final String[] EXCLUDE_PATHS = {
            "/css/**",
            "/js/**",
            "/images/**",
            "/fonts/**",
            "/favicon.ico"
    };

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        // 루트 경로를 /login으로 리다이렉트
        registry.addRedirectViewController("/", "/login");
    }

    
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**")
                .addResourceLocations("classpath:/static/css/", "/css/");
        registry.addResourceHandler("/js/**")
                .addResourceLocations("classpath:/static/js/", "/js/");
    }

    /**
     * Interceptor를 등록합니다.
     * 
     * @param registry InterceptorRegistry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(viewPageInterceptor).addPathPatterns("/**").excludePathPatterns(EXCLUDE_PATHS);
        registry.addInterceptor(resourceInterceptor).addPathPatterns("/**").excludePathPatterns(EXCLUDE_PATHS);
    }
}
