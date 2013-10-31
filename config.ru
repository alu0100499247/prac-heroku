require 'rack'
require 'rack/showexceptions'
require './lib/ppt'

use Rack::Static, :urls => ['/public']
use Rack::ShowExceptions
use Rack::Lint
use Rack::Session::Cookie,
	:key => 'rack.session'
	#:secret => 'some_secret'

run PiedraPapelTijeras::App.new

