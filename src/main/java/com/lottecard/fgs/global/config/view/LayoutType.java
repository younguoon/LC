package com.lottecard.fgs.global.config.view;

public enum LayoutType {
    MAIN("layout/layout"),
    FRAG("layout/layout_frag");

    private final String path;

    LayoutType(String path){
        this.path = path;
    }

    public String path(){
        return path;
    }
}
