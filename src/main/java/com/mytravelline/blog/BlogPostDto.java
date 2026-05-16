package com.mytravelline.blog;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BlogPostDto {

    private Long id;
    private String slug;
    private String title;
    private String summary;
    private String content;
    private String coverImage;
    private String author;
    private String tags;
    private boolean published;
    private LocalDateTime publishedAt;
    private LocalDateTime createdAt;
}
