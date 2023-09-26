module Step3Helper
  def heat_pump_size(response)
    return if response.nil?

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

  def get_multiple_choice_value(response, field)
    # TODO: looking up by field name may be brittle

    return if response.nil?

    question = response.fields.find { |i| i["label"] == field }

    option_keys = question["value"]

    result = []

    option_keys.each do |key|
      result << question["options"].find { |o| o["id"] == key }["text"]
    end

    result.to_sentence
  end
end
