import React, { Component, PropTypes } from 'react';
import shallowCompare from 'react-addons-shallow-compare';
import {Modal, Input, ButtonInput, Panel, Table} from 'react-bootstrap'
import ImmutablePropTypes from 'react-immutable-proptypes';
import {Map, List} from 'immutable';
import MentorGroupReportDetail from './MentorGroupReportDetail'

export default class MentorGroupReport extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return shallowCompare(this, nextProps, nextState)
  }

  closeModal() {
    this.props.events.onCancel();
  }

  report_id() {
    return this.props.data.get("mentor_group_report_id", "").toString();
  }

  report() {
    return this.props.entities.getIn(["mentor_group_reports", this.report_id()], Map());
  }

  associations() {
    this.report()
  }

  reportHeader() {
    return ""
  }

  render() {
    const report_header = (
      <h4 className="panel-title group-title">
        Date: {this.report().get("meeting_dt")}
      </h4>
    )
    return (
      <Modal show={this.props.show} onHide={this.closeModal.bind(this)} >
        <Modal.Header closeButton>
          <Modal.Title>Mentor Group Report</Modal.Title>
        </Modal.Header>
        <Modal.Body>
      <Panel header={report_header}>
        <Table fill hover condensed>
          <thead>
            <tr>
              <th>Mentor</th>
              <th>Mentee</th>
              <th>Status</th>
              <th>Notes</th>
            </tr>
          </thead>
          <tbody>
            {this.report().get("mentor_group_report_details", List()).map((id, index) =>
              <MentorGroupReportDetail
                key={id}
                entities={this.props.entities}
                mentor_group_report_detail={this.props.entities.getIn(["mentor_group_report_details", id.toString()], Map({}))}
                onSave={this.props.events.onDetailSave}
              />
            )}
          </tbody>
        </Table>
      </Panel>
        </Modal.Body>
      </Modal>
    )
  }
}

MentorGroupReport.propTypes = {
  entities: ImmutablePropTypes.contains({
    persons: ImmutablePropTypes.map.isRequired,
    clients: ImmutablePropTypes.map.isRequired,
    volunteers: ImmutablePropTypes.map.isRequired,
    group_assignments: ImmutablePropTypes.map.isRequired,
    mentor_group_reports: ImmutablePropTypes.map.isRequired,
    mentor_group_report_details: ImmutablePropTypes.map.isRequired
  }).isRequired,
  data: ImmutablePropTypes.map.isRequired,
  show: PropTypes.bool.isRequired,
  events: PropTypes.shape({
    onClick: PropTypes.func.isRequired,
    onCancel: PropTypes.func.isRequired,
    onSave:  PropTypes.func.isRequired,
    onDetailSave: PropTypes.func.isRequired
  }).isRequired
}
