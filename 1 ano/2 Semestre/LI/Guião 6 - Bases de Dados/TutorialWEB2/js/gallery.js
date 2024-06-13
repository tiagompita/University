$(document).ready(
	function(){
		imageslist("all");
    });

function imageslist(id) {
	var author;
	if (id == "all") author = "all";
	else {
			author = $("#authorImg").val();
			if (author == "") author = "all";
	}
	$.get("/list",
		{ id : author },
		function(response){

			showimages(response);
		});
}

function showimages(response) {
    console.log(response)
    // response.images is the list of dictionaries with the images information
    $("#showimages").html("");
    for (let image of response.images) {
        console.log(image)
        // html code for print the image information
        var imageHTML = document.createElement("img");
        imageHTML.style.width = "550px";
        imageHTML.style.height = "450px";
        imageHTML.src = location.origin + "/" + image.path;
        imageHTML.alt = image.name;

        // Add click event to the image
        imageHTML.onclick = function() {
            showimagecomments(image.id);
        };

        var imageINFO = document.createElement("div");
        var imageTEXT = document.createElement("p");
        
        $(imageTEXT).html(`<span class="red">Image</span> ${image.id} <span class="red">Name</span> ${image.name} <span class="red">Author</span> ${image.author} <span class="red">Upload</span> ${image.datetime}`);

        $(imageINFO).append(imageTEXT, imageHTML);
        $("#showimages").append(imageINFO);
        // html code for showing the image and allow to click on it and invoke function showimagecomments
    }
}

function showimagecomments(id) {
    window.open("../html/image.html?id=" + id, '_blank');
}
