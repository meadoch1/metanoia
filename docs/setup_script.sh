#!/bin/bash
mix phoenix.gen.json Address addresses address_type_id:references:address_types line1:string line2:string city:string state_id:references:states zip_code:string latitude:float longitude:float
mix phoenix.gen.json AddressType address_types name:string
mix phoenix.gen.json Church churches name:string address_id:references:addresses phone:string denomination_id:references:denominations presbytery_id:references:presbyteries one_time_support:boolean ongoing_support:boolean prayer_support:boolean newsletter:boolean
mix phoenix.gen.json Client clients person_id:references:persons facility_id:references:facilities facility_ref_cd:string earliest_out_dt:date client_status_id:references:client_status note:string facility_address_text:string grader_address_text:string parole_status_id:references:parole_status tentative_parole_month:date max_possible_release_dt:date
mix phoenix.gen.json ClientCommunication client_communications client_id:references:clients client_communication_type_id:references:client_communication_types sent_dt:date note:string
mix phoenix.gen.json ClientCommunicationType client_commmunication_types name:string contents:string
mix phoenix.gen.json ClientStatus client_status name:string
mix phoenix.gen.json ClientVolunteerAssignment client_volunteer_assignments client_id:references:clients program_id:references:programs volunteer_id:references:volunteers
mix phoenix.gen.json Course courses name:string level:string description:string order_nr:integer curriculum_id:references:curriculums
mix phoenix.gen.json Curriculum curriculums name:string description:string
mix phoenix.gen.json Denomination denominations name:string
mix phoenix.gen.json Facility facilities name:string address_id:references:addresses courier:string warden_id:references:persons chaplain_id:references:persons jurisdiction_id:references:jurisdictions security_level_id:references:security_levels avg_daily_pop:integer pop_gender_id:references:genders resident_address_id:references:addresses
mix phoenix.gen.json Gender genders name:string code:string
mix phoenix.gen.json Jurisdiction jurisdictions name:string
mix phoenix.gen.json Lesson lessons name:string description:string booklet:boolean order_nr:integer course_id:references:courses
mix phoenix.gen.json MentorGroup mentor_groups name:string leader_id:references:volunteers facility_id:references:facilities
mix phoenix.gen.json MentorGroupAssignment mentor_group_assignments mentor_group_id:references:mentor_groups volunteer_id:references:volunteers comments:string start_month:date
mix phoenix.gen.json ParoleStatus parole_status name:string
mix phoenix.gen.json Pastor pastors person_id:references:persons is_primary:boolean is_head:boolean
mix phoenix.gen.json Person persons first_name:string last_name:string middle_name:string address_id:references:addresses phone:string mobile_phone:string email:string church_id:references:churches pastor_id:references:pastors dob:date pastor_id:references:pastors work_phone:string spouse_name:string email2:string nickname:string suffix:string
mix phoenix.gen.json Presbytery presbyteries name:string
mix phoenix.gen.json Program programs name:string
mix phoenix.gen.json RelationshipPreference relationship_preferences name:string
mix phoenix.gen.json ScheduleEntry schedule_entries day_of_week:integer week_of_month:integer mentor_group_id:references:mentor_groups
mix phoenix.gen.json SecurityLevel security_levels name:string
mix phoenix.gen.json State states name:string abbreviation:string
mix phoenix.gen.json StudentLesson student_lessons student_id:references:clients lesson_id:references:lessons sent_dt:date received_dt:date grade:float
mix phoenix.gen.json User users username:string encrypted_password:string admin:boolean person_id:references:persons
mix phoenix.gen.json Volunteer volunteers person_id:references:persons volunteer_status_id:references:volunteer_status relationship_preference_id:references:relationship_preferences mna_second_career:boolean note:string
mix phoenix.gen.json VolunteerCredential volunteer_credentials credential_cd:string expiration_dt:date comment:string volunteer_id:references:volunteers facility_id:references:facilities
mix phoenix.gen.json VolunteerProgramAssignment volunteer_program_assignments volunteer_id:references:volunteer program_id:references:programs
mix phoenix.gen.json VolunteerStatus volunteer_status name:string
