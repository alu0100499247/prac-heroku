require "test/unit"
require "rack/test"
require './lib/ppt'

class PPTTest < Test::Unit::TestCase

	include Rack::Test::Methods

	def app
		Rack::Session::Cookie.new(PiedraPapelTijeras::App.new,
									:secret => 'cristhian')
	end

	#def setup
	#	PiedraPapelTijeras::App.pc = 'piedra'
	#end

	def test_inicial
		get "/"
		assert last_response.ok?
	end

	def test_inicial
		get "/"
		assert last_response.body.include?("Elige una de las siguientes opciones:")
	end

	def test_titulo
		get "/"
		assert_match "<title>PPT</title>", last_response.body
	end

	#def test_tie
	#	get "/?choice=piedra"
	#	assert last_response.body.include?("Has empatado! Elige de nuevo ;)")
	#end

	def test_usuario
		get "/?choice=piedra"
		assert last_response.body.include?("Usuario: piedra") 
	end

	def test_game
		get "/?choice=piedra"
		assert last_response.body.include?("Jugadas") 
	end

end

















