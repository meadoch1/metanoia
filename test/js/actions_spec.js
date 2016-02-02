import {List, Map, fromJS} from 'immutable';
import {expect} from 'chai';

import {mapToState} from '../../web/static/js/actions';

describe('mapToState', () => {

  it('transforms Server Json into State', () => {
    const initialState = {"clients": [
      {"client_status_id": null, "earliest_out_dt": null, "facility_address_text": null, "facility_id": null, "facility_ref_cd": "1001014200", "grader_address_text": null, "id": 1, "max_possible_release_dt": "2022-08-01", "note": null, "parole_status_id": null, "person": {"address_id": null, "church_id": null, "dob": null, "email": null, "email2": null, "first_name": "John", "id": 3, "last_name": "Adams", "middle_name": null, "mobile_phone": null, "nickname": null, "pastor_id": null, "phone": null, "spouse_name": null, "suffix": null, "work_phone": null}, "person_id": 3, "tentative_parole_month": null},
      {"client_status_id": null, "earliest_out_dt": null, "facility_address_text": null, "facility_id": null, "facility_ref_cd": "1242123", "grader_address_text": null, "id": 2, "max_possible_release_dt": "2025-12-06", "note": null, "parole_status_id": null, "person": {"address_id": null, "church_id": null, "dob": null, "email": null, "email2": null, "first_name": "Jimmy", "id": 4, "last_name": "Smith", "middle_name": null, "mobile_phone": null, "nickname": null, "pastor_id": null, "phone": null, "spouse_name": null, "suffix": null, "work_phone": null}, "person_id": 4, "tentative_parole_month": null}
    ],
                          "group_assignments": [
                            {"comments": null, "id": 1, "mentor_group_id": 1, "start_month": "2013-07-01", "volunteer_id": 1, "client_id": 1, "program_id": 2},
                            {"comments": null, "id": 2, "mentor_group_id": 2, "start_month": "2014-11-01", "volunteer_id": 2, "client_id": 2, "program_id": 2}
                          ],
                          "mentor_groups": [
                            {"facility_id": null, "id": 1, "leader_id": 1, "name": "Group 1"},
                            {"facility_id": null, "id": 2, "leader_id": null, "name": "Group 2"}
                          ],
                          "schedules": [
                            {"day_of_week": 1, "id": 13, "mentor_group_id": 1, "week_of_month": 1},
                            {"day_of_week": 1, "id": 14, "mentor_group_id": 1, "week_of_month": 3},
                            {"day_of_week": 3, "id": 15, "mentor_group_id": 2, "week_of_month": 1},
                            {"day_of_week": 1, "id": 16, "mentor_group_id": 2, "week_of_month": 3},
                          ],
                          "volunteers": [
                            {"id": 1, "mna_second_career": false, "note": null, "person": {"address": {"address_type": {"id": 1, "name": "Home"}, "address_type_id": 1, "city": "Chattanooga", "id": 127, "latitude": null, "line1": "127 Drive", "line2": null, "longitude": null, "state": {"abbreviation": "TN", "id": 42, "name": "Tennessee"}, "state_id": 42, "zip_code": null}, "address_id": 127, "church_id": 4, "dob": null, "email": null, "email2": null, "first_name": "Bill", "id": 1, "last_name": "Brimm", "middle_name": null, "mobile_phone": "423-254-5550", "nickname": null, "pastor_id": null, "phone": null, "spouse_name": "Diane", "suffix": null, "work_phone": "423-777-9999"}, "person_id": 1, "relationship_preference_id": null, "volunteer_status_id": 2},
                            {"id": 2, "mna_second_career": false, "note": null, "person": {"address": {"address_type": {"id": 1, "name": "Home"}, "address_type_id": 1, "city": "Ringgold", "id": 128, "latitude": null, "line1": "128 Street", "line2": null, "longitude": null, "state": {"abbreviation": "GA", "id": 10, "name": "Georgia"}, "state_id": 10, "zip_code": null}, "address_id": 128, "church_id": 11, "dob": null, "email": null, "email2": null, "first_name": "Adam", "id": 2, "last_name": "Ant", "middle_name": null, "mobile_phone": null, "nickname": null, "pastor_id": null, "phone": null, "spouse_name": "Teri", "suffix": null, "work_phone": null}, "person_id": 2, "relationship_preference_id": null, "volunteer_status_id": 2}
                          ]
                         };
    const newState = mapToState(initialState);

    expect(newState).to.equal( fromJS({
      //groupSidebar: { title: 'Welcome' },
        entities: {
          address_types: {
            1: {
              id: 1,
              name: "Home"
            }
          },
          addresses: {
            127: {
              address_type: 1,
              address_type_id: 1,
              city: "Chattanooga",
              id: 127,
              latitude: null,
              line1: "127 Drive",
              line2: null,
              longitude: null,
              state: 42,
              state_id: 42,
              zip_code: null
            },
            128: {
              address_type: 1,
              address_type_id: 1,
              city: "Ringgold",
              id: 128,
              latitude: null,
              line1: "128 Street",
              line2: null,
              longitude: null,
              state: 10,
              state_id: 10,
              zip_code: null
            }
          },
          clients: {
            1: {
              client_status_id: null,
              earliest_out_dt: null,
              facility_address_text: null,
              facility_id: null,
              facility_ref_cd: "1001014200",
              grader_address_text: null,
              id: 1,
              max_possible_release_dt: "2022-08-01",
              note: null,
              parole_status_id: null,
              person: 3,
              person_id: 3,
              tentative_parole_month: null
            },
            2: {
              client_status_id: null,
              earliest_out_dt: null,
              facility_address_text: null,
              facility_id: null,
              facility_ref_cd: "1242123",
              grader_address_text: null,
              id: 2,
              max_possible_release_dt: "2025-12-06",
              note: null,
              parole_status_id: null,
              person: 4,
              person_id: 4,
              tentative_parole_month: null
            }
          },
          group_assignments: {
            1: {
              client_id: 1,
              comments: null,
              id: 1,
              mentor_group_id: 1,
              program_id: 2,
              start_month: "2013-07-01",
              volunteer_id: 1
            },
            2: {
              client_id: 2,
              comments: null,
              id: 2,
              mentor_group_id: 2,
              program_id: 2,
              start_month: "2014-11-01",
              volunteer_id: 2
            }
          },
          mentor_groups: {
            1: {
              facility_id: null,
              id: 1,
              leader_id: 1,
              name: "Group 1"
            },
            2: {
              facility_id: null,
              id: 2,
              leader_id: null,
              name: "Group 2"
            }
          },
          persons: {
            1: {
              address: 127,
              address_id: 127,
              church_id: 4,
              dob: null,
              email: null,
              email2: null,
              first_name: "Bill",
              id: 1,
              last_name: "Brimm",
              middle_name: null,
              mobile_phone: "423-254-5550",
              nickname: null,
              pastor_id: null,
              phone: null,
              spouse_name: "Diane",
              suffix: null,
              work_phone: "423-777-9999"
            },
            2: {
              address: 128,
              address_id: 128,
              church_id: 11,
              dob: null,
              email: null,
              email2: null,
              first_name: "Adam",
              id: 2,
              last_name: "Ant",
              middle_name: null,
              mobile_phone: null,
              nickname: null,
              pastor_id: null,
              phone: null,
              spouse_name: "Teri",
              suffix: null,
              work_phone: null
            },
            3: {
              address_id: null,
              church_id: null,
              dob: null,
              email: null,
              email2: null,
              first_name: "John",
              id: 3,
              last_name: "Adams",
              middle_name: null,
              mobile_phone: null,
              nickname: null,
              pastor_id: null,
              phone: null,
              spouse_name: null,
              suffix: null,
              work_phone: null
            },
            4: {
              address_id: null,
              church_id: null,
              dob: null,
              email: null,
              email2: null,
              first_name: "Jimmy",
              id: 4,
              last_name: "Smith",
              middle_name: null,
              mobile_phone: null,
              nickname: null,
              pastor_id: null,
              phone: null,
              spouse_name: null,
              suffix: null,
              work_phone: null
            }
          },
          schedules: {
            13: {
              day_of_week: 1,
              id: 13,
              mentor_group_id: 1,
              week_of_month: 1
            },
            14: {
              day_of_week: 1,
              id: 14,
              mentor_group_id: 1,
              week_of_month: 3
            },
            15: {
              day_of_week: 3,
              id: 15,
              mentor_group_id: 2,
              week_of_month: 1
            },
            16: {
              day_of_week: 1,
              id: 16,
              mentor_group_id: 2,
              week_of_month: 3
            }
          },
          states: {
            10: {
              abbreviation: "GA",
              id: 10,
              name: "Georgia"
            },
            42: {
              abbreviation: "TN",
              id: 42,
              name: "Tennessee"
            }
          },
          volunteers: {
            1: {
              id: 1,
              mna_second_career: false,
              note: null,
              person: 1,
              person_id: 1,
              relationship_preference_id: null,
              volunteer_status_id: 2
            },
            2: {
              id: 2,
              mna_second_career: false,
              note: null,
              person: 2,
              person_id: 2,
              relationship_preference_id: null,
              volunteer_status_id: 2
            }
          }
        },
        result: {
          clients: [
            1,
            2
          ],
          group_assignments: [
            1,
            2
          ],
          mentor_groups: [
            1,
            2
          ],
          schedules: [
            13,
            14,
            15,
            16
          ],
          volunteers: [
            1,
            2
          ]
        }
    })
    );
  });
});
