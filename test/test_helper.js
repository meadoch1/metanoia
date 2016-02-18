import jsdom from 'jsdom';
import expect from 'expect';
import expectJSX from 'expect-jsx';
import expectImmutable from 'expect-immutable';

expect.extend(expectJSX);
expect.extend(expectImmutable);

const doc = jsdom.jsdom('<!doctype html><html><body></body></html>');
const win = doc.defaultView;

global.document = doc;
global.window = win;

Object.keys(window).forEach((key) => {
  if (!(key in global)) {
    global[key] = window[key];
  }
});

var colors = require('mocha/lib/reporters/base').colors;
colors['error stack'] = '33';
colors['pass'] = '32';
colors['fast'] = '32';
colors['diff gutter'] = '32';
