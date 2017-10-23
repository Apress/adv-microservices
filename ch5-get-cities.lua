-- get-cities.lua: Find cities within 10km of query

local key_geo = KEYS[1]
local key_data = KEYS[2]

local longitude = ARGV[1]
local latitude = ARGV[2]

local city_ids = redis.call(
  'GEORADIUS', key_geo, longitude, latitude, 10, 'km'
)
return redis.call('HMGET', key_data, unpack(city_ids))
