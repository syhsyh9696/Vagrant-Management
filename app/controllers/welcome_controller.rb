class WelcomeController < ApplicationController
  def index
    flash[:notice] = "ha pi"
  end
end
