module ApplicationHelper

include ScoreDatesHelper
#Produce a Gauge with the given parameters using google Visualr 
#A Library that uses the google visualization API
    def produceGauge(name, value, width, height, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, minorTicks, min, max)
        data_table = GoogleVisualr::DataTable.new
	    data_table.new_column('string'  , 'Label')
	    data_table.new_column('number'  , 'Value')
        data_table.add_rows(1)
       	data_table.set_cell(0, 0, name )
    	data_table.set_cell(0, 1, value.round(2))
        opts   = { :width => width, :height => height, :redFrom => redfrom, :redTo => redto, :yellowFrom => yellowfrom, :yellowTo => yellowto, :greenFrom => greenfrom, :greenTo => greento, :minorTicks => minorTicks, :min => min, :max => max, :view => {'columns' => {} }}
    	return GoogleVisualr::Interactive::Gauge.new(data_table, opts)
    end

#Produce a Line Chart with the given parameters using google Visualr 
#A Library that uses the google visualization API

    def produceLineChart(title, scores, name)
        data_table = GoogleVisualr::DataTable.new
        data_table.new_column('string', 'Mes' ) 
        data_table.new_column('number', name) 
        data_table.new_column('number', 'Meta')  
        # Add Rows and Values 
        scores.each{|s|
            data_table.add_rows([[scoredate_month_to_text(ScoreDate.find(s.scoredate_id)), s.score, s.goal]])
        }
        option = { title: title }
        option["vAxes" => { title: "Porcentaje"}]
        return GoogleVisualr::Interactive::LineChart.new(data_table, option)
    end

end
