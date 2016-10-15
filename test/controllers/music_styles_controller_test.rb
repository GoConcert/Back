require 'test_helper'

class MusicStylesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @music_style = music_styles(:one)
  end

  test "should get index" do
    get music_styles_url
    assert_response :success
  end

  test "should get new" do
    get new_music_style_url
    assert_response :success
  end

  test "should create music_style" do
    assert_difference('MusicStyle.count') do
      post music_styles_url, params: { music_style: { description: @music_style.description, name: @music_style.name } }
    end

    assert_redirected_to music_style_url(MusicStyle.last)
  end

  test "should show music_style" do
    get music_style_url(@music_style)
    assert_response :success
  end

  test "should get edit" do
    get edit_music_style_url(@music_style)
    assert_response :success
  end

  test "should update music_style" do
    patch music_style_url(@music_style), params: { music_style: { description: @music_style.description, name: @music_style.name } }
    assert_redirected_to music_style_url(@music_style)
  end

  test "should destroy music_style" do
    assert_difference('MusicStyle.count', -1) do
      delete music_style_url(@music_style)
    end

    assert_redirected_to music_styles_url
  end
end
