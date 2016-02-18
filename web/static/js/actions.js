import fetch from 'isomorphic-fetch';
import {fromJS} from 'immutable';
import { normalize, Schema, arrayOf } from 'normalizr';

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

export function fetchState() {
  return dispatch => {
    dispatch(requestState());
    return fetch(`api/mentoring`)
      .then(req => req.json())
      .then(json => dispatch(setState(mapToState(json))))
  }
}

const volunteer = new Schema('volunteers');
const client = new Schema('clients');
const person  = new Schema('persons');
const address = new Schema('addresses');
const address_type = new Schema('address_types');
const state = new Schema('states');
const group_assignment = new Schema('group_assignments');
const mentor_group = new Schema('mentor_groups');
const facility = new Schema('facilities');
const schedule = new Schema('schedules');
const program = new Schema('programs');

schedule.define({
  mentor_group: mentor_group
});

client.define({
  person: person
});

person.define({
  address: address
});

address.define({
  address_type: address_type,
  state: state
})

group_assignment.define({
  volunteer: volunteer,
  client: client,
  program: program
});

mentor_group.define({
  mentor_group_assignments: arrayOf(group_assignment),
  schedule_entries: arrayOf(schedule)
});

volunteer.define({
  person: person
});

export function mapToState(json) {
  const norm = normalize(json, {mentor_groups: arrayOf(mentor_group)});
  return fromJS({entities: norm.entities});
}
