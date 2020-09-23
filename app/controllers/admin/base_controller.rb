class Admin::BaseController < ApplicationController

  ######Add Amin authentication for the theree Admin controllers
  ###### dashboard, products, categories 
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
  password: ENV["HTTP_BASIC_PASSWORD"],
  if: -> { ENV["HTTP_BASIC_PASSWORD"].present? }
  

end
