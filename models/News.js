var keystone = require('keystone');
var Types = keystone.Field.Types;

var News = new keystone.List('News', {
	track: true,
	autokey: { path: 'key', from: 'name', unique: true }
});

News.add({
	headline: {type: String, required: true, initial: true},
	author: { type: Types.Relationship, ref: 'User', index: true },
	publishedDate: { type: Types.Date, index: true },
	image: { type: Types.CloudinaryImage },
	language: { type: Types.Select, options: [
		{ value: 1, label: 'English' },
		{ value: 2, label: 'Español' }
	], default: 1 },content: {
		brief: { type: Types.Html, wysiwyg: true, height: 150 },
		extended: { type: Types.Html, wysiwyg: true, height: 400 }
	}
});

News.schema.virtual('content.full').get(function() {
	return this.content.extended || this.content.brief;
});

News.defaultColumns = 'headline author|40% publishedDate|70%';
News.register();
