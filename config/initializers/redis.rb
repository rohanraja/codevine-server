# $redis = Redis::Namespace.new("my_app", :redis => Redis.new)
$redis = Redis.new
Resque.redis = "algomuse.com:6379"
