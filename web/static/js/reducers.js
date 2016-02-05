//import {combineReducers} from 'redux';
import {List, Map, fromJS} from 'immutable';
import {
  CREATE_MENTOR_GROUP_REPORT, EDIT_MENTOR_GROUP,
  CREATE_MESSAGE_FOR_MENTOR_GROUP, EDIT_MENTOR_RELATIONSHIP, SET_STATE,
  ViewStates
} from './actions';
const { HIDDEN } = ViewStates;


function setState(state, newState) {
  return state.merge(newState);
}

export default function(state = Map(), action) {
  switch(action.type) {
  case SET_STATE:
    return setState(state, action.state);
  }
  return state;
}

// const metanoiaApp = combineReducers({
//   groupSidebar
// })

// function groupSidebar(state = { title: 'Welcome' }, action) {
//   switch (action.type) {
//   case CREATE_MENTOR_GROUP_REPORT:
//     return Object.assign({}, state, {title: 'New Group Report'})
//   case EDIT_MENTOR_GROUP:
//     return Object.assign({}, state, {title: 'Edit Group Report'})
//   case CREATE_MESSAGE_FOR_MENTOR_GROUP:
//     return Object.assign({}, state, {title: 'Message to Group Report'})
//   case EDIT_MENTOR_RELATIONSHIP:
//     return Object.assign({}, state, {title: 'Edit Mentoring Relationship'})
//   default:
//     return state
//   }
// }

//export default metanoiaApp
