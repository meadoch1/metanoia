import React, { Component, PropTypes } from 'react';
import { connect } from 'react-redux'
import {mapGroupFromState} from '../util/map_group';
import {reduxForm} from 'redux-form';
import { routeActions } from 'react-router-redux';

class MentorGroupEdit extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return !React.addons.shallowCompare(this, nextProps, nextState)
  }

  handleSubmit(data) {
    console.log('Submission received!', data);
//    this.props.dispatch(initialize('email-group', {})); // clear form
    data.preventDefault();
    this.props.dispatch(routeActions.push('/mentoring'));
  }


  render() {
    const {fields: {name, leader_id, facility_id }} = this.props;
    var selectOptions = (this.props.assignments == undefined) ? [] : this.props.assignments.map(assignment => Object({id: assignment.mentor_id, label: assignment.mentor_name}));

    return (
      <div className="well mentoring-sidebar">
        <h4>Mentor Group</h4>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <div>
            <label>Name</label>
            <input type="text" placeholder="Name" {...name}/>
          </div>
          <div>
            <label>Leader</label>
            <select {...leader_id}>
              {selectOptions.map(val => <option key={val.id} value={val.id}>{val.label}</option>)}
            </select>
          </div>
          <button type="submit" onClick={this.handleSubmit.bind(this)}>Send Email</button>
        </form>
      </div>
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
