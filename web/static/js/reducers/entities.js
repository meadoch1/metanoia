import {List, Map, fromJS} from 'immutable';
import {
  SET_MENTOR_GROUPS
} from '../actions';


function setState(state, newState) {
  return state.merge(newState);
}

const initialState = Map({
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
});

function entities(state = initialState, action) {
  switch(action.type) {
  case SET_MENTOR_GROUPS:
    return setState(state, action.state);
  default:
    return state;
  }
}

export default entities; 
