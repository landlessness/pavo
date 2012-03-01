class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery

  protected
  def reward_notice(reward)
    return "+#{reward.points} points. #{reward.description}. #{current_person.points} so far."    
  end
end
