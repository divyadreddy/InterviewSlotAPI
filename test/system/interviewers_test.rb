require "application_system_test_case"

class InterviewersTest < ApplicationSystemTestCase
  setup do
    @interviewer = interviewers(:one)
  end

  test "visiting the index" do
    visit interviewers_url
    assert_selector "h1", text: "Interviewers"
  end

  test "creating a Interviewer" do
    visit interviewers_url
    click_on "New Interviewer"

    fill_in "Email", with: @interviewer.email
    click_on "Create Interviewer"

    assert_text "Interviewer was successfully created"
    click_on "Back"
  end

  test "updating a Interviewer" do
    visit interviewers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @interviewer.email
    click_on "Update Interviewer"

    assert_text "Interviewer was successfully updated"
    click_on "Back"
  end

  test "destroying a Interviewer" do
    visit interviewers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interviewer was successfully destroyed"
  end
end
