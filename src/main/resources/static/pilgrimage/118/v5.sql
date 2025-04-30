-- MySQL dump 10.13  Distrib 9.2.0, for macos15.2 (arm64)
--
-- Host: localhost    Database: toge_info
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appearance`
--

DROP TABLE IF EXISTS `appearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appearance` (
  `place_id` int NOT NULL,
  `episode_id` int NOT NULL,
  `character_id` int NOT NULL,
  PRIMARY KEY (`place_id`,`episode_id`,`character_id`),
  KEY `character_id` (`character_id`),
  KEY `FK4fk8ylhr0a31tvh24m9t2q72m` (`episode_id`),
  CONSTRAINT `appearance_ibfk_2` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  CONSTRAINT `FK4fk8ylhr0a31tvh24m9t2q72m` FOREIGN KEY (`episode_id`) REFERENCES `episode` (`id`),
  CONSTRAINT `FK89tjiafjhlg16ejcoagqai8ex` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appearance`
--

LOCK TABLES `appearance` WRITE;
/*!40000 ALTER TABLE `appearance` DISABLE KEYS */;
/*!40000 ALTER TABLE `appearance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `japanese_name` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `birthplace` varchar(255) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `blood_type` varchar(255) DEFAULT NULL,
  `favorite_food` varchar(255) DEFAULT NULL,
  `hobby` varchar(255) DEFAULT NULL,
  `affiliation` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `voice_actor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'아와 스바루','安和 すばる','2007-04-27','효고현 고베시',158,'AB형','고수, 피망, 레몬, 새콤한 것들','인도어파, 게임, 인터넷, 키보드 배틀','토게나시 토게아리','드럼','미레이'),(2,'이세리 니나','井芹 仁菜 ','2007-10-24','구마모토현 구마모토시',152,'A형','나물, 카페오레, 요구르트','쇼와 마니아, 불상 좋아함, 주인(御朱印) 모으기','토게나시 토게아리','보컬','리나'),(3,'카와라기 모모카','河原木 桃香','2004-12-09','홋카이도 아사히카와시',164,'O형','안미츠, 야키니쿠','독서, 스포츠 관전','토게나시 토게아리','기타','유리'),(4,'에비즈카 토모','海老塚 智','2008-03-22','미야기현 센다이시',148,'B형','슈크림, 백미, 오챠즈케, 매실장아찌, 푸딩','야모리, 파충류 사육','토게나시 토게아리','키보드','나츠'),(5,'루파','ルパ','2002-06-28','남아시아 (일본 혼혈)',169,'O형','파르페, 푸딩 아 라 모드, 햄버그','반주, 독서','토게나시 토게아리','베이스','슈리'),(6,'히나','ヒナ','2008-01-01',NULL,NULL,NULL,NULL,NULL,'다이아몬드 더스트','보컬','콘도 레이나');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `japanese_title` varchar(255) DEFAULT NULL,
  `episode_number` int NOT NULL,
  `episode_season` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,'도쿄 으랏차',NULL,'東京ワッショイ',1,'s1'),(2,'야행성 생물 세 마리',NULL,'夜行性の生き物3匹[10]',2,'s1'),(3,'엉뚱한 문답',NULL,'ズッコケ問答',3,'s1'),(4,'감사(놀람)',NULL,'感謝(驚)',4,'s1'),(5,'노랫소리여 일어나라',NULL,'歌声よおこれ',5,'s1'),(6,'아웃사이더 찬가',NULL,'はぐれ者賛歌',6,'s1'),(7,'이름을 붙여 주겠어',NULL,'名前をつけてやる',7,'s1'),(8,'만약 네가 운다면',NULL,'もしも君が泣くならば',8,'s1'),(9,'이지러진 달이 나왔다',NULL,'欠けた月が出ていた',9,'s1'),(10,'반더포겔',NULL,'ワンダーフォーゲル',10,'s1'),(11,'세상 한가운데',NULL,'世界の真ん中',11,'s1'),(12,'하늘이 다시 흐려져',NULL,'空がまた暗くなる',12,'s1'),(13,'로큰롤은 멈추지 않아',NULL,'ロックンロールは鳴り止まないっ',13,'s1');
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_schedule`
--

DROP TABLE IF EXISTS `live_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `live_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `location` varchar(255) NOT NULL,
  `event_time` time DEFAULT NULL,
  `description` text,
  `guests` json DEFAULT NULL,
  `ticket_link` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_schedule`
--

LOCK TABLES `live_schedule` WRITE;
/*!40000 ALTER TABLE `live_schedule` DISABLE KEYS */;
INSERT INTO `live_schedule` VALUES (1,'regular','토게나시 토게아리 수행 중! 공개 연습 라이브','2023-09-14','다이칸야마 SPACE ODD','19:00:00',NULL,'[\"null\"]',NULL,'/poster/1/practice_live.webp'),(2,'regular','토게나시 토게아리 1st ONE-MAN LIVE \"박명의 서주\"','2024-03-16','요코하마 1000 CLUB','17:00:00',NULL,'[\"null\"]',NULL,'/poster/2/toge1.webp'),(3,'regular','토게나시 토게아리 2nd ONE-MAN LIVE \"린네의 이치\"','2024-09-13','카와사키 CLUB CITTA','17:00:00',NULL,'[\"null\"]',NULL,'/poster/3/toge2.webp'),(4,'regular','토게나시 토게아리 3rd ONE-MAN LIVE \"포효의 연주\"','2024-11-02','도쿄 돔 시티 홀','17:00:00',NULL,'[\"null\"]',NULL,'/poster/4/toge3.webp'),(5,'regular','토게나시 토게아리 4th ONE-MAN LIVE \"협주의 울림\"','2024-12-20','토요스PIT','18:00:00',NULL,'[\"null\"]',NULL,'/poster/5/toge4.webp'),(6,'regular','토게나시 토게아리 5th ONE-MAN LIVE \"울림의 순간\"','2025-02-07','퍼시피코 요코하마 국립대홀','18:00:00',NULL,'[\"null\"]',NULL,'/poster/6/toge5.webp'),(7,'regular','『걸즈 밴드 크라이』2nd Anniversary LIVE','2025-04-27','도쿄 돔 시티 홀','17:00:00',NULL,'[\"null\"]',NULL,'/poster/7/2nd_anniversary.webp'),(8,'regular','토게나시 토게아리 LIVE in 일본 무도관 \"격주의 외침\"','2025-09-23','일본 무도관','16:30:00',NULL,'[\"null\"]','https://pia.jp/v/toge25bd-v7/','/poster/8/budokan_live.webp'),(9,'temp','Animelo Summer Live 2024-Stargazer-','2024-08-30','사이타마 슈퍼 아레나','14:00:00',NULL,'[\"null\"]',NULL,'/poster/9/animelo.webp'),(10,'temp','ATF 25th presents BAYCAMP 2024','2024-09-15','가나가와현 카와사키시 카와사키구 치도리 공원',NULL,NULL,'[\"null\"]',NULL,'/poster/10/baycamp_2024.webp'),(11,'temp','WONDERLIVET 2024','2024-11-08','대한민국 KINTEX',NULL,NULL,'[\"null\"]',NULL,'/poster/11/wonder_livet_2024.webp'),(12,'temp','COUNTDOWN JAPAN 24/25','2024-12-29','마쿠하리 멧세','09:30:00',NULL,'[\"null\"]',NULL,'/poster/12/cdj2425.webp'),(13,'temp','MyGO!!!!! ✕ 토게나시토게아리 대반 라이브「Avoid Note」','2025-01-12','도쿄 돔 시티 홀','09:30:00',NULL,'[\"null\"]',NULL,'/poster/13/avoid_note.webp'),(14,'temp','MEGA VEGAS 2025','2025-03-22','고베 월드 기념 홀',NULL,NULL,'[\"null\"]','https://t.pia.jp/pia/ticketInformation.do?eventCd=2503503&rlsCd=001&lotRlsCd=','/poster/14/mega_vega_2025.webp'),(15,'temp','She is Legend ✕ 토게나시토게아리 대반 라이브 「SOUL&CRY」','2025-05-15','도쿄 가든 시어터',NULL,NULL,'[\"null\"]','https://t.pia.jp/pia/event/event.do?eventCd=2509074','/poster/15/sil.webp');
/*!40000 ALTER TABLE `live_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_image`
--

DROP TABLE IF EXISTS `place_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `place_id` int DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `display_order` int DEFAULT '0',
  `caption` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `upload_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_place` (`place_id`),
  CONSTRAINT `fk_place` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_image`
--

LOCK TABLES `place_image` WRITE;
/*!40000 ALTER TABLE `place_image` DISABLE KEYS */;
INSERT INTO `place_image` VALUES (5,1,'/pilgrimage/1/1.webp',0,'1.webp','/pilgrimage/1/1.html','2025-03-26 17:43:28'),(6,1,'/pilgrimage/1/2.webp',1,'2.webp','','2025-03-26 17:43:28'),(7,1,'/pilgrimage/1/3.webp',2,'3.webp','/pilgrimage/1/3.html','2025-03-26 17:43:28'),(8,2,'/pilgrimage/2/1.webp',0,'1.webp',NULL,'2025-03-31 01:48:37'),(9,5,'/pilgrimage/5/1.webp',0,'1.webp',NULL,'2025-04-01 15:19:46'),(10,3,'/pilgrimage/3/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(11,4,'/pilgrimage/4/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(12,6,'/pilgrimage/6/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(13,7,'/pilgrimage/7/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(14,10,'/pilgrimage/10/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(15,12,'/pilgrimage/12/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(16,13,'/pilgrimage/13/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(17,13,'/pilgrimage/13/2.webp',1,'2.webp',NULL,'2025-04-08 15:15:28'),(18,14,'/pilgrimage/14/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(19,14,'/pilgrimage/14/2.webp',1,'2.webp',NULL,'2025-04-08 15:15:28'),(20,15,'/pilgrimage/15/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(21,15,'/pilgrimage/15/2.webp',1,'2.webp',NULL,'2025-04-08 15:15:28'),(22,16,'/pilgrimage/16/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(23,16,'/pilgrimage/16/2.webp',1,'2.webp',NULL,'2025-04-08 15:15:28'),(24,18,'/pilgrimage/18/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(25,19,'/pilgrimage/19/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(26,20,'/pilgrimage/20/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(27,20,'/pilgrimage/20/2.webp',1,'2.webp',NULL,'2025-04-08 15:15:28'),(28,20,'/pilgrimage/20/3.webp',2,'3.webp',NULL,'2025-04-08 15:15:28'),(29,20,'/pilgrimage/20/4.webp',3,'4.webp',NULL,'2025-04-08 15:15:28'),(30,25,'/pilgrimage/25/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(31,26,'/pilgrimage/26/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(32,29,'/pilgrimage/29/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(33,30,'/pilgrimage/30/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(34,31,'/pilgrimage/31/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(35,31,'/pilgrimage/31/2.webp',1,'2.webp',NULL,'2025-04-08 15:15:28'),(36,33,'/pilgrimage/33/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(37,35,'/pilgrimage/35/2.webp',0,'2.webp',NULL,'2025-04-08 15:15:28'),(38,35,'/pilgrimage/35/3.webp',1,'3.webp',NULL,'2025-04-08 15:15:28'),(39,37,'/pilgrimage/37/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(40,38,'/pilgrimage/38/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(41,39,'/pilgrimage/39/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(42,49,'/pilgrimage/49/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(43,61,'/pilgrimage/61/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(44,66,'/pilgrimage/66/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(45,66,'/pilgrimage/66/2.webp',1,'2.webp',NULL,'2025-04-08 15:15:28'),(46,68,'/pilgrimage/68/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(47,90,'/pilgrimage/90/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(48,90,'/pilgrimage/90/2.webp',1,'2.webp',NULL,'2025-04-08 15:15:28'),(49,114,'/pilgrimage/114/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(50,117,'/pilgrimage/117/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(51,118,'/pilgrimage/118/1.webp',0,'1.webp',NULL,'2025-04-08 15:15:28'),(52,118,'/pilgrimage/118/2.webp',1,'2.webp',NULL,'2025-04-08 15:15:28');
/*!40000 ALTER TABLE `place_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `region` varchar(255) DEFAULT NULL,
  `season` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'도쿄 역',NULL,35.681236,139.767125,'tokyo','s1'),(2,'일본 무도관',NULL,35.69303,139.74923,'tokyo','s1'),(3,'TOKYO DOME CITY HALL',NULL,35.70336,139.75421,'tokyo','s1'),(4,'시부야 모디 뒤편',NULL,35.6617167,139.7003101,'shibuya','s1'),(5,'충견 하치코 동상',NULL,35.6590579,139.7006293,'shibuya','s1'),(6,'시부야 센터 거리②',NULL,35.6600832,139.6998022,'shibuya','s1'),(7,'시부야 센터 거리①',NULL,35.6600732,139.699766,'shibuya','s1'),(8,'시부야역 A4 출구 길 반대편',NULL,35.6595709,139.6998975,'shibuya','s1'),(9,'스페인자카 (스페인 언덕)',NULL,35.6614854,139.6988813,'shibuya','s1'),(10,'시나가와역 1-2 도쿄역 방향 플렛폼',NULL,35.62707,139.73855,'tokyo','s1'),(11,'라쿠스이바시',NULL,35.62471,139.74613,'tokyo','s1'),(12,'사쿠라자카 (벚꽃 언덕)',NULL,35.6565822,139.7008651,'shibuya','s1'),(13,'썬 플라워 빌딩',NULL,35.71122,139.70402,'tokyo','s1'),(14,'오크 빌리지 앞',NULL,35.6613266,139.6970752,'shibuya','s1'),(15,'모스버거 시부야 도겐자카점',NULL,35.6592597,139.6979083,'shibuya','s1'),(16,'오이마치 역',NULL,35.60717,139.73495,'tokyo','s1'),(17,'CLUB Que Shimokitazawa',NULL,35.6609,139.66885,'tokyo','s1'),(18,'시모키타자와 미나미구치 상점가',NULL,35.66083,139.66866,'tokyo','s1'),(19,'시모키타자와 역 고가 밑',NULL,35.66141,139.66828,'tokyo','s1'),(20,'에쿠푸리',NULL,35.66066,139.66835,'tokyo','s1'),(21,'헤이와지마 역',NULL,35.57841,139.73518,'tokyo','s1'),(22,'사운드 크루 스튜디오',NULL,35.57612,139.74746,'tokyo','s1'),(23,'Zepp Haneda (TOKYO)',NULL,35.54743,139.75649,'tokyo','s1'),(24,'하네다 공항 D활주로',NULL,35.5285,139.80833,'tokyo','s1'),(25,'JR 카와사키 역 중앙남쪽개찰','',35.531504,139.697107,'kawasaki','s1'),(26,'JR 카와사키 역 개찰 앞','',35.531365,139.696889,'kawasaki','s1'),(27,'라조나 카와사키 2층 입구','',35.531934,139.696417,'kawasaki','s1'),(28,'아제리아 입구','',35.530868,139.697834,'kawasaki','s1'),(29,'카와사키 역 동쪽출구 앞 광장','',35.530533,139.698073,'kawasaki','s1'),(30,'뮤자 카와사키 보행자 데크','',35.531017,139.695678,'kawasaki','s1'),(31,'라조나 카와사키 루파 광장','',35.532299,139.695874,'kawasaki','s1'),(32,'아제리아 카와사키 에스컬레이터 (JR 카와사키 역 중앙 동쪽 출구 방향)','',35.53063,139.698413,'kawasaki','s1'),(33,'뮤자 카와사키 2층 입구 앞','',35.530991,139.69542,'kawasaki','s1'),(34,'(주)카와사키 역 앞 부동산','',35.53198,139.698989,'kawasaki','s1'),(35,'마루후쿠 커피점 카와사키 아제리아 점','',35.530366,139.698561,'kawasaki','s1'),(36,'나카미세 거리 (카와사키 역쪽)','',35.530211,139.698565,'kawasaki','s1'),(37,'JR 카와사키 역앞 동쪽 출구 버스 터미널 바깥쪽','',35.529849,139.698014,'kawasaki','s1'),(38,'뮤자 카와사키 피아노','',35.531171,139.694897,'kawasaki','s1'),(39,'라조나 카와사키 루파 광장 4층','',35.533124,139.696043,'kawasaki','s1'),(40,'JR 카와사키 역 동쪽 출구 버스 터미널 안쪽','',35.529727,139.697713,'kawasaki','s1'),(41,'오프닝 카와사키 역앞 동쪽 교차로','',35.531201,139.699346,'kawasaki','s1'),(42,'아제리아 지하상가 27번 출구 (남쪽)','',35.530386,139.698949,'kawasaki','s1'),(43,'뮤자 카와사키 북측 에스컬레이터','',35.531449,139.6948,'kawasaki','s1'),(44,'나카미세 거리 ①','',35.530086,139.698765,'kawasaki','s1'),(45,'HMV 라조나 카와사키','',35.532968,139.69546,'kawasaki','s1'),(46,'오프닝 카와사키 DICE 앞','',35.531209,139.699574,'kawasaki','s1'),(47,'프티 컬레이터 (가장 작은 에스컬레이터)','신카와사키 3인방 사진의 장소',35.530897,139.699498,'kawasaki','s1'),(48,'뮤자 카와사키 심포니 홀 입구 앞 광장','',35.531052,139.694662,'kawasaki','s1'),(49,'빅 에코(폐점) (현 SILK HAT)','',35.530895,139.699522,'kawasaki','s1'),(50,'시마무라 악기 라조나 카와사키점','',35.53325,139.69534,'kawasaki','s1'),(51,'애니메이트 카와사키점','',35.530817,139.69439,'kawasaki','s1'),(52,'나카미세 거리 ②','',35.529773,139.699244,'kawasaki','s1'),(53,'뮤자 카와사키 심포니 홀 앞 교차로','',35.531468,139.694012,'kawasaki','s1'),(54,'오프닝 카와사키 MORE\'S 앞','',35.530471,139.70002,'kawasaki','s1'),(55,'나카미세 거리 ③','',35.529678,139.699401,'kawasaki','s1'),(56,'1화 도망치다 숨은 장소','',35.529759,139.699634,'kawasaki','s1'),(57,'중화요리 텐류','',35.531008,139.700539,'kawasaki','s1'),(58,'야키토리 토리테이','',35.529677,139.699813,'kawasaki','s1'),(59,'cine citta 거리 입구','',35.528985,139.698817,'kawasaki','s1'),(60,'나베 조우 (폐점)','',35.528707,139.6981,'kawasaki','s1'),(61,'라조나 사계의 길','',35.534352,139.695903,'kawasaki','s1'),(62,'LA CITTADELLA','',35.528439,139.697846,'kawasaki','s1'),(63,'카와신 만남의 광장','',35.52999,139.701032,'kawasaki','s1'),(64,'Hill Valley 라 시타델라 카와사키점','',35.52795,139.697751,'kawasaki','s1'),(65,'타워레코드 카와사키점','',35.527938,139.697994,'kawasaki','s1'),(66,'CLUB CITTA','',35.52783,139.69728,'kawasaki','s1'),(67,'모모카 끌고 가는 골목','슬 취한 모모가를 들고 가는 골목',35.53232,139.692634,'kawasaki','s1'),(68,'요시노야 카와사키 서쪽 출구점','',35.531719,139.692462,'kawasaki','s1'),(69,'세르비안 나이트 카와사키','',35.528167,139.699924,'kawasaki','s1'),(70,'나카사이와이쵸 교차로','',35.5316,139.691856,'kawasaki','s1'),(71,'스에히로안 본점','',35.528371,139.702406,'kawasaki','s1'),(72,'스와 공원가는 골목','',35.533272,139.690559,'kawasaki','s1'),(73,'스와 공원 앞 교차로 (세카라시카 교차로)','',35.534848,139.690569,'kawasaki','s1'),(74,'카와사키 헬로 브릿지','',35.529812,139.704647,'kawasaki','s1'),(75,'신이와키 과자점','',35.536422,139.691757,'kawasaki','s1'),(76,'모모카 집 (존재하지 않음)','',35.535828,139.690962,'kawasaki','s1'),(77,'타마가와미하라시 공원','',35.537905,139.69933,'kawasaki','s1'),(78,'모모카 집에서 돌아갈 떄','니나, 스바루가 돌아갈떄 장소',35.535806,139.69057,'kawasaki','s1'),(79,'모토키 육교','',35.523879,139.697207,'kawasaki','s1'),(80,'카와라마치 14동','',35.538447,139.691611,'kawasaki','s1'),(81,'미나미카와라 공원 남쪽','',35.536075,139.688524,'kawasaki','s1'),(82,'미나미카와라 공원 나카요시마루','',35.536343,139.688504,'kawasaki','s1'),(83,'카와라마치 단지','토모, 루파가 사는 단지입니다.',35.53894,139.691785,'kawasaki','s1'),(84,'미야코초 육교','',35.535907,139.687634,'kawasaki','s1'),(85,'미나미카와라 공원 입구 신호등','',35.537174,139.688235,'kawasaki','s1'),(86,'신메이초 어린이 공원','',35.5396,139.6916,'kawasaki','s1'),(87,'미나미카와라 공원 입구 신호등 (공원쪽)','',35.537224,139.688148,'kawasaki','s1'),(88,'사이와이 산책로','',35.536804,139.686867,'kawasaki','s1'),(89,'토테혼마치 2초메 ④','',35.538918,139.687117,'kawasaki','s1'),(90,'신메이 신사','',35.539119,139.687338,'kawasaki','s1'),(91,'토테혼마치 2초메 ③','',35.539363,139.686309,'kawasaki','s1'),(92,'후지미 공원 (광장 부근 동쪽)','',35.52722,139.710738,'kawasaki','s1'),(93,'니나가 편지보내는 우편함','아빠한테 자립한다고 선언하는 편지 보내는 우편함',35.540207,139.6866,'kawasaki','s1'),(94,'오프닝 토테혼마치 2초메','',35.540182,139.686275,'kawasaki','s1'),(95,'토테혼마치 2초메 ②','',35.540159,139.685592,'kawasaki','s1'),(96,'니나 집','',35.540791,139.686256,'kawasaki','s1'),(97,'토테혼마치 2초메 ①','',35.540143,139.684688,'kawasaki','s1'),(98,'오프닝 텐비 터널','',35.517464,139.7016,'kawasaki','s1'),(99,'오시마 4초메 육교','',35.525299,139.713418,'kawasaki','s1'),(100,'오프닝 오시마 4초메 육교','',35.525116,139.713388,'kawasaki','s1'),(101,'타마가와 과자점 (오이와케 만주)','',35.522044,139.713056,'kawasaki','s1'),(102,'제2 배수관 (아지노모토 배수관)','',35.537421,139.718105,'kawasaki','s1'),(103,'오시마 3초메 교차로','',35.519533,139.716385,'kawasaki','s1'),(104,'카와사키 다이시 앞 스미요시야','',35.534613,139.73061,'kawasaki','s1'),(105,'다이시교','',35.543071,139.741416,'kawasaki','s1'),(106,'동아석유 사하시 미즈에초 선 측','',35.511782,139.739199,'kawasaki','s1'),(107,'치도리초 공장 야경','',35.51848,139.750688,'kawasaki','s1'),(108,'타마가와 스카이브릿지',NULL,35.54156,139.76163,'kawasaki','s1'),(109,'카와사키 마리엔 (카와사키시 항만진흥회관)','',35.496455,139.763218,'kawasaki','s1'),(110,'히가시오기시마 히가시 공원東扇島公園(BAY CAMP）','',35.505775,139.772301,'kawasaki','s1'),(111,'동오이시마 동공원 미사키 광장','',35.504697,139.778001,'kawasaki','s1'),(112,'카와사키구 시민건강의 숲 (우키시마쵸 공원)','',35.521845,139.78914,'kawasaki','s1'),(113,'미조노구치 극장',NULL,35.59835,139.61303,'kawasaki','s1'),(114,'야코유','',35.537328,139.683981,'yokohama','s1'),(115,'야코 5초메 ①','',35.538293,139.683791,'yokohama','s1'),(116,'야코 5초메 ②','',35.540079,139.683061,'yokohama','s1'),(117,'야코 역','',35.538792,139.680421,'yokohama','s1'),(118,'퍼시픽 로얄코트 미나토미라이 어반타워','스바루 집의 모델 장소',35.46264,139.63119,'yokohama','s1'),(119,'사가미코, 후지노 방향 사가미코IC(츄오자동차도)',NULL,35.6228449,139.1703981,'sagamihara','s1'),(120,'EXPASA談合坂 (하행선 휴게소)',NULL,35.6324165,139.0638238,'ueno_hara','s1'),(121,'談合坂SA (상행선 휴게소)',NULL,35.6279325,139.0458075,'ueno_hara','s1'),(122,'간판 「환영, 스와의 나라에」',NULL,36.0468246,138.1168871,'suwa','s1'),(123,'카미스와역 앞 얀나미센(도로)',NULL,36.0467101,138.1153161,'suwa','s1'),(124,'스와 중앙 주차장',NULL,36.0443201,138.1188576,'suwa','s1'),(125,'얀나미 공원',NULL,36.0445314,138.1163873,'suwa','s1'),(126,'카미스와 clubrockhearts',NULL,36.0437998,138.117873,'suwa','s1'),(127,'야키토리 스에히로 니쵸메',NULL,36.0437157,138.1177757,'suwa','s1'),(128,'카미스와 요코초',NULL,36.0438125,138.1177013,'suwa','s1'),(129,'세키쵸(석조)공원',NULL,36.04724,138.1108915,'suwa','s1'),(130,'슨다이 예비학교 센다이캠퍼스','니나가 다닌 학원의 모델 장소',38.25823699904302,140.884106460594,'sendai','s1'),(131,'구마모토 역',NULL,32.7901769,130.689049,'kumamoto','s1'),(132,'구마모토 역 1-3번선 플렛폼',NULL,32.790383,130.6885128,'kumamoto','s1'),(133,'센바바시 역',NULL,32.799202137,130.699329972,'kumamoto','s1'),(134,'구마모토 현립 제1 고등학교',NULL,32.8015542571232,130.70037377434917,'kumamoto','s1'),(135,'썬로드 신시가이',NULL,32.7991002,130.7050047,'kumamoto','s1'),(136,'토리쵸스지 역',NULL,32.80332690272973,130.70975035031174,'kumamoto','s1'),(137,'전차 이동중일떄 모습',NULL,32.802023,130.7138961,'kumamoto','s1'),(138,'메이고바시',NULL,32.8064327,130.7184079,'kumamoto','s1'),(139,'신스이젠지에키마에 역',NULL,32.7936896,130.7266978,'kumamoto','s1'),(140,'다쓰타구치 역',NULL,32.8204354,130.7465337,'kumamoto','s1'),(141,'다쓰타구치 역 앞',NULL,32.8217382,130.7476985,'kumamoto','s1'),(142,'아사히카와 키타 고등학교',NULL,43.79008929635614,142.36955877061865,'asahikawa','s1'),(143,'스타루힌 구장 앞 버스 정류장',NULL,43.78949775470728,142.36736620431344,'asahikawa','s1'),(144,'하나사키 스포츠공원 구기장',NULL,43.78873974914357,142.37099780140653,'asahikawa','s1');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-09  0:15:51
