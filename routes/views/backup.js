var keystone = require('keystone');
var mongoBackup = require('mongodb-backup');

exports = module.exports = function(req, res, next) {

	var view = new keystone.View(req, res);

	view.on('init', function(next) {
		mongoBackup({
			uri: keystone.get('mongo'),
			stream: res, // send stream into client response
		});
	});
	
	// Render the view
	view.render(function (err, req, res) {
		next();
	});

};