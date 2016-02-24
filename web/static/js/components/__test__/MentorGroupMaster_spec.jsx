import React from 'react';
import expect from 'expect';
import MentorGroupMaster from '../MentorGroupMaster';
import {initialMentoringState} from '../../util/initialMentoringState';

import {renderIntoDocument,
       scryRenderedDOMComponentsWithClass,
        findRenderedDOMComponentWithTag,
       Simulate} from 'react-addons-test-utils';

describe('MentorGroupMaster', () => {

  it('title works', () => {
    const entities = initialMentoringState.get("entities");
    const group = entities.getIn(["mentor_groups","1"]);

    const component = renderIntoDocument(
      <MentorGroupMaster entities={entities} group={group}/>
    );
    expect(component.title()).toEqual('Monday  Every 1st and 3rd Week');
  });


});


