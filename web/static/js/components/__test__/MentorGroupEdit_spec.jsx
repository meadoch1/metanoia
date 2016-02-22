import React from 'react';
import { expect} from 'chai';
import chai from 'chai';
import {MentorGroupEdit }from '../MentorGroupEdit';

import {renderIntoDocument,
       scryRenderedDOMComponentsWithClass,
       Simulate} from 'react-addons-test-utils';

describe('MentorGroupEdit', () => {
  it('renders the group edit page', () => {
    var props = {
      assignments: [
        { mentor_id: 1, mentor_name: "Joe One"},
        { mentor_id: 2, mentor_name: "Joe Two"}
      ]
    }
    const component = renderIntoDocument(
      <MentorGroupEdit {...props}/>
    );

    const selectBox = scryRenderedDOMComponentsWithClass(component,'form-control' );
    expect(selectBox.length).to.equal(1);
    console.log("selectBox = " + selectBox);
    console.log("selectBox Text= " + selectBox.textContent);
  });

});


