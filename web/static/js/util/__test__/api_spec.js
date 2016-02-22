import {List, Map, fromJS} from 'immutable';
import expect from 'expect';
import jsonfile from 'jsonfile';

import {mapMentorGroupsToState} from '../api';
import {initialMentoringState} from '../initialMentoringState';

describe('mapMentorGroupsToState', () => {

  it('transforms Server Json into State', () => {
    const resultsFromServer = jsonfile.readFileSync("./test/fixtures/mentoring.json");

    const newState = mapMentorGroupsToState(resultsFromServer);

    expect(newState).toEqual(initialMentoringState);
  });
});
