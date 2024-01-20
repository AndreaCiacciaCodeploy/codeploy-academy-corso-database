# Tuning tool MariaDB & Postgres

Alcune utility open per lavorare con MariaDb e Postgres

## MariaDb - MySqlTuner

Possiamo usare MySqlTuner (script in perl) per effettuare un monitoraggio con indicazione di quali eventuali parametri possiamo ottimizzare.
Effettua una lunga lista di controlli  (circa 300) sul database.

### Informazioni di sicurezza e accesso
Confronto della versione installata capire se è vulnerabile
Controlla cache, indici e connessioni
Controlla slow queries e performance di join e altre operazioni comuni
Si tratta di uno script di sola lettura che analizza e vi suggerisce le impostazioni più veloce e sicure. S

https://github.com/major/MySQLTuner-perl
```
wget http://mysqltuner.pl/ -O mysqltuner.pl
wget https://raw.githubusercontent.com/major/MySQLTuner-perl/master/basic_passwords.txt -O basic_passwords.txt
wget https://raw.githubusercontent.com/major/MySQLTuner-perl/master/vulnerabilities.csv -O vulnerabilities.csv
```
Necessario avere mysql-client
Usare eventualmente immagine docker tramite Dockerfile

### build image
```docker build -t mysqltuner-image .```


### run mysqltuner in docker
```docker run -it --rm mysqltuner-image perl mysqltuner.pl --host hostdatabase m --port 3306 --user nomeutente --password passworddb --forcemem 7500```


## MariaDb - Explain visualizer

https://explainmysql.com/

## Postgres - PgTune

PGTune calcola la configurazione per PostgreSQL in base alle prestazioni massime per una determinata configurazione hardware.
https://pgtune.leopard.in.ua/

Impostiamo i valori richiesti e otteniamo una serie di modifiche e opzioni di configurazione da impostare.

## Postgres - PgBadger

È uno strumento da riga di comando che analizza i file di log di PostgreSQL.
PgBadger è un analizzatore di log PostgreSQL che offre un dettagliato report di performance. Fornisce un'analisi completa delle attività del database, 
inclusi i tempi di esecuzione delle query lente.

https://pgbadger.darold.net/

```pgbadger postgresql.log.2024-01-17-20```


## Postgres - Explain visualizer

- https://explain.dalibo.com/
- https://explain.dalibo.com/plan/218dda04e337dc2f
- https://www.pgexplain.dev/
- https://tatiyants.com/pev/#/plans

