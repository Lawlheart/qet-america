var keystone = require('keystone');
var Types = keystone.Field.Types;

/**
 * Page Model
 * ==========
 */

var Page = new keystone.List('Page', {
	map: { name: 'title' },
	autokey: { path: 'slug', from: 'title', unique: true }
});

Page.add({
	title: { type: String, required: true, note: 'Keep it short' },
	state: { type: Types.Select, options: 'draft, published, archived', default: 'draft', index: true },
	author: { type: Types.Relationship, ref: 'User', index: true },
	publishedDate: { type: Types.Date, index: true, dependsOn: { state: 'published' } },

	//create a dropdown with templates
	// template: { type: Types.Select, options: 'page, about, team, contact, portfolio', default: 'page'},
	image: { type: Types.CloudinaryImage },
	content: {
		type: Types.Html, wysiwyg: true, height: 400
		// brief: { type: Types.Html, wysiwyg: true, height: 150 },
		// extended: { type: Types.Html, wysiwyg: true, height: 400 }
	},
});

// Page.schema.virtual('content.full').get(function() {
// 	return this.content.extended || this.content.brief;
// });

Page.defaultColumns = 'title, state|20%, author|20%, publishedDate|20%';
Page.register();
