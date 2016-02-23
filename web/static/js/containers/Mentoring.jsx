import React, {Component, PropTypes} from 'react';
import shallowCompare from 'react-addons-shallow-compare';
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
    return shallowCompare(this, nextProps, nextState)
  }

  render() {
    const entities = this.props.entities;
    const mentor_groups_map = entities.get("mentor_groups");
    if (mentor_groups_map == undefined) {
      return <div />
    } else { 
      const mentor_groups = mentor_groups_map.valueSeq();
      return (

        <div className="row">
        <div id="groups-container" className="col-sm-9">
        {mentor_groups.map( group =>
          <MentorGroupMaster group={group} entities={entities} key={"group"+group.get("id")} />
        )}
        </div>
        <div className="col-sm-3">
          {this.props.children}
        </div>
        </div>
      )
    }
  }
}

Mentoring.propTypes = {
  entities: ImmutablePropTypes.contains({
    mentor_groups: ImmutablePropTypes.map.isRequired,
    persons: ImmutablePropTypes.map.isRequired,
    clients: ImmutablePropTypes.map.isRequired,
    volunteers: ImmutablePropTypes.map.isRequired,
    group_assignments: ImmutablePropTypes.map.isRequired
  }).isRequired
};

export const mapStateToProps = function(state) {
  return {entities: state.root.get("entities", Map({}))};
  /* var groups = mapGroupsFromState(state.root);
     return {
     mentor_groups: groups
     }; */
}
export const MentoringContainer =  connect(mapStateToProps)(Mentoring);
