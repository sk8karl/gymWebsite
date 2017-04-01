# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Värd: localhost (MySQL 5.6.35)
# Databas: Gym_db
# Genereringstid: 2017-03-30 15:26:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Tabelldump activities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activities`;

CREATE TABLE `activities` (
  `A_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`A_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;

INSERT INTO `activities` (`A_id`, `activity`)
VALUES
	(1,'Gym'),
	(2,'Bollspel'),
	(3,'Gruppträning'),
	(4,'Simning'),
	(5,'Klättring'),
	(6,'Racketsport'),
	(8,'Personlig tränare'),
	(9,'Crossfit'),
	(10,'Parkour');

/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump general_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `general_info`;

CREATE TABLE `general_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gymma_logo_path` varchar(50) DEFAULT NULL,
  `backgroundImagePath` varchar(50) DEFAULT NULL,
  `backgroundImagePath2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `general_info` WRITE;
/*!40000 ALTER TABLE `general_info` DISABLE KEYS */;

INSERT INTO `general_info` (`id`, `gymma_logo_path`, `backgroundImagePath`, `backgroundImagePath2`)
VALUES
	(1,'gymmaLogo2.jpg','marklyft.jpeg','biffar.jpeg');

/*!40000 ALTER TABLE `general_info` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump gym
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gym`;

CREATE TABLE `gym` (
  `G_id` int(11) NOT NULL AUTO_INCREMENT,
  `gym_name` varchar(50) NOT NULL DEFAULT '',
  `logo_path` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`G_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `gym` WRITE;
/*!40000 ALTER TABLE `gym` DISABLE KEYS */;

INSERT INTO `gym` (`G_id`, `gym_name`, `logo_path`, `website`)
VALUES
	(1,'Campus1477','campus_1477.gif','http://campus1477.se/sv/'),
	(2,'Actic','actic-logo.png','http://www.actic.se/'),
	(3,'Friskis&Svettis','friskis.png','http://web.friskissvettis.se/'),
	(4,'Fitness24Seven','24-7-logo.jpg','https://sv.fitness24seven.com/'),
	(5,'Womens Wellness','ww-logo.jpg','http://womenswellness.se/'),
	(6,'Nordic Wellness','n-w.png','https://nordicwellness.se/'),
	(7,'Puls & Träning','p-t.jpg','https://www.pulsochtraning.se/'),
	(8,'SATS','sats.png','https://www.sats.se/'),
	(9,'MCW Crossfit Garage','MCW.jpg','http://www.mcwcrossfit.se/'),
	(10,'Crossfit Uppsala','crossfituppsala.jpg','http://www.crossfituppsala.se/'),
	(11,'Crossfit Vanheim','vanheim.jpeg','http://crossfitvanheim.se/'),
	(12,'Power Center','powercenter.png','http://powercenter.se/'),
	(13,'EFCT Sports Center','efct.jpg','http://www.efct.se/'),
	(14,'Curves','curves.png','http://www.curves.eu/se'),
	(15,'MyTraining','mytraining.jpg','http://www.mytraining.se/'),
	(16,'Antonis Gym','antonis-gym_logo.png','http://www.antonisgym.se/'),
	(17,'Allis','Allis.png','http://allis.uppsala.se/'),
	(18,'USIF','USIF.png','http://www.usif.se/sv/');

/*!40000 ALTER TABLE `gym` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump gym_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gym_activity`;

CREATE TABLE `gym_activity` (
  `g_id` int(11) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  KEY `company_ref` (`g_id`),
  KEY `activity_ref` (`a_id`),
  CONSTRAINT `activity_ref` FOREIGN KEY (`a_id`) REFERENCES `activities` (`A_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `company_ref` FOREIGN KEY (`g_id`) REFERENCES `gym` (`G_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `gym_activity` WRITE;
/*!40000 ALTER TABLE `gym_activity` DISABLE KEYS */;

INSERT INTO `gym_activity` (`g_id`, `a_id`)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,5),
	(1,6),
	(1,8),
	(2,1),
	(2,3),
	(2,8),
	(2,4),
	(3,1),
	(3,3),
	(3,8),
	(4,1),
	(5,1),
	(5,8),
	(5,3),
	(6,1),
	(6,3),
	(6,4),
	(6,8),
	(7,1),
	(7,3),
	(7,8),
	(4,3),
	(8,1),
	(8,3),
	(8,6),
	(8,4),
	(8,8),
	(9,8),
	(9,9),
	(10,9),
	(10,8),
	(11,9),
	(11,8),
	(12,1),
	(12,8),
	(12,3),
	(13,1),
	(13,3),
	(13,8),
	(14,8),
	(14,1),
	(14,3),
	(15,1),
	(15,8),
	(15,3),
	(16,1),
	(16,8),
	(17,1),
	(17,5),
	(17,10),
	(18,1),
	(18,6),
	(18,3),
	(18,2);

/*!40000 ALTER TABLE `gym_activity` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump gym_town
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gym_town`;

CREATE TABLE `gym_town` (
  `town_area` varchar(40) DEFAULT '',
  `g_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `mapsSearchString` varchar(40) DEFAULT NULL,
  KEY `company` (`g_id`),
  KEY `town` (`t_id`),
  CONSTRAINT `company` FOREIGN KEY (`g_id`) REFERENCES `gym` (`G_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `town` FOREIGN KEY (`t_id`) REFERENCES `town` (`T_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `gym_town` WRITE;
/*!40000 ALTER TABLE `gym_town` DISABLE KEYS */;

INSERT INTO `gym_town` (`town_area`, `g_id`, `t_id`, `mapsSearchString`)
VALUES
	('Campus1477_Uppsala',1,1,'1477'),
	('Friskis_Uppsala',3,1,'friskis'),
	('Actic_Uppsala',2,1,'actic'),
	('Friskis_Stockholm',3,2,'friskis'),
	('24-7_Uppsala',4,1,'fitnett24seven'),
	('Actic_Stockholm',2,2,'actic'),
	('24-7_Stockholm',4,2,'fitnett24seven'),
	('womensWellness_uppsala',5,1,'womens wellness'),
	('nordicWellness_uppsala',6,1,'nordic wellness'),
	('nordicWellness_uppsala',6,2,'nordic wellness'),
	('puls&träning',7,1,'puls&träning'),
	('puls&träning',7,2,'puls&träning'),
	('SATS',8,3,'SATS'),
	('SATS',8,4,'SATS'),
	('SATS',8,2,'SATS'),
	('Actic_Malmö',2,3,'Actic'),
	('Actic_gbg',2,4,'Actic'),
	('friskis_malmö',3,3,'friskis'),
	('friskis_gbg',3,4,'friskis'),
	('nordicWellness_malmö',6,3,'nordic wellness'),
	('nordicWellness_gbg',6,4,'nordic wellness'),
	('puls&träning_gbg',7,4,'puls&träning'),
	('puls&träning',7,3,'puls&träning'),
	('24-7_malmö',4,3,'fitnett24seven'),
	('24-7_gbg',4,4,'fitnett24seven'),
	('MCW',9,1,'MCW'),
	('crossfitUppsala',10,1,'crossfit uppsala'),
	('vanheim',11,1,'crossfit vanheim'),
	('powercenter_uppsla',12,1,'power center'),
	('curves_uppsala',14,1,'curves'),
	('curves_sthlm',14,2,'curves'),
	('mytraning',15,1,'mytraining'),
	('antonis',16,1,'antonis gym'),
	('allis',17,1,'allis'),
	('USIF - Uppsala studenters IF',18,1,'USIF');

/*!40000 ALTER TABLE `gym_town` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump membership_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `membership_info`;

CREATE TABLE `membership_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `g_id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `info_gym` (`g_id`),
  CONSTRAINT `info_gym` FOREIGN KEY (`g_id`) REFERENCES `gym` (`G_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `membership_info` WRITE;
/*!40000 ALTER TABLE `membership_info` DISABLE KEYS */;

INSERT INTO `membership_info` (`id`, `g_id`, `description`)
VALUES
	(1,1,'12-månaderskort kan frysas i 60 dagar. Student kan frysa kort i 6 mån vid utlandsstudier.'),
	(2,1,'Kort kan frysas kostnadsfritt om man har läkarintyg.'),
	(3,1,'Gratis provträningsvecka vid terminsstarter.'),
	(4,2,'Få 2 timmar med personlig tränare som ny medlem.'),
	(5,2,'En månads uppsägningstid.'),
	(6,2,'Frysning av kort kan göras vid skada, sjukdom, graviditet samt arbete och studier vid annan ort.'),
	(7,3,'200 kr i medlemsavgift tillkommer årligen.'),
	(8,3,'Du får tillgång till alla anläggningar i din stad.'),
	(9,3,'Kort kan frysas vid ett tillfälle i max 60 dagar för 100 kr.'),
	(10,4,'Öppet dygnet runt.'),
	(11,4,'2 månaders uppsägningstid, ingen bindningstid.'),
	(12,4,'249 kr i startavgift.'),
	(13,5,'Inskrivningavgift á 1190 kr tillkommer vid start oavsett val av program.'),
	(14,5,'Gratis Kaffe, Te och tidningar.'),
	(15,5,'Roliga och nyttiga extra event under året som föreläsning, tävlingar, teampass m.m.'),
	(16,6,'Klubbavgift på 249 kr tillkommer vid tecknandet av autogiro-medlemskap.'),
	(17,6,'Kostnad för medlemskort/medlemsarmband tillkommer med 100 kr resp. 199 kr.'),
	(19,6,'Erbjuder barnpassning och Sol- och relax-avdelningar.'),
	(20,7,'\"Att bygga gym nära där folk bor, där alla kan trivas, oavsett ambitionsnivå!\"'),
	(21,7,'Inträdesavgift på 400 kr vid tecknande av medlemskap.'),
	(22,7,'Uppsägningstid på en månad.'),
	(24,8,'En månads uppsägningstid.'),
	(25,8,'Man har rätt att avsluta sitt medlemskap inom 3 veckor från dagen för ingånget Medlemsavtal'),
	(26,8,'SATS erbjuer specialträning såsom Martial Arts, Prformance, Squash, Immersive Fitness och Build\'n Burn. Dessa aktiviteter kostar 100-200 kr/mån.'),
	(27,9,'Första passet är alltid gratis och våra tränare hjälper dig under passet så att du hittar en bra nivå på övningarna.'),
	(28,9,'Vi har tre olika program att följa beroende på dina mål och förutsättningar: Hälsa, prestation och atlet.'),
	(29,9,'Erbjuder bland annat boxning, massage, fysioterapi, tyngdlyftning och endurance.'),
	(30,10,'Till varje terminsstart så släpper vi 10 stycken träningskort rabatterade med 10% till heltidsstuderande. Detta gäller på alla våra träningskort, du väljer vilket du vill ha!'),
	(31,10,'I alla medlemskap ingår också en uppföljning/hälsoutvärdering (värde 750kr) och en baskurs (värde 1400kr).'),
	(32,10,'Du är välkommen på vårt intropass som sker varje Lördagkl 12-13.'),
	(34,11,'Erbjuder crossfit, styrkelytf, gymnastik, tungdlyftning, strongman, massage och mobility & yoga.'),
	(35,11,'Bemannat dagtid och kvällar. Öppet 05:00-24:00.'),
	(36,11,'Erbjuder prova-på.pass.'),
	(37,12,'Startavgift 495 kr. Gäller ej för yoga-medlemskap. '),
	(38,12,'10 % rabbat för studenter, arbetssökande och pensionärer. Gäller ej startavgiften.'),
	(39,12,'I Startavgiften ingår en 45-minuters introduktion med instruktioner för dig som vill lära dig maskinerna och träna i gymmet.'),
	(40,13,'Startavgift mellan 50-740 kr beroende på medlemskap.'),
	(41,13,'EFCT Sport Center står för erfarenhet, kunskap, kompetens och känslan vi får av träningen.'),
	(42,13,'EFCT erbjuder supermoderna lokaler med stark designkänsla i inredning, träningslokaler, lounge och kringmiljö liksom högsta standard på maskiner och utrustning.'),
	(43,14,'Utformat för kvinnor.'),
	(44,14,'Curves-träningen kombinerar styrketräning med konditionsträning och stretching – allt på bara 30 minuter.'),
	(45,14,'CURVES HAR HJÄLPT 10 MILJONER KVINNOR\nCURVES HAR HJÄLPT 10 MILJONER KVINNOR\nFitness, måltidsplan och coaching'),
	(46,15,'550 kr i medlemsavgift (engångskostnad).'),
	(47,15,'I medlemskapen ingår konditionsmaskiner, styrkemaskiner, fria vikter, MILON, duschhandduk, svetthandduk, parkering, uppföljning, kaffe och té.'),
	(48,15,'Kom in till oss på Stålgatan 8 i Uppsala och be om att få provträna.'),
	(50,16,'Tills vidare sker all kortförsäljning i vår reception genom kontant- eller kortbetalning.'),
	(51,16,'Årskort och halvårskort kan pausas en gång, under en period mellan en och två månader.'),
	(52,16,'Öppettider är 04:00-23:00. Receptionen är öppen på eftermiddagarna på vardagar, för kortförsäljning mm. Öppettiderna är 13.00-19.00.'),
	(53,17,'Vi har professionell och engagerad personal på plats till varje aktivitet, du väljer själv om du vill träna på egen hand eller med hjälp av en instruktör.'),
	(54,17,'Till oss kan du komma utan att ha provat våra aktiviteter tidigare. Skulle du vilja ha hjälp av en instruktör så är du välkommen under våra drop-in tider. Priset för drop-in är 60 kr utöver entrékostnad.'),
	(55,17,'Vi har klätterväggar, parkourhall, skatebanor, danssal, gym och café.'),
	(56,18,'Erbjuder racketsporterna tennis, padel och squash.'),
	(57,18,'Innehåller fem tennisbanor, en squashbana, en multihall för t.ex. basket för 600+ åskådare, restaurang, konferens, kontor, parkeringsplatser och 500 kvm modernt gym.'),
	(58,18,'Alla medlemmar i USIF förening har 50 kr rabatt på alla träningskort.');

/*!40000 ALTER TABLE `membership_info` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump pricelist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricelist`;

CREATE TABLE `pricelist` (
  `PL_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL,
  `g_id` int(11) NOT NULL,
  `price_unit` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`PL_id`),
  KEY `company_pricelist` (`g_id`),
  CONSTRAINT `company_pricelist` FOREIGN KEY (`g_id`) REFERENCES `gym` (`G_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pricelist` WRITE;
/*!40000 ALTER TABLE `pricelist` DISABLE KEYS */;

INSERT INTO `pricelist` (`PL_id`, `category`, `price`, `g_id`, `price_unit`)
VALUES
	(1,'30 dagar (student)',495,1,'kr'),
	(2,'30 dagar',595,1,'kr'),
	(3,'Klippkort 10 gånger (giltigt 1 år)',995,1,'kr'),
	(7,'Årskort (student)',275,1,'kr/mån'),
	(8,'Årskort',345,1,'kr/mån'),
	(9,'Årskort (student)',3290,1,'kr'),
	(10,'Årskort kontant',4150,1,'kr'),
	(11,'Årskort dagtid',2290,1,'kr'),
	(12,'Årskort kontant',3350,3,'kr'),
	(13,'Årskort (student)',2600,3,'kr'),
	(14,'Årskort dagtid',2650,3,'kr'),
	(15,'Årskort',279,3,'kr/mån'),
	(16,'Årskort (student)',225,3,'kr/mån'),
	(17,'Dagspass',100,3,'kr'),
	(18,'Årskort',429,2,'kr/mån'),
	(19,'4 månader, månadskort',759,2,'kr/mån'),
	(20,'Årskort (student)',369,2,'kr/mån'),
	(21,'4 månader (student)',649,2,'kr/mån'),
	(22,'24 månader',389,2,'kr/mån'),
	(24,'24 månader (student)',339,2,'kr/mån'),
	(25,'Månadskort autogiro',199,4,'kr/mån'),
	(26,'Månadskort (student, pensionär)',169,4,'kr/mån'),
	(27,'30-dagarskort',620,3,'kr'),
	(30,'Livsstilsprogram - Bas, dagsavgift',23,5,'kr/dag'),
	(31,'Livsstilsprogram - \"Bra start\", dagsavgift',44,5,'kr/dag'),
	(32,'Livsstilsprogram - \"Förändra\", dagsavgift',65,5,'kr/dag'),
	(33,'Livsstilsprogram - \"Resultat\", dagsavgift',107,5,'kr/dag'),
	(34,'Livsstilsprogram - \"Förvandring\", dagsavgift',149,5,'kr/dag'),
	(35,'Livsstilsprogram - \"Biggest Winner\"',99000,5,'kr'),
	(36,'Årskort kontant',2988,6,'kr'),
	(37,'Månadskort autogiro',249,6,'kr/mån'),
	(39,'Express+',299,6,'kr/mån'),
	(40,'Sverigekortet',449,6,'kr/mån'),
	(41,'30-dagar, sverigekort',999,6,'kr'),
	(42,'Sverigekort (Student), autogiro',299,6,'kr/mån'),
	(43,'3 månader, sverigekort',1999,6,'kr'),
	(44,'10-klippkort',999,6,'kr'),
	(46,'Årskort',299,7,'kr/mån'),
	(47,'Årskort Samtliga gym',399,7,'kr/mån'),
	(48,'3 månaderskort',399,7,'kr/mån'),
	(49,'Årskort Seniorkort',239,7,'kr/mån'),
	(50,'6 månader (student)',299,7,'kr/mån'),
	(51,'Årskort',349,8,'kr/mån'),
	(52,'Årskort (student, pensionär)',299,8,'kr/mån'),
	(53,'Årskort + gruppträning',449,8,'kr/mån'),
	(54,'Månadskort',449,8,'kr/mån'),
	(55,'Månadskort + gruppträning',549,8,'kr/mån'),
	(56,'Månadskort',1000,9,'kr/mån'),
	(57,'6 månader',700,9,'kr/mån'),
	(58,'Årskort',600,9,'kr/mån'),
	(59,'PT-tillägg till medlemskort',250,9,'kr/mån'),
	(60,'Årskort',800,10,'kr/mån'),
	(61,'Årskort kontant',9000,10,'kr'),
	(62,'6 månader kontant',5700,10,'kr'),
	(63,'6 månader',1000,10,'kr/mån'),
	(64,'Årskort',650,11,'kr/mån'),
	(65,'Årskort (student)',595,11,'kr/mån'),
	(66,'6 månader',715,11,'kr/mån'),
	(67,'6 månader (student)',660,11,'kr/mån'),
	(68,'Månadskort',770,11,'kr/mån'),
	(69,'Månadskort (student)',715,11,'kr/mån'),
	(70,'Årskort + 12 PT sessioner',1050,11,'kr/mån'),
	(71,'Årskort',429,12,'kr/mån'),
	(72,'6 månader',499,12,'kr/mån'),
	(73,'2 månader',699,12,'kr/mån'),
	(74,'Årskort + gruppträning',499,12,'kr/mån'),
	(75,'6 månader + gruppträning',579,12,'kr/mån'),
	(76,'2 månader + gruppträning',799,12,'kr/mån'),
	(77,'Årskort Varm Yoga',599,12,'kr/mån'),
	(78,'Terminskort',2495,12,'kr'),
	(79,'Klippkort 10 ggr',1595,12,'kr'),
	(80,'24 månader',360,13,'kr/mån'),
	(81,'Årskort',395,13,'kr/mån'),
	(82,'6 månader',595,13,'kr/mån'),
	(83,'3 månader',725,13,'kr/mån'),
	(84,'Årskort kontant',4740,13,'kr'),
	(86,'6 månader kontant',3570,13,'kr'),
	(87,'Årskort (student)',325,13,'kr/mån'),
	(88,'Årskort (student, senior)',325,13,'kr/mån'),
	(89,'Årskort',0,14,'kr/mån'),
	(90,'Curves fitness',0,14,'kr/mån'),
	(91,'Curves Smart',0,14,'kr/mån'),
	(92,'Curves Complete',0,14,'kr/mån'),
	(93,'Årskort',595,15,'kr/mån'),
	(94,'Årskort kontant',7140,15,'kr'),
	(95,'Månadskort',795,15,'kr/mån'),
	(96,'Årskort (pensionär, junior)',395,15,'kr/mån'),
	(97,'Dagskort',150,15,'kr/dag'),
	(98,'Årskort kontant',3600,16,'kr'),
	(99,'Årskort',340,16,'kr/mån'),
	(100,'6 månader',2100,16,'kr'),
	(101,'Klippkort 10 ggr',700,16,'kr'),
	(102,'Gyminstruktion',350,16,'kr'),
	(103,'Årskort (student)',290,16,'kr/mån'),
	(104,'Årskort (senior)',2200,16,'kr'),
	(105,'Dagskort',100,17,'kr/dag'),
	(106,'Klippkort 10 ggr',750,17,'kr'),
	(107,'Klippkort 25 ggr',1750,17,'kr'),
	(108,'Månadskort autogiro',325,17,'kr/mån'),
	(109,'6 månader',1250,17,'kr'),
	(110,'Månadskort (student)',195,17,'kr/mån'),
	(112,'Årskort',399,18,'kr/mån'),
	(113,'Månadskort',699,18,'kr/mån'),
	(114,'Klippkort 10 ggr',1000,18,'kr'),
	(115,'Familjekort (2 vuxna, 2 barn)',898,18,'kr/mån'),
	(116,'10-klippkort tennis',1920,18,'kr'),
	(117,'10-klippkort padel',2240,18,'kr'),
	(118,'Provträning',150,18,'kr');

/*!40000 ALTER TABLE `pricelist` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump town
# ------------------------------------------------------------

DROP TABLE IF EXISTS `town`;

CREATE TABLE `town` (
  `T_id` int(11) NOT NULL AUTO_INCREMENT,
  `town_name` varchar(40) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`T_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `town` WRITE;
/*!40000 ALTER TABLE `town` DISABLE KEYS */;

INSERT INTO `town` (`T_id`, `town_name`, `latitude`, `longitude`)
VALUES
	(1,'Uppsala','59.8601083','17.6433355'),
	(2,'Stockholm','59.3274242','18.071996'),
	(3,'Malmö','55.5986063','13.0019066'),
	(4,'Göteborg','57.7003634','11.9925318');

/*!40000 ALTER TABLE `town` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
