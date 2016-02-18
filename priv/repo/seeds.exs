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

alias Metanoia.Gender
genders = [
  %Gender{ id: 1, name: "Female", code: "F" },
  %Gender{ id: 2, name: "Male", code: "M" }
]
SeedHelper.do_insert(Gender, genders)

alias Metanoia.Program
recs = [
  %Program{ id: 1, name: "Grader" },
  %Program{ id: 2, name: "Mentor" }
]
SeedHelper.do_insert(Program, recs)

alias Metanoia.ClientCommunicationType
recs = [
  %ClientCommunicationType{ id: 1, name: "Follow-up Letter #1" },
  %ClientCommunicationType{ id: 3, name: "Follow-up Letter #2" },
  %ClientCommunicationType{ id: 4, name: "Level 1 Grad Package" },
  %ClientCommunicationType{ id: 5, name: "Level 2 Grad Package" },
]
SeedHelper.do_insert(ClientCommunicationType, recs)

alias Metanoia.AddressType
recs = [
  %AddressType{ id: 1, name: "Home" },
  %AddressType{ id: 2, name: "Office" },
  %AddressType{ id: 3, name: "Prison" },
]
SeedHelper.do_insert(AddressType, recs)

alias Metanoia.ClientStatus
recs = [
  %ClientStatus{ id: 1, name: "Active" },
  %ClientStatus{ id: 2, name: "InActive" },
  %ClientStatus{ id: 3, name: "Ligonier Enrollment" },
]
SeedHelper.do_insert(ClientStatus, recs)

alias Metanoia.State
recs = [
  %State{ id: 1, name: "Alabama", abbreviation: "AL" },
  %State{ id: 2, name: "Alaska", abbreviation: "AK" },
  %State{ id: 3, name: "Arizona", abbreviation: "AZ" },
  %State{ id: 4, name: "Arkansas", abbreviation: "AR" },
  %State{ id: 5, name: "California", abbreviation: "CA" },
  %State{ id: 6, name: "Colorado", abbreviation: "CO" },
  %State{ id: 7, name: "Connecticut", abbreviation: "CT" },
  %State{ id: 8, name: "Delaware", abbreviation: "DE" },
  %State{ id: 9, name: "Florida", abbreviation: "FL" },
  %State{ id: 10, name: "Georgia", abbreviation: "GA" },
  %State{ id: 11, name: "Hawaii", abbreviation: "HI" },
  %State{ id: 12, name: "Idaho", abbreviation: "ID" },
  %State{ id: 13, name: "Illinois", abbreviation: "IL" },
  %State{ id: 14, name: "Indiana", abbreviation: "IN" },
  %State{ id: 15, name: "Iowa", abbreviation: "IA" },
  %State{ id: 16, name: "Kansas", abbreviation: "KS" },
  %State{ id: 17, name: "Kentucky", abbreviation: "KY" },
  %State{ id: 18, name: "Louisiana", abbreviation: "LA" },
  %State{ id: 19, name: "Maine", abbreviation: "ME" },
  %State{ id: 20, name: "Maryland", abbreviation: "MD" },
  %State{ id: 21, name: "Massachusetts", abbreviation: "MA" },
  %State{ id: 22, name: "Michigan", abbreviation: "MI" },
  %State{ id: 23, name: "Minnesota", abbreviation: "MN" },
  %State{ id: 24, name: "Mississippi", abbreviation: "MS" },
  %State{ id: 25, name: "Missouri", abbreviation: "MO" },
  %State{ id: 26, name: "Montana", abbreviation: "MT" },
  %State{ id: 27, name: "Nebraska", abbreviation: "NE" },
  %State{ id: 28, name: "Nevada", abbreviation: "NV" },
  %State{ id: 29, name: "New Hampshire", abbreviation: "NH" },
  %State{ id: 30, name: "New Jersey", abbreviation: "NJ" },
  %State{ id: 31, name: "New Mexico", abbreviation: "NM" },
  %State{ id: 32, name: "New York", abbreviation: "NY" },
  %State{ id: 33, name: "North Carolina", abbreviation: "NC" },
  %State{ id: 34, name: "North Dakota", abbreviation: "ND" },
  %State{ id: 35, name: "Ohio", abbreviation: "OH" },
  %State{ id: 36, name: "Oklahoma", abbreviation: "OK" },
  %State{ id: 37, name: "Oregon", abbreviation: "OR" },
  %State{ id: 38, name: "Pennsylvania", abbreviation: "PA" },
  %State{ id: 39, name: "Rhode Island", abbreviation: "RI" },
  %State{ id: 40, name: "South Carolina", abbreviation: "SC" },
  %State{ id: 41, name: "South Dakota", abbreviation: "SD" },
  %State{ id: 42, name: "Tennessee", abbreviation: "TN" },
  %State{ id: 43, name: "Texas", abbreviation: "TX" },
  %State{ id: 44, name: "Utah", abbreviation: "UT" },
  %State{ id: 45, name: "Vermont", abbreviation: "VT" },
  %State{ id: 46, name: "Virginia", abbreviation: "VA" },
  %State{ id: 47, name: "Washington", abbreviation: "WA" },
  %State{ id: 48, name: "West Virginia", abbreviation: "WV" },
  %State{ id: 49, name: "Wisconsin", abbreviation: "WI" },
  %State{ id: 50, name: "Wyoming", abbreviation: "WY" },
]
SeedHelper.do_insert(State, recs)

