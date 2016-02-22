export function nameFromPerson(person) {
  return person.get("last_name", "") + ", " + person.get("first_name")
}
