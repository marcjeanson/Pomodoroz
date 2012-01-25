Given /^that I have activities$/ do
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
  fill_in('Title', with: valid_attributes[:title])
  click_on('Create Activity')
end

Then /^I should be able to navigate to the new activity page$/ do
  click_on('New Activity')
  current_path.should eq(new_activity_path)
end

When /^I delete an activity in the list$/ do
  within("#activity_#{activities.first.id}") do
    click_on('Delete')
  end
end

Then /^the activity should be removed permanently$/ do
  current_path.should eq(activities_path)
  page.should_not have_content(activities.first.title)
end

Given /^I'm editing an activity$/ do
  activity = create_activity("edit me")
  visit edit_activity_path(activity)
end

When /^I submit valid data for the activity$/ do
  fill_in('Title', with: valid_attributes[:title])
  click_on('Update Activity')
end

Then /^I should see the activity in the activities list$/ do
  visit activities_path
  page.should have_content(activity.title)
end

Then /^I should be able to navigate to the edit activity page$/ do
  activity_to_edit = activities.first
  within("#activity_#{activity_to_edit.id}") do
    click_on('Edit')
  end
  current_path.should eq(edit_activity_path(activity_to_edit))
end

When /^I mark and activity as completed$/ do
  within("#activity_#{Activity.first.id}") do
    check('Completed')  # likely want a dom id here if there is no label
  end
end

Then /^the activity should be registered as done$/ do
  Activity.first.completed?.should be_true
end

World(ActivityHelper)
