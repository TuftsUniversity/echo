class LockoutsController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @lockout = Lockout.new
    @lockouts = Lockout.in_last(24.hours).by_newest
    @top_lockouts = Lockout.in_last(72.hours).top_users(5)
  end
  
  def search
    @username = params[:lockout][:username]
    @lockout = Lockout.new
    @lockouts = Lockout.for_user(@username).by_newest
    @top_hosts = Lockout.for_user(@username).top_hosts(5)
  end 
end