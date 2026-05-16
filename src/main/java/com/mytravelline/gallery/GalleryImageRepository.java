package com.mytravelline.gallery;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GalleryImageRepository extends JpaRepository<GalleryImage, Long> {

    Page<GalleryImage> findAllByOrderBySortOrderAsc(Pageable pageable);

    List<GalleryImage> findByDestinationIdOrderBySortOrderAsc(Long destinationId);
}
