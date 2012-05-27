class ObjectiveScoresController < ApplicationController
  # GET /objective_scores
  # GET /objective_scores.json
  def index
    @objective_scores = ObjectiveScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @objective_scores }
    end
  end

  # GET /objective_scores/1
  # GET /objective_scores/1.json
  def show
    @objective_score = ObjectiveScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @objective_score }
    end
  end

  # GET /objective_scores/new
  # GET /objective_scores/new.json
  def new
    @objective_score = ObjectiveScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @objective_score }
    end
  end

  # GET /objective_scores/1/edit
  def edit
    @objective_score = ObjectiveScore.find(params[:id])
  end

  # POST /objective_scores
  # POST /objective_scores.json
  def create
    @objective_score = ObjectiveScore.new(params[:objective_score])

    respond_to do |format|
      if @objective_score.save
        format.html { redirect_to @objective_score, notice: 'Objective score was successfully created.' }
        format.json { render json: @objective_score, status: :created, location: @objective_score }
      else
        format.html { render action: "new" }
        format.json { render json: @objective_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /objective_scores/1
  # PUT /objective_scores/1.json
  def update
    @objective_score = ObjectiveScore.find(params[:id])

    respond_to do |format|
      if @objective_score.update_attributes(params[:objective_score])
        format.html { redirect_to @objective_score, notice: 'Objective score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @objective_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objective_scores/1
  # DELETE /objective_scores/1.json
  def destroy
    @objective_score = ObjectiveScore.find(params[:id])
    @objective_score.destroy

    respond_to do |format|
      format.html { redirect_to objective_scores_url }
      format.json { head :no_content }
    end
  end
end
