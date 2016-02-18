# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Metanoia.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule SeedHelper do
  alias Metanoia.Repo
  def do_insert(rec_type, vals) do
    for rec <- vals do
      old_rec = Repo.get(rec_type, rec.id)
      if old_rec == nil do
        Repo.insert!(rec)
      end
    end
  end
end

alias Metanoia.VolunteerStatus
recs = [
  %VolunteerStatus{ id: 1, name: "Preference Requested" },
  %VolunteerStatus{ id: 2, name: "Active" },
  %VolunteerStatus{ id: 3, name: "No Response" },
  %VolunteerStatus{ id: 4, name: "Temporary Leave" },
  %VolunteerStatus{ id: 5, name: "Temporary Leave until Further Notice" },
  %VolunteerStatus{ id: 6, name: "Refered to Mark" },
  %VolunteerStatus{ id: 7, name: "Resigned" },
  %VolunteerStatus{ id: 8, name: "Resigned - Lost Contact" },
]
SeedHelper.do_insert(VolunteerStatus, recs)


alias Metanoia.Facility
facs = [
  %Facility{ id: 1, name: "Walker State" },
  %Facility{ id: 2, name: "Hays State" }
]
SeedHelper.do_insert(Facility, facs)

alias Metanoia.Address
addresses = [
  %Address{ id: 1, line1: "5843 Hendrerit St.", city: "Herne", zip_code: "36740", state_id: 42, address_type_id: 1},
  %Address{ id: 2, line1: "2253 Non, Rd.", city: "Acquasanta Terme", zip_code: "99430", state_id: 5, address_type_id: 1},
  %Address{ id: 3, line1: "403 A, Ave", city: "Macklin", zip_code: "16775", state_id: 19, address_type_id: 1},
  %Address{ id: 4, line1: "P.O. Box 499, 1899 Tempus St.", city: "Betim", zip_code: "37645", state_id: 42, address_type_id: 1},
  %Address{ id: 5, line1: "Ap #393-2210 Tellus Ave", city: "Quillota", zip_code: "37646", state_id: 42, address_type_id: 1},
  %Address{ id: 6, line1: "P.O. Box 874, 6464 Nonummy Av.", city: "Ligney", zip_code: "38483", state_id: 42, address_type_id: 1}
]
SeedHelper.do_insert(Address, addresses)

alias Metanoia.Person
people = [
  %Person{ id: 1, first_name: "Basil", middle_name: "Barry", last_name: "Mendez", phone: "(671) 458-6564", mobile_phone: "(735) 247-1116", email: "fermentum@metus.co.uk", dob: "1933-06-06T11:07:19-08:00", work_phone: "(727) 139-2661", spouse_name: "Leigh", email2: "tristique@arcu.net", nickname: "Bar", address_id: 1 },
  %Person{ id: 2, first_name: "Zorita", middle_name: "Acton", last_name: "Drake", dob: "1953-06-06T11:07:19-08:00" },
  %Person{ id: 3, first_name: "Price", last_name: "Francis", phone: "(233) 711-5746", mobile_phone: "(449) 251-0439", email: "eget.dictum@odioNaminterdum.com", dob: "1939-06-29", work_phone: "(847) 726-1058", spouse_name: "Shea", email2: "pellentesque@Integer.net", nickname: "Money", address_id: 2 },
  %Person{ id: 4, first_name: "Irene", middle_name: "Bruno", last_name: "Cox", dob: "1975-03-04" },
  %Person{ id: 5, first_name: "Seth", middle_name: "Adrian", last_name: "Patterson", phone: "(203) 461-9805", mobile_phone: "(694) 614-0672", email: "nunc.sit@aliquetPhasellus.com", dob: "1969-06-29", work_phone: "(287) 384-4777", spouse_name: "Bree", address_id: 3 },
  %Person{ id: 6, first_name: "Richard", middle_name: "Alvin", last_name: "Valenzuela", dob: "1965-03-04" },
  %Person{ id: 7, first_name: "Gray", middle_name: "Gabriel", last_name: "Lloyd", phone: "(423) 342-9485", mobile_phone: "(423) 222-0672", email: "dolor@vestibulum.org", dob: "1979-07-29", address_id: 4 },
  %Person{ id: 8, first_name: "Mikayla", last_name: "Woods", dob: "1973-08-14" },
  %Person{ id: 9, first_name: "Lucian", middle_name: "Prescott", last_name: "Harvey", phone: "(423) 214-5849", mobile_phone: "(423) 853-1830", email: "sceleris@magna.net", dob: "1954-10-09", address_id: 5 },
  %Person{ id: 10, first_name: "Kasper", last_name: "Keith", dob: "1983-08-14" },
  %Person{ id: 11, first_name: "Keegan", last_name: "Hull", phone: "(423) 314-7647", mobile_phone: "(423) 402-9321", email: "vitae@condi.ca", dob: "1942-11-11", address_id: 6 },
  %Person{ id: 12, first_name: "Dillon", last_name: "Conway", dob: "1988-05-14" }
]
SeedHelper.do_insert(Person, people)


