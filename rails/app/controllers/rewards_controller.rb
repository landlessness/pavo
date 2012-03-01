class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end

  def show
    @reward = Reward.find(params[:id])
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(params[:reward])
    if @reward.save
      redirect_to @reward, :notice => "Successfully created reward."
    else
      render :action => 'new'
    end
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])
    if @reward.update_attributes(params[:reward])
      redirect_to @reward, :notice  => "Successfully updated reward."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy
    redirect_to rewards_url, :notice => "Successfully destroyed reward."
  end
end
