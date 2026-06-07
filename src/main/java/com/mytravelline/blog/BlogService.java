package com.mytravelline.blog;

import com.mytravelline.common.RequestLocaleResolver;
import com.mytravelline.common.PageResponse;
import com.mytravelline.common.exception.BadRequestException;
import com.mytravelline.common.exception.ResourceNotFoundException;
import com.mytravelline.translation.LocaleCode;
import com.mytravelline.translation.TranslationService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class BlogService {

    private static final String ENTITY_TYPE = "blog";

    private final BlogPostRepository blogPostRepository;
    private final TranslationService translationService;
    private final RequestLocaleResolver localeResolver;

    // ===== Public methods =====

    public PageResponse<BlogPostDto> getPublishedPosts(int page, int size, HttpServletRequest request) {
        Pageable pageable = PageRequest.of(page, size);
        Page<BlogPost> posts = blogPostRepository.findByPublishedTrueOrderByPublishedAtDesc(pageable);
        LocaleCode locale = localeResolver.resolve(request);
        List<BlogPostDto> content = posts.getContent().stream()
                .map(p -> overlayTranslations(toDto(p), p.getId(), locale))
                .toList();
        return PageResponse.of(content, posts.getNumber(), posts.getSize(),
                posts.getTotalElements(), posts.getTotalPages(), posts.isLast());
    }

    public BlogPostDto getPostBySlug(String slug, HttpServletRequest request) {
        BlogPost post = blogPostRepository.findBySlug(slug)
                .orElseThrow(() -> new ResourceNotFoundException("Blog post", "slug", slug));
        LocaleCode locale = localeResolver.resolve(request);
        return overlayTranslations(toDto(post), post.getId(), locale);
    }

    // ===== Admin methods =====

    public PageResponse<BlogPostDto> getAllPosts(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<BlogPost> posts = blogPostRepository.findAllByOrderByCreatedAtDesc(pageable);
        return toPageResponse(posts);
    }

    public BlogPostDto getPostById(Long id) {
        BlogPost post = blogPostRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Blog post", "id", id));
        return toDto(post);
    }

    public Map<String, Map<String, String>> getPostTranslations(Long id) {
        if (!blogPostRepository.existsById(id)) {
            throw new ResourceNotFoundException("Blog post", "id", id);
        }
        return translationService.getAll(ENTITY_TYPE, id);
    }

    @Transactional
    public void savePostTranslations(Long id, Map<String, Map<String, String>> translations) {
        if (!blogPostRepository.existsById(id)) {
            throw new ResourceNotFoundException("Blog post", "id", id);
        }
        translationService.saveAll(ENTITY_TYPE, id, translations);
    }

    @Transactional
    public BlogPostDto createPost(CreateBlogPostRequest request) {
        if (blogPostRepository.existsBySlug(request.getSlug())) {
            throw new BadRequestException("Blog post with slug '" + request.getSlug() + "' already exists");
        }

        BlogPost post = BlogPost.builder()
                .title(request.getTitle())
                .slug(request.getSlug())
                .summary(request.getSummary())
                .content(request.getContent())
                .coverImage(request.getCoverImage())
                .author(request.getAuthor())
                .tags(request.getTags())
                .published(request.isPublished())
                .publishedAt(request.isPublished() ? LocalDateTime.now() : null)
                .build();

        post = blogPostRepository.save(post);
        log.info("Blog post created: id={}, slug={}", post.getId(), post.getSlug());
        return toDto(post);
    }

    @Transactional
    public BlogPostDto updatePost(Long id, CreateBlogPostRequest request) {
        BlogPost post = blogPostRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Blog post", "id", id));

        post.setTitle(request.getTitle());
        post.setSlug(request.getSlug());
        post.setSummary(request.getSummary());
        post.setContent(request.getContent());
        post.setCoverImage(request.getCoverImage());
        post.setAuthor(request.getAuthor());
        post.setTags(request.getTags());

        if (request.isPublished() && !post.isPublished()) {
            post.setPublishedAt(LocalDateTime.now());
        }
        post.setPublished(request.isPublished());

        post = blogPostRepository.save(post);
        return toDto(post);
    }

    @Transactional
    public void deletePost(Long id) {
        if (!blogPostRepository.existsById(id)) {
            throw new ResourceNotFoundException("Blog post", "id", id);
        }
        translationService.deleteAll(ENTITY_TYPE, id);
        blogPostRepository.deleteById(id);
    }

    private BlogPostDto toDto(BlogPost post) {
        return BlogPostDto.builder()
                .id(post.getId())
                .slug(post.getSlug())
                .title(post.getTitle())
                .summary(post.getSummary())
                .content(post.getContent())
                .coverImage(post.getCoverImage())
                .author(post.getAuthor())
                .tags(post.getTags())
                .published(post.isPublished())
                .publishedAt(post.getPublishedAt())
                .createdAt(post.getCreatedAt())
                .build();
    }

    private BlogPostDto overlayTranslations(BlogPostDto dto, Long id, LocaleCode locale) {
        if (locale == LocaleCode.EN) return dto;
        String title = translationService.get(ENTITY_TYPE, id, "title", locale);
        String content = translationService.get(ENTITY_TYPE, id, "content", locale);
        String excerpt = translationService.get(ENTITY_TYPE, id, "excerpt", locale);
        if (title != null) dto.setTitle(title);
        if (content != null) dto.setContent(content);
        if (excerpt != null) dto.setSummary(excerpt);
        return dto;
    }

    private PageResponse<BlogPostDto> toPageResponse(Page<BlogPost> page) {
        List<BlogPostDto> content = page.getContent().stream()
                .map(this::toDto)
                .toList();
        return PageResponse.of(content, page.getNumber(), page.getSize(),
                page.getTotalElements(), page.getTotalPages(), page.isLast());
    }
}
