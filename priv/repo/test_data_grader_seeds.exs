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

alias Metanoia.Curriculum
recs = [
  %Curriculum{ id: 1, name: "Level 1" },
  %Curriculum{ id: 2, name: "Level 2" },
]
SeedHelper.do_insert(Curriculum, recs)

alias Metanoia.Course
recs = [
  %Course{ id: 1, name: "Ultimate Questions", level: "1", description: "This is a study of John Blanchard’s pamphlet entitled Ultimate Questions. This course presents God as the Great Creator and Redeemer of this world.", order_nr: 1, curriculum_id: 1 },
  %Course{ id: 2, name: "Biblical Christian Truths", level: "1", description: "This course is a biblically-based overview of the major doctrines of the Bible: The Doctrine of God, Man, Jesus Christ, Salvation and the Kingdom of God.", order_nr: 2, curriculum_id: 1 },
  %Course{ id: 3, name: "Am I Good Enough?", level: "2", description: "This course is a biblically-based in-depth study of salvation by grace, God’s justice and mercy, the fall, reconciliation, call, repentance, saving faith, justification, sanctification, perseverance, and the Christian life.", order_nr: 1, curriculum_id: 2 },
  %Course{ id: 4, name: "All Things Under His Feet", level: "2", description: "This course is a study of the book of Ephesians using John Stott’s book entitled The Message of Ephesians.", order_nr: 2, curriculum_id: 2 },
  %Course{ id: 5, name: "Learning to Live a Godly Life", level: "2", description: "This course is a study of the book of James, using Gordon Keddie’s book The Practical Christian. ", order_nr: 3, curriculum_id: 2 },
]
SeedHelper.do_insert(Course, recs)

alias Metanoia.Lesson
recs = [
  %Lesson{ id: 1, name: "Course 1 Lesson 1", order_nr: 1, course_id: 1 },
  %Lesson{ id: 2, name: "Course 1 Lesson 2", order_nr: 2, course_id: 1 },
  %Lesson{ id: 3, name: "Course 1 Lesson 3", order_nr: 3, course_id: 1 },
  %Lesson{ id: 4, name: "Course 1 Lesson 4", order_nr: 4, course_id: 1 },
  %Lesson{ id: 5, name: "Course 1 Lesson 5", order_nr: 5, course_id: 1 },
  %Lesson{ id: 6, name: "Course 1 Lesson 6", order_nr: 6, course_id: 1 },
  %Lesson{ id: 7, name: "Course 1 Lesson 7", order_nr: 7, course_id: 1 },
  %Lesson{ id: 8, name: "Course 1 Lesson 8", order_nr: 8, course_id: 1 },
  %Lesson{ id: 9, name: "Course 1 Lesson 9", order_nr: 9, course_id: 1 },
  %Lesson{ id: 10, name: "Course 1 Lesson 10", order_nr: 10, course_id: 1 },
  %Lesson{ id: 11, name: "Course 1 Lesson 11", order_nr: 11, course_id: 1 },
  %Lesson{ id: 12, name: "Course 1 Lesson 12", order_nr: 12, course_id: 1 },
  %Lesson{ id: 13, name: "Course 2 Lesson 1", order_nr: 1, course_id: 2 },
  %Lesson{ id: 14, name: "Course 2 Lesson 2", order_nr: 2, course_id: 2 },
  %Lesson{ id: 15, name: "Course 2 Lesson 3", order_nr: 3, course_id: 2 },
  %Lesson{ id: 16, name: "Course 2 Lesson 4", order_nr: 4, course_id: 2 },
  %Lesson{ id: 17, name: "Course 2 Lesson 5", order_nr: 5, course_id: 2 },
  %Lesson{ id: 18, name: "Course 2 Lesson 6", order_nr: 6, course_id: 2 },
  %Lesson{ id: 19, name: "Course 2 Lesson 7", order_nr: 7, course_id: 2 },
  %Lesson{ id: 20, name: "Course 2 Lesson 8", order_nr: 8, course_id: 2 },
  %Lesson{ id: 21, name: "Course 2 Lesson 9", order_nr: 9, course_id: 2 },
  %Lesson{ id: 22, name: "Course 2 Lesson 10", order_nr: 10, course_id: 2 },
  %Lesson{ id: 23, name: "Course 2 Lesson 11", order_nr: 11, course_id: 2 },
  %Lesson{ id: 24, name: "Course 2 Lesson 12", order_nr: 12, course_id: 2 },
  %Lesson{ id: 25, name: "Course 2 Lesson 13", order_nr: 13, course_id: 2 },
  %Lesson{ id: 26, name: "Course 2 Lesson 14", order_nr: 14, course_id: 2 },
  %Lesson{ id: 27, name: "Course 2 Lesson 15", order_nr: 15, course_id: 2 },
  %Lesson{ id: 28, name: "Course 2 Lesson 16", order_nr: 16, course_id: 2 },
  %Lesson{ id: 29, name: "Course 2 Lesson 17", order_nr: 17, course_id: 2 },
  %Lesson{ id: 30, name: "Course 1 Lesson 13", order_nr: 13, course_id: 3 },
  %Lesson{ id: 31, name: "Course 1 Lesson 14", order_nr: 14, course_id: 3 },
  %Lesson{ id: 32, name: "Course 1 Lesson 15", order_nr: 15, course_id: 3 },
  %Lesson{ id: 33, name: "Course 3 Lesson 1", order_nr: 1, course_id: 5 },
  %Lesson{ id: 34, name: "Course 3 Lesson 2", order_nr: 2, course_id: 5 },
  %Lesson{ id: 35, name: "Course 3 Lesson 3", order_nr: 3, course_id: 5 },
  %Lesson{ id: 36, name: "Course 3 Lesson 4", order_nr: 4, course_id: 5 },
  %Lesson{ id: 37, name: "Course 3 Lesson 5", order_nr: 5, course_id: 5 },
  %Lesson{ id: 38, name: "Course 3 Lesson 6", order_nr: 6, course_id: 5 },
  %Lesson{ id: 39, name: "Course 3 Lesson 7", order_nr: 7, course_id: 5 },
]
SeedHelper.do_insert(Lesson, recs)
