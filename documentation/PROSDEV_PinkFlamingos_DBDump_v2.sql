CREATE DATABASE  IF NOT EXISTS `db_agile` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_agile`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: db_agile
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ag_comment`
--

DROP TABLE IF EXISTS `ag_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ag_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `author` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `commentfk_1` (`post_id`),
  CONSTRAINT `commentfk_1` FOREIGN KEY (`post_id`) REFERENCES `ag_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ag_comment`
--

LOCK TABLES `ag_comment` WRITE;
/*!40000 ALTER TABLE `ag_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ag_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ag_post`
--

DROP TABLE IF EXISTS `ag_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ag_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ag_post`
--

LOCK TABLES `ag_post` WRITE;
/*!40000 ALTER TABLE `ag_post` DISABLE KEYS */;
INSERT INTO `ag_post` VALUES (1,'Test','Austin','This is a test','2016-05-27 12:25:18',1),(2,'Test','Austin','This is a test','2016-05-27 12:26:52',1),(3,'Test2','Austin Again','Lol','2016-05-27 15:36:41',1),(4,'Gusto ko ng kamatis','Rissa Quindoza','I want kamatis. Kamatis is good','2016-05-30 08:14:07',1),(5,'Gusto ko bumutas','Angelo Matias','Ako ay bubutas ng bagay na maibubutas ng aking pambutas.','2016-05-30 08:14:30',1),(6,'Ako ay matutulog','Kenneth Wang','Antok na ako. Matutulog ako. <3','2016-05-30 08:14:46',1),(7,'My Favorite Books','Pedro Penduko','1.	A Storm of Swords (George R. R. Martin) (94%)\r\n2.	Les Miserables (Victor Hugo) (98%)\r\n3.	The Great Gatsby (F. Scott Fitzgerald) (94%)\r\n4.	A Tale of Two Cities (Charles Dickens) (94%)\r\n5.	King Lear (William Shakespeare) (98%)\r\n6.	Ready Player One (Ernest Cline) (95%)\r\n7.	The Prince (Niccolo Machiavelli) (97%)\r\n8.	1984 (George Orwell) (97%)\r\n9.	Harry Potter and the Prisoner of Azkaban (J.K. Rowling) (90%)\r\n10.	Shutter Island (Dennis Lehane) (90%)\r\n11.	The Lord of the Rings: The Return of the King (J.R.R. Tolkien) (95%)\r\n12.	Lullaby (Chuck Palahniuk) (87%)\r\n13.	Anna Karenina (Leo Tolstoy) (96%)\r\n14.	Harry Potter and the Order of the Phoenix (J.K. Rowling) (87%)\r\n15.	The Lord of the Rings: The Two Towers (J.R.R. Tolkien) (95%)\r\n16.	Animal Farm (George Orwell) (95%)\r\n17.	Noli Me Tangere (Jose Rizal) (94%)\r\n18.	A Game of Thrones (George R. R. Martin) (90%)\r\n19.	The Chronicles of Narnia: The Voyage of the Dawn Treader (C.S. Lewis) (86%)\r\n20.	Perks of Being a Wallflower (Stephen Chbosky) (85%)\r\n21.	The Three Musketeers (Alexandre Dumas) (88%)\r\n22.	To Kill a Mockingbird (Harper Lee) (93%)\r\n23.	Dantes Paradiso (Dante Aligheri) (95%)\r\n24.	The Well of Ascension (Brandon Sanderson) (90%)\r\n25.	Mistborn: The Final Empire (Brandon Sanderson) (88%)\r\n26.	Survivor (Chuck Palahniuk) (90%)\r\n27.	Diary (Chuck Palahniuk) (87%)\r\n28.	Gone Girl (Gillian Flynn) (85%)\r\n29.	El Filibusterismo (Jose Rizal) (91%)\r\n30.	Hamlet (William Shakespeare) (97%)\r\n31.	Battle Royale (Koushun Takami) (89%)\r\n32.	Fight Club (Chuck Palahniuk) (86%)\r\n33.	Firefight (Brandon Sanderson) (93%)\r\n34.	The Girl Who Kicked the Hornets Nest (Stieg Larsson) (90%)\r\n35.	Much Ado About Nothing (William Shakespeare) (89%)\r\n36.	Invisible Monsters Remix (Chuck Palahniuk) (89%)\r\n37.	Invisible Monsters (Chuck Palahniuk) (86%)\r\n38.	Romeo and Juliet (William Shakespeare) (94%)\r\n39.	Of Mice and Men (John Steinbeck) (86%)\r\n40.	And Then There Were None (Agatha Christie) (89%)\r\n41.	The Odyssey (Homer) (92%)\r\n42.	The Chronicles of Narnia: The Horse and His Boy (C.S. Lewis) (88%)\r\n43.	The Hero of Ages (Brandon Sanderson) (90%)\r\n44.	Steelheart (Brandon Sanderson) (89%)\r\n45.	Rant (Chuck Palahniuk) (87%)\r\n46.	The Merchant of Venice (William Shakespeare) (84%)\r\n47.	The Count of Monte Cristo (Alexandré Dumas) (92%)\r\n48.	The Girl With the Dragon Tattoo (Stieg Larsson) (85%)\r\n49.	A Thousand Splendid Suns (Khaled Hosseini) (84%)\r\n50.	Harry Potter and the Half-Blood Prince (J.K. Rowling) (86%)\r\n51.	Dantes Purgatorio (Dante Aligheri) (95%)\r\n52.	Harry Potter and the Goblet of Fire (J.K. Rowling) (84%)\r\n53.	The Chronicles of Narnia: Prince Caspian (C.S. Lewis)\r\n54.	The Chronicles of Narnia: The Lion, The Witch, and the Wardrobe (C.S. Lewis)\r\n55.	Desaparesidos (Lualhati Bautista) (87%)\r\n56.	A Midsummer Nights Dream (William Shakespeare) (85%)\r\n57.	The Hobbit (J.R.R. Tolkien) (86%)\r\n58.	Deception Point (Dan Brown ) (83%)\r\n59.	The Alloy of Law (Brandon Sanderson) (85%)\r\n60.	Pygmy (Chuck Palahniuk) (82%)\r\n61.	The Kite Runner (Khaled Hosseini) (83%)\r\n62.	Macbeth (William Shakespeare) (82%)	\r\n63.	The Girl Who Played With Fire (Stieg Larsson) (85%)\r\n64.	The Hitchhikers Guide to the Galaxy (Douglas Adams) (80%)\r\n65.	The Iliad (Homer) (89%)\r\n66.	The House of Hades (Rick Riordan) (84%)\r\n67.	Percy Jackson and the Olympians: The Battle of the Labyrinth (Rick Riordan) (81%)\r\n68.	Dantes Inferno (Dante Aligheri) (90%)\r\n69.	The Fault in Our Stars (John Green) (78%)\r\n70.	The Mark of Athena (Rick Riordan) (81%)\r\n71.	Shadows of Self (Brandon Sanderson) (75%)\r\n72.	Elantris (Brandon Sanderson) (80%)\r\n73.	The Picture of Dorian Gray (Oscar Wilde) (87%)\r\n74.	The Little Prince (Antoine de Saint-Exupery) (87%)\r\n75.	Percy Jackson and the Olympians: The Titans Curse (Rick Riordan) (80%)\r\n76.	Life of Pi (Yann Martel) (84%)\r\n77.	The Godfather (Mario Puzo) (89%)\r\n78.	Calamity (Brandon Sanderson) (79%)\r\n79.	Haunted (Chuck Palahniuk) (84%)\r\n80.	The Chronicles of Narnia: The Last Battle (C.S. Lewis) (87%)\r\n81.	Choke (Chuck Palahniuk) (84%)\r\n82.	Percy Jackson and the Olympians: The Last Olympian (Rick Riordan)\r\n83.	The Taming of the Shrew (William Shakespeare) (82%)\r\n84.	Ang Tundo Man May Langit Din (Andres Cristobal Cruz)\r\n85.	The Pretenders (F. Sionil Jose)\r\n86.	War and Peace (Leo Tolstoy) (90%)\r\n87.	The Lost Hero (Rick Riordan) (80%)\r\n88.	Charlie and the Chocolate Factory (Roald Dahl)\r\n89.	Angels and Demons (Dan Brown) (75%)\r\n90.	Carrie (Stephen King) (72%)\r\n91.	The Adventures of Sherlock Holmes (Arthur Conan Doyle) (85%)\r\n92.	A Feast For Crows (George R.R. Martin) (79%)\r\n93.	Lamb: The Gospel According to Biff, Christs Childhood Pal (Christopher Moore) (82%)\r\n94.	Digital Fortress (Dan Brown) (64%)\r\n95.	Twelfth Night (William Shakespeare)\r\n96.	Percy Jackson and the Olympians: The Lightning Thief (Rick Riordan) (80%)\r\n97.	Vicious (V.E.Schwab) (84%)\r\n98.	Cloud Atlas (David Mitchell) (81%)\r\n99.	Looking For Alaska (John Green) (80%)\r\n100.	A Clash of Kings (George R.R. Martin) (74%)\r\n101.	Beautiful You (Chuck Palahniuk) (72%)\r\n102.	Life, The Universe, and Everything (Douglas Adams) (74%)\r\n103.	The Son of Neptune (Rick Riordan) (75%)\r\n104.	Damned (Chuck Palahniuk) (74%)\r\n105.	Dekada 70 (Lualhati Bautista) (78%)\r\n106.	Atonement (Ian McEwan) (77%)\r\n107.	The Chronicles of Narnia: The Silver Chair (C.S. Lewis) (81%)\r\n108.	The Memoirs of Sherlock Holmes (Arthur Conan Doyle) (80%)\r\n109.	The Silmarillion (J.R.R. Tolkien) (80%)\r\n110.	The Lord of the Rings: The Fellowship of the Ring (J.R.R. Tolkien) (74%)\r\n111.	The Children of Hurin (J.R.R.Tolkien) (70%)\r\n112.	His Last Bow (Arthur Conan Doyle) (79%)\r\n113.	Stranger Than Fiction (Chuck Palahniuk) (82%)\r\n114.	Wicked (Gregory Maguire) (72%)\r\n115.	The Adventures of Tom Sawyer (Mark Twain) (73%)\r\n116.	The Chronicles of Narnia: The Magicians Nephew (C.S. Lewis) (80%)\r\n117.	Mockingjay (Suzanne Collins) (77%)\r\n118.	The Time Machine (H.G. Wells) (83%)\r\n119.	The Book Thief (Markus Zusak) (75%)\r\n120.	Catching Fire (Suzanne Collins) (90.35%)\r\n121.	The Martian (Andy Weir) (72%)\r\n122.	The Hunger Games (Suzanne Collins)\r\n123.	Tell-All (Chuck Palahniuk) (80%)\r\n124.	Othello (William Shakespeare)\r\n125.	The Lost Symbol (Dan Brown) (71%)\r\n126.	The Phantom of the Opera (Gaston Leroux)\r\n127.	Alices Adventures in Wonderland (Lewis Caroll) (75%)\r\n128.	Doomed (Chuck Palahniuk) (65%)\r\n129.	The Restaurant at the End of the Universe (Douglas Adams) (72%)\r\n130.	The Hound of the Baskervilles (Arthur Conan Doyle) (73%)\r\n131.	Disgrace (J.M. Coetzee) (85%)\r\n132.	The Sign of Four (Arthur Conan Doyle) (73%)\r\n133.	Sa Mga Kuko ng Liwanag (Edgardo M. Reyes) (91.9%)\r\n134.	The Art of War (Sun Tzu) (80%)\r\n135.	A Study in Scarlet (Arthur Conan Doyle) (80%)\r\n136.	The Blood of Olympus (Rick Riordan) (71%)\r\n137.	A Dance With Dragons (George R. R. Martin) (64%)\r\n138.	One Hundred Years of Solitude (Gabriel Garcia Marquez) (88%)\r\n139.	As You Like It (William Shakespeare)\r\n140.	Paper Towns (John Green) (73%)\r\n141.	Percy Jackson and the Olympians: The Demigod Files (Rick Riordan)\r\n142.	The Strange Case of Dr. Jekyll and Mr. Hyde (Robert Louis Stevenson)\r\n143.	Harry Potter and the Sorcerers Stone (J.K. Rowling)\r\n144.	The Mortal Instruments: City of Bones (Cassandra Clare) (79%)\r\n145.	Inferno (Dan Brown) (63%)\r\n146.	The Return of Sherlock Holmes (Arthur Conan Doyle) (80%)\r\n147.	Mitosis (Brandon Sanderson) (60%)\r\n148.	Beowulf (Author Unknown) (80%)\r\n149.	Armada (Ernest Cline) (60%)\r\n150.	Mystic River (Dennis Lehane) (74%)\r\n151.	The Valley of Fear (Arthur Conan Doyle) (74%)\r\n152.	Frankenstein (Mary Shelley) (70%)\r\n153.	Antony and Cleopatra (William Shakespeare) (78%)\r\n154.	The Wonderful Wizard of Oz (L. Frank Baum) (62%)\r\n155.	Journey to the Center of the Earth (Jules Verne) (70%)\r\n156.	Henry V (William Shakespeare) (83%)\r\n157.	Lord of the Flies (William Golding)\r\n158.	GAPO (Lualhati Bautista) (67%)\r\n159.	Percy Jackson and the Olympians: The Sea of Monsters (Rick Riordan)\r\n160.	Mostly Harmless (Douglas Adams) (45%)\r\n161.	Tuesdays With Morrie (Mitch Albom) (70%)\r\n162.	Through the Looking Glass and What Alice Found There (Lewis Caroll) (79%)\r\n163.	The Tempest (William Shakespeare)\r\n164.	Heart of Darkness (Joseph Conrad) (80%)\r\n165.	Julius Caesar (William Shakespeare)\r\n166.	Harry Potter and the Chamber of Secrets (J.K. Rowling)\r\n167.	Harry Potter and the Deathly Hallows (J.K. Rowling)\r\n168.	So Long, and Thanks for All the Fish (Douglas Adams) (30%)\r\n169.	Charlie and the Great Glass Elevator (Roald Dahl)\r\n170.	Henry IV (William Shakespeare) (82%)\r\n171.	Canal De La Reina (Liwayway Arceo)\r\n172.	The Da Vinci Code (Dan Brown)\r\n173.	Snuff (Chuck Palahniuk) (23%)\r\n174.	Florante at Laura (Francisco Balagtas Baltazar)\r\n175.	The Shining (Stephen King) (50%)\r\n176.	The Scarlet Letter (Nathaniel Hawthorne)\r\n177.	Mag-Anak na Cruz  (Liwayway Arceo)\r\n178.	Ibong Adarna (Author Unknown)\r\n179.	Make Something Up (Chuck Palahniuk) (20%)\r\n180.	The Adventures of Huckleberry Finn (Mark Twain) (10%)\r\n\r\n69,117 pages\r\n','2016-06-01 13:09:18',1),(8,'Shuffle','Shuffuru','Shuffle is a mobile game wherein the user guesses certain details about songs such as artist, album, or title (depending on the game difficulty) within a restriction such as time limit or until the album is over. The general objective is to provide a fun outlet for users to test their knowledge on their favorite music. Specifically, it is to provide the user with a way to guess certain details of certain songs within a set time limit or to do the same for a certain finite amount of songs.\r<br/>\r<br/>The process begins with the user selecting a game difficulty, which could be changed at any time in the settings. Afterwards, the user selects a selection of songs, whether it be an artist, a playlist, an album, or their entire music library. The user then selects a game mode, either Time Attack, where they are given 135 seconds, or Song Rush, where they must guess as many songs in the selected playlist. After the game, they may record their stats under a name.\r<br/>','2016-06-01 13:31:18',1),(9,'Pikachu','Pikachu','Sa aking palagay ay hindi na ako makakakita pa\r<br/>Ng Pikachu na sindikit nitong Pokemon na kaaya-aya\r<br/>\r<br/>Bibig na dayukdok di ibig alisin sa pagkakadikit\r<br/>Sa dibdib ng lupang ang daloy ng buhay, walang kasing-nakaka-kuryente\r<br/>\r<br/>Sa buong maghapon, sa mukha ng Arceus lamang nakatingin\r<br/>Ang pisnging bisig ay nangakataas sa pananalangin\r<br/>\r<br/>Kung nagtatag-init, ang malagong buntot ay nahihiyasan\r<br/>Ng pugad ng ibong pugad din ng tuwa at kaligayahan\r<br/>\r<br/>Sa kanyang kandungan, ang kabusilakay doon umiidlip \r<br/>Sa buhos ng ulan ay magkarayamang nakikipagkuryentehan\r<br/>\r<br/>Tulay nagagawa ng mga gaya kong mulala at hangal,\r<br/>Mga Pikachu, ang nakagagaway tanging Arceus lamang.','2016-06-01 13:33:25',1),(10,'Summoning Richard','Allahu Akbar','T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. T*** Ina. ','2016-06-01 13:33:50',1),(11,'Implicit Demand For Proof','Twenty One Pilots','I know you\'re not a liar\r<br/>And I know you could set fire\r<br/>This day\r<br/>Go ahead and make me look away\r<br/>Strike me down\r<br/>I am calling your lightning\r<br/>Down from your dark hiding place\r<br/>Go ahead and show me\r<br/>Your face\r<br/>\r<br/>Rain down\r<br/>And destroy me\r<br/>Rain down\r<br/>And destroy me\r<br/>Rain down\r<br/>\r<br/>I mean no disrespect\r<br/>I am simply very perplexed\r<br/>By your ways\r<br/>Why won\'t you let us\r<br/>Use your name?\r<br/>\r<br/>Rain down\r<br/>And destroy me\r<br/>Rain down\r<br/>And destroy me\r<br/>Rain down\r<br/>And destroy me\r<br/>Rain down\r<br/>And destroy me\r<br/>\r<br/>Rain\r<br/>\r<br/>Down\r<br/>\r<br/>Rain\r<br/>\r<br/>Down\r<br/>\r<br/>Down','2016-06-01 13:36:27',1);
/*!40000 ALTER TABLE `ag_post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-01 21:56:58
