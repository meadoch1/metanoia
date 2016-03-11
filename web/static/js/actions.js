import {getLastMentorGroupReport, updateMentorGroupReportDetail} from './util/api';

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
export const UPDATED_MENTOR_GROUP_REPORT_DETAIL = 'UPDATED_MENTOR_GROUP_REPORT_DETAIL';
export const UPDATING_MENTOR_GROUP_REPORT_DETAIL = 'UPDATING_MENTOR_GROUP_REPORT_DETAIL';

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
    dispatch(requestMentorGroupReport(id))
    return getLastMentorGroupReport(id).then(new_state => dispatch(receiveMentorGroupReport(new_state)));
  }
}

export function updatingMentorGroupReportDetail(id) {
  return {type: UPDATING_MENTOR_GROUP_REPORT_DETAIL, id}
}

export function updatedMentorGroupReportDetail(data) {
  console.log("DETAIL: " + data)
  return {type: UPDATED_MENTOR_GROUP_REPORT_DETAIL, data}
}

export function pushMentorGroupReportDetail(data) {
  return function (dispatch) {
    dispatch(updatingMentorGroupReportDetail(data.get("id")));
    return updateMentorGroupReportDetail(data).then( new_state => dispatch(updatedMentorGroupReportDetail(new_state)));
  }
} 

