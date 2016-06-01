// Simulate config options from your production environment by
// customising the .env file in your project's root folder.
require('dotenv').config({ silent: true });

// Initialise New Relic if an app name and license key exists
if (process.env.NEW_RELIC_APP_NAME && process.env.NEW_RELIC_LICENSE_KEY) {
	require('newrelic');
}

// Require language middleware and express to implement i18n
// This should not be necessary after upgrading to keystone 0.4
var language = require('./lib/language');
var cookieParser = require('cookie-parser');
var express = require('express');
var app = express();

// Require keystone
var keystone = require('keystone');
var swig = require('swig');

// Disable swig's bulit-in template caching, express handles it
swig.setDefaults({ cache: false });

// Initialise Keystone with your project's configuration.
// See http://keystonejs.com/guide/config for available options
// and documentation.

keystone.init({

	'name': 'QET America',
	'brand': 'QET America',

	'sass': 'public',
	'static': 'public',
	'favicon': 'public/favicon.ico',
	'views': 'templates/views',
	'view engine': 'swig',

	'custom engine': swig.renderFile,

	'emails': 'templates/emails',

	'mongo': process.env.MONGODB_URI || 'mongodb://localhost/qet-america',

	'auto update': true,
	'session': true,
	'session store': 'mongo',
	'auth': true,
	'user model': 'User',
	'cookie secret': process.env.COOKIE_SECRET || 'QET23095jwif',
	'mandrill api key': process.env.MANDRILL_KEY,
	'cloudinary url' : process.env.CLOUDINARY_URL,
	'language options': {
		'supported languages': ['en', 'es']
	}

});

// Set language preferences using the backported middleware
// We also need cookieParser
app.use(cookieParser(keystone.get('cookie secret')));
var languageOptions = keystone.get('language options') || {};
if (!languageOptions.disable) {
	app.use(language(keystone));
}
keystone.set('app', app);

// Set up Amazon S3
keystone.set('s3 config', { 
	bucket: process.env.S3_BUCKET_NAME, 
	key: process.env.AWS_ACCESS_KEY_ID, 
	secret: process.env.AWS_SECRET_ACCESS_KEY 
});

keystone.set('embedly api key', process.env.EMBEDLY_API_KEY);

// Load your project's Models
keystone.import('models');

// Setup common locals for your templates. The following are required for the
// bundled templates and layouts. Any runtime locals (that should be set uniquely
// for each request) should be added to ./routes/middleware.js

keystone.set('locals', {
	_: require('underscore'),
	env: keystone.get('env'),
	utils: keystone.utils,
	editable: keystone.content.editable
});

// Load your project's Routes
keystone.set('routes', require('./routes'));


// Setup common locals for your emails. The following are required by Keystone's
// default email templates, you may remove them if you're using your own.

keystone.set('email locals', {
	logo_src: '/images/logo-email.gif',
	logo_width: 194,
	logo_height: 76,
	theme: {
		email_bg: '#f9f9f9',
		link_color: '#2697de',
		buttons: {
			color: '#fff',
			background_color: '#2697de',
			border_color: '#1a7cb7'
		}
	}
});

// Setup replacement rules for emails, to automate the handling of differences
// between development a production.

// Be sure to update this rule to include your site's actual domain, and add
// other rules your email templates require.

// keystone.set('email rules', [{
// 	find: '/images/',
// 	replace: (process.env.NODE_ENV == 'production') ? 'http://www.your-server.com/images/' : 'http://localhost:3000/images/'
// }, {
// 	find: '/keystone/',
// 	replace: (process.env.NODE_ENV == 'production') ? 'http://www.your-server.com/keystone/' : 'http://localhost:3000/keystone/'
// }]);

// Load your project's email test routes

keystone.set('email tests', require('./routes/emails'));

// Configure the navigation bar in Keystone's Admin UI

keystone.set('nav', {
	'posts': ['posts', 'post-categories'],
	'galleries': 'galleries',
	'enquiries': 'enquiries',
	'users': 'users'
});

// Start Keystone to connect to your database and initialise the web server

keystone.start();
