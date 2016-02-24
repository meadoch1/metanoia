import React, { Component, PropTypes } from 'react';
import shallowCompare from 'react-addons-shallow-compare';
import MentorGroupDetail from './MentorGroupDetail';
import Link from './Link';
import ImmutablePropTypes from 'react-immutable-proptypes';
import {Map, List} from 'immutable';

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

  render() {
    const group = this.props.group;
    return (
      <div className="panel panel-default" >
        <div className="panel-heading">
          <h4 className="panel-title group-title"><strong>{group.get("name")} ({group.get("mentor_group_assignments").size})  </strong>
            <small>{ this.title()}</small>
            <div className='pull-right'>
              <Link active={false} onClick={() => {this.props.onEmailMentorGroupClick(group.get("id"))}}><i className="fa fa-envelope" ></i></Link>
                &nbsp;
              <Link active={false} onClick={() => {this.props.onEditMentorGroupClick(group.get("id"))}}><i className="fa fa-edit" ></i></Link>
            </div>
          </h4>
        </div>
        <table className="table table-hover table-condensed">
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
        </table>
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
  entities: ImmutablePropTypes.contains({
    persons: ImmutablePropTypes.map.isRequired,
    clients: ImmutablePropTypes.map.isRequired,
    volunteers: ImmutablePropTypes.map.isRequired,
    group_assignments: ImmutablePropTypes.map.isRequired
  }).isRequired,
  onEditMentorGroupClick: PropTypes.func.isRequired,
  onEmailMentorGroupClick: PropTypes.func.isRequired
}
