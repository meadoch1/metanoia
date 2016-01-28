import React from 'react';
import ReactDOM from 'react-dom';
import { createStore } from 'redux';
import { Provider } from 'react-redux';
import {List, Map, fromJS} from 'immutable';
import { MentoringContainer } from './containers/Mentoring';
import {setState} from './actions';
import {initialState} from './reducers'
import configureStore from './configureStore';

let store = configureStore();
//store.dispatch( setState( initialState));

ReactDOM.render(
  <Provider store={store}>
    <MentoringContainer />
  </Provider>,
  document.getElementById('root')
); 
