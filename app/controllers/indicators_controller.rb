class IndicatorsController < ApplicationController
include ApplicationHelper
include IndicatorsHelper
  # GET /indicators
  # GET /indicators.json
  def index
    @indicators = Indicator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @indicators }
    end
  end

  # GET /indicators/1
  # GET /indicators/1.json
  def show
    @indicator = Indicator.find(params[:id])
    #@chart = produceGauge(@indicator.name, @indicator.today_score, 625, 187.5, 90, 100, 75, 90, 5)    
    @lastSix = getLastN(6, @indicator, ScoreDate.find_by_month_and_year(Date.today.month,Date.today.year))
    @linechart = produceLineChart("Tendencia de 6 meses", @lastSix, @indicator)


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @indicator }
    end
  end

  # GET /indicators/new
  # GET /indicators/new.json
  def new
    @indicator = Indicator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @indicator }
    end
  end

  # GET /indicators/1/edit
  def edit
    @indicator = Indicator.find(params[:id])
  end

  # POST /indicators
  # POST /indicators.json
  def create
    @indicator = Indicator.new(params[:indicator])

    respond_to do |format|
      if @indicator.save
        format.html { redirect_to @indicator, notice: 'Indicator was successfully created.' }
        format.json { render json: @indicator, status: :created, location: @indicator }
      else
        format.html { render action: "new" }
        format.json { render json: @indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /indicators/1
  # PUT /indicators/1.json
  def update
    @indicator = Indicator.find(params[:id])
    son = params[:son]
    if son[:id] != ""
        @indicator.sons << Indicator.find(son[:id])
    end
        respond_to do |format|
          if @indicator.update_attributes(params[:indicator])
            format.html { redirect_to @indicator, notice: 'Indicator was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @indicator.errors, status: :unprocessable_entity }
          end
        end
  end

  # DELETE /indicators/1
  # DELETE /indicators/1.json
  def destroy
    @indicator = Indicator.find(params[:id])
    @indicator.destroy

    respond_to do |format|
      format.html { redirect_to indicators_url }
      format.json { head :no_content }
    end
  end

#Releases a Indicator that does not influenciate it's "Father"
  def emancipate
      father = Indicator.find(params[:father])
      son = Indicator.find(params[:son])
      
      sons = father.sons
      sons.each{|s|
          if s == son
              father.sons.delete(s)
              break
          end
      }
      father.save
      respond_to do |format|
        format.html { redirect_to father }
        format.json { head :no_content }
      end
   end
end

