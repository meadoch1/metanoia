import React from 'react';
import expect from 'expect';
import MentorGroupDetail from '../MentorGroupDetail';
import {initialMentoringState} from '../../util/initialMentoringState';

import {renderIntoDocument,
       scryRenderedDOMComponentsWithClass,
        findRenderedDOMComponentWithTag,
       Simulate} from 'react-addons-test-utils';

describe('MentorGroupDetail', () => {

  it('renders a detail line for the leader', () => {
    const entities = initialMentoringState.get("entities");
    const assignment = entities.getIn(["group_assignments","1"]);
    const leader_id = entities.getIn(
      ["mentor_groups", assignment.get("mentor_group_id").toString(), "leader_id"]);

    const component = renderIntoDocument(
      <MentorGroupDetail entities={entities} group_assignment={assignment} leader_id={leader_id}/>
    );
    expect(component.facilityRefCd()).toEqual('CLIENT1');
    expect(component.mentorGroupAssignmentId()).toEqual('1');
    expect(component.mentorName()).toEqual('Mendez, Basil');
    expect(component.menteeName()).toEqual('Drake, Zorita');
  });


});


