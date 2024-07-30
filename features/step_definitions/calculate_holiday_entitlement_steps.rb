response_hours, response_days = 37.5, 5.0
# SCENARIO HOMEPAGE IS VISIBLE
Given('I navigate to the homepage') do 
    visit 'https://www.gov.uk/calculate-your-holiday-entitlement'
    sleep 0
end

And('I should see the homepage') do
    expect(page).to have_title 'Calculate holiday entitlement - GOV.UK'
    expect(page).to have_css 'h1.govuk-heading-xl'
    expect(page).to have_link 'Start now'
    expect(page).to have_content 'Use this tool to calculate holiday entitlement for:'
end
# SCENARIO CALCULATE THE CORRECT HOLIDAY ENTITLEMENT FOR AN EMPLOYEE WHO WORKS REGULAR HOURS
When ("I click on the 'Start now' button") do
    click_link 'Start now'
end

And('I select the option no for working irregular hours') do
    choose('No', allow_label_click: true)
    click_button 'Continue'
end

And ('I select the option hours worked per week') do
    choose('response-1', allow_label_click: true)
    click_button 'Continue'
end

And ('I select the option for a full leave year') do
    choose('response-0', allow_label_click:true)
    click_button 'Continue'
 
      
end

And ('I input 37.5 hours worked per week') do
    fill_in 'response', with: '37.5'
    click_button 'Continue'
     
end

And ('I input 5 days worked per week') do
    fill_in 'response', with: '5'
    click_button 'Continue'
end

Then ('I should see the correct submitted answers') do
    within('div.gem-c-summary-list') do
        expect(page).to have_css('dd.govuk-summary-list__value', text: 'No')
        expect(page).to have_css('dd.govuk-summary-list__value', text: 'hours worked per week')
        expect(page).to have_css('dd.govuk-summary-list__value', text: 'for a full leave year')
        expect(page).to have_css('dd.govuk-summary-list__value', text: '37.5')
        expect(page).to have_css('dd.govuk-summary-list__value', text: '5.0')
    end
    sleep 0

    
end

And ('I should see the total entitlement hours') do
    expect(page).to have_content '210'
    sleep 0
    
    
end

# SCENARIO Calculate the correct holiday entitlement for an employee who works irregular hours



And('I select the option yes for working irregular hours') do
    choose('Yes', allow_label_click: true)
    click_button 'Continue'
end

And ('I input 10 October 2024 for the the date the leave starts') do
    fill_in 'response-0', with: '10'
    fill_in 'response-1', with: '10'
    fill_in 'response-2', with: '2024'
    click_button 'Continue'
end
     

And ('I input 375 work hours for the hours worked in the pay period') do
    fill_in 'response', with: '375'
    click_button 'Continue'
end

Then ('I should see the correct total entitlement hours') do
    expect(page).to have_content 'The statutory entitlement for this pay period is 45 hours.'
    sleep 0
    
    
end

# SCENARIO UPDATES CALCULATIONS WHEN VALUE IS UPDATED
When ("I click 'change' for the hours worked in the pay period") do
    # click_link('a[href="/calculate-your-holiday-entitlement/y/irregular-hours-and-part-year/2024-10-10?previous_response=375.0"]')
    find('a[data-module="ga4-link-tracker"][href="/calculate-your-holiday-entitlement/y/irregular-hours-and-part-year/2024-10-10?previous_response=375.0"]').click

end


And ('I input 450 hours')do
    fill_in 'response', with:'450'
    click_button 'Continue'
end

Then ('I should see the new correct total entitlement hours')do
    expect(page).to have_content 'The statutory entitlement for this pay period is 54 hours.'
    sleep 0

end

# SCENARIO  Calculate the correct holiday entitlement 
# for an employee who works regular
# hours and entitlement based 
# on annualised hours

And ('I select the option for annualised hours')do
    choose('response-2', allow_label_click: true)
    click_button 'Continue'
end

And('I select the option for someone starting and leaving part way through a leave year')do 
    choose('response-3', allow_label_click: true)
    click_button 'Continue'
end

And ('I input 1 January 2024 for the employment start date') do 
    fill_in 'response-0', with: '1'
    fill_in 'response-1', with: '1'
    fill_in 'response-2', with: '2024'
    click_button 'Continue'
end
   
And ('I input 20 July 2024 for the employment end date')do
    fill_in 'response-0', with: '20'
    fill_in 'response-1', with: '07'
    fill_in 'response-2', with: '2024'
    click_button 'Continue'
end

Then ('I should see the correct total entitlement based on annualised hours')do
    expect(page).to have_content 'The statutory holiday entitlement is'
end

# SCENARIO Calculate the correct holiday
#  entitlement for an employee who works 
#  regular hours and entitlement based 
#  on compressed hours


And ('I select the option for compressed hours')do
    choose 'response-3', allow_label_click: true
    click_button 'Continue'
end

And ('I select the option for someone leaving part way through a leave year')do
    choose('response-2', allow_label_click: true) 
    click_button 'Continue'
end

And ('I input 12 July 2024 for the employment end date')do
    fill_in 'response-0', with: '12'
    fill_in 'response-1', with: '07'
    fill_in 'response-2', with: '2024'

    click_button 'Continue'
  
end

And ('I input 4 April 2024 dor the leave year start')do
fill_in 'response-0', with: '04'
fill_in 'response-1', with: '04'
fill_in 'response-2', with: '2024'
click_button 'Continue'
end

And ('I input 16 for the hours worked per week')do

#   fill_in :xpath, "/html/body/div[3]/div/main/div/div/form/div/div/input", with: '16'
    # find(:xpath, "/html/body/div[3]/div/main/div/div/form/div/div/input").set('16')
    fill_in 'response',with: '16'
    click_button 'Continue'
end

And ('I input 4 for the days worked per week')do
    fill_in 'response', with: '4'
    click_button 'Continue'
end      

Then ('I should see the correct total entitlement based on compressed hours')do
    expect(page).to have_content 'The statutory holiday entitlement is'
end


# SCENARIO Calculate the correct holiday 
# entitlement for an employee who works regular 
# hours and entitlement based on shifts

And ('I select the option for shifts') do
    choose 'response-4', allow_label_click: true
    click_button 'Continue'
end

And ('I select the option for someone starting part way through a leave year') do
    choose 'response-1', allow_label_click: true
    sleep 0
    click_button 'Continue'
end

And ('I input 12 July 2024 for the employment start date') do
    fill_in 'response-0', with: '12'
    fill_in 'response-1', with: '07'
    fill_in 'response-2', with: '2024'
    click_button 'Continue'
end

And ('I input 5 for the hours worked per shift') do
    fill_in 'response', with: '5'
    click_button 'Continue'
end

And ('I input 12 for the shifts per shift pattern') do
    fill_in 'response', with: '12'
    click_button 'Continue'
end

And ('I input 30 for the days in a shift pattern') do
    fill_in 'response', with: '30'
    click_button 'Continue'

end

Then ('I should see the correct total entitlement based on shifts') do
    expect(page).to have_content 'The statutory holiday entitlement is 12 shifts for the year. Each shift being 5.0 hours.' 
    sleep 0
end 