class UserDetailsController < ApplicationController
  # GET /user_details
  # GET /user_details.json
  require 'json'
  require 'net/http'
  def index
    @user_details = UserDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_details }
    end
  end

  # GET /user_details/1
  # GET /user_details/1.json
  def show
    @user_detail = UserDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_detail }
    end
  end

  # GET /user_details/new
  # GET /user_details/new.json
  def new
    @user_detail = UserDetail.new

    respond_to do |format|
    #  format.js { render :layout => false } 
      format.html # new.html.erb
      format.json { render json: @user_detail }
    end
  end

  # GET /user_details/1/edit
  def edit
    @user_detail = UserDetail.find(params[:id])
  end

  # POST /user_details
  # POST /user_details.json
  def create
    #puts params[:user_detail]
    @user_detail = UserDetail.new(params[:user_detail])
    params[:user_detail]="jansi"
    
    net = Net::HTTP.new("localhost", 3000)
    request = Net::HTTP::Post.new("localhost:3000/user_details")
    request.set_form_data({"name" => @user_detail.to_json})
    #request.add_field("X-API-KEY", "some api key or custom field")
    net.set_debug_output $stdout #useful to see the raw messages going over the wire
    net.read_timeout = 10
    net.open_timeout = 10

    response = net.start do |http|
    http.request(request)
    end
    puts response.code
    puts response.read_body

    
    respond_to do |format|
      if @user_detail.save
        format.html { redirect_to @user_detail, notice: 'User detail was successfully created.' }
        format.json { render json: @user_detail, status: :created, location: @user_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_details/1
  # PUT /user_details/1.json
  def update
    @user_detail = UserDetail.find(params[:id])

    respond_to do |format|
      if @user_detail.update_attributes(params[:user_detail])
        format.html { redirect_to @user_detail, notice: 'User detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_details/1
  # DELETE /user_details/1.json
  def destroy
    @user_detail = UserDetail.find(params[:id])
    @user_detail.destroy

    respond_to do |format|
      format.html { redirect_to user_details_url }
      format.json { head :no_content }
    end
  end
end
