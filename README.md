# CheekyPi

EventMachine friendly library for working with the DreamCheeky Webmail Notifier.

## Installation

Add this line to your application's Gemfile:

    gem 'cheeky-pi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cheeky-pi

## Usage

```ruby
require 'cheeky-pi`
require 'eventmachine'

light = CheekyPi.new.light

EventMachine.run {
  pi.light.color([0, 255, 0])
}
```

### Multiple lights:

```ruby
light1 = CheekyPi.lights[0]
light2 = CheekyPi.lights[1]
...
light1.failure
light2.success
```

### Simple animation

```ruby
CheekyPi.new.light.transition! [255, 0, 255]
```

### Throb animation

```ruby
#Perpetual throb animation, with a 10 second cycle period
CheekyPi.new.light.throb! [0, 255, 0], [0, 0, 255], 10
```

##$ Fun with promises

```ruby
light = CheekyPi.new.light
light.transition!(255, 0, 255).then {
  puts 'animation complete'
  light.throb! 10, [255, 0, 255], [255, 255, 255]
}
```

### Build lights

```ruby
case some_build_status
  when :build
    light.building
  when :failed
    light.failure
  when :successful
    light.success
  else
    light.off
end
```

## Related gems:

 * [blinky](https://github.com/perryn/blinky)
 * [cheeky_dreams](https://github.com/simojenki/cheeky-dreams)

## Why?

My raspberry pi could not interact with the webmail notifier via libusb, so this gem depends instead on
`/sys/devices/*/red|green|blue` courtesy of the usbled driver.

Additionally, I wanted (non-blocking) animation for use with a build monitoring tool.