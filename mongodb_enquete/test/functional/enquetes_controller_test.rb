require 'test_helper'

class EnquetesControllerTest < ActionController::TestCase
  setup do
    @enquete = enquetes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enquetes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enquete" do
    assert_difference('Enquete.count') do
      post :create, enquete: { name: @enquete.name }
    end

    assert_redirected_to enquete_path(assigns(:enquete))
  end

  test "should show enquete" do
    get :show, id: @enquete
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enquete
    assert_response :success
  end

  test "should update enquete" do
    put :update, id: @enquete, enquete: { name: @enquete.name }
    assert_redirected_to enquete_path(assigns(:enquete))
  end

  test "should destroy enquete" do
    assert_difference('Enquete.count', -1) do
      delete :destroy, id: @enquete
    end

    assert_redirected_to enquetes_path
  end
end
