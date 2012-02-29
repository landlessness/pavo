require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Like.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Like.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Like.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to like_url(assigns(:like))
  end

  def test_edit
    get :edit, :id => Like.first
    assert_template 'edit'
  end

  def test_update_invalid
    Like.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Like.first
    assert_template 'edit'
  end

  def test_update_valid
    Like.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Like.first
    assert_redirected_to like_url(assigns(:like))
  end

  def test_destroy
    like = Like.first
    delete :destroy, :id => like
    assert_redirected_to likes_url
    assert !Like.exists?(like.id)
  end
end
