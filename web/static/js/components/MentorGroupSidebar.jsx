import React, { Component, PropTypes } from 'react';

export default class MentorGroupSidebar extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return !React.addons.shallowCompare(this, nextProps, nextState)
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
