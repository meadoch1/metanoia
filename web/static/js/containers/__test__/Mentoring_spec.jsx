import React from 'react';
import expect from 'expect';
import {Mentoring, mapStateToProps }from '../Mentoring';
import {initialMentoringState} from '../../util/initialMentoringState';

import {renderIntoDocument,
       scryRenderedDOMComponentsWithClass,
       Simulate} from 'react-addons-test-utils';

describe('Mentoring', () => {
  it('renders groups', () => {
    var props = mapStateToProps(initialMentoringState);
    const component = renderIntoDocument(
      <Mentoring entities={props.get("entities")}/>
    );

    const groups = scryRenderedDOMComponentsWithClass(component,'group-title' );
    expect(groups.length).toEqual(3);
    expect(groups[0].textContent).toEqual('WS Group 1 (2)  Fill in title somehow ');
    const details = scryRenderedDOMComponentsWithClass(component, 'group-detail-row');
    expect(details.length).toEqual(6);
    expect(details[0].textContent).toEqual('Mendez, BasilDrake, ZoritaCLIENT1mentor group assignment 1 comment');
  });

});


