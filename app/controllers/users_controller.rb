class UsersController < ApplicationController
 # GET /users
 # GET /users.json
  def index
   @users ="hello ignitemindz"
   
    respond_to do |format|
      format.json { render json: @users }
    end
  end
end
