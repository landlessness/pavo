class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @exhibit = current_person.exhibits.find(params[:exhibit_id])
    @tag = @exhibit.tags.build
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
    @tag.destroy
    redirect_to tags_url, :notice => "Successfully destroyed tag."
  end
end
