package com.mytravelline.admin.dto;

import com.mytravelline.admin.AdminRole;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@Builder
public class AdminUserDto {

    private Long id;
    private String email;
    private String name;
    private AdminRole role;
    private boolean active;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
