import {List, Map, fromJS} from 'immutable';
import {
  CANCEL_EDIT_MENTOR_GROUP, EDIT_MENTOR_GROUP, SET_MENTOR_GROUP_DATA,
  COMPOSE_MENTOR_GROUP_EMAIL, REQUEST_MENTOR_GROUP_REPORT, RECEIVE_MENTOR_GROUP_REPORT,
  ViewStates
} from '../actions';

function requestMentorGroupReport(state, mentor_group_id) {
  return state;
}

function receiveMentorGroupReport(state, data) {
  return state;
}

function setEditMentorGroup(state, group) {
  const newState = Map({ sidebar: ViewStates.EDIT_MENTOR_GROUP,
                         sidebar_data: Map({...group
                         })})
  return state.merge(newState);
}

function cancelEditMentorGroup(state) {
  const newState = Map({ sidebar: ViewStates.HIDDEN, sidebar_data: Map()})
  return state.merge(newState);
}

function setMentorGroupData(state, data) {
  const newState = Map({ sidebar: ViewStates.HIDDEN, sidebar_data: Map()})
  return state.merge(newState);
}


function setComposeMentorGroupEmail(state, id) {
  const newState = Map({ sidebar: ViewStates.EMAIL_MENTOR_GROUP, sidebar_data: Map({ id: id})})
  return state.merge(newState);
}

const initialState = Map({
  sidebar: ViewStates.HIDDEN,
  sidebar_data: Map()
})

function mentoring(state = initialState, action) {
  switch(action.type) {
  case EDIT_MENTOR_GROUP:
    return setEditMentorGroup(state, action.id);
  case COMPOSE_MENTOR_GROUP_EMAIL:
    return setComposeMentorGroupEmail(state, action.group);
  case CANCEL_EDIT_MENTOR_GROUP:
    return cancelEditMentorGroup(state);
  case SET_MENTOR_GROUP_DATA:
    return setMentorGroupData(state, action.data);
  case REQUEST_MENTOR_GROUP_REPORT:
    return requestMentorGroupReport(state, action.id);
  case RECEIVE_MENTOR_GROUP_REPORT:
    return receiveMentorGroupReport(state, action.data);
  default:
    return state;
  }
}

export default mentoring; 
