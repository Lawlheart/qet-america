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
	// author: { type: Types.Relationship, ref: 'User', index: true },
	showInNavBar: { type: Types.Boolean, label: 'Show in navigation bar' },
	publishedDate: { type: Types.Date, index: true, dependsOn: { state: 'published' } },

	//create a dropdown with templates
	// template: { type: Types.Select, options: 'page, about, team, contact, portfolio', default: 'page'},
	image: { type: Types.CloudinaryImage },
	docs: { type: Types.Relationship, ref: 'Document',  label: 'Documents', many: true },
	video: { type: Types.Embedly, from: 'videoUrl'},
	videoUrl: { type: Types.Url },
	language: { type: Types.Select, options: [
			{ value: 'en', label: 'English' }, 
			{ value: 'es', label: 'Español' }
		], default: 'en' },

	content: {
		type: Types.Html, wysiwyg: true, height: 400
		// brief: { type: Types.Html, wysiwyg: true, height: 150 },
		// extended: { type: Types.Html, wysiwyg: true, height: 400 }
	}
});

// Page.schema.virtual('content.full').get(function() {
// 	return this.content.extended || this.content.brief;
// });

Page.schema.methods.isPublished = function() {
	return this.state == 'published';
};
 
Page.schema.pre('save', function(next) {
	if (this.isPublished() && !this.publishedDate) {
		this.publishedDate = new Date();
	}
	next();
});

// updates the navigation menu after saving or removing a page
Page.schema.post('save', function(next) {
	keystone.get('updateNavigation')();
});

Page.schema.post('remove', function(next) {
	keystone.get('updateNavigation')();
});

Page.defaultColumns = 'title, language|15%, state|15%, publishedDate|20%';
Page.register();
