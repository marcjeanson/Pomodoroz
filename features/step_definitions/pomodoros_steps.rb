When /^I start the timer for an activity$/ do
  within("#activity_#{activity.id}") do
    click_on('Start')
  end
end

Then /^the timer should be counting down$/ do
  sleep 2
  within("#timer") do
    page.should_not have_content("25:00")
  end
end

When /^the pomodoro timer expires$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the pomodoro should be marked as completed$/ do
  pending # express the regexp above with the code you wish you had
end
