package com.mytravelline.category;

import com.mytravelline.common.RequestLocaleResolver;
import com.mytravelline.common.exception.ResourceNotFoundException;
import com.mytravelline.translation.LocaleCode;
import com.mytravelline.translation.TranslationService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class CategoryService {

    private static final String ENTITY_TYPE = "category";

    private final CategoryRepository categoryRepository;
    private final CategoryMapper categoryMapper;
    private final TranslationService translationService;
    private final RequestLocaleResolver localeResolver;

    public List<CategoryDto> getAllActiveCategories(HttpServletRequest request) {
        LocaleCode locale = localeResolver.resolve(request);
        return categoryRepository.findByActiveTrue().stream()
                .map(c -> overlayTranslations(categoryMapper.toDto(c), c.getId(), locale))
                .toList();
    }

    public List<CategoryDto> getAllCategories() {
        return categoryMapper.toDtoList(categoryRepository.findAll());
    }

    public CategoryDto getCategoryBySlug(String slug, HttpServletRequest request) {
        Category category = categoryRepository.findBySlug(slug)
                .orElseThrow(() -> new ResourceNotFoundException("Category", "slug", slug));
        LocaleCode locale = localeResolver.resolve(request);
        return overlayTranslations(categoryMapper.toDto(category), category.getId(), locale);
    }

    public CategoryDto getCategoryById(Long id) {
        Category category = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Category", "id", id));
        return categoryMapper.toDto(category);
    }

    public Map<String, Map<String, String>> getCategoryTranslations(Long id) {
        if (!categoryRepository.existsById(id)) {
            throw new ResourceNotFoundException("Category", "id", id);
        }
        return translationService.getAll(ENTITY_TYPE, id);
    }

    @Transactional
    public void saveCategoryTranslations(Long id, Map<String, Map<String, String>> translations) {
        if (!categoryRepository.existsById(id)) {
            throw new ResourceNotFoundException("Category", "id", id);
        }
        translationService.saveAll(ENTITY_TYPE, id, translations);
    }

    @Transactional
    public CategoryDto createCategory(CategoryDto dto) {
        Category category = categoryMapper.toEntity(dto);
        category = categoryRepository.save(category);
        return categoryMapper.toDto(category);
    }

    @Transactional
    public CategoryDto updateCategory(Long id, CategoryDto dto) {
        Category category = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Category", "id", id));
        categoryMapper.updateEntity(dto, category);
        category = categoryRepository.save(category);
        return categoryMapper.toDto(category);
    }

    @Transactional
    public void deleteCategory(Long id) {
        if (!categoryRepository.existsById(id)) {
            throw new ResourceNotFoundException("Category", "id", id);
        }
        translationService.deleteAll(ENTITY_TYPE, id);
        categoryRepository.deleteById(id);
    }

    private CategoryDto overlayTranslations(CategoryDto dto, Long id, LocaleCode locale) {
        if (locale == LocaleCode.EN) return dto;
        String name = translationService.get(ENTITY_TYPE, id, "name", locale);
        if (name != null) dto.setName(name);
        return dto;
    }
}
