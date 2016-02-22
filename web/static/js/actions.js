import {fetchMentorGroups} from './util/api';

/* action types */
export const CREATE_MENTOR_GROUP_REPORT = 'CREATE_MENTOR_GROUP_REPORT';
export const EDIT_MENTOR_GROUP = 'EDIT_MENTOR_GROUP';
export const CREAGE_MESSAGE_FOR_MENTOR_GROUP = 'CREAGE_MESSAGE_FOR_MENTOR_GROUP';
export const EDIT_MENTOR_RELATIONSHIP = 'EDIT_MENTOR_RELATIONSHIP';
export const SET_STATE = 'SET_STATE';
export const REQUEST_STATE = 'REQUEST_STATE';
export const INVALID_STATE = 'INVALID_STATE';


/* other constants */

export const ViewStates = {
  HIDDEN: 'HIDDEN',
  VIEW: 'VIEW',
  EDIT: 'EDIT',
  NEW: 'NEW'
}

/* action creators */

export function setState(state) {
  return { type: SET_STATE, state: state}
}

export function requestState() {
  return {type: REQUEST_STATE }
}

export function createMentorGroupReport(id) {
  return { type: CREATE_MENTOR_GROUP_REPORT, id }
}

export function editMentorGroup(id) {
  return { type: EDIT_MENTOR_GROUP, id }
}

export function createMessageForMentorGroup(id) {
  return { type: CREATE_MESSAGE_FOR_MENTOR_GROUP, id }
}

export function editMentorRelationship(id) {
  return {type: EDIT_MENTOR_RELATIONSHIP, id }
}

export function requestMentorGroups() {
  return dispatch => {
    dispatch(requestState());
    return fetchMentorGroups()
      .then(new_state => dispatch(setState(new_state)))
  }
}

