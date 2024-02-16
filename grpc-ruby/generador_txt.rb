# frozen_string_literal: true

# Función para generar archivos de tamaño especificado
def generar_archivo(nombre_archivo, tamano_bytes)
  File.open(nombre_archivo, 'wb') do |file|
    file.write('x' * tamano_bytes)
  end
end

# Generar archivos de diferentes tamaños
generar_archivo('archivo_1k.txt', 1024) # 1 KB
generar_archivo('archivo_10k.txt', 10_240)     # 10 KB
generar_archivo('archivo_100k.txt', 102_400)   # 100 KB
generar_archivo('archivo_1M.txt', 1024 * 1024) # 1 MB
generar_archivo('archivo_10M.txt', 10 * 1024 * 1024)  # 10 MB
