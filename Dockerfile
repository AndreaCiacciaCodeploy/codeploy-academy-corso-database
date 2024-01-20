FROM debian:latest

RUN apt-get update && apt-get install -y default-mysql-client
RUN apt-get install -y wget perl

RUN wget http://mysqltuner.pl/ -O mysqltuner.pl
RUN chmod +x mysqltuner.pl
RUN wget https://raw.githubusercontent.com/major/MySQLTuner-perl/master/basic_passwords.txt -O basic_passwords.txt
RUN wget https://raw.githubusercontent.com/major/MySQLTuner-perl/master/vulnerabilities.csv -O vulnerabilities.csv

ENTRYPOINT ["perl", "mysqltuner.pl"]





