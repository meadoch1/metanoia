import React, {Component, PropTypes} from 'react';
import { connect } from 'react-redux'
import MentorGroupMaster from '../components/MentorGroupMaster'
import MentorGroupSidebar from '../components/MentorGroupSidebar'
import {fetchState} from '../actions'
import {mapGroupsFromState} from '../util/map_group';

export class Mentoring extends React.Component {
  componentDidMount() {
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
          {this.props.children}
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

export const mapStateToProps = function(state) {
  var groups = mapGroupsFromState(state.root);
  return {
    groupSidebar: { title: 'test'},
    groups: groups
  };
}
export const MentoringContainer =  connect(mapStateToProps)(Mentoring);
