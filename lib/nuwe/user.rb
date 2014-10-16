module Nuwe
  class User

    attr_reader :id, :email, :bmi, :weight, :height, :bpm, :blood_pressure

    def initialize(attributes)
      @id = attributes["id"]
      @email = attributes["email"]
      @bmi = attributes["bmi"]
      @weight = attributes["weight"]
      @height = attributes["height"]
      @bpm = attributes["bpm"]
      @blood_pressure = attributes["blood_pressure"]
    end

  end
end
