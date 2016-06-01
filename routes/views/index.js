var keystone = require('keystone');

var i18next = require('i18next');
var path = require('path');
var News = keystone.list('News');

exports = module.exports = function(req, res) {
	var view = new keystone.View(req, res);
	var locals = res.locals;

	// load recent posts for displaying them on the homepage
	view.on('init', function(next) {
		Post.model.find()
			.where('state', 'published')
			.where('language', req.language)
			.limit(4)
			.sort('-publishedDate')
			.exec(function(err, posts) {
				locals.recentPosts = posts;
				next();
			});
			
	});

	i18next.setDefaultNamespace('index');
	i18next.loadNamespaces('index', function(err, t) {
		// locals.section is used to set the currently selected
		// item in the header navigation.
		locals.section = 'home';

		News.model.find().sort('-publishedDate').exec(function(err, news) {
			locals.news = news;
			view.render('index');
		});
	});
};
