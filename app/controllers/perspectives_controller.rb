class PerspectivesController < ApplicationController
  # GET /perspectives
  # GET /perspectives.json
  def index
    @perspectives = Perspective.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @perspectives }
    end
  end

  # GET /perspectives/1
  # GET /perspectives/1.json
  def show
    @perspective = Perspective.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @perspective }
    end
  end

  # GET /perspectives/new
  # GET /perspectives/new.json
  def new
    @perspective = Perspective.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @perspective }
    end
  end

  # GET /perspectives/1/edit
  def edit
    @perspective = Perspective.find(params[:id])
  end

  # POST /perspectives
  # POST /perspectives.json
  def create
    @perspective = Perspective.new(params[:perspective])

    respond_to do |format|
      if @perspective.save
        format.html { redirect_to @perspective, notice: 'Perspective was successfully created.' }
        format.json { render json: @perspective, status: :created, location: @perspective }
      else
        format.html { render action: "new" }
        format.json { render json: @perspective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /perspectives/1
  # PUT /perspectives/1.json
  def update
    @perspective = Perspective.find(params[:id])

    respond_to do |format|
      if @perspective.update_attributes(params[:perspective])
        format.html { redirect_to @perspective, notice: 'Perspective was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @perspective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perspectives/1
  # DELETE /perspectives/1.json
  def destroy
    @perspective = Perspective.find(params[:id])
    @perspective.destroy

    respond_to do |format|
      format.html { redirect_to perspectives_url }
      format.json { head :no_content }
    end
  end
end
