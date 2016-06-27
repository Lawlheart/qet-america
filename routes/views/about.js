var keystone = require('keystone');

exports = module.exports = function(req, res) {

	var view = new keystone.View(req, res);
	var locals = res.locals;

	// Set locals
	locals.section = 'about';

	view.query('users', keystone.list('User').model.find());

	view.render('about');
};
