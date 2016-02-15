import {List} from 'immutable';

const daysOfTheWeek = new Array(
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
);

function fullNameFromPerson(person) {
  if (person.get("last_name") == undefined && person.get("first_name") == undefined) {
    return "";
  } else {
    return person.get("last_name", "") + ", " + person.get("first_name", "")
  }
}

var getOrdinal = function(n) {
  var s=["th","st","nd","rd"],
      v=n%100;
  return n+(s[(v-20)%10]||s[v]||s[0]);
}

function buildTitleFromGroup(group) {
  var entries = group.get("schedule_entries");
  var day_name = daysOfTheWeek[entries.first().get('day_of_week')];
  var weeks = entries.map( entry => getOrdinal(entry.get('week_of_month'))).join(" and ");
  return day_name + "  Every " + weeks + " Week";
}

export function mapGroupFromState(group) {
  var title = buildTitleFromGroup(group);
  return {
    id: group.get('id'),
    name: group.get('name'),
    title: title,
    assignments: group.get('mentor_group_assignments', List()).map( function(assignment){
      return {
        id: assignment.get('id'),
        mentor_name: fullNameFromPerson(assignment.getIn(["volunteer","person"], new Map())),
        mentee_name: fullNameFromPerson(assignment.getIn(["client", "person"], new Map())),
        facility_ref_cd: assignment.getIn(["client","facility_ref_cd"]),
        comments: assignment.get("comments")
      }
    }).sortBy( ament => ament.mentor_name ).toArray()
  }
}

export function mapGroupsFromState(state) {
  console.log('in mapGroupsFromState');
  var group_map = state.getIn(["entities", "mentor_groups"], new Map([]));
  if (group_map.size == 0) {
    return [];
  } else {
    var groups = group_map.entrySeq().sortBy( pair => pair[1].get('name')).map( pair => {
      var group = pair[1];
      return mapGroupFromState(group);
    });
    return groups.toJS();
  }
}
