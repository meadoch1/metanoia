import React, { Component, PropTypes } from 'react';
import shallowCompare from 'react-addons-shallow-compare';
import { connect } from 'react-redux'
import {Modal, Input, ButtonInput} from 'react-bootstrap'
import {mapGroupFromState} from '../util/map_group';
import {reduxForm} from 'redux-form';
import { routeActions } from 'react-router-redux';

class MentorGroupEdit extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return shallowCompare(this, nextProps, nextState)
  }

  handleSubmit(data) {
    console.log('Submission received!', data);
//    this.props.dispatch(initialize('email-group', {})); // clear form
    data.preventDefault();
    this.props.events.onSave(data);
  }

  closeModal() {
    this.props.events.onCancel();
  }

  render() {
    const {fields: {name, leader_id, facility_id }} = this.props;
    var selectOptions = (this.props.assignments == undefined) ? [] : this.props.assignments.map(assignment => Object({id: assignment.mentor_id, label: assignment.mentor_name}));

    return (
        <Modal show={this.props.show} onHide={this.closeModal.bind(this)} >
          <Modal.Header closeButton>
            <Modal.Title>Edit Group</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <form onSubmit={this.handleSubmit.bind(this)}>
              <Input type="text" label="Name" placeholder="Name" {...name}/>
              <Input type="select" label="Leader" {...leader_id}>
                {selectOptions.map(val => <option key={val.id} value={val.id}>{val.label}</option>)}
              </Input>
              <ButtonInput type="submit" value="Send Email" onClick={this.handleSubmit.bind(this)} />
            </form>
          </Modal.Body>
        </Modal>
    )
  }
}

MentorGroupEdit = reduxForm({
  form: 'mentor-group-edit',
  fields: ['name', 'leader_id','facility_id']
})(MentorGroupEdit);

export default MentorGroupEdit;

export const mapStateToProps = function(state, ownProps) {
  let group_id = ownProps.params.id;
  var group_map = state.root.getIn(["entities", "mentor_groups"], new Map([]));
  if (group_map.size == 0) {
    return {name: 'test', leader_id: undefined, facility_id: undefined}
  } else {
    var group = group_map.find(grp => grp.get("id") == group_id);
    return mapGroupFromState(group);
  }
}

export const MentorGroupEditContainer =  connect(mapStateToProps)(MentorGroupEdit);
