var keystone = require('keystone');

var i18next = require('i18next');

exports = module.exports = function(req, res) {

  var view = new keystone.View(req, res);
  var locals = res.locals;

  // Set locals
  locals.section = 'documents';

	// Load the posts
	view.on('init', function(next) {
		var q = keystone.list('Document').paginate({
				page: req.query.page || 1,
				perPage: 9,
				maxPages: 10
			});

		q.exec(function(err, results) {
			locals.documents = results;
			next(err);
		});
	});

	i18next.setDefaultNamespace('index');
	i18next.loadNamespaces('index', function(err, t) {
		view.render('documents');
	});
};
