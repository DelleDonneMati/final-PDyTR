# frozen_string_literal: true

require 'grpc'
require 'byebug'
require_relative 'file_transfer_pb'
require_relative 'file_transfer_services_pb'

class FileTransferServer < Filetransfer::FileTransfer::Service
  def transfer_file(request, _unused_call)
    # Agrega un mensaje para mostrar el nombre del archivo recibido
    puts "Recibiendo archivo: #{request.name}"

    # Agrega un mensaje para mostrar el tamaño del archivo recibido
    puts "Tamaño del archivo: #{request.size} bytes"

    file_content = request.content

    # Agrega un mensaje para mostrar que la respuesta se está generando
    puts 'Generando respuesta...'

    response = Filetransfer::FileResponse.new(content: file_content)

    # Agrega un mensaje para mostrar que la respuesta se ha generado correctamente
    puts 'Respuesta generada'

    response
  end
end

server = GRPC::RpcServer.new
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
server.handle(FileTransferServer)
puts 'Servidor gRPC iniciado en el puerto 50051...'
server.run_till_terminated
