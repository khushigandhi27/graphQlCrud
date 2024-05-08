import '../../infrastructure/dtos/menu_dto.dart';
import 'package:dartz/dartz.dart';

abstract class MenuRepository {
  Future<List<MenuDto>> getMenuItems();

  Future<Either<String, MenuDto>> getMenuItemById({required String id});
}
