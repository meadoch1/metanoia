import React, { Component, PropTypes } from 'react';
import { shallowCompare } from 'react-addons-shallow-compare';
import MentorGroupDetail from './MentorGroupDetail';
import { Link } from 'react-router';
import ImmutablePropTypes from 'react-immutable-proptypes';

export default class MentorGroupMaster extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return !React.addons.shallowCompare(this, nextProps, nextState)
  }

  render() {
    const group = this.props.group;
    return (
      <div className="panel panel-default" >
        <div className="panel-heading">
          <h4 className="panel-title group-title"><strong>{group.get("name")} ({group.get("mentor_group_assignments", List({})).length})  </strong>
            <small>Fill in title somehow</small>
            <div className='pull-right'>
              <Link to={`/mentoring/email_group/${group.get("id")}`}><i className="fa fa-envelope" ></i></Link>
                &nbsp;
              <Link to={`/mentoring/edit_group/${group.get("id")}`}><i className="fa fa-edit" ></i></Link>
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
            {group.get("mentor_group_assignments", List({})).map((assignment_id, index) =>
              <MentorGroupDetail entities={this.props.entities} group_assignment={this.props.entities.getIn(["group_assignments", assignment_id.toString()], Map({}))} leader_id={group.get("leader_id").toString()}/>
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
  }).isRequired
}
