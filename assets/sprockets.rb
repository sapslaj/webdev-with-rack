require 'sprockets'

require 'bootstrap-sass' # Okay to remove this if you don't want TWBS.

Sprockets.append_path File.join(Dir.pwd, 'js')
Sprockets.append_path File.join(Dir.pwd, 'css')

def build
  %w(main.js main.css).each do |filename|
    File.open("assets/#{filename}", 'w') do |f|
      f.write Sprockets::Environment.new[filename].to_s
    end
  end
end
