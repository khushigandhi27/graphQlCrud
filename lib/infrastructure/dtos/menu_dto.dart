// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'menu_dto.freezed.dart';
part 'menu_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class MenuDto with _$MenuDto {
  factory MenuDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'price') required int price,
  }) = _MenuDto;

  factory MenuDto.fromJson(Map<String, dynamic> json) =>
      _$MenuDtoFromJson(json);
}
