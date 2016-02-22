import fetch from 'isomorphic-fetch';
import {fromJS} from 'immutable';
import { normalize, Schema, arrayOf } from 'normalizr';

export function mapMentorGroupsToState(json) {
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
    schedule_entries: arrayOf(schedule),
    facility: facility
  });

  volunteer.define({
    person: person
  });

  const norm = normalize(json, {mentor_groups: arrayOf(mentor_group)});
  return fromJS({entities: norm.entities});
}

export function fetchMentorGroups() {
  return fetch(`api/mentoring`)
    .then(req => req.json())
    .then(json => mapMentorGroupsToState(json))
}

