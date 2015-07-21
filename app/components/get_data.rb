# require 'pi_piper'
#port of the Adafruit MCP3008 interface code found @ http://learn.adafruit.com/send-raspberry-pi-data-to-cosm/python-script
class Sensor
  def read_adc(adc_pin, clockpin, adc_in, adc_out, cspin)
    cspin.on
    clockpin.off
    cspin.off

    command_out = adc_pin
    command_out |= 0x18
    command_out <<= 3

    (0..4).each do
      adc_in.update_value((command_out & 0x80) > 0)
      command_out <<= 1
      clockpin.on
      clockpin.off
    end
    result = 0

    (0..11).each do
      clockpin.on
      clockpin.off
      result <<= 1
      adc_out.read
      if adc_out.on?
        result |= 0x1
      end
    end

    cspin.on

    result >> 1
  end

  def self.timely_loop(t, &block)
    last = Time.now
    while true
      block.call
      now = Time.now
      _next = [last + t,now].max
      sleep (_next-now)
      last = _next
    end
  end

  def self.start
p 'started'
    # clock = PiPiper::Pin.new :pin => 18, :direction => :out
    # adc_out = PiPiper::Pin.new :pin => 23
    # adc_in = PiPiper::Pin.new :pin => 24, :direction => :out
    # cs = PiPiper::Pin.new :pin => 25, :direction => :out
    #
    # adc_pin = 0
    #
    # timely_loop 10 do
    #   value = read_adc(adc_pin, clock, adc_in, adc_out, cs)
    #   invert = 1023 - value
    #   mvolts = invert * (3300.0 / 1023.0)
    #   if mvolts < 2700
    #     temp = (mvolts - 380.0) / (2320.0 / 84.0)
    #   else
    #     temp = (mvolts - 2700.0) / (390.0 / 92.0) + 84.0
    #   end
    #   temp_f = (temp * 9.0 / 5.0) + 32
    #   puts "Value = #{value}, invert = #{invert}, mvolts = #{mvolts}, temp = #{temp} C | #{temp_f} F"
    #   Temp.create(:value => value)
    # end
  end
end
