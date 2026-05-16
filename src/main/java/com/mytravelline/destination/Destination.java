package com.mytravelline.destination;

import com.mytravelline.common.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "destination")
public class Destination extends BaseEntity {

    @Column(nullable = false, length = 150)
    private String name;

    @Column(nullable = false, unique = true, length = 170)
    private String slug;

    @Column(length = 100)
    private String country;

    @Column(length = 4000)
    private String description;

    @Column(name = "cover_image_key", length = 500)
    private String coverImageKey;
}
