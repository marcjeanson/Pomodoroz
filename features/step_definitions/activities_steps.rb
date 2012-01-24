Given /^the following activities exist:$/ do |activities|
  @activities = activities.hashes.collect { |activity| Activity.create! activity }
end

When /^I'm on the activities page$/ do
  visit activities_path
end

Then /^I should see all the activities$/ do
  @activities.each do |activity|
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
  page.should_have_content('Read email')
end
