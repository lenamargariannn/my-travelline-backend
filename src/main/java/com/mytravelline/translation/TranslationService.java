package com.mytravelline.translation;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TranslationService {

    private final TranslationRepository repo;

    /**
     * Returns the value for a field in the requested locale,
     * falling back to EN if not found.
     */
    public String get(String entityType, Long entityId, String field, LocaleCode requested) {
        return repo.findByEntityTypeAndEntityIdAndLocaleAndField(entityType, entityId, requested, field)
                .map(Translation::getValue)
                .or(() -> repo.findByEntityTypeAndEntityIdAndLocaleAndField(
                        entityType, entityId, LocaleCode.EN, field)
                        .map(Translation::getValue))
                .orElse(null);
    }

    /**
     * Bulk-load all translations for an entity, grouped as locale → field → value.
     */
    public Map<String, Map<String, String>> getAll(String entityType, Long entityId) {
        return repo.findByEntityTypeAndEntityId(entityType, entityId)
                .stream()
                .collect(Collectors.groupingBy(
                        t -> t.getLocale().name().toLowerCase(),
                        Collectors.toMap(Translation::getField, Translation::getValue)
                ));
    }

    /**
     * Save or update translations. Partial updates are fine — missing keys are left unchanged.
     */
    @Transactional
    public void saveAll(String entityType, Long entityId,
                        Map<String, Map<String, String>> translations) {
        translations.forEach((localeStr, fields) -> {
            LocaleCode locale = LocaleCode.valueOf(localeStr.toUpperCase());
            fields.forEach((field, value) -> {
                repo.findByEntityTypeAndEntityIdAndLocaleAndField(entityType, entityId, locale, field)
                        .ifPresentOrElse(
                                t -> {
                                    t.setValue(value);
                                    repo.save(t);
                                },
                                () -> repo.save(Translation.builder()
                                        .entityType(entityType)
                                        .entityId(entityId)
                                        .locale(locale)
                                        .field(field)
                                        .value(value)
                                        .build())
                        );
            });
        });
    }

    /** Call when an entity is deleted to avoid orphan rows. */
    @Transactional
    public void deleteAll(String entityType, Long entityId) {
        repo.deleteByEntityTypeAndEntityId(entityType, entityId);
    }
}
