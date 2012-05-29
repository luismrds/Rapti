class ObjectivesController < ApplicationController
  # GET /objectives
  # GET /objectives.json
  def index
    @objectives = Objective.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @objectives }
    end
  end

  # GET /objectives/1
  # GET /objectives/1.json
  def show
    @objective = Objective.find(params[:id])
    @indicators = @objective.indicators
    @charts = []

    for i in @indicators
        data_table = GoogleVisualr::DataTable.new
	    data_table.new_column('string'  , 'Label')
	    data_table.new_column('number'  , 'Value')
        data_table.add_rows(1)
       	data_table.set_cell(0, 0, i.name )
    	data_table.set_cell(0, 1, 80)
        opts   = { :width => 400, :height => 120, :redFrom => 90, :redTo => 100, :yellowFrom => 75, :yellowTo => 90, :minorTicks => 5 }
    	ch = GoogleVisualr::Interactive::Gauge.new(data_table, opts)
        @charts << ch
    end


    data_table = GoogleVisualr::DataTable.new

    data_table.new_column('string', 'Year' ) 
    data_table.new_column('number', 'Sales') 
    data_table.new_column('number', 'Expenses') 

    # Add Rows and Values 
    data_table.add_rows([ 
      ['Dic', 1000, 400], 
      ['Ene', 1170, 460], 
      ['Feb', 660, 1120], 
      ['Mar', 1030, 540], 
      ['Abr', 710, 1410], 
      ['May', 960, 980] 
    ])
    option = { width: 400, height: 240, title: 'Ultimos 6 meses' }
    @chart = GoogleVisualr::Interactive::AreaChart.new(data_table, option)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @objective }
    end
  end

  # GET /objectives/new
  # GET /objectives/new.json
  def new
    @objective = Objective.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @objective }
    end
  end

  # GET /objectives/1/edit
  def edit
    @objective = Objective.find(params[:id])
  end

  # POST /objectives
  # POST /objectives.json
  def create
    @objective = Objective.new(params[:objective])

    respond_to do |format|
      if @objective.save
        format.html { redirect_to @objective, notice: 'Objective was successfully created.' }
        format.json { render json: @objective, status: :created, location: @objective }
      else
        format.html { render action: "new" }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /objectives/1
  # PUT /objectives/1.json
  def update
    @objective = Objective.find(params[:id])

    respond_to do |format|
      if @objective.update_attributes(params[:objective])
        format.html { redirect_to @objective, notice: 'Objective was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objectives/1
  # DELETE /objectives/1.json
  def destroy
    @objective = Objective.find(params[:id])
    @objective.destroy

    respond_to do |format|
      format.html { redirect_to objectives_url }
      format.json { head :no_content }
    end
  end
end
