require 'rack-livereload'

use Rack::LiveReload

map '/' do
  run Rack::Directory.new(Dir.pwd)
end

map '/fonts' do
  run Sprockets::Environment.new
end
