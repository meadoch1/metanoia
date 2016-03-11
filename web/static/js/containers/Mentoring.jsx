import React, {Component, PropTypes} from 'react';
import shallowCompare from 'react-addons-shallow-compare';
import { Map } from 'immutable';
import ImmutablePropTypes from 'react-immutable-proptypes';
import { connect } from 'react-redux'
import {Row, Col} from 'react-bootstrap'
import MentorGroupMaster from '../components/MentorGroupMaster'
import EmailGroup from '../components/EmailGroup'
import EmptySidebar from '../components/EmptySidebar'
import {ViewStates, requestMentorGroups, setMentorGroups,
        editMentorGroup, cancelEditMentorGroup, setMentorGroupData, fetchLastMentorGroupReport,
        pushMentorGroupReportDetail,
        composeMentorGroupEmail} from '../actions'
import {mapGroupsFromState} from '../util/map_group';
import {fetchMentorGroups} from '../util/api';

export class Mentoring extends React.Component {
  componentWillMount() {
    const { dispatch } = this.props;
    if (dispatch != undefined) {
      dispatch(requestMentorGroups());
      fetchMentorGroups().then(new_state => dispatch(setMentorGroups(new_state)))
    }
  }

  shouldComponentUpdate(nextProps, nextState) {
    return shallowCompare(this, nextProps, nextState)
  }

  sidebarComponent() {
    switch(this.props.mentoring.get("sidebar")) {
      case ViewStates.EDIT_MENTOR_GROUP:
        return <MentorGroupEdit entities={this.props.entities} data={this.props.mentoring.get("sidebar_data")} />;
      case ViewStates.EMAIL_MENTOR_GROUP:
        return <EmailGroup entities={this.props.entities} data={this.props.mentoring.get("sidebar_data")} />;
      default:
        return <EmptySidebar />;
    }
  }

  render() {
    const entities = this.props.entities;
    const mentor_groups_map = entities.get("mentor_groups");
    if (mentor_groups_map == undefined) {
      return <div />
    } else { 
      const mentor_groups = mentor_groups_map.valueSeq();
      return (
        <Row>
          {mentor_groups.map( group =>
            <MentorGroupMaster group={group} {...this.props} key={"group"+group.get("id")} />
           )}
        </Row>
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
  }).isRequired,
  mentoring: ImmutablePropTypes.contains({
    sidebar: PropTypes.string.isRequired,
    sidebar_data: ImmutablePropTypes.map.isRequired
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
};

const mapStateToProps = function(state) {
  return {entities: state.entities, mentoring: state.mentoring}
}
const mapDispatchToProps = function(dispatch) {
  return {
    dispatch: dispatch,
    editMentorGroupEvents: {
      onClick: function(id) { dispatch(editMentorGroup(id))},
      onCancel: function() {dispatch(cancelEditMentorGroup())},
      onSave: function() {dispatch(cancelEditMentorGroup())}
    },
    mentorGroupReportEvents: {
      onClick: function(id) { dispatch(fetchLastMentorGroupReport(id)) },
      onCancel: function() {dispatch(cancelEditMentorGroup())},
      onSave:  function(data) {dispatch(setMentorGroupData(data))},
      onDetailSave: function(data) {dispatch(pushMentorGroupReportDetail(data))}
    },
    onEmailMentorGroupClick: function(id) { dispatch(composeMentorGroupEmail(id)) }
  }
}

export const MentoringContainer =  connect(mapStateToProps, mapDispatchToProps)(Mentoring);
