package com.lottecard.fgs.global.config.view;

public enum ViewPage {
    
    // 특별한 경우만 정의 (대부분은 자동 매핑 사용)
    LOGIN("/WEB-INF/jsp/login.jsp"),
    HOME("/WEB-INF/jsp/main.jsp"),
    ERROR("/WEB-INF/jsp/error.jsp");

    private final String path;

    ViewPage(String path) {
        this.path = path;
    }

    public String path() {
        return path;
    }

    /**
     * URI를 JSP 경로로 자동 변환
     * 예: /admin/dashboard -> /WEB-INF/jsp/admin/dashboard.jsp
     */
    public static String resolve(String uri) {
        // 루트 경로는 로그인으로
        if ("/".equals(uri)) {
            return LOGIN.path();
        }
        
        // 첫 번째 슬래시 제거 후 JSP 경로 생성
        String cleanUri = uri.startsWith("/") ? uri.substring(1) : uri;
        
        // 빈 경로면 login
        if (cleanUri.isEmpty()) {
            return LOGIN.path();
        }
        
        return "/WEB-INF/jsp/" + cleanUri + ".jsp";
    }
}