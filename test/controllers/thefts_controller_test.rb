require 'test_helper'

class TheftsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get thefts_new_url
    assert_response :success
  end

  test "should get index" do
    get thefts_index_url
    assert_response :success
  end

end
