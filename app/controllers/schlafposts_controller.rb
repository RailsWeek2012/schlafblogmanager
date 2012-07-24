class SchlafpostsController < ApplicationController
  before_filter :require_login!
  # GET /schlafposts
  # GET /schlafposts.json
  def index
    @schlafposts = Schlafpost.find_all_by_user_id(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schlafposts }
    end
  end

  # GET /schlafposts/1
  # GET /schlafposts/1.json
  def show
    @schlafpost = Schlafpost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schlafpost }
    end
  end

  # GET /schlafposts/new
  # GET /schlafposts/new.json
  def new
    @schlafpost = Schlafpost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schlafpost }
    end
  end

  # GET /schlafposts/1/edit
  def edit
    @schlafpost = Schlafpost.find(params[:id])
  end

  # POST /schlafposts
  # POST /schlafposts.json
  def create
    @schlafpost = Schlafpost.new(params[:schlafpost])

    @schlafpost.user = current_user

    respond_to do |format|
      if @schlafpost.save
        format.html { redirect_to schlafposts_index_url(current_user.id), notice: 'Schlafpost was successfully created.' }
        format.json { render json: @schlafpost, status: :created, location: @schlafpost }
      else
        format.html { render action: "new" }
        format.json { render json: @schlafpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schlafposts/1
  # PUT /schlafposts/1.json
  def update
    @schlafpost = Schlafpost.find(params[:id])

    respond_to do |format|
      if @schlafpost.update_attributes(params[:schlafpost])
        format.html { redirect_to schlafpost_path(current_user.id), notice: 'Schlafpost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schlafpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schlafposts/1
  # DELETE /schlafposts/1.json
  def destroy
    @schlafpost = Schlafpost.find(params[:id])
    @schlafpost.destroy

    respond_to do |format|
      format.html { redirect_to schlafposts_index_url(current_user.id) }
      format.json { head :no_content }
    end
  end
end
