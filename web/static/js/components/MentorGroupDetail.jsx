import React, { Component, PropTypes } from 'react';
import ImmutablePropTypes from 'react-immutable-proptypes';
import shallowCompare from 'react-addons-shallow-compare';
import {nameFromPerson} from '../util/person_utils';

export default class MentorGroupDetail extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return shallowCompare(this, nextProps, nextState);
  }

  mentorGroupAssignmentId() {
    return this.props.group_assignment.get("id").toString();
  }

  mentorName() {
    const entities = this.props.entities;
    const volunteer = entities.getIn(["volunteers", this.props.group_assignment.get("volunteer_id").toString()]);
    const mentor = entities.getIn(["persons", volunteer.get("person_id").toString()]);
    return nameFromPerson(mentor);
  }

  client() {
    return this.props.entities.getIn(
      ["clients", this.props.group_assignment.get("client_id").toString()]);
  }
  menteeName() {
    const mentee = this.props.entities.getIn(["persons", this.client().get("person_id").toString()], "");
    return nameFromPerson(mentee);
  }

  facilityRefCd() {
    return this.client().get("facility_ref_cd", "")
  }

  render() {
    return (
      <tr className='group-detail-row' data-assignment-id={this.mentorGroupAssignmentId()} >
        <td >{this.mentorName()}</td>
        <td >{this.menteeName()}</td>
        <td>{this.facilityRefCd()}</td>
        <td>{this.props.group_assignment.get("comments")}</td>
      </tr>
    )
  }
}

MentorGroupDetail.propTypes = {
  leader_id: PropTypes.number.isRequired,
  group_assignment: ImmutablePropTypes.contains({
    start_month: PropTypes.string.isRequired,
    program: PropTypes.number.isRequired,
    volunteer: PropTypes.number.isRequired,
    client: PropTypes.number.isRequired,
    volunteer_id: PropTypes.number.isRequired,
    client_id: PropTypes.number.isRequired,
    comments: PropTypes.string.isRequired,
    program_id: PropTypes.number.isRequired,
    mentor_group_id: PropTypes.number.isRequired,
    id: PropTypes.number.isRequired
  }).isRequired,
  entities: ImmutablePropTypes.contains({
    persons: ImmutablePropTypes.map.isRequired,
    clients: ImmutablePropTypes.map.isRequired,
    volunteers: ImmutablePropTypes.map.isRequired
  }).isRequired
}
