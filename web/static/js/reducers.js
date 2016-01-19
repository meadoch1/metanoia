//import {combineReducers} from 'redux';
import {List, Map} from 'immutable';
import {
  CREATE_MENTOR_GROUP_REPORT, EDIT_MENTOR_GROUP,
  CREATE_MESSAGE_FOR_MENTOR_GROUP, EDIT_MENTOR_RELATIONSHIP, SET_STATE,
  ViewStates
} from './actions';
const { HIDDEN } = ViewStates;

export const initialState = Map({
  groupSidebar: Map({ title: 'Welcome' }),
  groups: List.of(
    Map({
      name: 'Group 1',
      id: 1,
      title: 'The first group',
      assignments: List.of(
        Map({
          id: 1,
          mentor_name: 'George One',
          mentee_name: 'Mentee One',
          facility_ref_cd: '0001',
          comments: 'comments 1'}),
        Map({
          id: 2,
          mentor_name: 'George Two',
          mentee_name: 'Mentee Two',
          facility_ref_cd: '0002',
          comments: 'comments 2'})
      )}),
    Map({
      name: 'Group 2',
      id: 2,
      title: 'The second group',
      assignments: List.of(
        Map({
          id: 3,
          mentor_name: 'Bob One',
          mentee_name: 'Mentee Three',
          facility_ref_cd: '0003',
          comments: 'comments 4'}),
        Map({
          id: 4,
          mentor_name: 'Bob Two',
          mentee_name: 'Mentee Four',
          facility_ref_cd: '0004',
          comments: 'comments 5'}),
        Map({
          id: 5,
          mentor_name: 'Bob Three',
          mentee_name: 'Mentee Five',
          facility_ref_cd: '0005',
          comments: 'comments 6'})
      )})
  )
});

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
