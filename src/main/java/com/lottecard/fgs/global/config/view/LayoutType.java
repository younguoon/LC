package com.lottecard.fgs.global.config.view;

public enum LayoutType {

    MAIN("layout/layout"), // 관리자 메인 레이아웃
    SIMPLE("layout/layout_simple"), // 로그인용 심플 레이아웃
    POPUP("layout/layout_popup"), // 팝업용 레이아웃 (필요시)
    ERROR("layout/layout_error"); // 에러페이지용 레이아웃 (필요시)

    private final String path;

    LayoutType(String path) {
        this.path = path;
    }

    public String path() {
        return this.path;
    }

    public String getPath() {
        return this.path;
    }
}