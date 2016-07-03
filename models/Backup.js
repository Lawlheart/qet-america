var keystone = require('keystone');
var Types = keystone.Field.Types;
var restore = require('mongodb-restore');
var unlink = require('fs').unlinkSync;
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
	url: { type: Types.Url, noedit: true },
	file: { type: Types.LocalFile, dest: '/tmp/qet/files', label: 'Restore' },
	date: { type: Types.Datetime, default: Date.now, label: 'Date' }
});

Backup.schema.pre('save', function(next) {
	// sets the path to backup endpoint
	this.url = '/backup.tar';
	
	if (this.file.filename) {
		var self = this;
		restore({
			uri: keystone.get('mongo'),
			root: this.file.path,
			tar: this.file.filename,
			drop: true,
			callback: function(err) {
				if (err) {
					next(err);
				}
				unlink(self.file.path + '/' + self.file.filename);
				self.file = {
					filetype: '',
					size: 0,
					path: '',
					originalname: '',
					filename: ''
				};
				console.log('Database restored');
				next();
			}
		});
	} else {
		next();
	}
});

Backup.defaultSort = '-date';
Backup.register();
