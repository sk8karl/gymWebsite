# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Värd: localhost (MySQL 5.6.35)
# Databas: Gym_db
# Genereringstid: 2017-04-04 20:45:36 +0000
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
	(18,'USIF','USIF.png','http://www.usif.se/sv/'),
	(19,'Fresh fitness','FF.png','https://www.freshfitness.se'),
	(20,'CrossFit Medis','crossfitmedis.jpg','http://www.crossfitmedis.se'),
	(21,'Crossfit södermalm','crossfitsoder.jpg','http://www.crossfitsodermalm.se'),
	(22,'Fit4life crossfit','f4l.jpg','http://f4lcrossfit.com'),
	(23,'Crossfit Eken','crossfiteken.jpg','http://www.crossfiteken.se'),
	(24,'Vici athletics','vici.jpg','http://www.viciathletics.se/hem'),
	(25,'Crossfit ATUM','atum.jpg','http://crossfitatum.com'),
	(26,'ConCor Crossfit','concor.jpg','http://www.concorcrossfit.se'),
	(27,'Crossfit Solid','solid.png','http://www.crossfitsolid.se/'),
	(28,'Balance Training','balance.jpg','http://www.balancetraining.se/'),
	(29,'Power Club','powerclub.jpg','http://gymleco.net/pc/wp/'),
	(31,'Delta Gym','deltagym.jpg','http://deltagym.com/'),
	(32,'Nox Box','noxbox.jpg','http://www.noxbox.se/'),
	(33,'Planet Fitness','planetfitness.jpg','http://www.planetfitness.se/'),
	(34,'Gymmet','gymmet.jpg','http://www.gymmet.nu/stockholm/'),
	(35,'Centralbadet','centralbadet.png','https://www.centralbadet.se/'),
	(36,'Pro Gym','progym.png','http://progym.se/');

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
	(18,2),
	(19,3),
	(19,8),
	(20,9),
	(20,8),
	(20,3),
	(21,9),
	(21,3),
	(22,8),
	(22,9),
	(22,3),
	(23,1),
	(23,3),
	(23,8),
	(23,9),
	(24,3),
	(24,8),
	(24,9),
	(25,1),
	(25,3),
	(25,8),
	(25,9),
	(26,8),
	(27,9),
	(26,3),
	(26,9),
	(27,8),
	(27,3),
	(28,1),
	(28,3),
	(28,8),
	(29,9),
	(29,8),
	(31,1),
	(31,3),
	(31,8),
	(32,8),
	(32,3),
	(33,3),
	(33,8),
	(33,1),
	(33,4),
	(34,1),
	(34,8),
	(35,1),
	(35,8),
	(35,3),
	(35,4),
	(36,1);

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
	('USIF - Uppsala studenters IF',18,1,'USIF'),
	('fresh fitness sthlm',19,2,'fresh fitness'),
	('crossfir medis',20,2,'crossfit medis'),
	('crossfit södermalm',21,2,'crossfit södermalm'),
	('f4l',22,2,'fit4life crossfit'),
	('Crossfit eken',23,2,'crossfit eken'),
	('vici',24,2,'vici athletics'),
	('atum',25,2,'Crossfit atum'),
	('concor',26,2,'concor crossfit'),
	('solid',27,2,'crossfit solid'),
	('balance sthlm',28,2,'balance training'),
	('power club',29,2,'power club'),
	('delta gym',31,2,'delta gym'),
	('noxbox',32,2,'nox box crossfit'),
	('planetfitness sthlm',33,2,'planet fitness'),
	('gymmet',34,2,'gymmet liljeholmen'),
	('centralbadet',35,2,'centralbadet'),
	('pro gym',36,2,'pro gym');

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
	(58,18,'Alla medlemmar i USIF förening har 50 kr rabatt på alla träningskort.'),
	(59,19,'Medlemskap kan frysas i max 365 dagar för 199 kr.'),
	(60,19,'Inskrivningsavgift på 250 kr.'),
	(61,19,'14 dagars ångerrätt ffrån tecknandet av medkskapet.'),
	(62,20,'2 månaders uppsägninstid.'),
	(63,20,'400 kr i medlemsavgift.'),
	(64,20,'Erbjuder ett gratis pröva-på-pass.'),
	(65,21,'På Onsdagar klockan kl.18:00 och fredagar kl.17.00 håller vi intropass där du är välkommen att testa på kostnadsfritt.'),
	(66,21,'Erbjuder intoutbildning för 500 kr.'),
	(67,21,'Erbjuder crossfit för barn tillsammans med erfarna ledare.'),
	(68,22,'Inskrivningavgift på 500 kr.'),
	(69,22,'I startpaketet ingår inskrivningsavgift och 3 pass med personlig tränare.'),
	(70,22,'60 dagars uppsägningstid.'),
	(71,23,'Två månaders uppsägningstid för årskort.'),
	(74,23,'Erbjuder morgonpass, lunchpass och kvällspass.'),
	(75,23,'Ingår intruktärsledda pass 1 gång i veckan. Fokus på teknik inom antingen tungdlyftning, kettlebell och romwod.'),
	(76,24,'Ingen startavgift.'),
	(77,24,'3 månaders uppsägningstid.'),
	(78,24,'Bring-a-friend-pass schemalagt söndagar kl 12:00.'),
	(79,25,'Du är alltid välkommen in för ett första gratis ”prova-på” pass!'),
	(80,25,'Vid köp av Årskort kan man köpa 3 PT timmar för 1 000 kr (Ord.pris 2 100 kr).'),
	(82,26,'Medlemsavgift på 450 kr/år'),
	(83,26,'Erbjuder kostnadsfritt testpass'),
	(84,26,'Erbjuder olika intropaket samt bootcamps'),
	(85,27,'Varje söndag klockan 14:00 hålls ett gratis prova-på pass.'),
	(86,27,'Medlemsavgift på 100 kr.'),
	(87,27,'Gymmet är bemannat vardagar kontorstid 10.00-16.00 samt kvällar 18.00-21.00.'),
	(88,28,'Erbjuder provträning.'),
	(89,28,'2 tillfällen med personlig tränare (PT) för nya medlemmar.'),
	(90,28,'Erbjuder även massage, barnpassning, sjukgymnastik och kostrådgivning.'),
	(91,29,'Medlemsavgift på 220 kr.'),
	(92,29,'2 månaders uppsägningstid.'),
	(93,29,'Öppet alla dagar 06-22.'),
	(94,31,'Studenter/pensionärer har 20% på alla priser.'),
	(95,31,'Gratis provträning.'),
	(96,31,'Inga bindningstider eller anslutningsavgifter.'),
	(97,32,'Öppen Mån - Sön 6-21.'),
	(98,32,'Nox Box är ett träningscenter som inriktar sig på funktionell träning som passar alla.'),
	(99,32,'Erbjuder nybörjarkurs.'),
	(100,33,'349 kr i startavgift.'),
	(101,33,'Erbjuder gratis prova-på-vecka.'),
	(102,34,'Startavgift på 200 för autogiro.'),
	(103,34,'Uppsägningstid på 3 månader för autogiro.'),
	(104,34,'Åldersgräns på 15 år.'),
	(105,35,'3500 kvadratmeter av hälsa, avkoppling och historia en av Stockholms mest attraktiva och avkopplande oaser.'),
	(106,35,'Gäller för entré till gym-, relax-, bastu-, och badavdelning alla dagar, alla tider (utom lördagar).'),
	(107,35,'Klippkort är giltigt i 12 månader.'),
	(108,36,'Medlemsavgift på 100kr, vilket gäller livet ut. Studenter behöver inte betala medlemsavgift.'),
	(109,36,'Uppsägningstid på 2 månader.'),
	(110,36,'37 bänkar och träningsställningar.');

