import { createStore, applyMiddleware } from 'redux';
import thunkMiddleware from 'redux-thunk';
import createLogger from 'redux-logger';
import rootReducer from './reducers';
import {fromJS} from 'immutable';

const loggerMiddleware = createLogger()

const createStoreWithMiddleware = applyMiddleware(
  thunkMiddleware,
  loggerMiddleware
)(createStore)

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

export default function configureStore(initialState) {
  return createStoreWithMiddleware(rootReducer, initialState)
}
