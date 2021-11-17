require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get account_signup_url
    assert_response :success
  end

end