/*!40000 ALTER TABLE `membership_info` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump pricelist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricelist`;

CREATE TABLE `pricelist` (
  `PL_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) DEFAULT NULL,
  `g_id` int(11) NOT NULL,
  `price_unit` varchar(10) DEFAULT '',
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
	(89,'Årskort',NULL,14,''),
	(90,'Curves fitness',NULL,14,''),
	(91,'Curves Smart',NULL,14,''),
	(92,'Curves Complete',NULL,14,''),
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
	(118,'Provträning',150,18,'kr'),
	(119,'Årskort kontant',2250,19,'kr'),
	(121,'Månadskort autogiro',199,19,'kr/mån'),
	(125,'Månadskort autogiro',1200,20,'kr/mån'),
	(126,'New you challenge, 9 weeks',3300,20,'kr'),
	(127,'Ett pass',200,20,'kr'),
	(128,'10 - klippkort',2495,20,'kr'),
	(129,'10 (30 min) sessioner personlig träning',3000,20,'kr'),
	(130,'Årskort',799,21,'kr/mån'),
	(131,'Två år',699,21,'kr/mån'),
	(132,'Tre år',599,21,'kr/mån'),
	(133,'Månadskort',1500,21,'kr'),
	(134,'10 -klippkort',1500,21,'kr'),
	(135,'Årskort',1000,22,'kr/mån'),
	(136,'Månadskort',1250,22,'kr/mån'),
	(137,'Dagskort autogiro',699,22,'kr/mån'),
	(138,'Ett pass',250,22,'kr'),
	(139,'10-klippkort',2000,22,'kr'),
	(140,'Startpaket (vardagar öppning – kl 16)',1000,22,'kr'),
	(141,'Årskort kontant',13800,23,'kr'),
	(142,'Årskort',1150,23,'kr/mån'),
	(143,'Månadskort (utan bindningstid)',1500,23,'kr/mån'),
	(144,'Nybörjarkurs + 1 månads träning',1500,23,'kr'),
	(145,'10-klippkort',1700,23,'kr'),
	(146,'Årskort',1200,24,'kr/mån'),
	(147,'Månadskort',1400,24,'kr/mån'),
	(148,'10-dagarskort',300,24,'kr'),
	(149,'10-klippkort',1800,24,'kr'),
	(150,'Årskort',499,25,'kr/mån'),
	(151,'Årskort crossfit',1099,25,'kr/mån'),
	(152,'6 månader',550,25,'kr/mån'),
	(153,'Årskort Crossfit (utan bindningstid)',1499,25,'kr/mån'),
	(154,'10-Klippkort gym',1500,25,'kr'),
	(155,'10-Klippkort crossfit',1999,25,'kr'),
	(156,'Årskort',1140,26,'kr/mån'),
	(157,'Halvårskort',7850,26,'kr'),
	(158,'Månadskort',1500,26,'kr/mån'),
	(159,'Dagkort',690,26,'kr/mån'),
	(160,'Studentkort',690,26,'kr/mån'),
	(161,'Årskort',1250,27,'kr/mån'),
	(162,'6 månader',1366,27,'kr/mån'),
	(163,'Månadskort (ingen bindningstid)',1500,27,'kr/mån'),
	(164,'Dagkort, halvår',950,27,'kr/mån'),
	(165,'Årskort kontant',15000,27,'kr'),
	(166,'6-månaderskort kontant',8200,27,'kr'),
	(167,'7-klippkort',1200,27,'kr'),
	(168,'Dagskort',200,27,'kr'),
	(169,'Årskort',745,28,'kr/mån'),
	(170,'Månadskort',975,28,'kr/mån'),
	(171,'Månadskort kontant',995,28,'kr'),
	(172,'Student/senior',525,28,'kr/mån'),
	(173,'Årskort',359,29,'kr/mån'),
	(174,'3-månaderskort',429,29,'kr/mån'),
	(175,'Årskort Silver',580,29,'kr/mån'),
	(176,'Månadskort',580,29,'kr/mån'),
	(177,'Årskort student',299,29,'kr/mån'),
	(178,'3-månaderskort student',359,29,'kr/mån'),
	(179,'Årskort',4500,31,'kr'),
	(180,'6-månaderskort',2700,31,'kr'),
	(181,'Engångspass',120,31,'kr'),
	(182,'Kvartalskort',1500,31,'kr'),
	(183,'10-klippkort',1000,31,'kr'),
	(184,'Månadskort',550,31,'kr'),
	(185,'Årskort',945,32,'kr/mån'),
	(186,'24 månader',845,32,'kr/mån'),
	(187,'6 månader',1095,32,'kr/mån'),
	(188,'10-klippkort',2000,32,'kr'),
	(189,'Årskort',450,33,'kr/mån'),
	(190,'Årskort kontant',5400,33,'kr'),
	(191,'Månadskort (ingen bindningstid)',550,33,'kr/mån'),
	(192,'30-dagarskort',700,33,'kr'),
	(193,'Årskort aqua',695,33,'kr/mån'),
	(194,'Årskort student/senior',349,33,'kr/mån'),
	(195,'Månadskort student/senior',399,33,'kr/mån'),
	(196,'Årskort student/senior, kontant',3588,33,'kr'),
	(197,'Månadskort autogiro',495,34,'kr/mån'),
	(198,'Årskort kontant',4995,34,'kr'),
	(199,'6-månaderskort',2995,34,'kr'),
	(200,'3-månaderskort',1595,34,'kr'),
	(201,'Dagspass',120,34,'kr'),
	(202,'Årskort student, kontant',3995,34,'kr'),
	(203,'Årskort student, autogiro',395,34,'kr'),
	(204,'Årskort',900,35,'kr/mån'),
	(205,'6-månaderkort',1016,35,'kr/mån'),
	(206,'3-månaderkort',1133,35,'kr/mån'),
	(207,'24-månaderkort',792,35,'kr/mån'),
	(208,'Årskort kontant',10800,35,'kr'),
	(209,'6-månaderskort, student & pensionär',416,35,'kr/mån'),
	(210,'3-månaderskort, student & pensionär',498,35,'kr/mån'),
	(211,'10-klippkort',2250,35,'kr'),
	(212,'Årskort',400,36,'kr/mån'),
	(213,'Årskort kontant',4295,36,'kr'),
	(214,'Månadskort',600,36,'kr'),
	(215,'10-klippkort',800,36,'kr'),
	(216,'Engångsträning',100,36,'kr'),
	(217,'Årskort student',320,36,'kr/mån'),
	(218,'6-månaderskort',2695,36,'kr/mån');

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
