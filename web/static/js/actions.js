/* action types */
export const CREATE_MENTOR_GROUP_REPORT = 'CREATE_MENTOR_GROUP_REPORT';
export const EDIT_MENTOR_GROUP = 'EDIT_MENTOR_GROUP';
export const CREAGE_MESSAGE_FOR_MENTOR_GROUP = 'CREAGE_MESSAGE_FOR_MENTOR_GROUP';
export const EDIT_MENTOR_RELATIONSHIP = 'EDIT_MENTOR_RELATIONSHIP';
export const SET_STATE = 'SET_STATE';


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
