class RawDataController < ApplicationController
  # GET /raw_data
  # GET /raw_data.json
  def index
    @raw_data = RawDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @raw_data }
    end
  end

  # GET /raw_data/1
  # GET /raw_data/1.json
  def show
    @raw_datum = RawDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @raw_datum }
    end
  end

  # GET /raw_data/new
  # GET /raw_data/new.json
  def new
    @raw_datum = RawDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @raw_datum }
    end
  end

  # GET /raw_data/1/edit
  def edit
    @raw_datum = RawDatum.find(params[:id])
  end

  # POST /raw_data
  # POST /raw_data.json
  def create
    @raw_datum = RawDatum.new(params[:raw_datum])

    respond_to do |format|
      if @raw_datum.save
        format.html { redirect_to @raw_datum, notice: 'Raw datum was successfully created.' }
        format.json { render json: @raw_datum, status: :created, location: @raw_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @raw_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /raw_data/1
  # PUT /raw_data/1.json
  def update
    @raw_datum = RawDatum.find(params[:id])

    respond_to do |format|
      if @raw_datum.update_attributes(params[:raw_datum])
        format.html { redirect_to @raw_datum, notice: 'Raw datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @raw_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_data/1
  # DELETE /raw_data/1.json
  def destroy
    @raw_datum = RawDatum.find(params[:id])
    @raw_datum.destroy

    respond_to do |format|
      format.html { redirect_to raw_data_url }
      format.json { head :no_content }
    end
  end
end
