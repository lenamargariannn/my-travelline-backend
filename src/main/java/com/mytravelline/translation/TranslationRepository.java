package com.mytravelline.translation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TranslationRepository extends JpaRepository<Translation, Long> {

    List<Translation> findByEntityTypeAndEntityId(String entityType, Long entityId);

    List<Translation> findByEntityTypeAndEntityIdAndLocale(
            String entityType, Long entityId, LocaleCode locale);

    Optional<Translation> findByEntityTypeAndEntityIdAndLocaleAndField(
            String entityType, Long entityId, LocaleCode locale, String field);

    void deleteByEntityTypeAndEntityId(String entityType, Long entityId);
}
