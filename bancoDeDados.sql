--1
create table aluno
(
    numal char(7) not null primary key,
	nome varchar(25), 
    telefone varchar(20)
)
;
--
create table disciplina
(
 códdisc varchar(4) not null primary key,
 nome varchar(50) not null
)
;

create table inscricao
(
    numal CHAR(7) NOT NULL,
    coddisc VARCHAR(4) NOT NULL,

    ano SMALLINT NOT NULL,
    semestre TINYINT NOT NULL,
    aprovado BIT,
    classif TINYINT,

    CONSTRAINT insc_pk PRIMARY KEY(numal, coddisc),
    CONSTRAINT sem_ck CHECK (semestre BETWEEN 1 AND 2),
    CONSTRAINT classif_ck CHECK (classif BETWEEN 0 AND 20)
);

--2
ALTER TABLE aluno ADD MORADA CHAR(50) NOT NULL;
ALTER TABLE aluno ALTER COLUMN MORADA VARCHAR(50) NOT NULL; 

ALTER TABLE aluno DROP COLUMN MORADA;

--3
ALTER TABLE aluno ALTER COLUMN numal CHAR(7) NOT NULL PRIMARY KEY;
ALTER TABLE disciplina ALTER COLUMN coddisc VARCHAR(4) NOT NULL PRIMARY KEY;
ALTER TABLE inscricao ADD CONSTRAINT insc_pk PRIMARY KEY(numal, coddisc, ano);


--4
ALTER TABLE inscricao ADD CONSTRAINT aluno_fk FOREIGN KEY(numal)
 REFERENCES aluno(numal);
ALTER TABLE inscricao ADD CONSTRAINT disc_fk FOREIGN KEY(códdisc) 
REFERENCES disciplina(coddisc);


--5
ALTER TABLE inscricao ADD CONSTRAINT semestre_ck CHECK (semestre BETWEEN 0 AND 2);

ALTER TABLE inscricao ADD CONSTRAINT classif_ck CHECK (classif BETWEEN 0 AND 20);

ALTER TABLE inscricao ADD CONSTRAINT aprovado_ck CHECK (classif BETWEEN 0 AND 1);

ALTER TABLE inscricao ADD CONSTRAINT aprovado_ck2 CHECK 
((aprovado = 1 AND clas >= 10) OR (aprovado = 0 AND clas < 10));



--6
INSERT INTO aluno (numal, nome)
VALUES ('12', 'Yuri');

INSERT INTO disciplina (coddisc, nome)
VALUES ('35', 'BancoDados');

INSERT INTO inscricao (numal, coddisc, ano, semestre, classif)
VALUES ('12', '4', '2021', 1, 3);

--7
DELETE from inscricao 
WHERE
classif is NULL
; 
*/

--8
INSERT INTO inscricao (numal, coddisc, ano, semestre, aprovado, classif)
VALUES ('12', '1', '2018', 1, 0, null);

INSERT INTO inscricao (numal, coddisc, ano, semestre, aprovado, classif)
VALUES ('12', '2', '2018', 1, 0, null);

INSERT INTO inscricao (numal, coddisc, ano, sem, aprovado, classif)
VALUES ('35', '1', '2018', 1, 0, null);

INSERT INTO inscricao (numal, coddisc, ano, sem, aprovado, classif)
VALUES ('35', '2', '2018', 1, 0, null);

--9
Update inscricao set aprovado=1 
WHERE classif>-10 AND aprovado =0
