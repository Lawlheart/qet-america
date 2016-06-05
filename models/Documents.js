var keystone = require('keystone');
var Types = keystone.Field.Types;

/*
*  Document Model
*  ============
*
*/

var Document = new keystone.List('Document', {
	map: {name: 'title'},
	autokey: {path: 'slug', from: 'title', unique: true}
});

Document.add({
	title: { type: String, required: true },
	document: { type: Types.S3File, label: 'File' }
});

Document.register();
