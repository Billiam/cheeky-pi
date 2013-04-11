$:.unshift(File.dirname(__FILE__))
require 'cheeky-pi/color'
require 'cheeky-pi/factory'
require 'cheeky-pi/light'


module CheekyPi
  COLOR = {
    :off => [0, 0, 0],
    :red => [255, 0, 0],
    :green => [0, 255, 0],
    :blue => [0, 0, 255],
    :yellow => [255,255,0],
    :aqua => [0,255,255],
    :purple => [255,0,255],
    :white => [255,255,255]
  }

  def self.new
    CheekyPi.new
  end

  class CheekyPi
    def initialize
      @lights = Factory.find_lights
    end

    def lights
      @lights
    end

    def light
      @lights.first
    end
  end
end

