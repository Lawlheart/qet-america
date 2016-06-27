var keystone = require('keystone');
//   async = require('async');

exports = module.exports = function(req, res, next) {

  var view = new keystone.View(req, res),
    locals = res.locals;

  // Set locals
  locals.filters = {
    // parent: req.params.parent || '',
    slug: req.params.slug || ''
  };

  // Load the current page
  view.on('init', function(done) {

    var q = keystone.list('Page').model.findOne({
      state: 'published',
      //parent: locals.filters.parent,
      slug: locals.filters.slug
    });

    q.exec(function(err, result) {
      if (result) {
        // locals.section = locals.filters.parent;
        locals.title = result.title;
        locals.page = result;
        done();
      } else {
        done(404);
      }
    });

  });

  // Render the view
  view.render(function (err, req, res) {
    if (!locals.filters.slug) {
      //locals.section = locals.filters.parent;
      //locals.title = locals.filters.parent;
      //return res.render(locals.filters.parent);
    }
    if (err === 404)  {
      return next();
    }
    res.render('page');
  });

};