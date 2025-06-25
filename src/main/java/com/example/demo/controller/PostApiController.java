package com.example.demo.controller;

import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/post")
public class PostApiController {

    // 태그 하나당 여러 필드
    public record Tag(
        String name,
        String color,
        boolean visible
    ) {}

    // 게시글 요청 데이터
    public record PostRequest(
        String title,
        String author,
        String content,
        List<Tag> tags
    ) {}

    @PostMapping("/save")
    public String savePost(@RequestBody PostRequest request) {
        System.out.println("제목: " + request.title());
        for (Tag tag : request.tags()) {
            System.out.printf("- 태그: %s (%s, 표시여부: %s)%n", tag.name(), tag.color(), tag.visible());
        }
        return "저장 완료";
    }
}
