require 'rack/request'
require 'rack/response'
require 'haml'


module PiedraPapelTijeras
	class App
		def initialize(app=nil)
			@app = app
			@content_type = :html
			@defeat = {'piedra' => 'tijeras', 'papel' => 'piedra', 'tijeras' => 'papel'}
			@throws = @defeat.keys
		end
		
		def set_env(env)
			@env = env
			@session = env['rack.session']
		end
		
		def game
			return @session['game'].to_i if @session['game']
			@session['game'] = 0
		end

		def game=(value)
			@session['game'] = value
		end

		def win
			return @session['win'].to_i if @session['win']
			@session['win'] = 0
		end

		def win=(value)
			@session['win'] = value
		end

		def tie
			return @session['tie'].to_i if @session['tie']
			@session['tie'] = 0
		end

		def tie=(value)
			@session['tie'] = value
		end

		def lost
			return @session['lost'].to_i if @session['lost']
			@session['lost'] = 0
		end

		def lost=(value)
			@session['lost'] = value
		end

		#def pc
		#	computer_throw
		#end

		#def pc=(value)
		#	computer_throw = value
		#end

		def call(env)
			set_env(env)
			req = Rack::Request.new(env)
			
			computer_throw = @throws.sample
			player_throw = req.GET["choice"]
			answer = if !@throws.include?(player_throw)
				alert = 0
				self.game = 0
				self.win = 0
				self.tie = 0
				self.lost = 0
				"Elige una de las siguientes opciones:"
			elsif player_throw == computer_throw
				alert = 1
				self.game += 1	
				self.tie += 1				
				"Has empatado! Elige de nuevo ;)"
			elsif computer_throw == @defeat[player_throw]
				alert = 2
				self.game += 1		
				self.win += 1
				"Bien! #{player_throw} gana a #{computer_throw}!! :D"
			else
				alert = 3
				self.game += 1		
				self.lost += 1 
				"Ohh! #{computer_throw} gana a #{player_throw}! :("
			end

			engine = Haml::Engine.new File.open("views/index.haml").read
			res = Rack::Response.new
			res.write engine.render({},
				:answer => answer,
				:alert => alert,
				:pc => computer_throw,
				:user => player_throw,
				:session => self.game,	
				:win => self.win,
				:tie => self.tie,
				:lost => self.lost) 
			res.finish
		end	# Call		
	end	# Class
end	# Module

if $0 == __FILE__
	require 'rack'
	require 'rack/showexceptions'

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
end








