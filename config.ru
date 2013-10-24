require 'rack'
require 'rack/showexceptions'
require './lib/ppt'

builder = Rack::Builder.new do
	use Rack::Static, :urls => ['/public']
	use Rack::ShowExceptions
	use Rack::Lint
	use Rack::Session::Cookie,
		:key => 'rack.session',
		:domain => 'ppt.com',
		:secret => 'some_secret'

	run PiedraPapelTijeras::App.new
end

Rack::Handler::Thin.run builder

