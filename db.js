// A function which returns a database object which has numerous
// prototypes for making queries to the database. 
function getDatabase(){
	
	// Sets up database
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'pass',
	  database : 'n23n7wfhs9a99dd3',
	});
	
	connection.connect();
	
	// The database object to be returned
	var db = {};
	
	// Function which gets a specific number of users from the database
	// Takes start number, number of rows, order, and a callback
	db.getUsers = function(start, num, order, callback) {
		var query = 'SELECT * from Users ORDER BY ' + order +  ' LIMIT ' + start + ', ' + num;
		connection.query(query, function(err, rows, fields) {
		  if (err){ console.log('ERROR CONNECTING TO MYSQL'); callback(undefined); throw err;};
		  
		  callback(rows);
	
		});
	}
	
	// Function which gets a specific number of content from the database
	// Takes start number, number of rows, order, and a callback
	db.getContent = function(start, num, order, callback) {
		var query = 'SELECT * from Content ORDER BY ' + order +  ' LIMIT ' + start + ', ' + num;
		connection.query(query, function(err, rows, fields) {
		  if (err){ console.log('ERROR CONNECTING TO MYSQL'); callback(undefined); throw err;};
		  
		  callback(rows);
	
		});
	}
	
	// Function which gets the stalker IDs of a user
	db.getUserStalkers = function(userID, callback) {
		var query = 'SELECT * from Stalkings WHERE StalkingID=' + userID;
		connection.query(query, function(err, rows, fields) {
		  if (err){ console.log('ERROR CONNECTING TO MYSQL'); callback(undefined); throw err;};
		  
		  callback(rows);
	
		});
	}
	
	// Function which gets the stalking IDs of a user
	db.getUserStalkings = function(userID, callback) {
		var query = 'SELECT * from Stalkings WHERE StalkerID=' + userID;
		connection.query(query, function(err, rows, fields) {
		  if (err){ console.log('ERROR CONNECTING TO MYSQL'); callback(undefined); throw err;};
		  
		  callback(rows);
	
		});
	}
	
	// Function which gets the likes of a user
	db.getUserLikes = function(userID, callback) {
		var query = 'SELECT * from Likes WHERE IsLike=1 AND UserID=' + userID;
		connection.query(query, function(err, rows, fields) {
		  if (err){ console.log('ERROR CONNECTING TO MYSQL'); callback(undefined); throw err;};
		  
		  callback(rows);
	
		});
	}
	
	// Function which gets the dislikes of a user
	db.getUserDislikes = function(userID, callback) {
		var query = 'SELECT * from Likes WHERE IsLike=0 AND UserID=' + userID;
		connection.query(query, function(err, rows, fields) {
		  if (err){ console.log('ERROR CONNECTING TO MYSQL'); callback(undefined); throw err;};
		  
		  callback(rows);
	
		});
	}
	
	// Function which gets users info by the userID
	db.getUserInfo = function(userID, callback) {
		var query = 'SELECT * from BasicInfo WHERE UserID=' + userID + ' LIMIT 1';
		connection.query(query, function(err, rows, fields) {
		  if (err){ console.log('ERROR CONNECTING TO MYSQL'); callback(undefined); throw err;};
		  
		  callback(rows);
	
		});
	}
	
	// Function which gets content info by the contentID
	db.getUserInfo = function(contentID, callback) {
		var query = 'SELECT * from Content WHERE ContentID=' + contentID + ' LIMIT 1';
		connection.query(query, function(err, rows, fields) {
		  if (err){ console.log('ERROR CONNECTING TO MYSQL'); callback(undefined); throw err;};
		  
		  callback(rows);
	
		});
	}
	
	// Function which gets the categores
	db.getCategories = function(callback) {
		var query = 'SELECT * from Categories';
		connection.query(query, function(err, rows, fields) {
		  if (err){ console.log('ERROR CONNECTING TO MYSQL'); callback(undefined); throw err;};
		  
		  callback(rows);
	
		});
	}
	
	// Function which adds content to the database
	db.addContent = function(content) {
		connection.query('INSERT INTO Content SET ?', content, function(err, rows, fields) {
		  if (err){ console.log('ERROR CONNECTING TO MYSQL');  throw err;};
		  	
		});
	}
	
	
	
	
		
	return db;	
}

exports.database = getDatabase;