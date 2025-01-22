const express = require('express');
const app = express();
const path = require('path');

const cors = require('cors');
app.use(cors());

const mysql = require('mysql');

const params = {
    host: "localhost",
    user: "root",
    password: "",
    database: "pit_projekat_drugi"
}

const connection = mysql.createConnection(params);
connection.connect((err) => {
  if(err) throw err;
  console.log("konektovani ste na bazu...");
});

app.use(express.static(path.join(__dirname, '..', 'klijent', 'public')));

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname, '..', 'klijent', 'index.html'));
});

app.get('/korisnici', function(req, res) {
  res.sendFile(path.join(__dirname, '..', 'klijent', 'html', 'korisnici.html'));
});

app.get('/nastavni_kadar', function(req, res) {
  res.sendFile(path.join(__dirname, '..', 'klijent', 'html', 'nastavni_kadar.html'));
});



app.get("/kucni_red_skole", (req, res)=>{
  let sql = 'select * from kucni_red_skole';
  connection.query(sql, (err, result)=>{
    if(err) throw err;
    res.send(result);
  });
});

app.get("/users", (req, res)=>{
  let sql = 'select * from users';
  connection.query(sql, (err, result)=>{
    if(err) throw err;
    res.send(result);
  });
});



const port = 9000;
app.listen(port, ()=>{
  console.log("server je pokrenut i radi...");
});
