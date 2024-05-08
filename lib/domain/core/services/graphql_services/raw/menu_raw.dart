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
}
