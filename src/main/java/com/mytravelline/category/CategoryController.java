package com.mytravelline.category;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class CategoryController {

    private final CategoryService categoryService;

    // ===== Public endpoints =====

    @GetMapping("/api/categories")
    public ResponseEntity<List<CategoryDto>> getActiveCategories(HttpServletRequest request) {
        return ResponseEntity.ok(categoryService.getAllActiveCategories(request));
    }

    @GetMapping("/api/categories/{slug}")
    public ResponseEntity<CategoryDto> getCategoryBySlug(@PathVariable String slug,
                                                          HttpServletRequest request) {
        return ResponseEntity.ok(categoryService.getCategoryBySlug(slug, request));
    }

    // ===== Admin endpoints =====

    @GetMapping("/api/admin/categories")
    public ResponseEntity<List<CategoryDto>> getAllCategories() {
        return ResponseEntity.ok(categoryService.getAllCategories());
    }

    @GetMapping("/api/admin/categories/{id}")
    public ResponseEntity<CategoryDto> getCategoryById(@PathVariable Long id) {
        return ResponseEntity.ok(categoryService.getCategoryById(id));
    }

    @GetMapping("/api/admin/categories/{id}/translations")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Map<String, Map<String, String>>> getCategoryTranslations(@PathVariable Long id) {
        return ResponseEntity.ok(categoryService.getCategoryTranslations(id));
    }

    @PutMapping("/api/admin/categories/{id}/translations")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Void> saveCategoryTranslations(
            @PathVariable Long id,
            @RequestBody Map<String, Map<String, String>> translations) {
        categoryService.saveCategoryTranslations(id, translations);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/api/admin/categories")
    public ResponseEntity<CategoryDto> createCategory(@Valid @RequestBody CategoryDto dto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(categoryService.createCategory(dto));
    }

    @PutMapping("/api/admin/categories/{id}")
    public ResponseEntity<CategoryDto> updateCategory(@PathVariable Long id,
                                                       @Valid @RequestBody CategoryDto dto) {
        return ResponseEntity.ok(categoryService.updateCategory(id, dto));
    }

    @DeleteMapping("/api/admin/categories/{id}")
    public ResponseEntity<Void> deleteCategory(@PathVariable Long id) {
        categoryService.deleteCategory(id);
        return ResponseEntity.noContent().build();
    }
}
