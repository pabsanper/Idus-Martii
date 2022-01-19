-- -- One admin user, named admin1 with passwor 4dm1n and authority admin

-- -- One owner user, named owner1 with passwor 0wn3r
-- INSERT INTO users(username,password,enabled) VALUES ('owner1','0wn3r',TRUE);
-- INSERT INTO authorities(id,username,authority) VALUES (2,'owner1','admin');

-- INSERT INTO users(username,password,enabled) VALUES ('antsermen','antsermen123',TRUE);
-- INSERT INTO authorities(id,username,authority) VALUES (4,'antsermen','admin');

-- INSERT INTO users(username,password,enabled) VALUES ('mancarver1','contraseña',TRUE);
-- INSERT INTO authorities(id,username,authority) VALUES (5,'mancarver1','admin');

-- INSERT INTO users(username,password,enabled) VALUES ('josariexp','contraseña',TRUE);
-- INSERT INTO authorities(id,username,authority) VALUES (6,'josariexp','admin');

-- INSERT INTO users(username,password,enabled) VALUES ('juamorper','juamorper2',TRUE);
-- INSERT INTO authorities(id,username,authority) VALUES (7,'juamorper','admin');

-- INSERT INTO users(username,password,enabled) VALUES ('pabsanper','robe',TRUE);
-- INSERT INTO authorities(id,username,authority) VALUES (8,'pabsanper','admin');

-- One vet user, named vet1 with passwor v3t
-- INSERT INTO users(id,username,password,enabled) VALUES (1,'vet1','v3t',TRUE);
-- INSERT INTO authorities(id,username,authority) VALUES (3,'vet1','veterinarian');

INSERT INTO vets VALUES (1, 'James', 'Carter');
INSERT INTO vets VALUES (2, 'Helen', 'Leary');
INSERT INTO vets VALUES (3, 'Linda', 'Douglas');
INSERT INTO vets VALUES (4, 'Rafael', 'Ortega');
INSERT INTO vets VALUES (5, 'Henry', 'Stevens');
INSERT INTO vets VALUES (6, 'Sharon', 'Jenkins');

INSERT INTO specialties VALUES (1, 'radiology');
INSERT INTO specialties VALUES (2, 'surgery');
INSERT INTO specialties VALUES (3, 'dentistry');

INSERT INTO vet_specialties VALUES (2, 1);
INSERT INTO vet_specialties VALUES (3, 2);
INSERT INTO vet_specialties VALUES (3, 3);
INSERT INTO vet_specialties VALUES (4, 2);
INSERT INTO vet_specialties VALUES (5, 1);

INSERT INTO types VALUES (1, 'cat');
INSERT INTO types VALUES (2, 'dog');
INSERT INTO types VALUES (3, 'lizard');
INSERT INTO types VALUES (4, 'snake');
INSERT INTO types VALUES (5, 'bird');
INSERT INTO types VALUES (6, 'hamster');

-- INSERT INTO owners VALUES (1, 'George', 'Franklin', '110 W. Liberty St.', 'Madison', '6085551023', 'owner1');
-- INSERT INTO owners VALUES (2, 'Betty', 'Davis', '638 Cardinal Ave.', 'Sun Prairie', '6085551749', 'owner1');
-- INSERT INTO owners VALUES (3, 'Eduardo', 'Rodriquez', '2693 Commerce St.', 'McFarland', '6085558763', 'owner1');
-- INSERT INTO owners VALUES (4, 'Harold', 'Davis', '563 Friendly St.', 'Windsor', '6085553198', 'owner1');
-- INSERT INTO owners VALUES (5, 'Peter', 'McTavish', '2387 S. Fair Way', 'Madison', '6085552765', 'owner1');
-- INSERT INTO owners VALUES (6, 'Jean', 'Coleman', '105 N. Lake St.', 'Monona', '6085552654', 'owner1');
-- INSERT INTO owners VALUES (7, 'Jeff', 'Black', '1450 Oak Blvd.', 'Monona', '6085555387', 'owner1');
-- INSERT INTO owners VALUES (8, 'Maria', 'Escobito', '345 Maple St.', 'Madison', '6085557683', 'owner1');
-- INSERT INTO owners VALUES (9, 'David', 'Schroeder', '2749 Blackhawk Trail', 'Madison', '6085559435', 'owner1');
-- INSERT INTO owners VALUES (10, 'Carlos', 'Estaban', '2335 Independence La.', 'Waunakee', '6085555487', 'owner1');

-- INSERT INTO owners VALUES (11, 'Antonio Roberto', 'Serrano Mena', '67 Tarfia', 'Sevilla', '1234567890', 'antsermen');
-- INSERT INTO owners VALUES (12, 'Manuel', 'Carnero', 'Sevilla', 'España', '6085555487', 'mancarver1');
-- INSERT INTO owners VALUES (13, 'Juan Carlos', 'Moreno', 'Goleta 5C', 'Barbate', '147852369', 'juamorper');
-- INSERT INTO owners VALUES (14, 'José Ramón', 'Arias Expósito', '32 Monzón', 'Sevilla', '6085552652', 'josariexp');


