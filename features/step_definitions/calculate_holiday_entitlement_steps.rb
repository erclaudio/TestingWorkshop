response_hours, response_days = 37.5, 5.0

Given('I navigate to the homepage') do 
    visit 'https://www.gov.uk/calculate-your-holiday-entitlement'
    sleep 1
end

And('I should see the homepage') do
    expect(page).to have_title 'Calculate holiday entitlement - GOV.UK'
    expect(page).to have_css 'h1.govuk-heading-xl'
    expect(page).to have_link 'Start now'
    expect(page).to have_content 'Use this tool to calculate holiday entitlement for:'
end

When ("I click on the 'Start now' button") do
    click_link 'Start now'
end

And("I select the option no for working irregular hours") do
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
    sleep 20

    
end

And ('I should see the total entitlement hours') do
    expect(page).to have_content '210'
    sleep 20
    
    
end