-- POSTGRES

CREATE TABLE public.partecipanti (
	part_id serial4 NOT NULL,
	part_nome varchar NOT NULL,
	part_cognome varchar NOT NULL,
	part_data_nascita date NOT NULL,
	part_tessera varchar NOT NULL,
	CONSTRAINT part_pk PRIMARY KEY (part_id)
);
CREATE INDEX partecipanti_part_nome_idx ON public.partecipanti USING btree (part_nome);

CREATE TABLE public.campionati (
	camp_id serial4 NOT NULL,
	camp_nome varchar NOT NULL,
	camp_luogo varchar NOT NULL,
	CONSTRAINT camp_pk PRIMARY KEY (camp_id)
);

CREATE TABLE public.risultati (
	risu_id serial4 NOT NULL,
	risu_punteggio int4 NOT NULL,
	risu_posizione int4 NOT NULL,
	risu_part_id int4 NOT NULL,
	risu_camp_id int4 NOT NULL,
	CONSTRAINT risu_pk PRIMARY KEY (risu_id)
);


-- MARIADB


CREATE TABLE `partecipanti` (
  `part_id` int(11) NOT NULL AUTO_INCREMENT,
  `part_nome` varchar(100) DEFAULT NULL,
  `part_cognome` varchar(100) DEFAULT NULL,
  `part_tessera` varchar(100) NOT NULL,
  `part_eta` int(11) DEFAULT NULL,
  PRIMARY KEY (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `campionati` (
  `camp_id` int(11) NOT NULL AUTO_INCREMENT,
  `camp_nome` varchar(100) DEFAULT NULL,
  `camp_data` date DEFAULT NULL,
  `camp_luogo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`camp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


CREATE TABLE `risultati` (
  `ris_id` int(11) NOT NULL AUTO_INCREMENT,
  `ris_punteggio` int(11) NOT NULL,
  `ris_posizione` int(11) NOT NULL,
  `ris_part_id` int(11) NOT NULL,
  `ris_camp_id` int(11) NOT NULL,
  PRIMARY KEY (`ris_id`),
  KEY `risultati_FK` (`ris_part_id`),
  KEY `risultati_FK_1` (`ris_camp_id`),
  CONSTRAINT `risultati_FK` FOREIGN KEY (`ris_part_id`) REFERENCES `partecipante` (`part_id`),
  CONSTRAINT `risultati_FK_1` FOREIGN KEY (`ris_camp_id`) REFERENCES `campionati` (`camp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;