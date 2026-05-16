package com.mytravelline.review;

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
public class ReviewDto {

    private Long id;
    private String authorName;
    private String authorLocation;
    private Integer rating;
    private String content;
    private boolean approved;
    private Long tourId;
    private String tourTitle;
    private LocalDateTime createdAt;
}
