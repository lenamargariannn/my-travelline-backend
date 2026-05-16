package com.mytravelline.destination;

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
public class DestinationDto {

    private Long id;
    private String name;
    private String slug;
    private String country;
    private String description;
    private String coverImage;
    private boolean active;
}
