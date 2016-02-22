import {Map, List} from 'immutable';

export const initialMentoringState = Map({
  "entities": Map({
    "states": Map({
      "5": Map({
        "name": "California",
        "id": 5,
        "abbreviation": "CA"
      }),
      "19": Map({
        "name": "Maine",
        "id": 19,
        "abbreviation": "ME"
      }),
      "42": Map({
        "name": "Tennessee",
        "id": 42,
        "abbreviation": "TN"
      })
    }),
    "addresses": Map({
      "1": Map({
        "address_type": 1,
        "state_id": 42,
        "zip_code": "36740",
        "city": "Herne",
        "latitude": null,
        "longitude": null,
        "state": 42,
        "address_type_id": 1,
        "id": 1,
        "line1": "5843 Hendrerit St.",
        "line2": null
      }),
      "2": Map({
        "address_type": 1,
        "state_id": 5,
        "zip_code": "99430",
        "city": "Acquasanta Terme",
        "latitude": null,
        "longitude": null,
        "state": 5,
        "address_type_id": 1,
        "id": 2,
        "line1": "2253 Non, Rd.",
        "line2": null
      }),
      "3": Map({
        "address_type": 1,
        "state_id": 19,
        "zip_code": "16775",
        "city": "Macklin",
        "latitude": null,
        "longitude": null,
        "state": 19,
        "address_type_id": 1,
        "id": 3,
        "line1": "403 A, Ave",
        "line2": null
      }),
      "4": Map({
        "address_type": 1,
        "state_id": 42,
        "zip_code": "37645",
        "city": "Betim",
        "latitude": null,
        "longitude": null,
        "state": 42,
        "address_type_id": 1,
        "id": 4,
        "line1": "P.O. Box 499, 1899 Tempus St.",
        "line2": null
      }),
      "5": Map({
        "address_type": 1,
        "state_id": 42,
        "zip_code": "37646",
        "city": "Quillota",
        "latitude": null,
        "longitude": null,
        "state": 42,
        "address_type_id": 1,
        "id": 5,
        "line1": "Ap #393-2210 Tellus Ave",
        "line2": null
      }),
      "6": Map({
        "address_type": 1,
        "state_id": 42,
        "zip_code": "38483",
        "city": "Ligney",
        "latitude": null,
        "longitude": null,
        "state": 42,
        "address_type_id": 1,
        "id": 6,
        "line1": "P.O. Box 874, 6464 Nonummy Av.",
        "line2": null
      })
    }),
    "group_assignments": Map({
      "1": Map({
        "start_month": "2015-06-06",
        "program": 2,
        "volunteer": 1,
        "client": 1,
        "client_id": 1,
        "volunteer_id": 1,
        "comments": "mentor group assignment 1 comment",
        "program_id": 2,
        "mentor_group_id": 1,
        "id": 1
      }),
      "2": Map({
        "start_month": "2013-02-02",
        "program": 2,
        "volunteer": 2,
        "client": 2,
        "client_id": 2,
        "volunteer_id": 2,
        "comments": "mentor group assignment 2 comment",
        "program_id": 2,
        "mentor_group_id": 1,
        "id": 2
      }),
      "3": Map({
        "start_month": "2014-03-03",
        "program": 2,
        "volunteer": 3,
        "client": 3,
        "client_id": 3,
        "volunteer_id": 3,
        "comments": "mentor group assignment 3 comment",
        "program_id": 2,
        "mentor_group_id": 2,
        "id": 3
      }),
      "4": Map({
        "start_month": "2015-04-04",
        "program": 2,
        "volunteer": 4,
        "client": 4,
        "client_id": 4,
        "volunteer_id": 4,
        "comments": "mentor group assignment 4 comment",
        "program_id": 2,
        "mentor_group_id": 2,
        "id": 4
      }),
      "5": Map({
        "start_month": "2010-05-05",
        "program": 2,
        "volunteer": 5,
        "client": 5,
        "client_id": 5,
        "volunteer_id": 5,
        "comments": "mentor group assignment 5 comment",
        "program_id": 2,
        "mentor_group_id": 3,
        "id": 5
      }),
      "6": Map({
        "start_month": "2012-06-06",
        "program": 2,
        "volunteer": 6,
        "client": 6,
        "client_id": 6,
        "volunteer_id": 6,
        "comments": "mentor group assignment 6 comment",
        "program_id": 2,
        "mentor_group_id": 3,
        "id": 6
      })
    }),
    "clients": Map({
      "1": Map({
        "person_id": 2,
        "facility_ref_cd": "CLIENT1",
        "earliest_out_dt": "2018-01-01",
        "parole_status_id": 1,
        "note": "Client 1 note",
        "client_status_id": 1,
        "facility_address_text": null,
        "person": 2,
        "facility_id": 1,
        "tentative_parole_month": "2017-01-01",
        "id": 1,
        "max_possible_release_dt": "2029-01-01",
        "grader_address_text": null
      }),
      "2": Map({
        "person_id": 4,
        "facility_ref_cd": "CLIENT2",
        "earliest_out_dt": "2020-02-02",
        "parole_status_id": 1,
        "note": "Client 2 note",
        "client_status_id": 1,
        "facility_address_text": null,
        "person": 4,
        "facility_id": 1,
        "tentative_parole_month": "2017-02-02",
        "id": 2,
        "max_possible_release_dt": "2029-02-02",
        "grader_address_text": null
      }),
      "3": Map({
        "person_id": 6,
        "facility_ref_cd": "CLIENT3",
        "earliest_out_dt": "2020-03-03",
        "parole_status_id": 1,
        "note": "Client 3 note",
        "client_status_id": 1,
        "facility_address_text": null,
        "person": 6,
        "facility_id": 1,
        "tentative_parole_month": "2017-03-03",
        "id": 3,
        "max_possible_release_dt": "2029-03-03",
        "grader_address_text": null
      }),
      "4": Map({
        "person_id": 8,
        "facility_ref_cd": "CLIENT4",
        "earliest_out_dt": "2020-04-04",
        "parole_status_id": 1,
        "note": "Client 4 note",
        "client_status_id": 1,
        "facility_address_text": null,
        "person": 8,
        "facility_id": 1,
        "tentative_parole_month": "2017-04-04",
        "id": 4,
        "max_possible_release_dt": "2029-04-04",
        "grader_address_text": null
      }),
      "5": Map({
        "person_id": 10,
        "facility_ref_cd": "CLIENT5",
        "earliest_out_dt": "2020-05-05",
        "parole_status_id": 1,
        "note": "Client 5 note",
        "client_status_id": 1,
        "facility_address_text": null,
        "person": 10,
        "facility_id": 2,
        "tentative_parole_month": "2017-05-05",
        "id": 5,
        "max_possible_release_dt": "2029-05-05",
        "grader_address_text": null
      }),
      "6": Map({
        "person_id": 12,
        "facility_ref_cd": "CLIENT6",
        "earliest_out_dt": "2020-06-06",
        "parole_status_id": 1,
        "note": "Client 6 note",
        "client_status_id": 1,
        "facility_address_text": null,
        "person": 12,
        "facility_id": 2,
        "tentative_parole_month": "2017-06-06",
        "id": 6,
        "max_possible_release_dt": "2029-06-06",
        "grader_address_text": null
      })
    }),
    "volunteers": Map({
      "1": Map({
        "volunteer_status_id": 2,
        "relationship_preference_id": 5,
        "person_id": 1,
        "person": 1,
        "note": "volunteer 1 note",
        "mna_second_career": false,
        "id": 1
      }),
      "2": Map({
        "volunteer_status_id": 2,
        "relationship_preference_id": 5,
        "person_id": 3,
        "person": 3,
        "note": "volunteer 2 note",
        "mna_second_career": false,
        "id": 2
      }),
      "3": Map({
        "volunteer_status_id": 2,
        "relationship_preference_id": 5,
        "person_id": 5,
        "person": 5,
        "note": "volunteer 3 note",
        "mna_second_career": false,
        "id": 3
      }),
      "4": Map({
        "volunteer_status_id": 2,
        "relationship_preference_id": 5,
        "person_id": 7,
        "person": 7,
        "note": "volunteer 4 note",
        "mna_second_career": false,
        "id": 4
      }),
      "5": Map({
        "volunteer_status_id": 2,
        "relationship_preference_id": 5,
        "person_id": 9,
        "person": 9,
        "note": "volunteer 5 note",
        "mna_second_career": false,
        "id": 5
      }),
      "6": Map({
        "volunteer_status_id": 2,
        "relationship_preference_id": 5,
        "person_id": 11,
        "person": 11,
        "note": "volunteer 6 note",
        "mna_second_career": false,
        "id": 6
      })
    }),
    "address_types": Map({
      "1": Map({
        "name": "Home",
        "id": 1
      })
    }),
    "programs": Map({
      "2": Map({
        "name": "Mentor",
        "id": 2
      })
    }),
    "facilities": Map({
      "1": Map({
        "address_id": null,
        "name": "Walker State",
        "pop_gender_id": null,
        "chaplain_id": null,
        "courier": null,
        "security_level_id": null,
        "warden_id": null,
        "resident_address_id": null,
        "jurisdiction_id": null,
        "id": 1,
        "avg_daily_pop": null
      }),
      "2": Map({
        "address_id": null,
        "name": "Hays State",
        "pop_gender_id": null,
        "chaplain_id": null,
        "courier": null,
        "security_level_id": null,
        "warden_id": null,
        "resident_address_id": null,
        "jurisdiction_id": null,
        "id": 2,
        "avg_daily_pop": null
      })
    }),
    "mentor_groups": Map({
      "1": Map({
        "schedule_entries": List([1, 2]),
        "name": "WS Group 1",
        "mentor_group_assignments": List([1, 2]),
        "leader_id": 1,
        "id": 1,
        "facility_id": 1,
        "facility": 1
      }),
      "2": Map({
        "schedule_entries": List([3, 4]),
        "name": "WS Group 2",
        "mentor_group_assignments": List([3, 4]),
        "leader_id": 3,
        "id": 2,
        "facility_id": 1,
        "facility": 1
      }),
      "3": Map({
        "schedule_entries": List([5, 6]),
        "name": "HS Group 1",
        "mentor_group_assignments": List([5, 6]),
        "leader_id": 5,
        "id": 3,
        "facility_id": 2,
        "facility": 2
      })
    }),
    "schedules": Map({
      "1": Map({
        "week_of_month": 1,
        "mentor_group_id": 1,
        "id": 1,
        "day_of_week": 1
      }),
      "2": Map({
        "week_of_month": 3,
        "mentor_group_id": 1,
        "id": 2,
        "day_of_week": 1
      }),
      "3": Map({
        "week_of_month": 1,
        "mentor_group_id": 2,
        "id": 3,
        "day_of_week": 3
      }),
      "4": Map({
        "week_of_month": 3,
        "mentor_group_id": 2,
        "id": 4,
        "day_of_week": 3
      }),
      "5": Map({
        "week_of_month": 2,
        "mentor_group_id": 3,
        "id": 5,
        "day_of_week": 5
      }),
      "6": Map({
        "week_of_month": 4,
        "mentor_group_id": 3,
        "id": 6,
        "day_of_week": 5
      })
    }),
    "persons": Map({
      "11": Map({
        "work_phone": null,
        "pastor_id": null,
        "address_id": 6,
        "nickname": null,
        "phone": "(423) 314-7647",
        "suffix": null,
        "mobile_phone": "(423) 402-9321",
        "church_id": null,
        "last_name": "Hull",
        "address": 6,
        "spouse_name": null,
        "middle_name": null,
        "email2": null,
        "dob": "1942-11-11",
        "first_name": "Keegan",
        "id": 11,
        "email": "vitae@condi.ca"
      }),
      "12": Map({
        "work_phone": null,
        "pastor_id": null,
        "address_id": null,
        "nickname": null,
        "phone": null,
        "suffix": null,
        "mobile_phone": null,
        "church_id": null,
        "last_name": "Conway",
        "spouse_name": null,
        "middle_name": null,
        "email2": null,
        "dob": "1988-05-14",
        "first_name": "Dillon",
        "id": 12,
        "email": null
      }),
      "1": Map({
        "work_phone": "(727) 139-2661",
        "pastor_id": null,
        "address_id": 1,
        "nickname": "Bar",
        "phone": "(671) 458-6564",
        "suffix": null,
        "mobile_phone": "(735) 247-1116",
        "church_id": null,
        "last_name": "Mendez",
        "address": 1,
        "spouse_name": "Leigh",
        "middle_name": "Barry",
        "email2": "tristique@arcu.net",
        "dob": "1933-06-06",
        "first_name": "Basil",
        "id": 1,
        "email": "fermentum@metus.co.uk"
      }),
      "2": Map({
        "work_phone": null,
        "pastor_id": null,
        "address_id": null,
        "nickname": null,
        "phone": null,
        "suffix": null,
        "mobile_phone": null,
        "church_id": null,
        "last_name": "Drake",
        "spouse_name": null,
        "middle_name": "Acton",
        "email2": null,
        "dob": "1953-06-06",
        "first_name": "Zorita",
        "id": 2,
        "email": null
      }),
      "3": Map({
        "work_phone": "(847) 726-1058",
        "pastor_id": null,
        "address_id": 2,
        "nickname": "Money",
        "phone": "(233) 711-5746",
        "suffix": null,
        "mobile_phone": "(449) 251-0439",
        "church_id": null,
        "last_name": "Francis",
        "address": 2,
        "spouse_name": "Shea",
        "middle_name": null,
        "email2": "pellentesque@Integer.net",
        "dob": "1939-06-29",
        "first_name": "Price",
        "id": 3,
        "email": "eget.dictum@odioNaminterdum.com"
      }),
      "4": Map({
        "work_phone": null,
        "pastor_id": null,
        "address_id": null,
        "nickname": null,
        "phone": null,
        "suffix": null,
        "mobile_phone": null,
        "church_id": null,
        "last_name": "Cox",
        "spouse_name": null,
        "middle_name": "Bruno",
        "email2": null,
        "dob": "1975-03-04",
        "first_name": "Irene",
        "id": 4,
        "email": null
      }),
      "5": Map({
        "work_phone": "(287) 384-4777",
        "pastor_id": null,
        "address_id": 3,
        "nickname": null,
        "phone": "(203) 461-9805",
        "suffix": null,
        "mobile_phone": "(694) 614-0672",
        "church_id": null,
        "last_name": "Patterson",
        "address": 3,
        "spouse_name": "Bree",
        "middle_name": "Adrian",
        "email2": null,
        "dob": "1969-06-29",
        "first_name": "Seth",
        "id": 5,
        "email": "nunc.sit@aliquetPhasellus.com"
      }),
      "6": Map({
        "work_phone": null,
        "pastor_id": null,
        "address_id": null,
        "nickname": null,
        "phone": null,
        "suffix": null,
        "mobile_phone": null,
        "church_id": null,
        "last_name": "Valenzuela",
        "spouse_name": null,
        "middle_name": "Alvin",
        "email2": null,
        "dob": "1965-03-04",
        "first_name": "Richard",
        "id": 6,
        "email": null
      }),
      "7": Map({
        "work_phone": null,
        "pastor_id": null,
        "address_id": 4,
        "nickname": null,
        "phone": "(423) 342-9485",
        "suffix": null,
        "mobile_phone": "(423) 222-0672",
        "church_id": null,
        "last_name": "Lloyd",
        "address": 4,
        "spouse_name": null,
        "middle_name": "Gabriel",
        "email2": null,
        "dob": "1979-07-29",
        "first_name": "Gray",
        "id": 7,
        "email": "dolor@vestibulum.org"
      }),
      "8": Map({
        "work_phone": null,
        "pastor_id": null,
        "address_id": null,
        "nickname": null,
        "phone": null,
        "suffix": null,
        "mobile_phone": null,
        "church_id": null,
        "last_name": "Woods",
        "spouse_name": null,
        "middle_name": null,
        "email2": null,
        "dob": "1973-08-14",
        "first_name": "Mikayla",
        "id": 8,
        "email": null
      }),
      "9": Map({
        "work_phone": null,
        "pastor_id": null,
        "address_id": 5,
        "nickname": null,
        "phone": "(423) 214-5849",
        "suffix": null,
        "mobile_phone": "(423) 853-1830",
        "church_id": null,
        "last_name": "Harvey",
        "address": 5,
        "spouse_name": null,
        "middle_name": "Prescott",
        "email2": null,
        "dob": "1954-10-09",
        "first_name": "Lucian",
        "id": 9,
        "email": "sceleris@magna.net"
      }),
      "10": Map({
        "work_phone": null,
        "pastor_id": null,
        "address_id": null,
        "nickname": null,
        "phone": null,
        "suffix": null,
        "mobile_phone": null,
        "church_id": null,
        "last_name": "Keith",
        "spouse_name": null,
        "middle_name": null,
        "email2": null,
        "dob": "1983-08-14",
        "first_name": "Kasper",
        "id": 10,
        "email": null
      })
    })
  })
});

