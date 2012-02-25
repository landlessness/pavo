require 'test_helper'

class ExhibitsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Exhibit.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Exhibit.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Exhibit.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to exhibit_url(assigns(:exhibit))
  end

  def test_edit
    get :edit, :id => Exhibit.first
    assert_template 'edit'
  end

  def test_update_invalid
    Exhibit.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Exhibit.first
    assert_template 'edit'
  end

  def test_update_valid
    Exhibit.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Exhibit.first
    assert_redirected_to exhibit_url(assigns(:exhibit))
  end

  def test_destroy
    exhibit = Exhibit.first
    delete :destroy, :id => exhibit
    assert_redirected_to exhibits_url
    assert !Exhibit.exists?(exhibit.id)
  end
end
