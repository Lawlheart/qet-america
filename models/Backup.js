var keystone = require('keystone');
var Types = keystone.Field.Types;
// var moment = require('moment');

/**
 * Backup Dummy Model
 * =============
 * This model is useful only for integrating the backup endpoint into
 * the Keystone admin panel
 */

var Backup = new keystone.List('Backup', {
	autokey: { from: 'name', path: 'key', unique: true },
	defaultColumns: 'name, url'
});

Backup.add({
	name: { type: String, label: 'Name', index: true },
	url: { type: Types.Url },
	date: { type: Types.Datetime, default: Date.now, label: 'Date' }
});

Backup.schema.pre('save', function(next) {
	// sets the path to backup endpoint
	this.url = '/backup';
	next();
});

Backup.defaultSort = '-date';
Backup.register();
