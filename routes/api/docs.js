var AWS = require('aws-sdk');
var s3 = new AWS.S3();

exports = module.exports = function(req, res) {
  
  var params = {
    Bucket: process.env.S3_BUCKET_NAME,
    EncodingType: 'url'
  };
  s3.listObjects(params, function(err, data) {
    if(err) console.log(err, err.stack);
    else console.log(data);
    res.json(data);
  });

};