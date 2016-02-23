import React, { Component, PropTypes } from 'react';
import shallowCompare from 'react-addons-shallow-compare';
import { connect } from 'react-redux'
import {mapGroupFromState} from '../util/map_group';
import {reduxForm} from 'redux-form';
import { routeActions } from 'react-router-redux'

class EmailGroup extends Component {
  handleSubmit(data) {
    console.log('Submission received!', data);
//    this.props.dispatch(initialize('email-group', {})); // clear form
    data.preventDefault();
    this.props.dispatch(routeActions.push('/mentoring'));
  }

  shouldComponentUpdate(nextProps, nextState) {
    return shallowCompare(this, nextProps, nextState);
  }

  render() {
    const {fields: {subject, body}} = this.props;

    return (
      <div className="well mentoring-sidebar">
        <h4>Email Group: {this.props.name}</h4>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <div>
            <label>Subject</label>
            <input type="text" placeholder="Subject" {...subject}/>
          </div>
          <div>
            <label>Body</label>
            <textarea placeholder="Body" {...body} />
          </div>
          <button type="submit" onClick={this.handleSubmit.bind(this)}>Send Email</button>
        </form>
      </div>
    )
  }
}

EmailGroup = reduxForm({
  form: 'email-group',
  fields: ['subject', 'body']
})(EmailGroup);

export default EmailGroup;

export const mapStateToProps = function(state, ownProps) {
  let group_id = ownProps.params.id;
  var group_map = state.root.getIn(["entities", "mentor_groups"], new Map([]));
  if (group_map.size == 0) {
    return {title: 'test', value: {}}
  } else {
    var group = group_map.find(grp => grp.get("id") == group_id);
    var props = mapGroupFromState(group);
    return props;
  }
}

export const EmailGroupContainer =  connect(mapStateToProps)(EmailGroup);
