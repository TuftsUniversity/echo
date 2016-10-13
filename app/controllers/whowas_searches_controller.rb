class WhowasSearchesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @search ||= WhowasSearch.new 
    respond_to do |format|
      format.js
      format.html
    end    
  end
  
  def create
    @search = WhowasSearch.new(whowas_search_params)
    
    Rails.logger.tagged("INFOSEC-ECHO") {
      Rails.logger.info "#{current_user.username} initiated a Whowas search." 
    }    
    
    @search.search!
    
    render :index, search: @search
  end
  
  def whowas_search_params
    params.require(:whowas_search).permit(:ip, :port, :timestamp)
  end
end
