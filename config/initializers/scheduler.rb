require 'rufus/scheduler'
require 'redis'
scheduler = Rufus::Scheduler.start_new
redis = Redis.new

scheduler.every("10s") do

 temps =  redis.lrange('temps', 0, -1)
  p temps
end