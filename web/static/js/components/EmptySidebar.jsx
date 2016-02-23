import React, { Component } from 'react';
import shallowCompare from 'react-addons-shallow-compare';

export default class EmptySidebar extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return shallowCompare(this, nextProps, nextState);
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
