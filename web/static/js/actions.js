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


/* other constants */

export const ViewStates = {
  HIDDEN: 'HIDDEN',
  VIEW: 'VIEW',
  EDIT_MENTOR_GROUP: 'EDIT_MENTOR_GROUP',
  EMAIL_MENTOR_GROUP: 'EMAIL_MENTOR_GROUP',
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
