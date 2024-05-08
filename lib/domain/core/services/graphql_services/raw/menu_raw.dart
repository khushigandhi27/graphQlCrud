class MenuRaw {
  static const String getMenuItems = r'''
      query getMenuItems {
        getMenuItems {
          category
          description
          id
          price
          title
        }
      }
''';

  static const String getMenuItemById = r'''
    query getMenuItemById($getMenuItemByIdId: ID!) {
      getMenuItemById(id: $getMenuItemByIdId) {
        category
        description
        id
        price
        title
      }
    }
''';

  static const String addMenuItem = r'''
    mutation AddMenuItem($input: MenuItemInput!) {
      addMenuItem(input: $input) {
      category,
      description,
      id,
      price,
      title 
      }
    }
''';

  static const String updateMenuItem = r'''
      mutation UpdateMenuItem($updateMenuItemId: ID!, $input: MenuItemInput!) {
        updateMenuItem(id: $updateMenuItemId, input: $input) {
        category,
        description,
        id,
        price,
        title
        }
      }
''';

  static const String deleteMenuItem = r'''
    mutation DeleteMenuItem($deleteMenuItemId: ID!) {
      deleteMenuItem(id: $deleteMenuItemId)
    }
''';
}
