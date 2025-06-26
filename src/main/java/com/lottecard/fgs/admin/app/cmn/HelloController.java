
package com.lottecard.fgs.admin.app.cmn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.lottecard.fgs.global.config.view.LayoutType;

@Controller
public class HelloController {

    @GetMapping("/hello")
    public String hello() {System.err.println();
        return LayoutType.MAIN.path(); // /WEB-INF/views/hello.jsp
    }
}
