package com.mytravelline.destination;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface DestinationRepository extends JpaRepository<Destination, UUID> {

    Optional<Destination> findBySlug(String slug);

    boolean existsBySlug(String slug);

    List<Destination> findByFeaturedTrue();
}
