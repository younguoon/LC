package com.lottecard.fgs.global.config.view;

import java.util.Map;

public enum ViewPage {
    LOGIN("/WEB-INF/jsp/common/login.jsp"),
    HOME("/WEB-INF/jsp/common/main.jsp");

    private final String path;

    ViewPage(String path) {
        this.path = path;
    }

    public String path() {
        return path;
    }

    public static String resolve(String uri){
        if(VIEW_EXCEPTIOONS.containsKey(uri)){
            return VIEW_EXCEPTIOONS.get(uri);
        }
        return "/WEB-INF/jsp" + uri + ".jsp";
    }

    private static final Map<String, String> VIEW_EXCEPTIOONS = Map.of(
        "/main", "/WEB-INF/jsp/common/main.jsp",
        "/lognin", "/WEB-INF/jsp/common/login.jsp"
    );

}
