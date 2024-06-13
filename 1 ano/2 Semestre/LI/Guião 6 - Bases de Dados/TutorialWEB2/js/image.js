var id;

$(document).ready(function () {
	const params = new URLSearchParams(window.location.search);
	id = params.get("id");
	if (id) {
		imagecomments();
	} else {
		console.error('id parameter is missing');
	}
});

function imagecomments() {
	$.get("/comments", { idimg: id }, function (response) {
		showimageandinfo(response);
	}).fail(function () {
		console.error('Failed to fetch comments');
	});
}

function showimageandinfo(response) {
	console.log(response);
	// Limpar conteúdo anterior
	$("#imageinfo").html("");
	$("#comments").html("");

	if (response.image) {
		// Adicionar a imagem
		var imageHTML = document.createElement("img");
		imageHTML.style.width = "550px";
		imageHTML.style.height = "450px";
		imageHTML.src = location.origin + "/" + response.image.path;
		imageHTML.alt = response.image.name;

		var imageINFO = document.createElement("div");
		var imageTEXT = document.createElement("p");

		$(imageTEXT).html(`<span class="red">Image</span> ${response.image.id} <span class="red">Name</span> ${response.image.name} <span class="red">Author</span> ${response.image.author} <span class="red">Upload</span> ${response.image.datetime}`);

		$(imageINFO).append(imageTEXT, imageHTML);
		$("#imageinfo").append(imageINFO);
	} else {
		console.error('Image information is missing in response');
	}

	if (response.comments) {
		// Adicionar comentários
		response.comments.forEach(function (comment) {
			var commentElement = document.createElement("div");
			var commentText = document.createElement("p");

			$(commentText).html(`<span class="red">Author:</span> ${comment.user} <span class="red">Comment:</span> ${comment.comment}`);

			$(commentElement).append(commentText);
			$("#comments").append(commentElement);
		});
	} else {
		console.error('Comments are missing in response');
	}

	if (response.votes) {
		// Adicionar votos
		$("#thumbs_up").html(response.votes.ups);
		$("#thumbs_down").html(response.votes.downs);
	} else {
		console.error('Votes are missing in response');
	}
}

function newcomment() {
	var user = document.getElementById("user").value;
	var comment = document.getElementById("comment").value;

	if (user === "" || comment === "") {
		alert("Missing comment and/or username!");
	} else {
		$.ajax({
			type: "POST",
			url: "/newcomment",
			contentType: "application/json",
			data: JSON.stringify({
				idimag: id,
				username: user,
				newcomment: comment
			}),
			success: function (response) {
				if (response.status === "success") {
					imagecomments();
				} else {
					alert(response.message);
				}
			},
			error: function (xhr, status, error) {
				console.error("Error posting new comment:", error);
				alert("Failed to post comment.");
			}
		});
	}
}

function upvote() {
	$.post("/upvote", { idimg: id }, function (response) {
		console.log("Upvote response:", response);
		if (response == "Up vote incremented" && response.votes) {
			$("#thumbs_up").html(response.votes.ups);
		} else {
			console.error("Error upvoting:", response.error);
			console.log(response);
		}
	}).fail(function () {
		console.error('Failed to upvote');
	});
}

function downvote() {
	$.post("/downvote", { idimg: id }, function (response) {
		console.log("Downvote response:", response);
		if (response == "Down vote incremented" && response.votes) {
			$("#thumbs_down").html(response.votes.downs);
		} else {
			console.error("Error downvoting:", response.error);
		}
	}).fail(function () {
		console.error('Failed to downvote');
	});
}
