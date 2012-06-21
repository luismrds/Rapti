class ObjectiveScoresController < ApplicationController
  include ApplicationHelper
  include ObjectiveScoresHelper
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


  def objectiveatdate
    @objective = Objective.find(params[:obj])
    @date = ScoreDate.find(params[:date])
    @indicators = @objective.indicators
    @currentindicators = []
    @indicators.each{|i|
      @currentindicators << IndicatorScore.find_by_indicator_id_and_scoredate_id(i.id, params[:date])
    }
    @currentobjective = ObjectiveScore.find_by_objective_id_and_scoredate_id(params[:obj],params[:date])
    @chart = produceGauge("", @currentobjective.score, 800, 240, @objective.redfrom, @objective.redto, @objective.yellowfrom, @objective.yellowto, @objective.greenfrom, @objective.greento, 5)

#    @lastsix = getLastNobjectiveScore(6, @objective, @date)


    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('number', 'Actual');
    data_table.new_column('number', 'Meta');
    data_table.new_column('number', 'Progreso');
    data_table.new_column('number', 'Baseline');
    data_table.new_column('number', 'Crecimiento');

    data_table.add_rows(1)
    data_table.set_cell(0, 0, @currentobjective.score)
    data_table.set_cell(0, 1, @currentobjective.goal)
    data_table.set_cell(0, 2, @currentobjective.progress)
    data_table.set_cell(0, 3, @currentobjective.baseline)
    data_table.set_cell(0, 4, @currentobjective.growth)

    opts   = { :width => 600, :showRowNumber => false }
    @tablechart = GoogleVisualr::Interactive::Table.new(data_table, opts)

    @lastSix = getLastNobjectiveScore(6, @objective, @date)
    @linechart = produceLineChart("Tendencia de 6 meses", @lastSix, @objective)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @objective }
    end
  end 
end
