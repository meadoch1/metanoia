import 'babel-polyfill';

import React from 'react';
import ReactDOM from 'react-dom';
import { createStore } from 'redux';
import { Provider } from 'react-redux';
import {List, Map, fromJS} from 'immutable';
import { MentoringContainer } from './containers/Mentoring';
import EmptySidebar from './components/EmptySidebar';
import {EmailGroupContainer} from './components/EmailGroup';
import {setState} from './actions';
import {initialState} from './reducers'
import configureStore from './configureStore';
import { Router, Route, Link, hashHistory, IndexRoute } from 'react-router';
import { App } from './containers/App';

require('bootstrap-webpack');
require('font-awesome-webpack');

let store = configureStore();
//store.dispatch( setState( initialState));

ReactDOM.render(
  <Provider store={store}>
    <Router history={hashHistory}>
      <Route path="/" component={App}>
        <IndexRoute compoonent={MentoringContainer} />
        <Route path="/mentoring" component={MentoringContainer} >
          <IndexRoute component={EmptySidebar} />
          <Route path="email_group/:id" component={EmailGroupContainer} />
        </Route>
      </Route>
    </Router>
  </Provider>,
  document.getElementById('root')
); 
