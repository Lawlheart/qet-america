var keystone = require('keystone');
var Types = keystone.Field.Types;

var News = new keystone.List('News', {
	map: { name: 'title' },
	track: true,
	autokey: { path: 'slug', from: 'title', unique: true }
});

News.add({
	title: {type: String, required: true, initial: true},
	state: { type: Types.Select, options: 'draft, published, archived', default: 'draft', index: true },
	author: { type: Types.Relationship, ref: 'User', index: true },
	publishedDate: { type: Types.Date, index: true },
	image: { type: Types.CloudinaryImage },
	language: { type: Types.Select, options: [
		{ value: 'en', label: 'English' },
		{ value: 'es', label: 'Español' }
	], default: 'en' },
	content: {
		brief: { type: Types.Html, wysiwyg: true, height: 150 }
	}
});

News.schema.virtual('content.full').get(function() {
	return this.content.extended || this.content.brief;
});

News.schema.methods.isPublished = function() {
	return this.state == 'published';
};

News.schema.pre('save', function(next) {
	if (this.isPublished() && !this.publishedDate) {
		this.publishedDate = new Date();
	}
	next();
});

News.defaultColumns = 'title, state|20%, author|20%, publishedDate|20%';
News.register();
