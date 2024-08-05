const express = require("express");
const mysql = require("mysql2/promise");
let db = null;
const app = express();
app.use(express.json());

app.post('/login_', async (req, res) => {
  const username = req.body.username;
  const password = req.body.password;

  console.log(username);
  console.log(password);


  const [rows] = await db.query("SELECT * FROM t_user where username=? and password=?", [username, password]);

  if (rows == '') {
    console.log(rows);
    console.log('Login Fail...');
    res.json({ ResponseFromNodeJsToFlutter: "Response from NodeJs... Login Fail..." });
  }
  else if (rows != '') {
    console.log(rows);
    console.log('Login Success...');
    res.json({ ResponseFromNodeJToFlutter: "Login Success" });
  }
});

async function main() {
  db = await mysql.createConnection({
    host: "localhost",
    port: "3306",
    user: "xxxxxx",
    password: "xxxxxx",
    database: "xxxxxx",
    timezone: "+00:00",
    charset: "utf8mb4_general_ci",
  });

  app.listen(8080, () => {
    console.log('Server is Running...');
  });
}
main();
