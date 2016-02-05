import React, { Component, PropTypes } from 'react';

export default class MentorGroupDetail extends Component {
  render() {
    return (
      <tr className='group-detail-row' data-assignment-id={this.props.assignment_id} >
        <td >{this.props.mentor_name}</td>
        <td >{this.props.mentee_name}</td>
        <td>{this.props.facility_ref_cd}</td>
        <td>{this.props.comments}</td>
      </tr>
    )
  }
}

MentorGroupDetail.propTypes = {
  mentor_name: PropTypes.string.isRequired,
  mentee_name: PropTypes.string,
  facility_ref_cd: PropTypes.string,
  comments: PropTypes.string
}
