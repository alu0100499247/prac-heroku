require 'rake'

desc "Ejecutar la práctica"
task :default do
	sh "bundle exec rackup"
end

desc "Ejecutar test unitarios"
task :test do
	sh "ruby -Ilib -Itest test/tc_ppt.rb"
end

desc "Ejecutar test usando TDD"
task :spec do
	sh "rspec spec/ppt_spec.rb"
end

desc "Ejecutar la práctica eligiendo piedra"
task :piedra do
	sh %q{curl -v 'http://localhost:8080/?choice=piedra'}
end

desc "Ejecutar la práctica eligiendo papel"
task :papel do
	sh %q{curl -v 'http://localhost:8080/?choice=papel'}
end

desc "Ejecutar la práctica eligiendo tijeras"
task :tijeras do
	sh %q{curl -v 'http://localhost:8080/?choice=tijeras'}
end

desc "Tarea de prueba"
task :hola do
	puts "Hola mundo!!"
end
