import React, {Component, PropTypes} from 'react';
import { connect } from 'react-redux'
import MentorGroupMaster from '../components/MentorGroupMaster'
import MentorGroupSidebar from '../components/MentorGroupSidebar'
import {fetchState} from '../actions'
import {List} from 'immutable';


export class Mentoring extends React.Component {
  componentDidMount() {
    console.log("calling fetchState");
    const { dispatch } = this.props;
    dispatch(fetchState());
  }

  render() {
    return (
      <div className="row">
        <div id="groups-container" className="col-sm-9">
          {this.props.groups.map( group =>
            <MentorGroupMaster {...group} key={"group"+group.id} />
           )}
        </div>
        <div className="col-sm-3">
          <h4>Sidebar</h4>
          <MentorGroupSidebar {...this.props.groupSidebar}  />
        </div>
      </div>
    )
  }
}

Mentoring.propTypes = {
  groupSidebar: PropTypes.shape({
    title: PropTypes.string.isRequired
  }),
  groups: PropTypes.arrayOf(PropTypes.shape({
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    title: PropTypes.string.isRequired,
    //  onGroupReportClick: PropTypes.func.isRequired,
    assignments: PropTypes.arrayOf(
      PropTypes.shape({
        id: PropTypes.number.isRequired,
      mentor_name: PropTypes.string.isRequired,
      mentee_name: PropTypes.string.isRequired,
      facility_ref_cd: PropTypes.string.isRequired,
      comments: PropTypes.string.isRequired
    }).isRequired).isRequired})
  ).isRequired
};

function select(state) {
  console.log("State: " + state);
  return state
}

function fullNameFromPerson(person) {
  return person.get("first_name") + " " + person.get("last_name")
}

function mapGroupsFromState(state) {
  console.log("in mapGroupsFromState");
  var group_ids = state.getIn(["result", "mentor_groups"], new List());
  var groups =  group_ids.map( function(group_id){
    console.log("group_id: " + group_id);
    var group = state.getIn(["entities", "mentor_groups"], new Map()).get(group_id.toString());
    console.log("group: " + group);
    return {
      id: group.get('id'),
      name: group.get('name'),
      title: group.get('name'),
      assignments: group.get('mentor_group_assignments', List()).map( function(assignment){
        return {
          id: assignment.get('id'),
          mentor_name: fullNameFromPerson(assignment.getIn(["volunteer","person"], new Map())),
          mentee_name: fullNameFromPerson(assignment.getIn(["client", "person"], new Map())),
          facility_ref_cd: assignment.getIn(["client","facility_ref_cd"]),
          comments: assignment.get("comments")
        }
      })
    }
  });
  return groups.toJS();
}

function mapStateToProps(state) {
  console.log("in mapStateToProps");
  var groups = mapGroupsFromState(state);
  return {
    groupSidebar: { title: 'test'},
    groups: groups
  };
}
export const MentoringContainer =  connect(mapStateToProps)(Mentoring);
