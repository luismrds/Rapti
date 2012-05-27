class ScoreDatesController < ApplicationController
  # GET /score_dates
  # GET /score_dates.json
  def index
    @score_dates = ScoreDate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @score_dates }
    end
  end

  # GET /score_dates/1
  # GET /score_dates/1.json
  def show
    @score_date = ScoreDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @score_date }
    end
  end

  # GET /score_dates/new
  # GET /score_dates/new.json
  def new
    @score_date = ScoreDate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @score_date }
    end
  end

  # GET /score_dates/1/edit
  def edit
    @score_date = ScoreDate.find(params[:id])
  end

  # POST /score_dates
  # POST /score_dates.json
  def create
    @score_date = ScoreDate.new(params[:score_date])

    respond_to do |format|
      if @score_date.save
        format.html { redirect_to @score_date, notice: 'Score date was successfully created.' }
        format.json { render json: @score_date, status: :created, location: @score_date }
      else
        format.html { render action: "new" }
        format.json { render json: @score_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /score_dates/1
  # PUT /score_dates/1.json
  def update
    @score_date = ScoreDate.find(params[:id])

    respond_to do |format|
      if @score_date.update_attributes(params[:score_date])
        format.html { redirect_to @score_date, notice: 'Score date was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @score_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /score_dates/1
  # DELETE /score_dates/1.json
  def destroy
    @score_date = ScoreDate.find(params[:id])
    @score_date.destroy

    respond_to do |format|
      format.html { redirect_to score_dates_url }
      format.json { head :no_content }
    end
  end
end
