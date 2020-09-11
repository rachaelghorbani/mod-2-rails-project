class HomeController < ApplicationController
  skip_before_action :authorized, only: [:homepage]
  def homepage

  end

end
