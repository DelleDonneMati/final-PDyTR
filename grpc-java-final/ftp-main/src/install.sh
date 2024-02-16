# Update Java version
apt install openjdk-8-jdk -y

# Install Maven
VERSION=3.6.3
wget -O /tmp/maven.tar.gz https://apache.dattatec.com/maven/maven-3/3.6.3/binaries/apache-maven-$VERSION-bin.tar.gz
tar -zxvf /tmp/maven.tar.gz -C /etc/
mv /etc/apache-maven-$VERSION /etc/maven
update-alternatives --install /usr/bin/mvn mvn /etc/maven/bin/mvn 1
