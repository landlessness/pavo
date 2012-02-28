class RelationshipsController < ApplicationController
  def index
    @relationships = Relationship.all
  end

  def show
    @relationship = Relationship.find(params[:id])
  end

  def new
    @followee = Person.find(params[:person_id])
    @relationship = Relationship.new
  end

  def create
    followee = Person.find(params[:person_id])
    relationship = Relationship.new(follower: current_person, followee: followee)
    if relationship.save
      redirect_to followee, :notice => "Successfully created relationship."
    else
      render :action => 'new'
    end
  end

  def edit
    @relationship = Relationship.find(params[:id])
  end

  def update
    @relationship = Relationship.find(params[:id])
    if @relationship.update_attributes(params[:relationship])
      redirect_to @relationship, :notice  => "Successfully updated relationship."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to :back
  end
end
