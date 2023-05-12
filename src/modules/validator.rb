module Validator
  VALID_PLAY_AGAIN_INPUTS = ["Y", "N"]
  VALID_GAME_TYPES = ["CPU_CPU", "HUMAN_HUMAN", "HUMAN_CPU"]
  VALID_POSITIONS = %w[0 1 2 3 4 5 6 7 8]
  VALID_MARKERS = %W[X O]

  def validate?(**kwargs)
    input_values = kwargs[:values].upcase
    comparison_values = kwargs[:compared_to]
    validation_method = kwargs[:by]

    return true if comparison_values.send(validation_method, input_values)

    false
  end
end
