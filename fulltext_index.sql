-- MARIADB

-- possono essere creati solo su campi di testo (VARCHAR, TEXT, CHAR)
-- Nella clausola MATCH possono essere inclusi più campi, ma è fondamentale che tutti facciano parte dell'indice FULLTEXT creato. 
-- È altrettanto essenziale che, se l'indice include più campi, tutti vengano nominati nella clausola MATCH.

CREATE FULLTEXT INDEX part_fulltext ON partecipante (part_cognome);

explain SELECT * FROM partecipante p  WHERE MATCH (part_cognome) AGAINST ('Rossi');

select part_id,part_cognome ,MATCH(part_cognome) AGAINST ('Rossi') from partecipante

select part_id,part_cognome ,MATCH(part_cognome) AGAINST('+Verdi -Rossi' IN BOOLEAN MODE) from partecipante

select part_id,part_cognome ,MATCH(part_cognome) AGAINST ('Ros*' IN BOOLEAN MODE) from partecipante
where MATCH(part_cognome) AGAINST ('Ros*' IN BOOLEAN MODE)

-- POSTGRES

-- serve creare una colonna di tipologia tsvector (un formato usato da postgres)
-- successivamente si usa to_tsquery per effettuare la ricerca
ALTER TABLE partecipanti ADD COLUMN partecipanti_tsvector tsvector GENERATED ALWAYS AS (to_tsvector('simple', part_cognome)) STORED;
CREATE INDEX indice_fulltext ON partecipanti USING GIN (partecipanti_tsvector);

-- La funzione to_tsvector è utilizzata per trasformare una stringa di testo in un tsvector, che è un tipo di dati in PostgreSQL progettato per l'indicizzazione e la ricerca full-text.
-- Un tsvector rappresenta un elenco di token estratti dal testo, come parole, 
-- e le posizioni in cui compaiono nel testo originale. Questi token sono normalmente normalizzati per rimuovere la differenziazione tra maiuscole e minuscole e altre variazioni.

SELECT to_tsvector('english', 'This is a test');

-- La funzione to_tsquery trasforma una stringa di testo in un tsquery, che è un tipo di dati usato per rappresentare una query di ricerca testuale. 
-- Questa funzione analizza la stringa di ricerca e la converte in un formato che può essere confrontato con i dati in un tsvector.

SELECT to_tsquery('english', 'test & string');


select to_tsvector('english', 'This is a test'), to_tsquery('english', 'test & string') from partecipanti p 
where to_tsvector('english', 'This is a test')  @@ to_tsquery('english', 'test | string')