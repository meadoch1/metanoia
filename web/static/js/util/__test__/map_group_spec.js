import React from 'react';
import expect from 'expect';
import {initialMentoringState} from '../initialMentoringState';
import {List, Map} from 'immutable';

import { mapGroupFromState } from '../map_group'; 

// describe('mapGroupFromState', () => {
//   it('works', () => {
//     const initial = initialState.getIn(['entities', 'mentor_groups', '1']);
//     const result = mapGroupFromState(initial);
//     const expected = Map({
//       'assignments': List([
//         Map({
//           'comments': null,
//           'facility_ref_cd': '222222222',
//           'id': 121,
//           'mentee_name': "Chums, Carl",
//           'mentor_id': 245,
//           'mentor_name': "Backa, Chewy",
//           'assignments': List([

//           ])
//         })
//       ])
//     });
//     expect(result).toEqualImmutable(expected);
//   });

// });
