var keystone = require('keystone');

exports = module.exports = function(req, res) {
  
  var view = new keystone.View(req, res);
  var locals = res.locals;
	
  // Set locals
  locals.section = 'documents';
	
	// view.query('documents', keystone.list('Document').model.find());

	// Load the posts
	view.on('init', function(next) {
		var q = keystone.list('Document').paginate({
			page: req.query.page || 1,
			perPage: 9,
			maxPages: 10
			// filters: {
			// 	'state': 'published',
			// 	'language': req.language
			// }
		});

		q.exec(function(err, results) {
			locals.documents = results;
			next(err);
		});

	});
	
	
  view.render('documents');
};
