var keystone = require('keystone');
var Types = keystone.Field.Types;

/*
* Step Model
* ==========
* */


var Step = new keystone.List('Step', {
	map: { name: 'title' },
	autokey: { path: 'slug', from: 'title', unique: true }
});

Step.add({
	title: { type: String, required: true },
	mediaType: { type: Types.Select, options: 'none, document, video, image', default: 'none', index: true },
	images: { type: Types.CloudinaryImages, autoCleanup: true, dependsOn: {mediaType: 'image'}},
	docs: { type: Types.Relationship, ref: 'Document',  label: 'Documents', many: true, dependsOn: {mediaType: 'document'} },
	video: { type: Types.Embedly, from: 'videoUrl', dependsOn: {mediaType: 'video'}},
	videoUrl: { type: Types.Url, dependsOn: {mediaType: 'video'} },
	language: { type: Types.Select, options: [
		{ value: 'en', label: 'English' },
		{ value: 'es', label: 'Español' }
	], default: 'en' },
	content: {
		brief: { type: Types.Html, wysiwyg: true, height: 150 },
		extended: { type: Types.Html, wysiwyg: true, height: 400 }
	}
});

Step.register();
