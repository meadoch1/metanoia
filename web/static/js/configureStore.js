import { compose, createStore, applyMiddleware, combineReducers } from 'redux';
import thunkMiddleware from 'redux-thunk';
import createLogger from 'redux-logger';
import entitiesReducer from './reducers/entities';
import mentoringReducer from './reducers/mentoring';
import {Map} from 'immutable';
import { syncHistory, routeReducer } from 'react-router-redux';
import { Router, Route, Link, hashHistory, IndexRoute } from 'react-router';
import {reducer as formReducer} from 'redux-form';

const loggerMiddleware = createLogger();
const reduxRouterMiddleware = syncHistory(hashHistory);

const reducer = combineReducers({
  entities: entitiesReducer,
  mentoring: mentoringReducer,
  routing: routeReducer,
  form: formReducer
});

const createStoreWithMiddleware = compose(
  applyMiddleware(thunkMiddleware),
  applyMiddleware(loggerMiddleware),
  applyMiddleware(reduxRouterMiddleware),
  typeof window === 'object' && typeof window.devToolsExtension !== 'undefined' ? window.devToolsExtension() : f => f
)(createStore)

// const createStoreWithMiddleware = applyMiddleware(
//   thunkMiddleware,
//   loggerMiddleware,
//   reduxRouterMiddleware,
// )(createStore)
const store = createStoreWithMiddleware(reducer);

reduxRouterMiddleware.listenForReplays(store)

export default function configureStore() {
  return store;
}

