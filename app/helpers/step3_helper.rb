module Step3Helper
  def heat_pump_size(response)
    case response.fields.find { |i| i["label"] == "Heat pump size" }["value"]
    when 'small'
      '5 to 9kW'
    when 'medium'
      '10 to 16kW'
    when 'large'
      '16+kW'
    else
      nil
    end
  end
end
