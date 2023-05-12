module InputValidator
  VALID_PLAY_AGAIN_INPUTS = ["Y", "N"]
  VALID_GAME_TYPES = ["CPU_CPU", "HUMAN_HUMAN", "HUMAN_CPU"]

  def validate?(**kwargs)
    input_values = kwargs[:values].upcase
    comparison_values = kwargs[:compared_to]
    validation_method = kwargs[:by]

    return true if comparison_values.send(validation_method, input_values)

    false
  end
end
