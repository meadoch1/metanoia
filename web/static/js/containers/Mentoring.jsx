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
function mapStateToProps(state) {
  return {
    groupSidebar: { title: 'test'},
    groups: state.get('groups', List()).toJS()
  };
}
export const MentoringContainer =  connect(mapStateToProps)(Mentoring);
