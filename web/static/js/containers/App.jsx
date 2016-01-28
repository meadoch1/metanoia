import React from 'react';
import {List, Map} from 'immutable';

export default React.createClass({
  componentDidMount: function() {
    console.log("calling fetchState");
    const { dispatch } = this.props;
    dispatch(fetchState());
  };

  render: function() {
    // return this.props.children; 
    return <div className='btn btn-default'>Hello from React2</div>
  }
});
