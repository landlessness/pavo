require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Relationship.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Relationship.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Relationship.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to relationship_url(assigns(:relationship))
  end

  def test_edit
    get :edit, :id => Relationship.first
    assert_template 'edit'
  end

  def test_update_invalid
    Relationship.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Relationship.first
    assert_template 'edit'
  end

  def test_update_valid
    Relationship.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Relationship.first
    assert_redirected_to relationship_url(assigns(:relationship))
  end

  def test_destroy
    relationship = Relationship.first
    delete :destroy, :id => relationship
    assert_redirected_to relationships_url
    assert !Relationship.exists?(relationship.id)
  end
end
