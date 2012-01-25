# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

activity1 = Activity.create title: "Read requirements document"
activity2 = Activity.create title: "Reinstall Visual Studio", completed: true
activity3 = Activity.create title: "Migrate from TFS to Git"

activity1.pomodoros.create completed_at: 1.day.ago
activity1.pomodoros.create reset_at: 2.days.ago
activity1.pomodoros.create completed_at: 3.days.ago

activity2.pomodoros.create completed_at: 1.day.ago

activity3.pomodoros.create completed_at: 1.day.ago
activity3.pomodoros.create completed_at: 2.days.ago
activity3.pomodoros.create completed_at: 4.days.ago
activity3.pomodoros.create reset_at: 2.days.ago
