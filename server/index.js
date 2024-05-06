const express = require("express");
const graphqlHTTP = require("express-graphql");
const { buildSchema } = require("graphql");
const mysql = require("mysql");
const cors = require("cors");

const app = express();
app.use(cors());

const schema = buildSchema(`
type MenuItem {
  id: ID
  title: String
  description: String
  category: String
  price: Float
}

type Query {
  getMenuItems: [MenuItem!]!
  getMenuItemById(id: ID!): MenuItem!
}

type Mutation {
  addMenuItem(input: MenuItemInput!): MenuItem!
  updateMenuItem(id: ID!, input: MenuItemInput!): MenuItem!
  deleteMenuItem(id: ID!): String!
}

input MenuItemInput {
  title: String!
  description: String!
  category: String!
  price: Float!
}

`);

const queryDB = (req, sql, args) =>
  new Promise((resolve, reject) => {
    req.mysqlDb.query(sql, args, (err, rows) => {
      if (err) return reject(err);
      rows.changedRows || rows.affectedRows || rows.insertId
        ? resolve(true)
        : resolve(rows);
    });
  });

const root = {
  getMenuItems: (args, req) =>
    queryDB(req, "select * from menu").then(
      (data) => data
    ),
  getMenuItemById: (args, req) =>
    queryDB(req, "select * from menu where id = ?", [args.id]).then(
      (data) => data[0]
    ),
  updateMenuItem: (args, req) =>
    queryDB(req, "update menu SET ? where id = ?", [args, args.id]).then(
      (data) => data
    ),
  addMenuItem: (args, req) =>
    queryDB(req, "insert into menu SET ?", args).then(
      (data) => data
    ),
  deleteMenuItem: (args, req) =>
    queryDB(req, "delete from menu where id = ?", [args.id]).then(
      (data) => data
    ),
};

// don't forget to create data base name userapp and table users with id, name,email, job_title
app.use((req, res, next) => {
  req.mysqlDb = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "userapp",
  });
  req.mysqlDb.connect();
  next();
});

app.use(
  "/graphql",
  graphqlHTTP({
    schema: schema,
    rootValue: root,
    graphiql: true,
  })
);

app.listen(4000);

console.log("Running a GraphQL API server at localhost:4000/graphql");
