import React, { Component, PropTypes } from 'react';
import ImmutablePropTypes from 'react-immutable-proptypes';
import shallowCompare from 'react-addons-shallow-compare';
import {nameFromPerson} from '../util/person_utils';
import ReportStatus from './ReportStatus'

export default class MentorGroupReportDetail extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return shallowCompare(this, nextProps, nextState);
  }

  mentorGroupReportDetailId() {
    return this.props.mentor_group_report_detail.get("id").toString();
  }

  mentorGroupAssignmentId() {
    return this.props.mentor_group_report_detail.get("mentor_group_assignment_id").toString();
  }

  mentorGroupAssignment() {
    return this.props.entities.getIn(["group_assignments", this.mentorGroupAssignmentId()]);
  }

  mentorName() {
    const entities = this.props.entities;
    const assignment = this.mentorGroupAssignment();
    const volunteer = entities.getIn(["volunteers", assignment.get("volunteer_id").toString()]);
    const mentor = entities.getIn(["persons", volunteer.get("person_id").toString()]);
    var name =  nameFromPerson(mentor);
    return name;
  }

  client() {
    return this.props.entities.getIn(
      ["clients", this.mentorGroupAssignment().get("client_id").toString()]);
  }
  menteeName() {
    const mentee = this.props.entities.getIn(["persons", this.client().get("person_id").toString()], "");
    return nameFromPerson(mentee);
  }

  handleReportStatusChange(id, newStatus) {
    this.props.onSave(this.props.mentor_group_report_detail.merge({status: newStatus}));
  }

  render() {
    const id = this.mentorGroupReportDetailId();
    return (
      <tr className='group-report-detail-row' data-assignment-id={id} >
        <td >{this.mentorName()}</td>
        <td >{this.menteeName()}</td>
        <td ><ReportStatus
               value={this.props.mentor_group_report_detail.get("status", "")}
               mentor_group_report_detail_id={id}
               onChange={this.handleReportStatusChange.bind(this)}
             />
        </td>
        <td >{this.props.mentor_group_report_detail.get("note", "")}</td>
      </tr>
    )
  }
}

MentorGroupReportDetail.propTypes = {
  mentor_group_report_detail: ImmutablePropTypes.contains({
    mentor_group_assignment_id: PropTypes.number.isRequired,
    mentor_group_report_id: PropTypes.number.isRequired,
    status: PropTypes.string,
    note: PropTypes.string,
    id: PropTypes.number.isRequired
  }).isRequired,
  entities: ImmutablePropTypes.contains({
    mentor_group_reports: ImmutablePropTypes.map.isRequired,
    group_assignments: ImmutablePropTypes.map.isRequired,
    persons: ImmutablePropTypes.map.isRequired,
    clients: ImmutablePropTypes.map.isRequired,
    volunteers: ImmutablePropTypes.map.isRequired
  }).isRequired,
  onSave: PropTypes.func.isRequired
}
