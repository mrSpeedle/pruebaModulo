require "test_helper"

class PostulacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get postulaciones_create_url
    assert_response :success
  end
end
