import React from 'react';
import ReactDOM from 'react-dom';
import { createStore } from 'redux';
import { Provider } from 'react-redux';
import {List, Map, fromJS} from 'immutable';
import Mentoring from './containers/Mentoring';
import reducer, {initialState} from './reducers';
import {setState} from './actions';

let store = createStore(reducer);
store.dispatch( setState( initialState));



ReactDOM.render(
  <Provider store={store}>
    <Mentoring />
  </Provider>,
  document.getElementById('root')
); 
