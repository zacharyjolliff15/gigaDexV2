const express = require('express');
const mysql = require('mysql2');
const app = express();
const PORT = 3000;

// MySQL connection setup
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'pokemon'
});

connection.connect((error) => {
  if (error) {
    console.error('Error connecting to MySQL database:', error);
    return;
  }
  console.log('Connected to MySQL database!');
});

// Middleware to parse JSON and urlencoded form data
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve the HTML file
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

// Endpoint to get regions from the database
app.get('/regions', (req, res) => {
  const sql = 'SELECT region_id, region_name FROM regions ORDER BY region_id ASC';

  connection.query(sql, (error, results) => {
    if (error) {
      console.error('Error fetching regions:', error);
      res.status(500).send('Error fetching regions');
      return;
    }

    res.json(results);
  });
});

app.get('/p_types', (req, res) => {
  const sql = 'SELECT type_id, type_name FROM p_types ORDER BY type_id ASC';

  connection.query(sql, (error, results) => {
    if (error) {
      console.error('Error fetching types:', error);
      res.status(500).send('Error fetching types');
      return;
    }

    res.json(results);
  });
});

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));

// This line tells Express to serve static files from the public directory.
app.use(express.static('public'));
