package com.mytravelline.translation;

import com.mytravelline.common.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "translations")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Translation extends BaseEntity {

    @Column(name = "entity_type", nullable = false, length = 50)
    private String entityType;

    @Column(name = "entity_id", nullable = false)
    private Long entityId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 10)
    private LocaleCode locale;

    @Column(nullable = false, length = 100)
    private String field;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String value;
}
