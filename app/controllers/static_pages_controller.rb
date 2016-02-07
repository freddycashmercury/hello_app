class StaticPagesController < ApplicationController

  def home
    render 'home'
  end

  def projects
    render 'projects'
  end
  
end
