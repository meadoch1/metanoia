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
    expect(groups.length).toEqual(1);
    expect(groups[0].textContent).toEqual('WS Group 1 (2)  Fill in title somehow ');
    const details = scryRenderedDOMComponentsWithClass(component, 'group-detail-row');
    expect(details.length).toEqual(2);
    expect(details[0].textContent).to.equal('Bill SmithBob Jones1111111111');
  });

  it('renders the sidebar', () => {
    var props = mapStateToProps(initialMentoringState);
    const component = renderIntoDocument(
      <Mentoring groupSidebar={props.groupSidebar} groups={props.groups} />
    );

    const sidebar = scryRenderedDOMComponentsWithClass(component,'mentoring-sidebar' );
    expect(sidebar.length).toEqual(1);
    expect(sidebar[0].textContent).toEqual('test');
  });


});


