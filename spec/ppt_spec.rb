require 'rspec'
require 'rack'
require './lib/ppt'

describe PiedraPapelTijeras::App do

	def server
		Rack::MockRequest.new(Rack::Session::Cookie.new(PiedraPapelTijeras::App.new,
														:secret => 'cristhian'))
	end

	context '/' do
		it "Debe devolver el código 200" do
			response = server.get('/')
			response.status.should == 200
		end
		
		it "Debe mostrar PPT" do
			response = server.get('/')
			response.header.include?("PPT")
		end

		it "Debe mostrar la variable answer sin inicializar" do
			response = server.get('/')
			response.body.include?("Elige una de las siguientes opciones:")
		end
	end

	context '/?choice=piedra' do
		it "Debe devolver el código 200" do
			response = server.get('/?choice=piedra')
			response.status.should == 200
		end

		it "Debe devolver la opción piedra elegida por el usuario" do
			response = server.get('/?choice=piedra')
			response.body.include?("Usuario: piedra")
		end
	end	

	context '/?choice=papel' do
		it "Debe devolver el código 200" do
			response = server.get('/?choice=papel')
			response.status.should == 200
		end

		it "Debe devolver la opción papel elegida por el usuario" do
			response = server.get('/?choice=papel')
			response.body.include?("Usuario: papel")
		end
	end

	context '/?choice=tijeras' do	
		it "Debe devolver el código 200" do
			response = server.get('/?choice=tijeras')
			response.status.should == 200
		end

		it "Debe devolver la opción tijeras elegida por el usuario" do
			response = server.get('/?choice=tijers')
			response.body.include?("Usuario: tijeras")
		end
	end
end







































