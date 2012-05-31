module ApplicationHelper

    def produceGauge(name, value, width, height, redFrom, redTo, yellowFrom, yellowTo, minorTicks)
        data_table = GoogleVisualr::DataTable.new
	    data_table.new_column('string'  , 'Label')
	    data_table.new_column('number'  , 'Value')
        data_table.add_rows(1)
       	data_table.set_cell(0, 0, name )
    	data_table.set_cell(0, 1, value)
        opts   = { :width => width, :height => height, :redFrom => redFrom, :redTo => redTo, :yellowFrom => yellowFrom, :yellowTo => yellowTo, :minorTicks => minorTicks }
    	return GoogleVisualr::Interactive::Gauge.new(data_table, opts)
    end

    
end
