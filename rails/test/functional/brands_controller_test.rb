require 'test_helper'

class BrandsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Brand.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Brand.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Brand.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to brand_url(assigns(:brand))
  end

  def test_edit
    get :edit, :id => Brand.first
    assert_template 'edit'
  end

  def test_update_invalid
    Brand.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Brand.first
    assert_template 'edit'
  end

  def test_update_valid
    Brand.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Brand.first
    assert_redirected_to brand_url(assigns(:brand))
  end

  def test_destroy
    brand = Brand.first
    delete :destroy, :id => brand
    assert_redirected_to brands_url
    assert !Brand.exists?(brand.id)
  end
end
