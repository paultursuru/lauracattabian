class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end

  def bio
  end

  def contact
  end
end
