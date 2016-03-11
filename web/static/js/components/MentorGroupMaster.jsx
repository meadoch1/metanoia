import React, { Component, PropTypes } from 'react';
import shallowCompare from 'react-addons-shallow-compare';
import {Panel, Table} from 'react-bootstrap'
import MentorGroupDetail from './MentorGroupDetail';
import Link from './Link';
import ImmutablePropTypes from 'react-immutable-proptypes';
import {Map, List} from 'immutable';
import MentorGroupEdit from '../components/MentorGroupEdit'
import MentorGroupReport from '../components/MentorGroupReport'
import {ViewStates} from '../actions'

export default class MentorGroupMaster extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return shallowCompare(this, nextProps, nextState)
  }

  dayOfTheWeek(dow) {
    const days = Array(
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    );
    return days[dow];
  }

  getOrdinal(n) {
    var s=["th","st","nd","rd"],
        v=n%100;
    return n+(s[(v-20)%10]||s[v]||s[0]);
  }

  title() {
    var ref_ids = this.props.group.get("schedule_entries");
    const entities = this.props.entities;
    const dow = entities.getIn(["schedules", ref_ids.first().toString(), "day_of_week"]);
    var day_name = this.dayOfTheWeek( dow );
    var weeks = ref_ids.map( id => this.getOrdinal(entities.getIn(["schedules", id.toString(), 'week_of_month']))).join(" and ");
    return day_name + "  Every " + weeks + " Week";
  }

  shouldShowEditMentorGroup() {
    return this.props.mentoring.get("sidebar") === ViewStates.EDIT_MENTOR_GROUP
  }

  shouldShowMentorGroupReport() {
    return this.props.mentoring.get("sidebar") === ViewStates.MENTOR_GROUP_REPORT
  }

  render() {
    const group = this.props.group;
    const group_header = (
      <h4 className="panel-title group-title"><strong>{group.get("name")} ({group.get("mentor_group_assignments").size})  </strong>
        <small>{ this.title()}</small>
        <div className='pull-right'>
          <Link active={false} onClick={() => {this.props.mentorGroupReportEvents.onClick(group.get("id"))}}><i className="fa fa-file-o" ></i></Link>
          &nbsp;
          <Link active={false} onClick={() => {this.props.onEmailMentorGroupClick(group.get("id"))}}><i className="fa fa-envelope" ></i></Link>
          &nbsp;
          <Link active={false} onClick={() => {this.props.editMentorGroupEvents.onClick(group.get("id"))}}><i className="fa fa-edit" ></i></Link>
        </div>
      </h4>
    )
    return (
      <div>
        <MentorGroupEdit entities={this.props.entities}
          show={this.shouldShowEditMentorGroup()}
          data={this.props.mentoring.get("sidebar_data")}
          events={this.props.editMentorGroupEvents}
        />;
        <MentorGroupReport entities={this.props.entities}
          show={this.shouldShowMentorGroupReport()}
          data={this.props.mentoring.get("sidebar_data")}
          events={this.props.mentorGroupReportEvents}
        />;
      <Panel header={group_header}>
        <Table fill hover condensed>
          <thead>
            <tr>
              <th>Mentor</th>
              <th>Mentee</th>
              <th>GCD ID</th>
              <th>Notes</th>
            </tr>
          </thead>
          <tbody>
            {group.get("mentor_group_assignments").map((assignment_id, index) =>
              <MentorGroupDetail key={assignment_id} entities={this.props.entities} group_assignment={this.props.entities.getIn(["group_assignments", assignment_id.toString()], Map({}))} leader_id={group.get("leader_id")}/>
            )}
          </tbody>
        </Table>
      </Panel>
      </div>
    )
  }
}

MentorGroupMaster.propTypes = {
  group: ImmutablePropTypes.contains({
    schedule_entries: ImmutablePropTypes.list.isRequired,
    name: PropTypes.string.isRequired,
    mentor_group_assignments: ImmutablePropTypes.list.isRequired,
    leader_id: PropTypes.number.isRequired,
    id: PropTypes.number.isRequired,
    facility_id: PropTypes.number.isRequired,
    facility: PropTypes.number.isRequired
  }).isRequired,
  mentoring: ImmutablePropTypes.contains({
    sidebar: PropTypes.string.isRequired,
    sidebar_data: ImmutablePropTypes.map.isRequired
  }).isRequired,
  entities: ImmutablePropTypes.contains({
    persons: ImmutablePropTypes.map.isRequired,
    clients: ImmutablePropTypes.map.isRequired,
    volunteers: ImmutablePropTypes.map.isRequired,
    group_assignments: ImmutablePropTypes.map.isRequired
  }).isRequired,
  editMentorGroupEvents: PropTypes.shape({
    onClick: PropTypes.func.isRequired,
    onCancel: PropTypes.func.isRequired,
    onSave:  PropTypes.func.isRequired
  }).isRequired,
  mentorGroupReportEvents: PropTypes.shape({
    onClick: PropTypes.func.isRequired,
    onCancel: PropTypes.func.isRequired,
    onSave:  PropTypes.func.isRequired,
    onDetailSave: PropTypes.func.isRequired
  }).isRequired,
  onEmailMentorGroupClick: PropTypes.func.isRequired
}
