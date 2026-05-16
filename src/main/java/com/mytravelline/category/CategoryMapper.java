package com.mytravelline.category;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;

import java.util.List;

@Mapper(componentModel = "spring")
public interface CategoryMapper {

    CategoryDto toDto(Category category);

    List<CategoryDto> toDtoList(List<Category> categories);

    Category toEntity(CategoryDto dto);

    void updateEntity(CategoryDto dto, @MappingTarget Category category);
}
