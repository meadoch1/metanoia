import React, {Component, PropTypes} from 'react';
import { Map } from 'immutable';
import ImmutablePropTypes from 'react-immutable-proptypes';
import { connect } from 'react-redux'
import MentorGroupMaster from '../components/MentorGroupMaster'
import MentorGroupSidebar from '../components/MentorGroupSidebar'
import {requestMentorGroups} from '../actions'
import {mapGroupsFromState} from '../util/map_group';

export class Mentoring extends React.Component {
  componentDidMount() {
    const { dispatch } = this.props;
    if (dispatch != undefined) {
      dispatch(requestMentorGroups());
    }
  }

  shouldComponentUpdate(nextProps, nextState) {
    return !React.addons.shallowCompare(this, nextProps, nextState)
  }

  render() {
    const entities = this.props.entities;
    const mentor_groups = entities.get("mentor_groups", Map({})).valueSeq();
    return (
      <div className="row">
        <div id="groups-container" className="col-sm-9">
          {mentor_groups.map( group =>
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
  mentor_groups: ImmutablePropTypes.mapOf(ImmutablePropTypes.contains({
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    title: PropTypes.string.isRequired,
    //  onGroupReportClick: PropTypes.func.isRequired,
    assignments: ImmutablePropTypes.listOf(
      ImmutablePropTypes.contains({
        id: PropTypes.number.isRequired,
        mentor_name: PropTypes.string.isRequired,
        mentee_name: PropTypes.string,
        facility_ref_cd: PropTypes.string,
        comments: PropTypes.string
      }).isRequired).isRequired})
  ).isRequired
};

export const mapStateToProps = function(state) {
  return state;
  /* var groups = mapGroupsFromState(state.root);
     return {
     mentor_groups: groups
     }; */
}
export const MentoringContainer =  connect(mapStateToProps)(Mentoring);
