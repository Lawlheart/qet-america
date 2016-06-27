function deleteEnquiry(id) {
	$.ajax({
		url: '/enquiries/' + id,
		type: 'DELETE',
		success: function(data) {
			location.reload();
		},
		error: function(err) {
			console.log(err);
		}
	})
}
