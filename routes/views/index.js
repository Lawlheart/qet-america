var keystone = require('keystone');

var i18next = require('i18next');
var Backend = require('i18next-node-fs-backend');
var path = require('path');


exports = module.exports = function(req, res) {
	var view = new keystone.View(req, res);
	var locals = res.locals;

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
