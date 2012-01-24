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
  pending # express the regexp above with the code you wish you had
end

When /^I submit valid data for the new activity$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the new activity in the activities list$/ do
  pending # express the regexp above with the code you wish you had
end
