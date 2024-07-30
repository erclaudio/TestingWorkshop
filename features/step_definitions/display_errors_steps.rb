And ('I do not select an option for working irregular hours') do
    click_button 'Continue'
end

Then ('I should see an error message saying there is a problem') do
    expect(page).to have_content 'There is a problem'
    sleep 2

end

And ('I should see a request to answer this question') do
    # find(:xpath,"/html/body/div[3]/div/main/div/div/form/div/div[1]/div/div/ul/li/a").click
    within('div.govuk-form-group p') do
        expect(page).to have_content 'Please answer this question'
    end
    within('li.gem-c-error-summary__list-item') do
        expect(page).to have_content 'Please answer this question'
    end
end

And ('I do not select an option for time worked') do
    click_button 'Continue'
    sleep 2

end

And ('I do not select an option for leave year') do
    click_button 'Continue'
    sleep 2

end

And ('I do not input number of hours worked per week') do
    click_button 'Continue'
    sleep 2

end

And ('I input more than 168 hours worked per week') do
    fill_in 'response', with: '169'
    click_button 'Continue'
    sleep 2

end

And ('I should see an error message saying the maximum is 168 hours per week') do
    within('li.gem-c-error-summary__list-item') do
        expect(page).to have_content 'You can enter a maximum of 168 hours per week'
    end
    within('div.govuk-form-group p') do
        expect(page).to have_content 'You can enter a maximum of 168 hours per week'
    end
end

And ('I input less than 0 hours worked per week') do
    fill_in 'response', with: '-1'
    click_button 'Continue'
    sleep 2

end

And ('I should see a request to enter at least .5 hours worked') do
    within('li.gem-c-error-summary__list-item') do
        expect(page).to have_content 'Please enter at least .5 hours worked'
    end
    within('div.govuk-form-group p') do
        expect(page).to have_content 'Please enter at least .5 hours worked'
    end
end

And ('I do not input number of days worked per week') do
    click_button 'Continue'
    sleep 2

end

And ('I input more than 7 days worked per week') do
    fill_in 'response', with: '8'
    click_button 'Continue'
    sleep 2

end

And ('I should see an error message saying there are only 7 days in a week') do
    within('li.gem-c-error-summary__list-item') do
        expect(page).to have_content 'There are only 7 days in a week'
    end
    within('div.govuk-form-group p') do
        expect(page).to have_content 'There are only 7 days in a week'
    end
end