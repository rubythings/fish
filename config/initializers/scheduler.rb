require 'rufus/scheduler'
require 'redis'
scheduler = Rufus::Scheduler.start_new
redis = Redis.new

scheduler.every("10s") do

 temps =  redis.get('temps')
  p temps
end