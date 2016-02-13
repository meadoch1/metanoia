import React, { Component, PropTypes } from 'react';
import MentorGroupDetail from './MentorGroupDetail';
import { Link } from 'react-router';

export default class MentorGroupMaster extends Component {
  render() {
    return (
      <div className="panel panel-default" >
        <div className="panel-heading">
          <h4 className="panel-title group-title"><strong>{this.props.name} ({this.props.assignments.length})  </strong>
            <small>{this.props.title}</small>
            <div className='pull-right'><i className="fa fa-edit" ></i></div>
          </h4>
        </div>
        <table className="table table-hover table-condensed">
          <thead>
            <tr>
              <th>Mentor</th>
              <th>Mentee</th>
              <th>GCD ID</th>
              <th>Notes</th>
              <th><Link to="email_group"><i className="fa fa-edit" ></i></Link></th>
            </tr>
          </thead>
          <tbody>
            {this.props.assignments.map((assignment, index) =>
              <MentorGroupDetail {...assignment}
                                 key={"assignment" + assignment.id} />
            )}
          </tbody>
        </table>
      </div>
    )
  }
}

MentorGroupMaster.propTypes = {
  id: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  title: PropTypes.string.isRequired,
//  onGroupReportClick: PropTypes.func.isRequired,
  assignments: PropTypes.arrayOf(PropTypes.shape({
    id: PropTypes.number.isRequired,
    mentor_name: PropTypes.string.isRequired,
    mentee_name: PropTypes.string,
    facility_ref_cd: PropTypes.string,
    comments: PropTypes.string
  }).isRequired).isRequired
}
