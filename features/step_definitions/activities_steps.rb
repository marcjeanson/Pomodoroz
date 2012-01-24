Given /^that activities exist$/ do
  create_activities
end

Given /^the following activities exist:$/ do |activities|
  activities_from_table(activities)
end

When /^I'm on the activities page$/ do
  visit activities_path
end

Then /^I should see all the activities$/ do
  activities.each do |activity|
    within_table('activities') do
      page.should have_content(activity.title)
    end
  end
end

Given /^I'm on the new activity page$/ do
  visit new_activity_path
end

When /^I submit valid data for the new activity$/ do
  fill_in('Title', with: 'Read email')
  click_on('Create Activity')
end

Then /^I should see the new activity in the activities list$/ do
  visit activities_path
  page.should have_content('Read email')
end

Then /^I should be able to navigate to the new activity page$/ do
  click_on('New Activity')
  current_path.should eq(new_activity_path)
end

When /^I delete an activity in the list$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the activity should be removed permanently$/ do
  pending # express the regexp above with the code you wish you had
end

World(ActivityHelper)
