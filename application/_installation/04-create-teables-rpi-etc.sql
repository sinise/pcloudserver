DROP TABLE IF EXISTS rpi;
DROP TABLE IF EXISTS userWanAsoc;
DROP TABLE IF EXISTS userRpiAsoc;
DROP TABLE IF EXISTS rpiStatus;
DROP TABLE IF EXISTS commands;

CREATE TABLE rpi(
   mac            VARCHAR (17)   NOT NULL,
   creatTime      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,    # Creation time
   PRIMARY KEY (mac)
);

CREATE TABLE userWanAsoc(
   id             INT (11)       NOT NULL AUTO_INCREMENT,
   user_id        INT (11)       NOT NULL,
   wan            VARCHAR (15)   NOT NULL,
   creatTime      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,    # Creation time
   PRIMARY KEY (id)
);

CREATE TABLE userRpiAsoc(
   id             INT (11)       NOT NULL AUTO_INCREMENT,
   user_id        INT (11)       NOT NULL,
   mac            VARCHAR (17)   NOT NULL,
   creatTime      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,    # Creation time
   PRIMARY KEY (id)
);

CREATE TABLE rpiStatus(
   id             INT            NOT NULL AUTO_INCREMENT,
   ip             VARCHAR (15)   NOT NULL,
   mac            VARCHAR (17)   NOT NULL,
   wan            VARCHAR (15)   NOT NULL,
   cpu            VARCHAR (8)    NOT NULL,
   ram            VARCHAR (8)    NOT NULL,
   url            VARCHAR (2000) ,
   urlViaServer   SMALLINT       ,                                      # 0 = direct 1 =  via cloudscreen.dk 
   orientation    SMALLINT       NOT NULL,
   lastMTansTime  VARCHAR (8)   ,
   creatTime      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,    # Creation time
   PRIMARY KEY (id)
);

CREATE TABLE commands(
   id             INT            NOT NULL AUTO_INCREMENT,
   mac            VARCHAR (17)   NOT NULL,
   command        VARCHAR (8000) ,                                      # Shell command
   url            VARCHAR (2000) ,
   urlViaServer   SMALLINT       ,                                      # 0 = direct 1 =  via cloudscreen.dk 
   orientation    SMALLINT       ,                                      # 0 = landscape 1 = potrait
   creatTime      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,    # Creation time
   PRIMARY KEY (id)
);

/*
# insert sample information to members
INSERT INTO members (FirstName, LastName, Email, Password) VALUES('Oscar', 'Roth Andersen', 'oscarrothandersen@gmail.com', 'passw0rd');
INSERT INTO members (FirstName, LastName, Email, Password) VALUES('Vivien', 'verdens-n�stl�ngeste-navn', 'vivien@gmail.com', 'p4ssw0rd');
INSERT INTO members (FirstName, LastName, Email, Password) VALUES('Sebastian', 'Ostenfeldt Jensen', 'sebastian@momentos.dk', 'pa55w0rd');

# insert sample information to PERMISSIONS
INSERT INTO permissions (RankName, Organise, Scannerman, Scan) VALUES('Organiser', TRUE, TRUE, TRUE);
INSERT INTO permissions (RankName, Organise, Scannerman, Scan) VALUES('Scannerman', FALSE, FALSE, TRUE);
INSERT INTO permissions (RankName, Organise, Scannerman, Scan) VALUES('Right hand', FALSE, TRUE, TRUE);
INSERT INTO permissions (RankName, Organise, Scannerman, Scan) VALUES('Guest', FALSE, FALSE, FALSE);

# insert sample information to CATEGORIES
INSERT INTO categories (CatName) VALUES('Fest');
INSERT INTO categories (CatName) VALUES('Koncert');
INSERT INTO categories (CatName) VALUES('Messe');
INSERT INTO categories (CatName) VALUES('Cirkus');

# insert sample information to ADS
INSERT INTO ads (AdName, AdPicture) VALUES('Carlsberg', 'carlsberg.png');
INSERT INTO ads (AdName, AdPicture) VALUES('Bog og Id�', 'relevant.png');
INSERT INTO ads (AdName, AdPicture) VALUES('Tycho Brahe's Studiebod', 'wuuut.png');

# insert sample information to EVENTS
INSERT INTO events (CategoryId, AdId, EventName, EventStart, EventEnd, Description, Location, Venue, URLName, Publicity) 
       VALUES (1, 2, 'Fishing in a pond', '2014-04-20 16:00:00', '2014-04-20 23:00:00', 'Det her bliver for vildt!!!', 'Ved andedammen', 'Andedammen', 'andedam', TRUE);
INSERT INTO events (CategoryId, AdId, EventName, EventStart, EventEnd, Description, Location, Venue, URLName, Publicity) 
       VALUES (2, 2, 'Vivien bliver oldgammel', '2014-04-29 08:00:00', '2014-04-30 23:00:00', '10000 �r gammel', 'Under bordet', 'Under bordet', 'vivien', TRUE);

# insert sample information to TICKETS
INSERT INTO tickets (UserId, EventId, Details, QRcode, IP) VALUES(1, 32, '...', 'QRQRQRQR', '234.543.234.543');
INSERT INTO tickets (UserId, EventId, Details, QRcode, IP) VALUES(2, 32, '...', 'QRQRQRQR', '234.543.234.543');
INSERT INTO tickets (UserId, EventId, Details, QRcode, IP) VALUES(3, 32, '...', 'QRQRQRQR', '234.543.234.543');
INSERT INTO tickets (UserId, EventId, Details, QRcode, IP) VALUES(2, 33, '...', 'QRQRQRQR', '234.543.234.543');

# insert sample information to ACTORS
INSERT INTO actors (EventId, UserId, RankId) VALUES(32, 1, 1);
INSERT INTO actors (EventId, UserId, RankId) VALUES(32, 2, 2);
INSERT INTO actors (EventId, UserId, RankId) VALUES(32, 3, 3);
INSERT INTO actors (EventId, UserId, RankId) VALUES(33, 1, 4);
INSERT INTO actors (EventId, UserId, RankId) VALUES(33, 2, 3);
*/
