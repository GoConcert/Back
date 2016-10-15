require 'test_helper'

class ConcertPreferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @concert_preference = concert_preferences(:one)
  end

  test "should get index" do
    get concert_preferences_url
    assert_response :success
  end

  test "should get new" do
    get new_concert_preference_url
    assert_response :success
  end

  test "should create concert_preference" do
    assert_difference('ConcertPreference.count') do
      post concert_preferences_url, params: { concert_preference: { concert_id: @concert_preference.concert_id, order: @concert_preference.order, style_id: @concert_preference.style_id } }
    end

    assert_redirected_to concert_preference_url(ConcertPreference.last)
  end

  test "should show concert_preference" do
    get concert_preference_url(@concert_preference)
    assert_response :success
  end

  test "should get edit" do
    get edit_concert_preference_url(@concert_preference)
    assert_response :success
  end

  test "should update concert_preference" do
    patch concert_preference_url(@concert_preference), params: { concert_preference: { concert_id: @concert_preference.concert_id, order: @concert_preference.order, style_id: @concert_preference.style_id } }
    assert_redirected_to concert_preference_url(@concert_preference)
  end

  test "should destroy concert_preference" do
    assert_difference('ConcertPreference.count', -1) do
      delete concert_preference_url(@concert_preference)
    end

    assert_redirected_to concert_preferences_url
  end
end
