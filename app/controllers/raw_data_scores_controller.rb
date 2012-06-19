class RawDataScoresController < ApplicationController
  # GET /raw_data_scores
  # GET /raw_data_scores.json
  def index
    @raw_data_scores = RawDataScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @raw_data_scores }
    end
  end

  # GET /raw_data_scores/1
  # GET /raw_data_scores/1.json
  def show
    @raw_data_score = RawDataScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @raw_data_score }
    end
  end

  # GET /raw_data_scores/new
  # GET /raw_data_scores/new.json
  def new
    @raw_data_score = RawDataScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @raw_data_score }
    end
  end

  # GET /raw_data_scores/1/edit
  def edit
    @raw_data_score = RawDataScore.find(params[:id])
  end

  # POST /raw_data_scores
  # POST /raw_data_scores.json
  def create
    @raw_data_score = RawDataScore.new(params[:raw_data_score])

    respond_to do |format|
      if @raw_data_score.save
        format.html { redirect_to @raw_data_score, notice: 'Raw data score was successfully created.' }
        format.json { render json: @raw_data_score, status: :created, location: @raw_data_score }
      else
        format.html { render action: "new" }
        format.json { render json: @raw_data_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /raw_data_scores/1
  # PUT /raw_data_scores/1.json
  def update
    @raw_data_score = RawDataScore.find(params[:id])

    respond_to do |format|
      if @raw_data_score.update_attributes(params[:raw_data_score])
        format.html { redirect_to @raw_data_score, notice: 'Raw data score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @raw_data_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_data_scores/1
  # DELETE /raw_data_scores/1.json
  def destroy
    @raw_data_score = RawDataScore.find(params[:id])
    @raw_data_score.destroy

    respond_to do |format|
      format.html { redirect_to raw_data_scores_url }
      format.json { head :no_content }
    end
  end

  def prepmassiveInsertion
    date = ScoreDate.find(params[:date_id])
    @raw_data = RawDatum.find_all_by_operation_id(nil)  
    @scores = []
    @raw_data.each{|raw|
        @scores << RawDataScore.find_by_rawdata_id_and_scoredate_id(raw.id,date.id)
    }
    
  end
end
