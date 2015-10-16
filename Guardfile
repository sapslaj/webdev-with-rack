guard 'livereload' do
  watch(%r{assets/.*})
  watch(%r{.*\.(html)})
end

guard 'rack' do
  watch('Gemfile.lock')
  watch('config.ru')
end

build_assets = proc do |_, _, _|
  require './assets/sprockets.rb'
  build
end

guard :yield, run_on_modifications: build_assets do
  watch(/^css\//)
  watch(/^js\//)
end

build_assets.call()
