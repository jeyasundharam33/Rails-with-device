require 'test_helper'

class CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get _comment" do
    get comment__comment_url
    assert_response :success
  end

  test "should get _form" do
    get comment__form_url
    assert_response :success
  end

end
