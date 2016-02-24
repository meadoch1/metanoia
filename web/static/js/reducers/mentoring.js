import {List, Map, fromJS} from 'immutable';
import {
  EDIT_MENTOR_GROUP, COMPOSE_MENTOR_GROUP_EMAIL, ViewStates
} from '../actions';


function setEditMentorGroup(state, id) {
  const newState = Map({ sidebar: ViewStates.EDIT_MENTOR_GROUP, sidebar_data: Map({ id: id})})
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
    return setComposeMentorGroupEmail(state, action.id);
  default:
    return state;
  }
}

export default mentoring; 
