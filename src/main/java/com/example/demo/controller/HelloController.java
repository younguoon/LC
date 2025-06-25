
package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return "hello"; // /WEB-INF/views/hello.jsp
    }

    @GetMapping("/post/detail")
    public String postDetail() {
        return "postDetail";
    }

}
