package com.mytravelline.contact;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ContactMessageDto {

    private Long id;
    private String name;
    private String email;
    private String subject;
    private String message;
    private boolean read;
    private LocalDateTime createdAt;
}
