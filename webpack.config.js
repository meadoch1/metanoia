var webpack = require('webpack');
var path = require('path');
var ExtractTextPlugin = require('extract-text-webpack-plugin');
var CopyWebpackPlugin = require('copy-webpack-plugin');

var env = process.env.MIX_ENV || 'dev';
var isProduction = (env === 'prod');

var plugins = [
  new ExtractTextPlugin('app.css'),
  new CopyWebpackPlugin([
    { from: './web/static/assets' },
    { from: './deps/phoenix_html/web/static/js/phoenix_html.js',
      to: 'js/phoenix_html.js' }
  ]),
  new webpack.optimize.CommonsChunkPlugin({
    name: "vendor", filename: "vendor.js"
  }),
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
];

// This is necessary to get the sass @import's working
var stylePathResolves = (
  'includePaths[]=' + path.resolve('./') + '&' +
    'includePaths[]=' + path.resolve('./node_modules')
);

if (isProduction) {
  plugins.push(new webpack.optimize.UglifyJsPlugin({minimize: true}));

}

module.exports = {
  entry: {
    vendor: ["jquery", "bootstrap-webpack", "font-awesome-webpack", "es6-promise",
             "history",
             "immutable",
             "isomorphic-fetch",
             // "less",
             "normalizr",
              "react", "react-redux", "react-router", "react-router-redux",
             "redux", "redux-logger", "redux-thunk"
            ],
    app: './web/static/js/index.jsx'
  },

  output: {
    path: './priv/static/js',
    publicPath: '/js/',
    filename: 'app.js'
  },

  resolve: {
    alias: {
      phoenix: __dirname + '/deps/phoenix/web/static/js/phoenix.js'
    },
    extensions: [ '','.js','.jsx' ]
  },
  scripts: {
    // add every bootstrap script you need
    'transition': true
  },
  styles: {
    // add every bootstrap style you need
    "mixins": true,
    "normalize": true,
    "print": true,
    "scaffolding": true,
    "type": true,
    "core": true,
    "icons": true,
    "larger": true,
    "path": true
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel',
        query: {
          presets: ['es2015', 'react']
        }
      },
      {
        test: /\.(png|jpg|jpeg|gif|bmp)$/,
        loader: 'url',
        include: path.join(__dirname, 'web/static')
      },{
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract(
          'style',
          'css' + '!sass?outputStyle=expanded&' + stylePathResolves
        )
      },
      { test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "url-loader?limit=10000&mimetype=application/font-woff" },
      { test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "file-loader" }
    ]
  },

  plugins: plugins

};
