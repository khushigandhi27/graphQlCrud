import 'package:app/domain/core/services/graphql_services/raw/menu_raw.dart';
import 'package:app/domain/menu/menu_repository.dart';
import 'package:app/infrastructure/dtos/menu_dto.dart';
import 'package:dartz/dartz.dart';

import '../../domain/core/services/graphql_services/graphql_service.dart';

class IMenuRepository extends MenuRepository {
  final GraphQLService graphQLService;

  IMenuRepository({required this.graphQLService});

  @override
  Future<List<MenuDto>> getMenuItems() async {
    try {
      List<MenuDto> lsOfMenuItems = [];
      final response = await graphQLService.performQuery(
        MenuRaw.getMenuItems,
        variables: {},
      );

      if (response.hasException) {
        throw Exception(response.exception);
      }

      final resData = response.data!;

      List<dynamic> menuItems = resData['getMenuItems'];

      if (menuItems.isEmpty) {
        return [];
      }

      for (var item in menuItems) {
        lsOfMenuItems.add(MenuDto.fromJson(item));
      }

      return lsOfMenuItems;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Either<String, MenuDto>> getMenuItemById({required String id}) async {
    try {
      final response = await graphQLService.performQuery(
        MenuRaw.getMenuItemById,
        variables: {'getMenuItemByIdId': id},
      );

      if (response.hasException) {
        throw Exception(response.exception);
      }

      final resData = response.data!;

      final menuData = MenuDto.fromJson(resData['getMenuItemById']);

      return right(menuData);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<bool> addMenuItem({required Map<String, dynamic> data}) async {
    bool isAdded = false;
    try {
      final response = await graphQLService.performMutation(
        MenuRaw.addMenuItem,
        variables: {'input': data},
      );

      if (response.hasException) {
        throw Exception(response.exception);
      }

    if (response.data != null) {
        isAdded = true;
      }
      
      return isAdded;
    } catch (e) {
      return isAdded;
    }
  }

  @override
  Future<bool> deleteMenuItem({required String menuId}) async {
    bool isRemoved = false;
    try {
      final response = await graphQLService.performMutation(
        MenuRaw.deleteMenuItem,
        variables: {'deleteMenuItemId': menuId},
      );

      if (response.hasException) {
        throw Exception(response.exception);
      }

      if (response.data != null) {
        isRemoved = true;
      }

      return isRemoved;
    } catch (e) {
      return isRemoved;
    }
  }

  @override
  Future<bool> updateMenuItem(
      {required String menuId,
      required Map<String, dynamic> updateData}) async {
    bool isUpdated = false;
    try {
      final response = await graphQLService.performMutation(
        MenuRaw.updateMenuItem,
        variables: {
          'input': updateData,
          'updateMenuItemId': menuId,
        },
      );

      if (response.hasException) {
        throw Exception(response.exception);
      }

      if (response.data != null) {
        isUpdated = true;
      }

      return isUpdated;
    } catch (e) {
      return isUpdated;
    }
  }
}
