package com.lottecard.fgs.global.interceptor;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Component
public class ViewPageInterceptor implements HandlerInterceptor {

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            @Nullable ModelAndView modelAndView) throws Exception {

        // ModelAndView가 없거나 리다이렉트인 경우 처리하지 않음
        if (modelAndView == null) {
            return;
        }

        String viewName = modelAndView.getViewName();
        if (viewName == null || viewName.startsWith("redirect:") || viewName.startsWith("forward:")) {
            return;
        }

        String uri = request.getRequestURI();

        // JSP 내부 요청이나 정적 리소스는 제외
        if (uri.contains("/WEB-INF/") || uri.startsWith("/static") || uri.endsWith(".css")
                || uri.endsWith(".js") || uri.endsWith(".png") || uri.endsWith(".jpg")
                || uri.endsWith(".ico") || uri.startsWith("/assets")) {
            return;
        }

        // 이미 viewPage가 설정되어 있으면 중복 처리 방지
        if (modelAndView.getModel().containsKey("viewPage")) {
            return;
        }

        String viewPage = null;
        Map<String, Object> pageInfo = null;

        // 레이아웃 타입에 따라 viewPage와 pageInfo 자동 설정
        if ("layout/layout_simple".equals(viewName)) {
            // 심플 레이아웃 - URI에 따라 매핑
            viewPage = getSimpleLayoutViewPage(uri);
        } else if ("layout/layout".equals(viewName)) {
            // 메인 레이아웃 - URI에 따라 매핑
            viewPage = getMainLayoutViewPage(uri);
            pageInfo = getPageInfo(uri);
        }

        if (viewPage != null) {
            modelAndView.addObject("viewPage", viewPage);
            System.out.println("[ViewPageInterceptor] " + uri + " -> " + viewPage);
        }

        if (pageInfo != null) {
            modelAndView.addObject("pageInfo", pageInfo);
            System.out.println("[ViewPageInterceptor] PageInfo set for: " + uri);
        }
    }

    /**
     * 심플 레이아웃용 viewPage 매핑
     */
    private String getSimpleLayoutViewPage(String uri) {
        switch (uri) {
            case "/":
            case "/login":
                return "/WEB-INF/jsp/login.jsp";
            case "/access-denied":
                return "/WEB-INF/jsp/access-denied.jsp";
            default:
                return "/WEB-INF/jsp/login.jsp"; // 기본값
        }
    }

    /**
     * 메인 레이아웃용 viewPage 매핑
     */
    private String getMainLayoutViewPage(String uri) {
        // URI를 JSP 경로로 자동 변환
        if ("/admin/dashboard".equals(uri)) {
            return "/WEB-INF/jsp/admin/dashboard.jsp";
        }

        // /admin/으로 시작하는 경우 자동 매핑
        if (uri.startsWith("/admin/")) {
            String path = uri.substring(1); // 첫 번째 슬래시 제거
            return "/WEB-INF/jsp/" + path + ".jsp";
        }

        // 기본값
        return "/WEB-INF/jsp/admin/dashboard.jsp";
    }

    /**
     * URI에 따른 pageInfo 생성 - 간소화된 메뉴 구조
     */
    private Map<String, Object> getPageInfo(String uri) {
        Map<String, Object> pageInfo = new HashMap<>();

        switch (uri) {
            case "/admin/dashboard":
                pageInfo.put("currentPage", "Dashboard");
                break;

            // 회원 관리
            case "/admin/members/list":
                pageInfo.put("menuDepth1", "회원 관리");
                pageInfo.put("currentPage", "회원 목록");
                break;
            case "/admin/members/add":
                pageInfo.put("menuDepth1", "회원 관리");
                pageInfo.put("currentPage", "회원 등록");
                break;
            case "/admin/members/stats":
                pageInfo.put("menuDepth1", "회원 관리");
                pageInfo.put("currentPage", "회원 통계");
                break;

            // 체크인 관리
            case "/admin/checkin/list":
                pageInfo.put("menuDepth1", "체크인 관리");
                pageInfo.put("currentPage", "체크인 현황");
                break;
            case "/admin/checkin/locations":
                pageInfo.put("menuDepth1", "체크인 관리");
                pageInfo.put("currentPage", "장소 관리");
                break;
            case "/admin/checkin/stats":
                pageInfo.put("menuDepth1", "체크인 관리");
                pageInfo.put("currentPage", "체크인 통계");
                break;

            // 게시판 관리
            case "/admin/board/notice":
                pageInfo.put("menuDepth1", "게시판 관리");
                pageInfo.put("currentPage", "공지사항");
                break;
            case "/admin/board/faq":
                pageInfo.put("menuDepth1", "게시판 관리");
                pageInfo.put("currentPage", "FAQ");
                break;
            case "/admin/board/qna":
                pageInfo.put("menuDepth1", "게시판 관리");
                pageInfo.put("currentPage", "Q&A");
                break;

            // 이벤트 관리
            case "/admin/events":
                pageInfo.put("currentPage", "이벤트 관리");
                break;

            // 시스템 관리
            case "/admin/system/settings":
                pageInfo.put("menuDepth1", "시스템 관리");
                pageInfo.put("currentPage", "시스템 설정");
                break;
            case "/admin/system/users":
                pageInfo.put("menuDepth1", "시스템 관리");
                pageInfo.put("currentPage", "관리자 계정");
                break;
            case "/admin/system/logs":
                pageInfo.put("menuDepth1", "시스템 관리");
                pageInfo.put("currentPage", "로그 관리");
                break;

            // 통계 및 리포트
            case "/admin/reports":
                pageInfo.put("currentPage", "통계 및 리포트");
                break;

            default:
                pageInfo.put("currentPage", "관리자 페이지");
                break;
        }

        return pageInfo;
    }
}