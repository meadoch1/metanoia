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
    if (dispatch != undefined) {
      dispatch(fetchState());
    }
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
      mentee_name: PropTypes.string,
      facility_ref_cd: PropTypes.string,
      comments: PropTypes.string
    }).isRequired).isRequired})
  ).isRequired
};

function select(state) {
  console.log("State: " + state);
  return state
}

function fullNameFromPerson(person) {
  if (person.get("last_name") == undefined && person.get("first_name") == undefined) {
    return "";
  } else {
    return person.get("last_name", "") + ", " + person.get("first_name", "")
  }
}

const daysOfTheWeek = new Array(
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
);

var getOrdinal = function(n) {
   var s=["th","st","nd","rd"],
       v=n%100;
   return n+(s[(v-20)%10]||s[v]||s[0]);
}

function buildTitleFromGroup(group) {
  var entries = group.get("schedule_entries");
  var day_name = daysOfTheWeek[entries.first().get('day_of_week')];
  var weeks = entries.map( entry => getOrdinal(entry.get('week_of_month'))).join(" and ");
  return day_name + "  Every " + weeks + " Week";
}

function mapGroupsFromState(state) {
  console.log("in mapGroupsFromState");
  var group_map = state.getIn(["entities", "mentor_groups"], new Map([]));
  if (group_map.size == 0) {
    return [];
  } else {
    var groups = group_map.entrySeq().sortBy( pair => pair[1].get('name')).map( pair => {
      var group = pair[1];
      var title = buildTitleFromGroup(group);
      return {
        id: group.get('id'),
        name: group.get('name'),
        title: title,
        assignments: group.get('mentor_group_assignments', List()).map( function(assignment){
          return {
            id: assignment.get('id'),
            mentor_name: fullNameFromPerson(assignment.getIn(["volunteer","person"], new Map())),
            mentee_name: fullNameFromPerson(assignment.getIn(["client", "person"], new Map())),
            facility_ref_cd: assignment.getIn(["client","facility_ref_cd"]),
            comments: assignment.get("comments")
          }
        }).sortBy( ament => ament.mentor_name ).toArray()
      }
    });
    return groups.toJS();
  }
}

export const mapStateToProps = function(state) {
  console.log("in mapStateToProps");
  var groups = mapGroupsFromState(state);
  return {
    groupSidebar: { title: 'test'},
    groups: groups
  };
}
export const MentoringContainer =  connect(mapStateToProps)(Mentoring);
