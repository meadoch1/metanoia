import {List, Map, fromJS} from 'immutable';
import {
  SET_MENTOR_GROUPS,
  SET_MENTOR_GROUP_REPORT,
  RECEIVE_MENTOR_GROUP_REPORT,
  UPDATED_MENTOR_GROUP_REPORT_DETAIL
} from '../actions';


function setState(state, newState) {
  return state.merge(newState);
}

function updateMentorGroupReportDetail(state, newState) {
  return state.mergeDeep(newState);
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
  case RECEIVE_MENTOR_GROUP_REPORT:
    return setState(state, action.data);
  case UPDATED_MENTOR_GROUP_REPORT_DETAIL:
    return updateMentorGroupReportDetail(state, action.data);
  default:
    return state;
  }
}

export default entities; 