-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (1, 'Leo', '2010-09-07', 1, 1);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (2, 'Basil', '2012-08-06', 6, 2);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (3, 'Rosy', '2011-04-17', 2, 3);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (4, 'Jewel', '2010-03-07', 2, 3);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (5, 'Iggy', '2010-11-30', 3, 4);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (6, 'George', '2010-01-20', 4, 5);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (7, 'Samantha', '2012-09-04', 1, 6);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (8, 'Max', '2012-09-04', 1, 6);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (9, 'Lucky', '2011-08-06', 5, 7);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (10, 'Mulligan', '2007-02-24', 2, 8);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (11, 'Freddy', '2010-03-09', 5, 9);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (12, 'Lucky', '2010-06-24', 2, 10);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (13, 'Sly', '2012-06-08', 1, 10);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (14, 'Mordisquitos', '2017-04-02', 2, 11);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (15, 'Perro', '2012-06-08', 1,12);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (16, 'Afri', '2012-08-10', 2,13);
-- INSERT INTO pets(id,name,birth_date,type_id,owner_id) VALUES (17, 'Duque', '2014-05-15', 2,13);


-- INSERT INTO visits(id,pet_id,visit_date,description) VALUES (1, 7, '2013-01-01', 'rabies shot');
-- INSERT INTO visits(id,pet_id,visit_date,description) VALUES (2, 8, '2013-01-02', 'rabies shot');
-- INSERT INTO visits(id,pet_id,visit_date,description) VALUES (3, 8, '2013-01-03', 'neutered');
-- INSERT INTO visits(id,pet_id,visit_date,description) VALUES (4, 7, '2013-01-04', 'spayed');
INSERT INTO matches (id,name,round,turn,votes_in_favor,votes_against,plays,finished)VALUES (1, 'partida1', 0, 0, 0, 0, 0, false);

INSERT INTO users(email,username,password,enabled) VALUES ('admin@gmail.com','admin1','4dm1n',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (1,'admin1','admin');
INSERT INTO players(id,name,card1,card2,vote,role,username,match_id,asigned) VALUES (1, 'player1', '1', 1, null, 0, 'admin1',1,false);

INSERT INTO users(email,username,password,enabled) VALUES ('ppp@gmail.com','ppp','ppp',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (2,'ppp','admin');

INSERT INTO users(email,username,password,enabled) VALUES ('friend1@gmail.com','friend1','friend1',TRUE);
INSERT INTO players(id,name,card1,card2,vote,role,username,match_id,asigned) VALUES (2, 'player2', '1', 2, null, 1, 'friend1',1,false);
INSERT INTO authorities(id,username,authority) VALUES (3,'friend1','user');

INSERT INTO users(email,username,password,enabled) VALUES ('friend2@gmail.com','friend2','friend2',TRUE);
INSERT INTO players(id,name,card1,card2,vote,role,username,match_id,asigned) VALUES (3, 'player3', '0', 1, null, 2,'friend2',1,false);
INSERT INTO authorities(id,username,authority) VALUES (4,'friend2','user');

INSERT INTO users(email,username,password,enabled) VALUES ('friend3@gmail.com','friend3','friend3',TRUE);
INSERT INTO players(id,name,card1,card2,vote,role,username,match_id,asigned) VALUES (4, 'player4', '2', 0, null, 2,'friend3',1,false);
INSERT INTO authorities(id,username,authority) VALUES (5,'friend3','user');

INSERT INTO users(email,username,password,enabled) VALUES ('friend4@gmail.com','friend4','friend4',TRUE);
INSERT INTO players(id,name,card1,card2,vote,role,username,match_id,asigned) VALUES (5, 'player5', '1', 2, null, 3, 'friend4',1,false);
INSERT INTO authorities(id,username,authority) VALUES (6,'friend4','user');

INSERT INTO users(email,username,password,enabled) VALUES ('friend5@gmail.com','friend5','friend5',TRUE);
INSERT INTO players(id,name,card1,card2,vote,role,username,match_id,asigned) VALUES (6, 'player6', '2', 2, null, 3, 'friend5',1,false);
INSERT INTO authorities(id,username,authority) VALUES (7,'friend5','user');

INSERT INTO invitations(id,match_id,username) VALUES (0,1,'friend1');
INSERT INTO invitations(id,match_id,username) VALUES (1,1,'ppp');

INSERT INTO achievement_type(id, name) VALUES (1,'jugadas');
INSERT INTO achievement_type(id, name) VALUES (2,'ganadas');


INSERT INTO achievements(id,name,description, valor, achievement_type) VALUES (1,'Primera Partida', 'Juega tu primera partida de Idus Martii', 1, 1);
INSERT INTO achievements(id,name,description, valor, achievement_type) VALUES (2,'5 Partidas', 'Juega 5 partidas de Idus Martii', 5, 1);
INSERT INTO achievements(id,name,description, valor, achievement_type) VALUES (3,'Primera Victoria', 'Gana tu partidas de Idus Martii', 1, 2);

INSERT INTO achievement_user(user_username,achievements_id) VALUES ('admin1',1);
INSERT INTO achievement_user(user_username,achievements_id) VALUES ('admin1',2);

INSERT INTO friends(user_username,friends_username) VALUES ('admin1','friend1');
INSERT INTO friends(user_username,friends_username) VALUES ('friend1','admin1');
INSERT INTO friends(user_username,friends_username) VALUES ('admin1','friend2');
INSERT INTO friends(user_username,friends_username) VALUES ('friend2','admin1');

INSERT INTO friends_invitations(id,username2,username) VALUES (1,'friend1','ppp');




