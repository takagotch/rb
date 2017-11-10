class UserObserver < ActiveRecord::Observer
  observer :user, :blog, :entry

  def after_create(model)
    Rails.logger.info("user: #{model.id} text ")
  end
end