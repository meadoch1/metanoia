import { createStore, applyMiddleware, combineReducers } from 'redux';
import thunkMiddleware from 'redux-thunk';
import createLogger from 'redux-logger';
import rootReducer from './reducers/root';
import {fromJS} from 'immutable';
import { syncHistory, routeReducer } from 'react-router-redux';
import { Router, Route, Link, hashHistory, IndexRoute } from 'react-router';
import {reducer as formReducer} from 'redux-form';

const loggerMiddleware = createLogger();
const reduxRouterMiddleware = syncHistory(hashHistory);

const reducer = combineReducers({
  root: rootReducer,
  routing: routeReducer,
  form: formReducer
});

const createStoreWithMiddleware = applyMiddleware(
  thunkMiddleware,
  loggerMiddleware,
  reduxRouterMiddleware
)(createStore)

const store = createStoreWithMiddleware(reducer);

reduxRouterMiddleware.listenForReplays(store)

const initialState = fromJS({
  entities: {
    address_types: {},
    addresses: {},
    clients: {},
    group_assignments: {},
    mentor_groups: {},
    persons: {},
    schedules: {},
    states: {},
    volunteers: {}
  },
  result: {
    clients: [],
    group_assignments: [],
    mentor_groups: [],
    schedules: [],
    volunteers: []
  }
});

export default function configureStore() {
  return store;
}
