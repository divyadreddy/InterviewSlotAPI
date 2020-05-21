require 'test_helper'

class IntervieweeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get interviewee_new_url
    assert_response :success
  end

  test "should get create" do
    get interviewee_create_url
    assert_response :success
  end

  test "should get edit" do
    get interviewee_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get interviewee_destroy_url
    assert_response :success
  end

  test "should get show" do
    get interviewee_show_url
    assert_response :success
  end

  test "should get update" do
    get interviewee_update_url
    assert_response :success
  end

end
