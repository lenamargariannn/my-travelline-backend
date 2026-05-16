package com.mytravelline.destination;

import com.mytravelline.common.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Table(name = "destination")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Destination extends BaseEntity {

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, unique = true)
    private String slug;

    @Column(nullable = false)
    private String country;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(name = "cover_image_key", length = 500)
    private String coverImageKey;

    @Column(nullable = false)
    private Boolean featured = false;
}
