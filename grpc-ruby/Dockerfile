# Usa la última imagen oficial de Ruby como base
FROM ruby:latest

# Directorio de trabajo en el contenedor
WORKDIR /app

# Copia el Gemfile y el Gemfile.lock al contenedor
COPY Gemfile Gemfile.lock ./

# Instala las gemas
RUN bundle install

# Copia todo el contenido del directorio actual al directorio de trabajo en el contenedor
COPY . .

# Comando por defecto a ejecutar al iniciar el contenedor
CMD ["ruby", "server.rb"]
