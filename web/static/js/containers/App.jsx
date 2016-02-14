import React from 'react';
import {Link} from 'react-router';

export const App = React.createClass({
  render() {
    return (
      <div>
        <h1>App</h1>
        {/* change the <a>s to <Link>s */}
        <ul>
          <li><Link to="/mentoring">Mentoring</Link></li>
        </ul>

        {this.props.children}
      </div>
    )
  }
})
