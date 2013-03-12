currentNumberOfContent = 0;
maxNumberOfContent = 1000;
currentTotalContent = 0;
var content;

function getContent(theUser, callback){
	$.post("/getContentFromUser", { startNum: 0, endNum: maxNumberOfContent, userID: theUser.UserID })
	.done(function(data) {
		currentTotalContent = data.length;
		content = data;
		callback();
	});
}
// Does the initial load for content
function loadInContent(theUser, masonryContainer){
	if(content != undefined && currentNumberOfContent != currentTotalContent)
		continueLoading(masonryContainer, theUser);
	//else
		//noMoreData(masonryContainer);
}

// Does the initial load for content for a category
function loadInContentForCategory(category, user, masonryContainer){
	if(category != undefined && user != undefined){
		//Sends post request to server to get content
		$.post("/getContentForCategory", { startNum: 0, endNum: 100, category: category.CategoryID })
		.done(function(data) {
			if(data != undefined)
		  		continueLoading(data, masonryContainer, user);
		  	else
		  		noMoreData(masonryContainer);
		});
	} else{
		noMoreData(masonryContainer);
	}
}

function continueLoading(masonryContainer, theUser){
	for(var i = currentNumberOfContent; i < currentNumberOfContent+10; i++) {
		var tempcontent = content[i];
		if(tempcontent == undefined) {currentNumberOfContent = i; break;}
		appendContent(tempcontent, masonryContainer);
		
		if(tempcontent.IsLike != null)
			displayHasLike(tempcontent.IsLike, tempcontent.ContentID, tempcontent.Ratio);
		masonryContainer.masonry('reload')
	}
	currentNumberOfContent = i;			
	masonryContainer.masonry('reload')
}

function noMoreData(masonryContainer){
	appendNoMoreDataWarning(masonryContainer);
	masonryContainer.masonry('reload')
}

function appendNoMoreDataWarning(masonryContainer){
	var theString = '<div class="item Wide centeredInDiv dislikeDiv" style="height:40px;'
	+ 'width: 500px; background-color: #903;">'
	+'Sorry, no more data.</div>';
	var $boxes = $(theString);
	masonryContainer.append( $boxes ).masonry( 'appended', $boxes );
}

function appendContent(content, masonryContainer){
	var el = document.createElement("option");
	var imageWidth;
	var imageHeight;
	if(content.Height > 0.8*content.Width){
		imageHeight = (160/content.Width) * content.Height;
		imageWidth = 160;
	} else if(content.Height > 0.5*content.Width && content.Height < 0.8*content.Width){
		imageWidth = getRandomInt(140,180);
		imageHeight = (imageWidth/content.Width) * content.Height;
	} else{
		imageWidth = getRandomInt(180,240);
		imageHeight = (imageWidth/content.Width) * content.Height;
	}

	//var imageHeight = (190/content.Width) * content.Height;
	var bottomHeight = 80;
	var contentHeight = imageHeight + bottomHeight;

	var theString = '<div class="item Wide" style="height:' + contentHeight 
		+'px; width: +' + imageWidth + ';"><img class="contentImg" width="'+ imageWidth +'" src="/public/images/' + content.FileName + '"/><br/>' 
		+ content.Title+'<br/>' + getBottom(content) + '</div>';
	var $boxes = $(theString);
	masonryContainer.append( $boxes ).masonry( 'appended', $boxes );
}

function getRandomInt (min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}


function getBottom(content){
	if(content != undefined){

		// Gets the ratio of likes to dislikes
		var likesToDislikes = content.Likes - content.Dislikes;
		var likesColorClass;
		if(likesToDislikes>0){
			likesColorClass = 'greenP';
		} else if(likesToDislikes<0){
			likesColorClass = 'redP';
		} else{
			likesColorClass = 'redP';
			likesToDislikes = 'No likes/dislikes';
		}

		returnS = '<center> <div id="likeAndDislikeDiv_' + content.ContentID +'">'
        +'<div class="centeredInDiv likeDiv" id="likeDiv_' + content.ContentID +'" name="' + content.ContentID +'">like</div>'
        +'<div class="centeredInDiv spacerDiv" id="spacerDiv_' + content.ContentID +'" name="' + content.ContentID +'"></div>'
        +'<div class="centeredInDiv dislikeDiv" id="dislikeDiv_' + content.ContentID +'" name="' + content.ContentID +'">dislike</div>'
    	+'</div></center>'
    	+'<div>'
		+'<div class="centeredInDiv haveLikedDiv" id="haveLikedDiv_' + content.ContentID +'" name="' + content.ContentID +'"></div>'
    	+'<div class="centeredInDiv likesVsDislikesDiv" id="likesVsDislikesDiv_' + content.ContentID +'" name="' + content.ContentID +'">' 
    	+'<p class="'+likesColorClass+'">' + likesToDislikes + '</p></div>'
    	+'</div>';
		
		return returnS;	
	}
	return "";	
}


// Function which handles a user liking or disliking a object
function haveLikedOrDislikedObject(res, contentNumber, user){
	if(user != undefined){
		if(res == 0){
			$("#haveLikedDiv_" + contentNumber).text("Processing...");
			$.post("/likeContent", { content: contentNumber, user: user.UserID, isLike: 1 })
				.done(function(data) {
					var numLikes = data.numberOfLikes;
					displayHasLike(1, contentNumber, numLikes);
				})
				.fail(function() { $("#haveLikedDiv_" + contentNumber).text("Error liking this object..."); });
		} else{
			$.post("/likeContent", { content: contentNumber, user: user.UserID, isLike: 0 })
				.done(function(data) {
					var numLikes = data.numberOfLikes;
					displayHasLike(0, contentNumber, numLikes);
				})
				.fail(function() { $("#haveLikedDiv_" + contentNumber).text("Error liking this object..."); });		}
	} else{
		$("#haveLikedDiv_" + contentNumber).text("Sorry, something went wrong.");
	}
};

// Updates text to display that you like or dislike a content
function displayHasLike(hasLike, contentNumber, numLikes){
	$("#likeAndDislikeDiv_" + contentNumber).fadeOut(400, function(){
		$("#haveLikedDiv_" + contentNumber).fadeIn(1000);
		$("#likesVsDislikesDiv_" + contentNumber).fadeIn(1000);
	});
	if(hasLike == 1)
		$("#haveLikedDiv_" + contentNumber).text("You like this.");
	else
		$("#haveLikedDiv_" + contentNumber).text("You dislike this.");

	$("#likesVsDislikesDiv_" + contentNumber).text(numLikes);
}