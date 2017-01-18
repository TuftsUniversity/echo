class LockoutsController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @lockout = Lockout.new
    respond_to do |format|
      format.js
      format.html
    end    
  end
  
  def search
    @lockout = Lockout.new
    @results = Lockout.where(username: params[:lockout][:username]).order("timestamp DESC")
    render :index
  end 
end