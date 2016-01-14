require 'bundler'
Bundler.require(:default)

Sprockets.append_path File.join(Dir.pwd, 'js')
Sprockets.append_path File.join(Dir.pwd, 'css')
Sprockets.append_path File.join(Dir.pwd, 'fonts') if Dir.exist? 'fonts'

if defined?(RailsAssets)
  RailsAssets.load_paths.each do |path|
    Sprockets.append_path(path)
  end
end

def build
  %w(main.js main.css).each do |filename|
    new_asset = Sprockets::Environment.new[filename].to_s

    File.open("assets/#{filename}", 'w') do |f|
      f.write new_asset
    end
  end
end
