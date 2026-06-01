package com.mytravelline.storage;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping("/api/admin/uploads")
@RequiredArgsConstructor
public class StorageController {

    private final S3StorageService s3StorageService;

    @PostMapping
    public ResponseEntity<Map<String, String>> uploadFile(
            @RequestParam("file") MultipartFile file,
            @RequestParam(value = "folder", defaultValue = "uploads") String folder) {

        String key = s3StorageService.uploadFile(file, folder);
        String url = s3StorageService.getImageUrl(key);

        return ResponseEntity.ok(Map.of(
                "key", key,
                "url", url
        ));
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteFile(@RequestParam("key") String key) {
        s3StorageService.deleteFile(key);
        return ResponseEntity.noContent().build();
    }
}
