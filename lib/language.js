// This middleware is included in the upcomming keystone 0.4, we added it here
// for use with version 0.3, for stability reasons.
// It should be safe to delete this file when upgrading to 0.4
// see https://github.com/keystonejs/keystone/pull/2096/files

var requestLanguage = require('express-request-language');
var assign = require('lodash/object/assign');

module.exports = function (keystone) {
	var languageOptions = assign({
		'supported languages': ['en-US'],
		'language cookie': 'language',
		'language cookie options': {},
		'language select url': '/languages/{language}'
	}, keystone.get('language options'));

	return requestLanguage({
		languages: languageOptions['supported languages'],
		cookie: {
			name: languageOptions['language cookie'],
			url: languageOptions['language select url']
		},
		queryName: languageOptions['language query name']
	});
};
