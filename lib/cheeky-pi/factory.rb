require 'cheeky-pi/light'

module CheekyPi
  module Factory
    def self.find_lights
      reds = Dir.glob('/sys/devices/**/red')
      reds.collect {|red| Light.new(File.dirname(red)) }
    end
  end
end