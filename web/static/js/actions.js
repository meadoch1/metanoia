import {getLastMentorGroupReport} from './util/api';

/* action types */
export const CREATE_MENTOR_GROUP_REPORT = 'CREATE_MENTOR_GROUP_REPORT';
export const EDIT_MENTOR_GROUP = 'EDIT_MENTOR_GROUP';
export const CANCEL_EDIT_MENTOR_GROUP = 'CANCEL_EDIT_MENTOR_GROUP';
export const SET_MENTOR_GROUP_DATA = 'SET_MENTOR_GROUP_DATA';
export const COMPOSE_MENTOR_GROUP_EMAIL = 'COMPOSE_MENTOR_GROUP_EMAIL';
export const EDIT_MENTOR_RELATIONSHIP = 'EDIT_MENTOR_RELATIONSHIP';
export const SET_MENTOR_GROUPS = 'SET_MENTOR_GROUPS';
export const REQUEST_MENTOR_GROUPS = 'REQUEST_MENTOR_GROUPS';
export const INVALID_MENTOR_GROUPS = 'INVALID_MENTOR_GROUPS';
export const REQUEST_MENTOR_GROUP_REPORT = 'REQUEST_MENTOR_GROUP_REPORT';
export const RECEIVE_MENTOR_GROUP_REPORT = 'RECEIVE_MENTOR_GROUP_REPORT';


/* other constants */

export const ViewStates = {
  HIDDEN: 'HIDDEN',
  LOADING: 'LOADING',
  VIEW: 'VIEW',
  EDIT_MENTOR_GROUP: 'EDIT_MENTOR_GROUP',
  EMAIL_MENTOR_GROUP: 'EMAIL_MENTOR_GROUP',
  MENTOR_GROUP_REPORT: 'MENTOR_GROUP_REPORT',
  NEW: 'NEW'
}

/* action creators */

export function setMentorGroups(state) {
  return { type: SET_MENTOR_GROUPS, state: state}
}

export function requestMentorGroups() {
  return {type: REQUEST_MENTOR_GROUPS }
}

export function editMentorGroup(group) {
  return { type: EDIT_MENTOR_GROUP, group }
}

export function cancelEditMentorGroup(id) {
  return { type: CANCEL_EDIT_MENTOR_GROUP}
}

export function setMentorGroupData(data) {
  return { type: SET_MENTOR_GROUP_DATA, data}
}

export function composeMentorGroupEmail(id) {
  return { type: COMPOSE_MENTOR_GROUP_EMAIL, id }
}

export function editMentorRelationship(id) {
  return {type: EDIT_MENTOR_RELATIONSHIP, id }
}

export function requestMentorGroupReport(id) {
  return {type: REQUEST_MENTOR_GROUP_REPORT, id }
}

export function receiveMentorGroupReport(data) {
  return {type: RECEIVE_MENTOR_GROUP_REPORT, data }
}

export function fetchLastMentorGroupReport(id) {
  return function (dispatch) {

    // First dispatch: the app state is updated to inform
    // that the API call is starting.

    dispatch(requestMentorGroupReport(id))

    // The function called by the thunk middleware can return a value,
    // that is passed on as the return value of the dispatch method.

    // In this case, we return a promise to wait for.
    // This is not required by thunk middleware, but it is convenient for us.

    return getLastMentorGroupReport(id).then(new_state => dispatch(receiveMentorGroupReport(new_state)));
  }
}

