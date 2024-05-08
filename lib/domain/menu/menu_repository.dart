import '../../infrastructure/dtos/menu_dto.dart';
import 'package:dartz/dartz.dart';

abstract class MenuRepository {
  Future<List<MenuDto>> getMenuItems();

  Future<Either<String, MenuDto>> getMenuItemById({required String id});
  
  Future<bool> addMenuItem({
    required Map<String, dynamic> data,
  });

  Future<bool> updateMenuItem({
    required String menuId,
    required Map<String, dynamic> updateData,
  });

  Future<bool> deleteMenuItem({
    required String menuId,
  });
}
