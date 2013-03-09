// Does the initial load for content
function loadInContent(options, masonryContainer){
	for(var i = 0; i < options.length; i++) {
		var opt = options[i];
		var el = document.createElement("option");
		var imageHeight = (190/opt.Width) * opt.Height;
		var bottomHeight = 80;
		var contentHeight = imageHeight + bottomHeight;
		console.log("Added this category to dropdown: " + contentHeight);

		var theString = '<div class="item Wide" style="height:' + contentHeight 
		+'px"><img class="contentImg" src="/public/images/' + opt.FileName + '"/><br/>' 
		+ opt.Title+'<br/>' + getBottom(opt) + '</div>';
		var $boxes = $(theString);
		masonryContainer.append( $boxes ).masonry( 'appended', $boxes );
	}			
	masonryContainer.masonry('reload')
}


function getBottom(content){
	if(content != undefined){
		returnS = '<center> <div id="likeAndDislikeDiv">'
        +'<div class="centeredInDiv" id="likeDiv" name="' + content.ContentID +'">like</div>'
        +'<div class="centeredInDiv" id="spacerDiv" name="' + content.ContentID +'"></div>'
        +'<div class="centeredInDiv" id="dislikeDiv" name="' + content.ContentID +'">dislike</div>'
    +'</div>'
	+'<div class="centeredInDiv" id="haveLikedDiv" name="' + content.ContentID +'"></div>'
    +'<div class="centeredInDiv" id="likesVsDislikesDiv" name="' + content.ContentID +'"></div>';
		
		return returnS;	
	}
	return "";	
}