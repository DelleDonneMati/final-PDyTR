# final-PDyTR

En la carpeta gRPC-TP/grpc-java-final/ftp-main esta el codigo del envio de archivos en java

```java
make ftp ARCHIVO=archivo_10k.txt
make ftp ARCHIVO=archivo_1k.txt
make ftp ARCHIVO=archivo_100k.txt
make ftp ARCHIVO=archivo_1M.txt
make ftp ARCHIVO=archivo_10M.txt
```

En la carpeta gRPC-TP/grpc-ruby esta el codigo del envio de archivos en ruby

comandos para grpc-ruby:

```rb
ruby server.rb
```

```rb
ruby client.rb archivo_1k.txt -m a
ruby client.rb archivo_10k.txt -m a
ruby client.rb archivo_100k.txt -m a
ruby client.rb archivo_1M.txt -m a
ruby client.rb archivo_10M.txt -m a
```
