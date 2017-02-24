class WelcomeController < ApplicationController
  def index
    render template: "index.html.haml"
  end
end
