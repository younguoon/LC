package com.lottecard.fgs.global.interceptor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.core.io.Resource;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.support.ResourcePatternUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Component
public class ResourceInterceptor implements HandlerInterceptor {

    private static final String[] CSS_EXTENSIONS = { ".css" };
    private static final String[] JS_EXTENSIONS = { ".js" };
    private static final String[] IMG_EXTENSIONS = { ".png" };

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        try {
            List<String> cssList = new ArrayList<>();
            List<String> jsList = new ArrayList<>();
            List<String> imgList = new ArrayList<>();

            Resource[] classPath = ResourcePatternUtils
                    .getResourcePatternResolver(new DefaultResourceLoader())
                    .getResources("classpath:static");

            String rPath = classPath[0].getURI().toString();

            Resource[] resources = ResourcePatternUtils
                    .getResourcePatternResolver(new DefaultResourceLoader())
                    .getResources("classpath:static/bootstrap/**");

            for (Resource r : resources) {
                String name = r.getFilename();
                if (!name.endsWith("/")) {
                    String path = r.getURI().toString().replace(rPath, "");
                    if (endsWithAny(name, CSS_EXTENSIONS)) {
                        cssList.add(path);
                    } else if (endsWithAny(name, JS_EXTENSIONS)) {
                        jsList.add(path);
                    } else if (endsWithAny(name, IMG_EXTENSIONS)) {
                        imgList.add(path);
                    }
                }
            }
            request.setAttribute("autoCssFiles", cssList);
            request.setAttribute("autoJsFiles", jsList);
            request.setAttribute("autoImgFiles", imgList);

        } catch (Exception e) {
            log.error(e.getMessage());
        }

        return true;
    }

    private boolean endsWithAny(String name, String[] exts) {
        for (String ext : exts) {
            if (name.endsWith(ext)) {
                return true;
            }
        }
        return false;
    }

}
