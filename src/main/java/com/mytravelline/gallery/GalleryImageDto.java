package com.mytravelline.gallery;

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
public class GalleryImageDto {

    private Long id;
    private String s3Key;
    private String imageUrl;
    private String caption;
    private Integer sortOrder;
    private Long destinationId;
    private String destinationName;
    private LocalDateTime createdAt;
}
