class Users::RegistrationsController < Devise::RegistrationsController
  
  
  # Extend default Devise gem behavoir so that
  # users signing up with the Pro account (plan ID 3) 
  # save with a special Stripe subscription function.
  # Otherswise Devise signs up user as usual.
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end