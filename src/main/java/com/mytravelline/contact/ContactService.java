package com.mytravelline.contact;

import com.mytravelline.common.PageResponse;
import com.mytravelline.common.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ContactService {

    private final ContactMessageRepository contactMessageRepository;

    @Transactional
    public ContactMessageDto createMessage(CreateContactRequest request) {
        ContactMessage message = ContactMessage.builder()
                .name(request.getName())
                .email(request.getEmail())
                .subject(request.getSubject())
                .message(request.getMessage())
                .read(false)
                .build();

        message = contactMessageRepository.save(message);
        log.info("New contact message received: id={}, from={}", message.getId(), message.getEmail());

        return toDto(message);
    }

    public PageResponse<ContactMessageDto> getAllMessages(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<ContactMessage> messages = contactMessageRepository.findAllByOrderByCreatedAtDesc(pageable);
        return toPageResponse(messages);
    }

    public PageResponse<ContactMessageDto> getUnreadMessages(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<ContactMessage> messages = contactMessageRepository.findByReadFalseOrderByCreatedAtDesc(pageable);
        return toPageResponse(messages);
    }

    public ContactMessageDto getMessageById(Long id) {
        ContactMessage message = contactMessageRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Contact message", "id", id));
        return toDto(message);
    }

    @Transactional
    public ContactMessageDto markAsRead(Long id) {
        ContactMessage message = contactMessageRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Contact message", "id", id));
        message.setRead(true);
        message = contactMessageRepository.save(message);
        return toDto(message);
    }

    @Transactional
    public void deleteMessage(Long id) {
        if (!contactMessageRepository.existsById(id)) {
            throw new ResourceNotFoundException("Contact message", "id", id);
        }
        contactMessageRepository.deleteById(id);
    }

    public long countUnread() {
        return contactMessageRepository.countByReadFalse();
    }

    private ContactMessageDto toDto(ContactMessage message) {
        return ContactMessageDto.builder()
                .id(message.getId())
                .name(message.getName())
                .email(message.getEmail())
                .subject(message.getSubject())
                .message(message.getMessage())
                .read(message.isRead())
                .createdAt(message.getCreatedAt())
                .build();
    }

    private PageResponse<ContactMessageDto> toPageResponse(Page<ContactMessage> page) {
        List<ContactMessageDto> content = page.getContent().stream()
                .map(this::toDto)
                .toList();
        return PageResponse.of(content, page.getNumber(), page.getSize(),
                page.getTotalElements(), page.getTotalPages(), page.isLast());
    }
}
