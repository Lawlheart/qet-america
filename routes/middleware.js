/**
 * This file contains the common middleware used by your routes.
 *
 * Extend or replace these functions as your application requires.
 *
 * This structure is not enforced, and just a starting point. If
 * you have more middleware you may want to group it as separate
 * modules in your project's /lib directory.
 */

var _ = require('underscore');

var i18next = require('i18next');
var Backend = require('i18next-node-fs-backend');
var path = require('path');

/**
	Initialises the standard view locals

	The included layout depends on the navLinks array to generate
	the navigation in the header, you may wish to change this array
	or replace it with your own templates / logic.
*/

exports.initLocals = function(req, res, next) {

	var locals = res.locals;

	locals.navLinks = [
		{ label: 'QET America',		key: 'home',		href: '/' },
		{ label: 'Blog',					key: 'blog',		href: '/blog' },
		{ label: 'Gallery',				key: 'gallery',	href: '/gallery' },
		// { label: 'Contact',				key: 'contact',	href: '/contact' },
		{ label: 'Donate', 				key: 'donate', 	href: '/donate'}
	];

	locals.user = req.user;

	next();

};


/**
	Fetches and clears the flashMessages before a view is rendered
*/

exports.flashMessages = function(req, res, next) {

	var flashMessages = {
		info: req.flash('info'),
		success: req.flash('success'),
		warning: req.flash('warning'),
		error: req.flash('error')
	};

	res.locals.messages = _.any(flashMessages, function(msgs) { return msgs.length; }) ? flashMessages : false;

	next();

};


/**
	Prevents people from accessing protected pages when they're not signed in
 */

exports.requireUser = function(req, res, next) {

	if (!req.user) {
		req.flash('error', 'Please sign in to access this page.');
		res.redirect('/keystone/signin');
	} else {
		next();
	}

};

// Adds static multilanguage feature
exports.i18n = function (req, res, next) {
	var baseDir = path.resolve('./locales');
	i18next
	.use(Backend)
	.init({
		lng: req.language,
		fallbackLng: 'en',
		saveMissing: true,
		backend: {
			// path where resources get loaded from
			loadPath: baseDir + '/{{lng}}/{{ns}}.json',

			// path to post missing resources
			addPath: baseDir + '/{{lng}}/{{ns}}.missing.json',

			// jsonIndent to use when storing json files
			jsonIndent: 2
		}
	}, function(err, t) {
		res.locals.t = t;
		next();
	});

}
