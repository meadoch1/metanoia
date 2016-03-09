import {List, Map, fromJS} from 'immutable';
import {
  SET_MENTOR_GROUPS,
  SET_MENTOR_GROUP_REPORT
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
  "persons": Map({}),
  "mentor_group_reports": Map({}),
  "mentor_group_report_details": Map({})
});

function entities(state = initialState, action) {
  switch(action.type) {
  case SET_MENTOR_GROUPS:
    return setState(state, action.state);
  case SET_MENTOR_GROUP_REPORT:
    return setState(state, action.state);
  default:
    return state;
  }
}

export default entities; 
