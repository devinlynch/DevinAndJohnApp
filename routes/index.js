database = require('../db')
// Gets the database object
var db = database.database();

exports.index = function(req, res){
	console.log('Test');
	
	
	
	// Performs a query for getting the first user
	db.getUsers(0, 1, 'UserID', function(theContent) {
		console.log('The user is: ', theContent[0]);
  	});
	
	// Performs a query for getting the first content
	db.getContent(0, 2, 'ContentID', function(theContent) {
		console.log('The content is: ', theContent[0]);
  	});
	
	// Performs a query for getting the first stalker
	db.getUserStalkers(1, function(theContent) {
		console.log('The stalker is: ', theContent[0]);
  	});
	
	// Performs a query for getting the first stalker
	db.getUserStalkings(2, function(theContent) {
		console.log('The stalking is: ', theContent[0]);
  	});
	
	// Performs a query for getting the likes
	db.getUserLikes(1, function(theContent) {
		console.log('The like is: ', theContent[0]);
  	});
	
	// Performs a query for getting the dislikes
	db.getUserDislikes(1, function(theContent) {
		console.log('The dislike is: ', theContent[0]);
  	});
	
	// Performs a query for getting the user info
	db.getUserInfo(1, function(theContent) {
		console.log('The userinfo is: ', theContent[0]);
  	});
	
	// Performs a query for getting the content info
	db.getUserInfo(1, function(theContent) {
		console.log('The content info is: ', theContent[0]);
  	});
	
	// Performs a query for getting the categories
	db.getCategories(function(theContent) {
		console.log('The category info is: ', theContent[0]);
  	});
	

	
	res.render('index', { title: 'Hello' });
};