# final-PDyTR

En la carpeta gRPC-TP/grpc-java-final/ftp-main esta el codigo del envio de archivos en java

En la carpeta `final-PDyTR/grpc-java-final/ftp-main/src` ejecutar:

```bash
chmod +x install.sh
./install.sh
```

Luego ejecutamos:

```java
make ftp ARCHIVO=archivo_10k.txt
make ftp ARCHIVO=archivo_1k.txt
make ftp ARCHIVO=archivo_100k.txt
make ftp ARCHIVO=archivo_1M.txt
make ftp ARCHIVO=archivo_10M.txt
```

----

En la carpeta gRPC-TP/grpc-ruby esta el codigo del envio de archivos en ruby

Comandos para grpc-ruby:

En una terminal dentro del directorio `final-PDyTR/grpc-java-final/grpc-ruby`

```sh
docker-compose build
docker-compose up
```

En otra terminal

```sh
docker exec -it grpc-ruby_app_1 bash
```

```rb
ruby client.rb archivo_1k.txt -m a
ruby client.rb archivo_10k.txt -m a
ruby client.rb archivo_100k.txt -m a
ruby client.rb archivo_1M.txt -m a
ruby client.rb archivo_10M.txt -m a
```
