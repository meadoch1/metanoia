import React, { Component, PropTypes } from 'react';
import shallowCompare from 'react-addons-shallow-compare';

export default class MentorGroupSidebar extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return shallowCompare(this, nextProps, nextState);
  }

  render() {
    return (
      <div className="well mentoring-sidebar">{this.props.title}</div>
    )
  }
}

MentorGroupSidebar.propTypes = {
  title: PropTypes.string.isRequired
}
