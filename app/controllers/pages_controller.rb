class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def index; end

  def bio; end

  def contacts; end

  def home; end
end
