package com.mytravelline.tour.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TourImageDto {

    private Long id;
    private String s3Key;
    private String url;
    private String caption;
    private Integer sortOrder;
    private boolean main;
}
