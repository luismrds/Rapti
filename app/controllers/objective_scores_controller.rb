class ObjectiveScoresController < ApplicationController
  include ApplicationHelper
  include ObjectiveScoresHelper
  # GET /objective_scores
  # GET /objective_scores.json
  def index
    @objective_scores = ObjectiveScore.order("objective_id, scoredate_id")

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


  def objectiveatdate
    @objective = Objective.find(params[:obj])
    @date = ScoreDate.find(params[:date])
    @trend = params[:trend]
    @indicators = @objective.indicators
    @currentindicators = []
    @indicators.each{|i|
      indscore = IndicatorScore.find_by_indicator_id_and_scoredate_id(i.id, params[:date])
      if indscore && indscore.indicator.show
        @currentindicators << indscore
      end
    }
    @currentobjective = ObjectiveScore.find_by_objective_id_and_scoredate_id(params[:obj],params[:date])
    
    if @currentobjective.greento > @currentobjective.redfrom
      min = @currentobjective.redfrom
      max = @currentobjective.greento
    end
    if @currentobjective.greento <  @currentobjective.redfrom
      max = @currentobjective.redto
      min = @currentobjective.greenfrom
    end
    @chart = produceGauge("", @currentobjective.score, 800, 240, @objective.redfrom, @objective.redto, 25, @objective.yellowto, @objective.greenfrom, @objective.greento, 5, min, max)

#    @lastsix = getLastNobjectiveScore(6, @objective, @date)
    @lastN = getLastNobjectiveScore(@trend.to_i, @objective, @date)
    @linechart = produceLineChart("Tendencia de " + @trend.to_s + " meses anteriores", @lastN, @objective.name)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @objective }
    end
  end 
end
