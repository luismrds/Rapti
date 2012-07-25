class IndicatorScoresController < ApplicationController
  include ApplicationHelper
  include IndicatorScoresHelper
  include ScoreDatesHelper
  
  # GET /indicator_scores
  # GET /indicator_scores.json
  def index
    @indicator_scores = IndicatorScore.order("indicator_id, scoredate_id")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @indicator_scores }
    end
  end

  # GET /indicator_scores/1
  # GET /indicator_scores/1.json
  def show
    @indicator_score = IndicatorScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @indicator_score }
    end
  end

  # GET /indicator_scores/new
  # GET /indicator_scores/new.json
  def new
    @indicator_score = IndicatorScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @indicator_score }
    end
  end

  # GET /indicator_scores/1/edit
  def edit
    @indicator_score = IndicatorScore.find(params[:id])
  end

  # POST /indicator_scores
  # POST /indicator_scores.json
  def create
    @indicator_score = IndicatorScore.new(params[:indicator_score])

    respond_to do |format|
      if @indicator_score.save
        format.html { redirect_to @indicator_score, notice: 'Indicator score was successfully created.' }
        format.json { render json: @indicator_score, status: :created, location: @indicator_score }
      else
        format.html { render action: "new" }
        format.json { render json: @indicator_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /indicator_scores/1
  # PUT /indicator_scores/1.json
  def update
    @indicator_score = IndicatorScore.find(params[:id])

    respond_to do |format|
      if @indicator_score.update_attributes(params[:indicator_score])
        format.html { redirect_to @indicator_score, notice: 'Indicator score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @indicator_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicator_scores/1
  # DELETE /indicator_scores/1.json
  def destroy
    @indicator_score = IndicatorScore.find(params[:id])
    @indicator_score.destroy

    respond_to do |format|
      format.html { redirect_to indicator_scores_url }
      format.json { head :no_content }
    end
  end

  def indicatoratdate
    @indicator = Indicator.find(params[:ind])
    @date = ScoreDate.find(params[:date])
    @trend = params[:trend]
    @sons = @indicator.sons
    @currentsons = []
    @sons.each{|i|
      @currentsons << IndicatorScore.find_by_indicator_id_and_scoredate_id(i.id, params[:date])
    }
    @currentindicator = IndicatorScore.find_by_indicator_id_and_scoredate_id(params[:ind],params[:date])
    if @currentindicator.greento > @currentindicator.redfrom
      min = @currentindicator.redfrom
      max = @currentindicator.greento
    end
    if @currentindicator.greento <  @currentindicator.redfrom
      max = @currentindicator.redto
      min = @currentindicator.greenfrom
    end

    @chart = produceGauge("", @currentindicator.score, 220, 220, @currentindicator.redfrom, @currentindicator.redto, @currentindicator.yellowfrom, @currentindicator.yellowto, @currentindicator.greenfrom, @currentindicator.greento, 5, min, max)

#    @lastsix = getLastNobjectiveScore(6, @objective, @date)


    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('number', 'Actual');
    data_table.new_column('number', 'Meta');
    data_table.new_column('number', 'Progreso');
    data_table.new_column('number', 'Baseline');
    data_table.new_column('number', 'Crecimiento');

    data_table.add_rows(1)
    data_table.set_cell(0, 0, @currentindicator.score)
    data_table.set_cell(0, 1, @currentindicator.goal)
    data_table.set_cell(0, 2, @currentindicator.progress)
    data_table.set_cell(0, 3, @currentindicator.baseline)
    data_table.set_cell(0, 4, @currentindicator.growth)

    opts   = { :width => 600, :showRowNumber => false }
    @tablechart = GoogleVisualr::Interactive::Table.new(data_table, opts)

    @lastN = getLastNindicatorScore(@trend.to_i, @indicator, @date)
    @linechart = produceLineChart("Tendencia de " + @trend.to_s + " meses anteriores", @lastN, @indicator.name)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @objective }
    end
  end 

end
