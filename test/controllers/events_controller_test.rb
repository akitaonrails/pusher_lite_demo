require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get create" do
    post :create, pusher_event: { message: "Hello" }
    assert_response :success
  end

end
