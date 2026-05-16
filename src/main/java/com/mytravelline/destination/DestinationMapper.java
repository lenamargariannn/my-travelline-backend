package com.mytravelline.destination;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;

import java.util.List;

@Mapper(componentModel = "spring")
public interface DestinationMapper {

    DestinationDto toDto(Destination destination);

    List<DestinationDto> toDtoList(List<Destination> destinations);

    Destination toEntity(DestinationDto dto);

    void updateEntity(DestinationDto dto, @MappingTarget Destination destination);
}
