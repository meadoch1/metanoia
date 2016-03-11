import React, { Component, PropTypes } from 'react';
import {Input} from 'react-bootstrap'

export default class ReportStatus extends Component {
  onChange() {
    this.props.onChange(
      this.props.mentor_group_report_detail_id,
      this.refs.select.getValue()
    );
  }

  render() {
    return (
      <Input type="select" placeholder="unset" ref="select" value={this.props.value} onChange={this.onChange.bind(this)}>
        <option value=""></option>
        <option value="met">Met</option>
        <option value="excused">Mentor Excused</option>
        <option value="unexcused">Mentor Unexcused</option>
        <option value="unavailable">Mentee Unavailable</option>
      </Input>
    )
  }
}

ReportStatus.propTypes = {
  mentor_group_report_detail_id: PropTypes.string.isRequired,
  value: PropTypes.string,
  onChange: PropTypes.func.isRequired
}
