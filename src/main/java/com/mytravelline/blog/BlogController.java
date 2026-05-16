package com.mytravelline.blog;

import com.mytravelline.common.PageResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class BlogController {

    private final BlogService blogService;

    // ===== Public endpoints =====

    @GetMapping("/api/blog")
    public ResponseEntity<PageResponse<BlogPostDto>> getPublishedPosts(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        return ResponseEntity.ok(blogService.getPublishedPosts(page, size));
    }

    @GetMapping("/api/blog/{slug}")
    public ResponseEntity<BlogPostDto> getPostBySlug(@PathVariable String slug) {
        return ResponseEntity.ok(blogService.getPostBySlug(slug));
    }

    // ===== Admin endpoints =====

    @GetMapping("/api/admin/blog")
    public ResponseEntity<PageResponse<BlogPostDto>> getAllPosts(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return ResponseEntity.ok(blogService.getAllPosts(page, size));
    }

    @GetMapping("/api/admin/blog/{id}")
    public ResponseEntity<BlogPostDto> getPostById(@PathVariable Long id) {
        return ResponseEntity.ok(blogService.getPostById(id));
    }

    @PostMapping("/api/admin/blog")
    public ResponseEntity<BlogPostDto> createPost(@Valid @RequestBody CreateBlogPostRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(blogService.createPost(request));
    }

    @PutMapping("/api/admin/blog/{id}")
    public ResponseEntity<BlogPostDto> updatePost(@PathVariable Long id, @Valid @RequestBody CreateBlogPostRequest request) {
        return ResponseEntity.ok(blogService.updatePost(id, request));
    }

    @DeleteMapping("/api/admin/blog/{id}")
    public ResponseEntity<Void> deletePost(@PathVariable Long id) {
        blogService.deletePost(id);
        return ResponseEntity.noContent().build();
    }
}
