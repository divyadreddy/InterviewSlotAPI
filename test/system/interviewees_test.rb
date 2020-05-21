require "application_system_test_case"

class IntervieweesTest < ApplicationSystemTestCase
  setup do
    @interviewee = interviewees(:one)
  end

  test "visiting the index" do
    visit interviewees_url
    assert_selector "h1", text: "Interviewees"
  end

  test "creating a Interviewee" do
    visit interviewees_url
    click_on "New Interviewee"

    fill_in "Email", with: @interviewee.email
    click_on "Create Interviewee"

    assert_text "Interviewee was successfully created"
    click_on "Back"
  end

  test "updating a Interviewee" do
    visit interviewees_url
    click_on "Edit", match: :first

    fill_in "Email", with: @interviewee.email
    click_on "Update Interviewee"

    assert_text "Interviewee was successfully updated"
    click_on "Back"
  end

  test "destroying a Interviewee" do
    visit interviewees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interviewee was successfully destroyed"
  end
end
