Dir[::File.join(::File.dirname(__FILE__), 'themes', '*.rb')].each do |f|
  require f
end
