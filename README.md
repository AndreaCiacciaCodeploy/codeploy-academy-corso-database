# codeploy-academy-corso-database

Questo repository contiene materiale usato durante il corso sui database relazionali.

- **create_database.sql**
Contiene sql per creare struttura tabelle per esempi (Postgres)

- **insert_partecipanti.py**
script python per creare inserimenti dati per tabella partecipanti 

- **fulltext_index.sql**
istruzioni e informazioni per la gestione degli indici fulltext su Postgres e MariaDb

- **materialized_view.sql**
esempi di creazione viste materializzate su Postgres e MariaDB.
MariaDB non ha le viste materializzate quindi sono presenti due modalità: eventi e store procedure;

- **algebra_relazionale.md**
Informazioni inerenti l'algebra relazionale.

- **tools.md**
tools di monitoraggio e visualizzazione explain per Postgres e MariaDb

- **vacuum_script.sh**
script per l'esecuzione del vacuum su Postgres

- **Dockerfile**
docker file per l'esecuzione del tool MySqlTuner (documentato su tools.md)

### GPT

Durante il corso ho usato qualche slide, ma invece di aggiungere qui le slide ho pensato di darle in pancia a un GPT
che potete consultare qui -> https://chat.openai.com/g/g-bTPeGEy4L-scopriamo-i-database-relazionali