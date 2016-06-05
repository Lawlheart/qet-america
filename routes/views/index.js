var keystone = require('keystone');

var i18next = require('i18next');
var Backend = require('i18next-node-fs-backend');
var path = require('path');


exports = module.exports = function(req, res) {
	var view = new keystone.View(req, res);
	var locals = res.locals;
	
	view.on('init', function(next) {
		// from blog
		// var q = keystone.list('Post').paginate({
		// 	page: req.query.page || 1,
		// 	perPage: 10,
		// 	maxPages: 10,
		// 	filters: {
		// 		'state': 'published'
		// 	}
		// })
		// .sort('-publishedDate')
		// .populate('author categories');
    //
		// if (locals.data.category) {
		// 	q.where('categories').in([locals.data.category]);
		// }
    //
		// q.exec(function(err, results) {
		// 	locals.data.posts = results;
			next();
		// });
	});

	// Internationalization Setup
	i18next
	.use(Backend)
	.init({
		lng: req.language,
		fallbackLng: 'en',
		ns: 'index',
		defaultNS: 'index',
		saveMissing: true,
		backend: {
			// path where resources get loaded from
			loadPath: path.resolve('./locales') + '/{{lng}}/{{ns}}.json',
			// loadPath: '/locales/{{lng}}/{{ns}}.json',

			// path to post missing resources
			addPath: path.resolve('./locales') + '/{{lng}}/{{ns}}.missing.json',

			// jsonIndent to use when storing json files
			jsonIndent: 2
		}
	}, function(err, t) {
		locals.t = t;
		
		
		// locals.section is used to set the currently selected
		// item in the header navigation.
		locals.section = 'home';

		view.render('index');
	});
};
