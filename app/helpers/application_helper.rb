module ApplicationHelper

    def produceGauge(name, value, width, height, redFrom, redTo, yellowFrom, yellowTo, minorTicks)
        data_table = GoogleVisualr::DataTable.new
	    data_table.new_column('string'  , 'Label')
	    data_table.new_column('number'  , 'Value')
        data_table.add_rows(1)
       	data_table.set_cell(0, 0, name )
    	data_table.set_cell(0, 1, value)
        opts   = { :width => width, :height => height, :redFrom => redFrom, :redTo => redTo, :yellowFrom => yellowFrom, :yellowTo => yellowTo, :greenFrom => 75, :greenTo => 100, :minorTicks => minorTicks }
    	return GoogleVisualr::Interactive::Gauge.new(data_table, opts)
    end

    def produceLineChart(title, scores, indicador)
        data_table = GoogleVisualr::DataTable.new
        data_table.new_column('string', 'Mes' ) 
        data_table.new_column('number', indicador.name) 
        data_table.new_column('number', 'Meta')  
        # Add Rows and Values 
        scores.each{|s|
            data_table.add_rows([[ScoreDate.find(s.scoredate_id).month.to_s, s.score, s.goal]])
        }
        option = { width: 400, height: 240, title: title }
        return GoogleVisualr::Interactive::LineChart.new(data_table, option)
    end
end