alias Metanoia.Volunteer
vols = [
  %Volunteer{ id: 1, note: "volunteer 1 note", person_id: 1, volunteer_status_id: 2, relationship_preference_id: 5 },
  %Volunteer{ id: 2, note: "volunteer 2 note", person_id: 3, volunteer_status_id: 2, relationship_preference_id: 5 },
  %Volunteer{ id: 3, note: "volunteer 3 note", person_id: 5, volunteer_status_id: 2, relationship_preference_id: 5 },
  %Volunteer{ id: 4, note: "volunteer 4 note", person_id: 7, volunteer_status_id: 2, relationship_preference_id: 5 },
  %Volunteer{ id: 5, note: "volunteer 5 note", person_id: 9, volunteer_status_id: 2, relationship_preference_id: 5 },
  %Volunteer{ id: 6, note: "volunteer 6 note", person_id: 11, volunteer_status_id: 2, relationship_preference_id: 5 }
]
SeedHelper.do_insert(Volunteer, vols)


alias Metanoia.Client
clients = [
  %Client{ id: 1, facility_ref_cd: "CLIENT1", earliest_out_dt: "2018-01-01", note: "Client 1 note", tentative_parole_month: "2017-01-01", max_possible_release_dt: "2029-01-01", comment: "Client 1 comment", person_id: 2, facility_id: 1, client_status_id: 1, parole_status_id: 1 },
  %Client{ id: 2, facility_ref_cd: "CLIENT2", earliest_out_dt: "2020-02-02", note: "Client 2 note", tentative_parole_month: "2017-02-02", max_possible_release_dt: "2029-02-02", comment: "Client 2 comment", person_id: 4, facility_id: 1, client_status_id: 1, parole_status_id: 1 },
  %Client{ id: 2, facility_ref_cd: "CLIENT3", earliest_out_dt: "2020-03-03", note: "Client 3 note", tentative_parole_month: "2017-03-03", max_possible_release_dt: "2029-03-03", comment: "Client 3 comment", person_id: 6, facility_id: 1, client_status_id: 1, parole_status_id: 1 },
  %Client{ id: 2, facility_ref_cd: "CLIENT4", earliest_out_dt: "2020-04-04", note: "Client 4 note", tentative_parole_month: "2017-04-04", max_possible_release_dt: "2029-04-04", comment: "Client 4 comment", person_id: 8, facility_id: 1, client_status_id: 1, parole_status_id: 1 },
  %Client{ id: 2, facility_ref_cd: "CLIENT5", earliest_out_dt: "2020-05-05", note: "Client 5 note", tentative_parole_month: "2017-05-05", max_possible_release_dt: "2029-05-05", comment: "Client 5 comment", person_id: 10, facility_id: 2, client_status_id: 1, parole_status_id: 1 },
  %Client{ id: 2, facility_ref_cd: "CLIENT6", earliest_out_dt: "2020-06-06", note: "Client 6 note", tentative_parole_month: "2017-06-06", max_possible_release_dt: "2029-06-06", comment: "Client 6 comment", person_id: 12, facility_id: 2, client_status_id: 1, parole_status_id: 1 }
]
SeedHelper.do_insert(Client, clients)

alias Metanoia.MentorGroup
groups = [
  %MentorGroup{id: 1, name: "WS Group 1", leader_id: 1, facility_id: 1 },
  %MentorGroup{id: 2, name: "WS Group 2", leader_id: 3, facility_id: 1 },
  %MentorGroup{id: 3, name: "HS Group 1", leader_id: 5, facility_id: 2 }
]
SeedHelper.do_insert(MentorGroup, groups)

alias Metanoia.MentorGroupAssignment
mgas = [
  %MentorGroupAssignment{ id: 1, comments: "mentor group assignment 1 comment", start_month: "2015-06-06", mentor_group_id: 1, volunteer_id: 1, client_id: 1, program_id: 2 },
  %MentorGroupAssignment{ id: 2, comments: "mentor group assignment 2 comment", start_month: "2013-02-02", mentor_group_id: 1, volunteer_id: 2, client_id: 2, program_id: 2 },
  %MentorGroupAssignment{ id: 3, comments: "mentor group assignment 3 comment", start_month: "2014-03-03", mentor_group_id: 2, volunteer_id: 3, client_id: 3, program_id: 2 },
  %MentorGroupAssignment{ id: 4, comments: "mentor group assignment 4 comment", start_month: "2015-04-04", mentor_group_id: 2, volunteer_id: 4, client_id: 4, program_id: 2 },
  %MentorGroupAssignment{ id: 5, comments: "mentor group assignment 5 comment", start_month: "2010-05-05", mentor_group_id: 3, volunteer_id: 5, client_id: 5, program_id: 2 },
  %MentorGroupAssignment{ id: 6, comments: "mentor group assignment 6 comment", start_month: "2012-06-06", mentor_group_id: 3, volunteer_id: 6, client_id: 6, program_id: 2 }
]
SeedHelper.do_insert(MentorGroupAssignment, mgas)

alias Metanoia.ScheduleEntry
schedules = [
  %ScheduleEntry{ id: 1, day_of_week: 1, week_of_month: 1, mentor_group_id: 1 },
  %ScheduleEntry{ id: 2, day_of_week: 1, week_of_month: 3, mentor_group_id: 1 },
  %ScheduleEntry{ id: 3, day_of_week: 3, week_of_month: 1, mentor_group_id: 2 },
  %ScheduleEntry{ id: 4, day_of_week: 3, week_of_month: 3, mentor_group_id: 2 },
  %ScheduleEntry{ id: 5, day_of_week: 5, week_of_month: 2, mentor_group_id: 3 },
  %ScheduleEntry{ id: 6, day_of_week: 5, week_of_month: 4, mentor_group_id: 3 }
]
SeedHelper.do_insert(ScheduleEntry, schedules)
