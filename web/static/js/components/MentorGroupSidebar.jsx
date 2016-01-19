import React, { Component, PropTypes } from 'react';

export default class MentorGroupSidebar extends Component {
  render() {
    return (
      <div className="well">{this.props.title}</div>
    )
  }
}

MentorGroupSidebar.propTypes = {
  title: PropTypes.string.isRequired
}
