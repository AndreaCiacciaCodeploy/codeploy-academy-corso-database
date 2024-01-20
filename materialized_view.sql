-- POSTGRES

CREATE MATERIALIZED VIEW classifica_materialized as
select
part_nome ,
part_cognome ,
ris_punteggio,
ris_posizione,
camp_nome
from partecipante p inner join risultati r  on p.part_id  = r.ris_part_id
inner join campionati c on c.camp_id  = r.ris_camp_id

REFRESH MATERIALIZED view classifica_materialized


-- MARIADB
-- EVENT SCHEDULER

-- enable event_scheduler
SET GLOBAL event_scheduler = ON;
-- how show events from information schema
SELECT * FROM information_schema.EVENTS;

-- create update events
DELIMITER //

CREATE OR REPLACE EVENT update_materialized_view
ON SCHEDULE EVERY 1 MINUTE  
DO
BEGIN
  TRUNCATE TABLE classifiche_materialized;
  INSERT INTO classifiche_materialized
  SELECT 
	p.part_nome, 
	part_cognome, 
	c.camp_nome,
	r.ris_punteggio, 
	r.ris_posizione
  FROM innodb.partecipante p 
  INNER JOIN innodb.risultati r ON p.part_id = r.ris_part_id 
  INNER JOIN innodb.campionati c ON c.camp_id = r.ris_camp_id;
  COMMIT;
END //

DELIMITER ;


-- store procedure (from trigger or script )
DELIMITER //
CREATE OR REPLACE PROCEDURE updateMaterializedView ()
BEGIN
DROP TABLE IF EXISTS classifiche_materialized;
create table innodb.classifiche_materialized as 
select 
p.part_nome , 
part_cognome, 
c.camp_nome ,
r.ris_punteggio , 
r.ris_posizione
from innodb.partecipante p 
inner join innodb.risultati r on p.part_id  = r.ris_part_id 
inner join innodb.campionati c on c.camp_id = r.ris_camp_id ;
END; //
DELIMITER ;

