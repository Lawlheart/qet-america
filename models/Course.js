var keystone = require('keystone');
var Types = keystone.Field.Types;

/**
 * Course Model
 * ============
 */

var Course = new keystone.List('Course', {
	map: {name: 'title'},
	state: { type: Types.Select, options: 'draft, published, archived', default: 'draft', index: true },
	description: { type: Types.Html, wysiwyg: true, height: 400 },
	autokey: {path: 'slug', from: 'title', unique: true}
});

Course.add({
	title: { type: String, required: true },
	steps: { type: Types.Relationship, ref: 'Step', label: 'Steps', many: true}
});

Course.register();
