class VectorsController < ApplicationController
  include ScoreDatesHelper

  # GET /vectors
  # GET /vectors.json
  def index
    @vectors = Vector.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vectors }
    end
  end

  # GET /vectors/1
  # GET /vectors/1.json
  def show
    @vector = Vector.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vector }
    end
  end

  # GET /vectors/new
  # GET /vectors/new.json
  def new
    @vector = Vector.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vector }
    end
  end

  # GET /vectors/1/edit
  def edit
    @vector = Vector.find(params[:id])
  end

  # POST /vectors
  # POST /vectors.json
  def create
    @vector = Vector.new(params[:vector])

    respond_to do |format|
      if @vector.save
        format.html { redirect_to @vector, notice: 'Vector was successfully created.' }
        format.json { render json: @vector, status: :created, location: @vector }
      else
        format.html { render action: "new" }
        format.json { render json: @vector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vectors/1
  # PUT /vectors/1.json
  def update
    @vector = Vector.find(params[:id])

    respond_to do |format|
      if @vector.update_attributes(params[:vector])
        format.html { redirect_to @vector, notice: 'Vector was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vectors/1
  # DELETE /vectors/1.json
  def destroy
    @vector = Vector.find(params[:id])
    @vector.destroy

    respond_to do |format|
      format.html { redirect_to vectors_url }
      format.json { head :no_content }
    end
  end

  def vectoratdate
    params[:date_id] ||= currentScoreDate.id
    @vector = Vector.find(params[:vec])
    @date = ScoreDate.find(params[:dat])
    @perspectives = []
    @vector.objectives.each{|o|
      if !@perspectives.include? o.perspective
        @perspectives << o.perspective
      end 
    }
    @objectives = @vector.objectives

    @perspectives = Perspective.all
    @financiera = []
    @clientes = []
    @procesos = []
    @desarrollo = []
    @filasprocesos = 0
    @vector.objectives.each{|o|
      if o.perspective_id == 1
        @financiera << o
      end 
      if o.perspective_id == 2
        @clientes << o 
      end
      if o.perspective_id == 3
        @procesos << o  
        @filasprocesos = @filasprocesos + 1
        @filasprocesos = @filasprocesos + o.indicators.size
      end 
      if o.perspective_id == 4
        @desarrollo << o 
      end 
    }
  end
end
