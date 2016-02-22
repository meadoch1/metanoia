import { createStore, applyMiddleware, combineReducers } from 'redux';
import thunkMiddleware from 'redux-thunk';
import createLogger from 'redux-logger';
import rootReducer from './reducers/root';
import {Map} from 'immutable';
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

export const initialState = Map({
  "entities": Map({
    "states": Map({}),
    "addresses": Map({}),
    "group_assignments": Map({}),
    "clients": Map({}),
    "volunteers": Map({}),
    "address_types": Map({}),
    "programs": Map({}),
    "facilities": Map({}),
    "mentor_groups": Map({}),
    "schedules": Map({}),
    "persons": Map({})
  })
});

export default function configureStore() {
  return store;
}

