import React, { Component } from 'react';
import { connect } from 'react-redux'

export class EmailGroup extends Component {
  render() {
    return (
      <div className="well mentoring-sidebar">{this.props.title}</div>
    )
  }
}

export const mapStateToProps = function(state) {
  return {
    title: 'test'
  };
}
export const EmailGroupContainer =  connect(mapStateToProps)(EmailGroup);
