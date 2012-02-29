class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @exhibit = current_person.exhibits.find(params[:exhibit_id])
    @q = Product.search(params[:q])
    @products = @q.result(:distinct => true)
  end

  def create
    @exhibit = current_person.exhibits.find(params[:exhibit_id])
    @product = Product.find(params[:tag][:product_id])
    @tag = @exhibit.tags.build(product: @product)
    if @tag.save
      redirect_to @exhibit, :notice => "Successfully created tag."
    else
      render :action => 'new'
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(params[:tag])
      redirect_to @tag, :notice  => "Successfully updated tag."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    exhibit = @tag.exhibit
    @tag.destroy
    redirect_to exhibit, :notice => "Successfully destroyed tag."
  end
end
