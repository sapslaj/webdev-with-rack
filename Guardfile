# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

guard 'livereload' do
  watch(%r{assets/.*})
  watch(%r{.*\.(html)})
end

guard 'rack' do
  watch('Gemfile.lock')
  watch('config.ru')
end

# Example 1: Run a single command whenever a file is added

build_assets = proc do |_, _, _|
  require './assets/sprockets.rb'
  build
end

guard :yield, run_on_modifications: build_assets do
  watch(/^css\//)
  watch(/^js\//)
end
