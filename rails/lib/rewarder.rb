class Rewarder
  def after_create(rewardable)
    rewardable.create_reward
  end
end
