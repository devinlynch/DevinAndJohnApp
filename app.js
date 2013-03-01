
/**
 * Module dependencies.
 */

var express = require('express')
  , routes = require('./routes')
  , user = require('./routes/user')
  , info = require('./routes/info')
  , http = require('http')
  , path = require('path')
  , db = require("./totallyLegitDB");

var app = express();

app.configure(function(){
  app.set('port', process.env.PORT || 4004);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.cookieParser());
  app.use(express.session({ secret: 'keyboard cat'}));
  app.use(app.router);
  app.use(require('stylus').middleware(__dirname + '/public'));
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

app.get('/', function(req, res, next){
    if(req.session.username){
        res.redirect("/users");
    }else{
        routes.index(req, res, next);
    }
});
app.get('/users', db.isAuthenticated, user.list);

app.get('/info', db.isAuthenticated, info.list);

app.post("/login", function(req,res){
    db.login(req, req.body.username);
    res.redirect("/users");
});

app.post("/update", function(req,res){
    db.information(req, req.body.usernameIn, req.body.nameIn, req.body.addressIn, req.body.emailIn, req.body.invisibleIn);
    res.redirect("/info");
});
app.post("/logout", function(req,res){
    db.logout(req);
    res.redirect("/");
});

http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});


