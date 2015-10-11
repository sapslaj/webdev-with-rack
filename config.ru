require 'rack-livereload'

use Rack::LiveReload

map '/' do
  run Rack::Directory.new(Dir.pwd)
end
