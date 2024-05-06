const String getMenuItemsQuery = """
query{
  getMenuItems{
    id: ID
    title: String
    description: String
    category: String
    price: Float
  }
}

""";

const String getMenuItemByIdQuery = """
query (\$id: Int){
    getMenuItemById(id: \$id) {
      id: ID
      title: String
      description: String
      category: String
      price: Float
    }
  }

""";
//  here id is in variable so we are passing id to filer user

const addMenuItemMutation = """
mutation(\$title: String, \$description: String, \$category: String, \$price: Float) {
    addMenuItem (title: \$title, description: \$description, category: \$category, price: \$price)
  }
""";
//  here name,email, job_title, is called variable, , in simple terms - these are parameters , 

// this is mutation type of call , mutation is use to make change , like query is use to simply get data

const updateMenuItemMutation = """
mutation(\$id: Int, \$title: String, \$description: String, \$category: String, \$price: Float) {
    updateMenuItem (id: \$id, title: \$title, description: \$description, category: \$category, price: \$price)
  }
""";
//  here we are also passing id to update this user
const deleteMenuItemMutation = """
mutation(\$id: Int) {
    deleteMenuItem(id: \$id)
  }

""";

//  it's simple mutation string  with id 
