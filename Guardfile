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

  log_generic_error = lambda do |e|
    ::Guard::UI.warning(e.inspect)
    ::Guard::UI.warning(e.backtrace.reject { |p| p.include? '.rb:' }.reject { |p| p.include?('Guardfile') || p.include?('_guard-core')}.join("\n"))
  end

  begin
    build
  rescue Sprockets::Error => e
    log_generic_error.call(e)
  rescue Sass::SyntaxError => e
    log_generic_error.call(e)
  rescue ExecJS::Error => e
    log_generic_error.call(e)
  rescue Exception => e
    ::Guard::UI.error(e.inspect)
    ::Guard::UI.error(e.backtrace.join("\n"))
  end
end

guard :yield, run_on_modifications: build_assets do
  watch(/^css\//)
  watch(/^js\//)
end

build_assets.call()
