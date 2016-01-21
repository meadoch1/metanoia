import React from 'react/addons';
import {expect} from 'chai';
import {Mentoring }from '../../../web/static/js/containers/Mentoring';
import {initialState} from '../../../web/static/js/reducers';

const {renderIntoDocument,
       scryRenderedDOMComponentsWithClass,
       Simulate} = React.addons.TestUtils;

describe('Mentoring', () => {
  it('renders groups', () => {
    const component = renderIntoDocument(
      <Mentoring groupSidebar={initialState.get('groupSidebar').toJS()} groups={initialState.get('groups').toJS()} />
    );

    const groups = scryRenderedDOMComponentsWithClass(component,'group-title' );
    expect(groups.length).to.equal(2);
    expect(groups[0].textContent).to.equal('Group 1 (2)  The first group');
    expect(groups[1].textContent).to.equal('Group 2 (3)  The second group');
    const details = scryRenderedDOMComponentsWithClass(component, 'group-detail-row');
    expect(details.length).to.equal(5);
    expect(details[0].textContent).to.equal('George OneMentee One0001comments 1');
  });

  it('renders the sidebar', () => {
    const component = renderIntoDocument(
      <Mentoring groupSidebar={initialState.get('groupSidebar').toJS()} groups={initialState.get('groups').toJS()} />
    );

    const sidebar = scryRenderedDOMComponentsWithClass(component,'mentoring-sidebar' );
    expect(sidebar.length).to.equal(1);
    expect(sidebar[0].textContent).to.equal('Welcome');
  });


});


