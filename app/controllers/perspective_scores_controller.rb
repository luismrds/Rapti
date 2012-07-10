class PerspectiveScoresController < ApplicationController
  include ScoreDatesHelper
  # GET /perspective_scores
  # GET /perspective_scores.json
  def index
    @perspective_scores = PerspectiveScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @perspective_scores }
    end
  end

  # GET /perspective_scores/1
  # GET /perspective_scores/1.json
  def show
    @perspective_score = PerspectiveScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @perspective_score }
    end
  end

  # GET /perspective_scores/new
  # GET /perspective_scores/new.json
  def new
    @perspective_score = PerspectiveScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @perspective_score }
    end
  end

  # GET /perspective_scores/1/edit
  def edit
    @perspective_score = PerspectiveScore.find(params[:id])
  end

  # POST /perspective_scores
  # POST /perspective_scores.json
  def create
    @perspective_score = PerspectiveScore.new(params[:perspective_score])

    respond_to do |format|
      if @perspective_score.save
        format.html { redirect_to @perspective_score, notice: 'Perspective score was successfully created.' }
        format.json { render json: @perspective_score, status: :created, location: @perspective_score }
      else
        format.html { render action: "new" }
        format.json { render json: @perspective_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /perspective_scores/1
  # PUT /perspective_scores/1.json
  def update
    @perspective_score = PerspectiveScore.find(params[:id])

    respond_to do |format|
      if @perspective_score.update_attributes(params[:perspective_score])
        format.html { redirect_to @perspective_score, notice: 'Perspective score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @perspective_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perspective_scores/1
  # DELETE /perspective_scores/1.json
  def destroy
    @perspective_score = PerspectiveScore.find(params[:id])
    @perspective_score.destroy

    respond_to do |format|
      format.html { redirect_to perspective_scores_url }
      format.json { head :no_content }
    end
  end

  def strategymap
    params[:date_id] ||= currentScoreDate.id
    @date = ScoreDate.find(params[:date_id])
    @trend = "6"
    @perspectives = Perspective.all
  end 
end
