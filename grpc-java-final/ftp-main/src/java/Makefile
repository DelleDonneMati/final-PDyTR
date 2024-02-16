MVN=mvn
FTP=ftp

.PHONY: ftp clean

ftp:
	$(FTP)/run.sh $(MVN) $(ARCHIVO)

clean:
	cd $(FTP) && $(MVN) clean:clean