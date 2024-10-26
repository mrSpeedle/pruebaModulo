require "test_helper"

class OfertasLaboralesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ofertas_laborales_index_url
    assert_response :success
  end

  test "should get show" do
    get ofertas_laborales_show_url
    assert_response :success
  end

  test "should get new" do
    get ofertas_laborales_new_url
    assert_response :success
  end

  test "should get create" do
    get ofertas_laborales_create_url
    assert_response :success
  end

  test "should get edit" do
    get ofertas_laborales_edit_url
    assert_response :success
  end

  test "should get update" do
    get ofertas_laborales_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ofertas_laborales_destroy_url
    assert_response :success
  end
end
