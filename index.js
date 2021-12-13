const express = require("express");
const mysql = require("mysql");
const ejs = require("ejs");

// Create express app
const app = express();

// Create a database connection configuration
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root123",
  database: "project",
});

// Establish connection with the DB
db.connect((err) => {
  if (err) {
    throw err;
  } else {
    console.log(`Successful connected to the database.`);
  }
});

// Initialize Body Parser Middleware to parse data sent by users in the request object
app.use(express.json());
app.use(express.urlencoded({ extended: true })); // to parse HTML form data

// Initialize ejs Middleware
app.set("view engine", "ejs");
app.use("/public", express.static(__dirname + "/public"));

// routes
app.get("/", (req, res) => {
  res.render("index");
});
app.get("/index", (req, res) => {
  res.render("index");
});
app.get("/info", (req, res) => {
  res.render("info");
});
app.get("/inventory", (req, res) => {
  res.render("inventory");
});
app.get("/results", (req, res) => {
  res.render("results");
});
app.get("/staff", (req, res) => {
    res.render("staff");
});

//read staff
app.get("/readstaff", (req, res) => {
    let sql = `SELECT * FROM project.staff`;
    db.query(sql, (err, result) => {
        if (err) {
            throw err;
        }
    res.render("readStaff", { data: result });
  });
});

//read inventory
app.get("/readinventory", (req, res) => {
    let sql = `SELECT * FROM project.inventory`;
    db.query(sql, (err, result) => {
      if (err) {
        throw err;
      }
      res.render("readInventory", { data: result });
    });
});

//read results
app.get("/readresults", (req, res) => {
    let sql = `SELECT * FROM project.results`;
    db.query(sql, (err, result) => {
        if (err) {
            throw err;
        }
    res.render("readResults", { data: result });
  });
});


//add new part
app.post("/insertinventory", (req, res) => {
    let data = { PartCost: req.body.PartCost, PartCat: req.body.PartCat, PartUse: req.body.PartUse, CarAssign: req.body.CarAssign};
    let sql = `INSERT INTO project.inventory SET ?`;
    let query = db.query(sql, data, (err, result) => {
      if (err) {
        throw err;
      }
      res.send(`Part entry was inserted to the database. Click <a href="./../readInventory">here</a> to view all parts.`);
    });
  });

//update part use
app.post("/updatepart", (req, res) => {
    let sql = `UPDATE project.inventory SET PartUse = '${req.body.PartUse}'  WHERE PartID = ${req.body.PartID}`;
    db.query(sql, (err, result) => {
      if (err) {
        throw err;
      }
      res.send(`Part entry was updated in the database. Click <a href="./readInventory">here</a> to view all parts.`);
    });
  });

//add new staff member
app.post("/insertstaff", (req, res) => {
  let data = { FName: req.body.FName, LName: req.body.LName, Email: req.body.Email, Dept: req.body.Dept};
  let sql = `INSERT INTO project.staff SET ?`;
  let query = db.query(sql, data, (err, result) => {
    if (err) {
      throw err;
    }
    res.send(`Staff entry was inserted to the database. Click <a href="./../readStaff">here</a> to view all staff.`);
  });
});

//update staff email
app.post("/updatestaff", (req, res) => {
  let sql = `UPDATE project.staff SET Email = '${req.body.staffNewEmailUpdate}'  WHERE StaffID = ${req.body.StaffID}`;
  db.query(sql, (err, result) => {
    if (err) {
      throw err;
    }
    res.send(`Staff entry was updated in the database. Click <a href="./readStaff">here</a> to view all staff.`);
  });
});

//update race results for leclerc
app.post("/updateresults16", (req, res) => {
    let sql = `UPDATE project.results SET quali16 = '${req.body.quali16}', race16 = '${req.body.race16}', points16 = '${req.body.points16}' WHERE raceID = ${req.body.raceID}`;
    db.query(sql, (err, result) => {
        if (err) {
            throw err;
        }
        res.send(`Results entry were updated in the database. Click <a href="./readResults">here</a> to view all results.`);
    });
});

//update race results for sainz
app.post("/updateresults55", (req, res) => {
    let sql = `UPDATE project.results SET quali55 = '${req.body.quali55}', race55 = '${req.body.race55}', points55 = '${req.body.points55}' WHERE raceID = ${req.body.raceID}`;
    db.query(sql, (err, result) => {
        if (err) {
            throw err;
        }
        res.send(`Results entry were updated in the database. Click <a href="./readResults">here</a> to view all results.`);
    });
});

// Setup server ports
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server is running on ${PORT}`));
