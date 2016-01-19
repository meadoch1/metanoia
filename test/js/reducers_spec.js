import {List, Map, fromJS} from 'immutable';
import {expect} from 'chai';

import reducer from '../../web/static/js/reducers';

describe('reducer', () => {

  it('handles SET_STATE', () => {
    const initialState = Map();
    const action = {
      type: 'SET_STATE',
      state: Map({
        groupSidebar: Map({ title: 'Welcome' }),
        groups: List.of(
          Map({
            name: 'Group 1',
            assignment_count: 10,
            title: 'The first group',
            assignments: List.of(
              Map({
                mentor_name: 'George One',
                mentee_name: 'Mentee One',
                facility_ref_cd: '0001',
                comments: 'comments 1'}),
              Map({
                mentor_name: 'George Two',
                mentee_name: 'Mentee Two',
                facility_ref_cd: '0002',
                comments: 'comments 2'})
            )
          })
        )
      })
    };
    const nextState = reducer(initialState, action);

    expect(nextState).to.equal(fromJS({
      groupSidebar: { title: 'Welcome' },
      groups: [
        {
          name: 'Group 1',
          assignment_count: 10,
          title: 'The first group',
          assignments: [
            {
              mentor_name: 'George One',
              mentee_name: 'Mentee One',
              facility_ref_cd: '0001',
              comments: 'comments 1'},
            {
              mentor_name: 'George Two',
              mentee_name: 'Mentee Two',
              facility_ref_cd: '0002',
              comments: 'comments 2'}
          ]
        }
      ]
    }));
  });
});
