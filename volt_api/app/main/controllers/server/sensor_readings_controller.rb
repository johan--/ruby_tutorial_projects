module Main
  class SensorReadingsController < Volt::HttpController
    def create
      store
        ._sensor_readings
        .append(SensorReading).new(temp: params_temp, time: Time.now)
        .then { |result| render json: result }
        .fail { |error| render json: errors }
    end
  end
end
