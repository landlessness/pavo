class ExhibitsController < ApplicationController
  before_filter :login_required
  def index
    if logged_in?
      @exhibits = Exhibit.followees(current_person)
    else
      @exhibits = Exhibit.all
    end
  end

  def show
    @exhibit = Exhibit.find(params[:id])
  end

  def new
    @exhibit = Exhibit.new
  end

  def create
    @exhibit = current_person.exhibits.new(params[:exhibit])
    if @exhibit.save
      redirect_to @exhibit, :notice => "Successfully created exhibit."
    else
      render :action => 'new'
    end
  end

  def edit
    @exhibit = Exhibit.find(params[:id])
  end

  def update
    @exhibit = Exhibit.find(params[:id])
    if @exhibit.update_attributes(params[:exhibit])
      redirect_to @exhibit, :notice  => "Successfully updated exhibit."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @exhibit = Exhibit.find(params[:id])
    @exhibit.destroy
    redirect_to exhibits_url, :notice => "Successfully destroyed exhibit."
  end
end
