# frozen_string_literal: true

require 'grpc'
require 'byebug'
require_relative 'file_transfer_pb'
require_relative 'file_transfer_services_pb'

def run_client(file_name, mode)
  stub = Filetransfer::FileTransfer::Stub.new('localhost:50051', :this_channel_is_insecure)

  chunk_size = 1024 # 1 KB
  total_time = 0 # Contador total de tiempo en milisegundos

  File.open(file_name, 'rb') do |file|
    iteration = 0

    while (chunk = file.read(chunk_size))
      iteration_start_time = Time.now # Tiempo de inicio de la iteración

      request = Filetransfer::FileRequest.new(name: File.basename(file_name), content: chunk, size: chunk.size)
      response = stub.transfer_file(request)

      output_file_name = "output_#{File.basename(file_name)}"

      File.open(output_file_name, mode) do |output_file|
        output_file.write(response.content)
      end

      iteration_end_time = Time.now # Tiempo de finalización de la iteración
      iteration_time = (iteration_end_time - iteration_start_time) * 1000 # Tiempo de la iteración en milisegundos
      total_time += iteration_time # Sumar al contador total
      iteration += 1

      puts "Fragmento recibido y guardado como #{output_file_name}"
      puts "Tiempo de iteración #{iteration}: #{iteration_time.round(2)} ms"
    end

    puts "Tiempo total de transferencia: #{total_time.round(2)} ms para #{iteration} iteraciones"
  end
end

# Verifica si se pasó un argumento con el nombre del archivo
if ARGV.empty?
  puts 'Debes proporcionar el nombre del archivo como argumento al ejecutar el cliente.'
  puts 'Seleccione el modo de apertura para el archivo de salida:'
  puts "  'a' - Añadir contenido al final sin perder la información existente"
  puts "  'w' - Sobrescribir el archivo por completo"
  puts 'Ejemplo: ruby client.rb archivo.txt -m a'
else
  # Toma el primer argumento como el nombre del archivo
  file_name = ARGV[0]
  mode = ARGV[2] # a or w

  if %w[a w].include?(mode)
    run_client(file_name, mode)
  else
    puts "Modo de apertura no válido. Debe seleccionar 'a' o 'w'."
    puts 'Seleccione el modo de apertura para el archivo de salida:'
    puts "  'a' - Añadir contenido al final sin perder la información existente"
    puts "  'w' - Sobrescribir el archivo por completo"
  end
end