alias Metanoia.Jurisdiction
recs = [
  %Jurisdiction{ id: 1, name: "County" },
  %Jurisdiction{ id: 2, name: "Federal" },
  %Jurisdiction{ id: 3, name: "State" },
  %Jurisdiction{ id: 4, name: "State-Private" },
]
SeedHelper.do_insert(Jurisdiction, recs)

alias Metanoia.SecurityLevel
recs = [
  %SecurityLevel{ id: 1, name: "Close" },
  %SecurityLevel{ id: 2, name: "Level 1" },
  %SecurityLevel{ id: 3, name: "Level 1 High" },
  %SecurityLevel{ id: 4, name: "Level 2" },
  %SecurityLevel{ id: 5, name: "Level 3" },
  %SecurityLevel{ id: 6, name: "Level 4" },
  %SecurityLevel{ id: 7, name: "Level 4 High" },
  %SecurityLevel{ id: 8, name: "Level 5" },
  %SecurityLevel{ id: 9, name: "Level 6 Maximum" },
  %SecurityLevel{ id: 10, name: "Maximum" },
  %SecurityLevel{ id: 11, name: "Medium" },
  %SecurityLevel{ id: 12, name: "Medium/Minimum" },
  %SecurityLevel{ id: 13, name: "Minimum" },
  %SecurityLevel{ id: 14, name: "Multi-Level" },
  %SecurityLevel{ id: 15, name: "Pre-Release" },
]
SeedHelper.do_insert(SecurityLevel, recs)

alias Metanoia.Denomination
recs = [
  %Denomination{ id: 1, name: "ARBCA" },
  %Denomination{ id: 2, name: "ARP" },
  %Denomination{ id: 3, name: "FORC" },
  %Denomination{ id: 4, name: "OPC" },
  %Denomination{ id: 5, name: "PCA" },
  %Denomination{ id: 6, name: "PRC" },
  %Denomination{ id: 7, name: "RCUS" },
  %Denomination{ id: 8, name: "RPC" },
  %Denomination{ id: 9, name: "RPCNA" },
  %Denomination{ id: 10, name: "RPCUS" },
  %Denomination{ id: 11, name: "URC" },
]
SeedHelper.do_insert(Denomination, recs)

alias Metanoia.Presbytery
recs = [
  %Presbytery{ id: 1, name: "Home" },
  %Presbytery{ id: 2, name: "Office" },
  %Presbytery{ id: 3, name: "Prison" },
  %Presbytery{ id: 4, name: "Blue Ridge" },
  %Presbytery{ id: 5, name: "C. Carolina" },
  %Presbytery{ id: 6, name: "C. Georgia" },
  %Presbytery{ id: 7, name: "Calvery" },
  %Presbytery{ id: 8, name: "Chesapeake" },
  %Presbytery{ id: 9, name: "Covenant" },
  %Presbytery{ id: 10, name: "E. Carolina" },
  %Presbytery{ id: 11, name: "Fellowship" },
  %Presbytery{ id: 12, name: "Georgia Foothills" },
  %Presbytery{ id: 13, name: "Heritage" },
  %Presbytery{ id: 14, name: "Illiana" },
  %Presbytery{ id: 15, name: "James River" },
  %Presbytery{ id: 16, name: "Metro Atlanta" },
  %Presbytery{ id: 17, name: "Mid-Atlantic" },
  %Presbytery{ id: 18, name: "Nashville" },
  %Presbytery{ id: 19, name: "New River" },
  %Presbytery{ id: 20, name: "NW. Georgia" },
  %Presbytery{ id: 21, name: "Ohio" },
  %Presbytery{ id: 22, name: "Ohio Valley" },
  %Presbytery{ id: 23, name: "Palmetto" },
  %Presbytery{ id: 24, name: "Piedmont Triad" },
  %Presbytery{ id: 25, name: "Pittsburg" },
  %Presbytery{ id: 26, name: "Potomac" },
  %Presbytery{ id: 27, name: "Savannah River" },
  %Presbytery{ id: 28, name: "Southeast" },
  %Presbytery{ id: 29, name: "TN Valley" },
  %Presbytery{ id: 30, name: "W. Carolina" },
  %Presbytery{ id: 31, name: "Westminster" },
]
SeedHelper.do_insert(Presbytery, recs)

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

alias Metanoia.RelationshipPreference
recs = [
  %RelationshipPreference{ id: 1, name: "Female" },
  %RelationshipPreference{ id: 2, name: "R/S Female" },
  %RelationshipPreference{ id: 3, name: "A/S Female" },
  %RelationshipPreference{ id: 4, name: "A/S Male" },
  %RelationshipPreference{ id: 5, name: "Male" },
  %RelationshipPreference{ id: 6, name: "A/S Male 3x (Spread Out)" },
]
SeedHelper.do_insert(RelationshipPreference, recs)

alias Metanoia.ParoleStatus
recs = [
  %ParoleStatus{ id: 1, name: "No Decision" },
  %ParoleStatus{ id: 2, name: "Not Eligible" },
  %ParoleStatus{ id: 3, name: "LIFE" },
  %ParoleStatus{ id: 4, name: "Eligible" },
]
SeedHelper.do_insert(ParoleStatus, recs)
