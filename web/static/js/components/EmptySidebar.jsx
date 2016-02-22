import React, { Component } from 'react';

export default class EmptySidebar extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return !React.addons.shallowCompare(this, nextProps, nextState)
  }

  render() {
    return (
      <div>
        <h4>Sidebar</h4>
        <div className="well mentoring-sidebar">Welcome</div>
      </div>
    )
  }
}
