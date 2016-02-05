import {fromJS} from 'immutable';

export const initialState = fromJS(
{
  "result": {
    "mentor_groups": [
      1
    ]
  },
  "entities": {
    "mentor_groups": {
      "1": {
        "facility_id": null,
        "id": 1,
        "leader_id": null,
        "mentor_group_assignments": [
          {
            "id": 120,
            "mentor_group_id": 1,
            "program_id": 2,
            "comments": null,
            "volunteer_id": 151,
            "client_id": 167,
            "client": {
              "grader_address_text": null,
              "max_possible_release_dt": "2020-02-17",
              "id": 167,
              "tentative_parole_month": null,
              "facility_id": null,
              "person": {
                "email": null,
                "id": 415,
                "first_name": "Bob",
                "dob": null,
                "email2": null,
                "middle_name": null,
                "spouse_name": null,
                "last_name": "Jones",
                "church_id": null,
                "mobile_phone": null,
                "suffix": null,
                "phone": null,
                "nickname": null,
                "address_id": null,
                "pastor_id": null,
                "work_phone": null
              },
              "facility_address_text": null,
              "client_status_id": null,
              "note": null,
              "parole_status_id": null,
              "earliest_out_dt": null,
              "facility_ref_cd": "1111111111",
              "person_id": 415
            },
            "volunteer": {
              "id": 151,
              "mna_second_career": false,
              "note": null,
              "person": {
                "email": null,
                "id": 244,
                "first_name": "Bill",
                "dob": null,
                "email2": "billybob@gmail.com",
                "middle_name": null,
                "spouse_name": "Jane",
                "address": {
                  "line2": null,
                  "line1": "2019 Smith Road",
                  "id": 141,
                  "address_type_id": 1,
                  "state": {
                    "abbreviation": "GA",
                    "id": 10,
                    "name": "Georgia"
                  },
                  "longitude": null,
                  "latitude": null,
                  "city": "Rossville",
                  "zip_code": null,
                  "state_id": 10,
                  "address_type": {
                    "id": 1,
                    "name": "Home"
                  }
                },
                "last_name": "Smith",
                "church_id": 11,
                "mobile_phone": "423-111-2222",
                "suffix": null,
                "phone": null,
                "nickname": null,
                "address_id": 141,
                "pastor_id": null,
                "work_phone": null
              },
              "person_id": 244,
              "relationship_preference_id": null,
              "volunteer_status_id": 2
            },
            "program": {
              "id": 2,
              "name": "Mentor"
            },
            "start_month": "2015-03-01"
          },
          {
            "id": 121,
            "mentor_group_id": 1,
            "program_id": 2,
            "comments": null,
            "volunteer_id": 152,
            "client_id": 119,
            "client": {
              "grader_address_text": null,
              "max_possible_release_dt": "2023-04-20",
              "id": 119,
              "tentative_parole_month": null,
              "facility_id": null,
              "person": {
                "email": null,
                "id": 367,
                "first_name": "Carl",
                "dob": null,
                "email2": null,
                "middle_name": null,
                "spouse_name": null,
                "last_name": "Chums",
                "church_id": null,
                "mobile_phone": null,
                "suffix": null,
                "phone": null,
                "nickname": null,
                "address_id": null,
                "pastor_id": null,
                "work_phone": null
              },
              "facility_address_text": null,
              "client_status_id": null,
              "note": null,
              "parole_status_id": null,
              "earliest_out_dt": null,
              "facility_ref_cd": "222222222",
              "person_id": 367
            },
            "volunteer": {
              "id": 152,
              "mna_second_career": false,
              "note": null,
              "person": {
                "email": null,
                "id": 245,
                "first_name": "Chewy",
                "dob": null,
                "email2": null,
                "middle_name": null,
                "spouse_name": "Cindy",
                "address": {
                  "line2": null,
                  "line1": "7323 Smith Drive",
                  "id": 142,
                  "address_type_id": 1,
                  "state": {
                    "abbreviation": "TN",
                    "id": 42,
                    "name": "Tennessee"
                  },
                  "longitude": null,
                  "latitude": null,
                  "city": "Chattanooga",
                  "zip_code": null,
                  "state_id": 42,
                  "address_type": {
                    "id": 1,
                    "name": "Home"
                  }
                },
                "last_name": "Backa",
                "church_id": 11,
                "mobile_phone": "423-333-4444",
                "suffix": null,
                "phone": null,
                "nickname": null,
                "address_id": 142,
                "pastor_id": null,
                "work_phone": null
              },
              "person_id": 245,
              "relationship_preference_id": null,
              "volunteer_status_id": 2
            },
            "program": {
              "id": 2,
              "name": "Mentor"
            },
            "start_month": "2015-03-01"
          }
        ],
        "name": "Group 6",
        "schedule_entries": [
          {
            "day_of_week": 4,
            "id": 23,
            "mentor_group_id": 1,
            "week_of_month": 2
          },
          {
            "day_of_week": 4,
            "id": 24,
            "mentor_group_id": 1,
            "week_of_month": 4
          }
        ]
      }
    }
  }
});
