import React, { Component, PropTypes } from 'react';
import shallowCompare from 'react-addons-shallow-compare';
import {Modal, Input, ButtonInput} from 'react-bootstrap'

class MentorGroupReport extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return shallowCompare(this, nextProps, nextState)
  }

  closeModal() {
    this.props.events.onCancel();
  }

  render() {
    return (
      <Modal show={this.props.show} onHide={this.closeModal.bind(this)} >
        <Modal.Header closeButton>
          <Modal.Title>Mentor Group Report</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          TODO: Fill this in next and add proptypes
        </Modal.Body>
      </Modal>
    )
  }
}

export default MentorGroupReport;
