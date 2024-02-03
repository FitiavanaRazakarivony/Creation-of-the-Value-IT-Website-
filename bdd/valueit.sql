-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 09 Juin 2023 à 10:36
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `valueit`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nom_admin` varchar(250) NOT NULL,
  `prenom_admin` varchar(250) NOT NULL,
  `motdepass_admin` varchar(50) NOT NULL,
  `email_admin` varchar(110) NOT NULL,
  `type_admin` varchar(50) DEFAULT NULL,
  `image_admin` varchar(50) NOT NULL,
  `pseudo_admin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `email_admin` (`email_admin`),
  UNIQUE KEY `type_admin` (`type_admin`),
  UNIQUE KEY `pseudo_admin` (`pseudo_admin`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `nom_admin`, `prenom_admin`, `motdepass_admin`, `email_admin`, `type_admin`, `image_admin`, `pseudo_admin`) VALUES
(11, 'RAZAKARIVONY', 'Andriniaina Olivia', '0000', 'olivia@gmail.com', 'Admin', 'c1.jpg', 'Trazakarivony');

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

CREATE TABLE IF NOT EXISTS `annonce` (
  `id_ann` int(11) NOT NULL AUTO_INCREMENT,
  `annonce` text NOT NULL,
  `typeAnn` varchar(50) NOT NULL,
  `id_nosMet` int(11) NOT NULL,
  PRIMARY KEY (`id_ann`),
  UNIQUE KEY `id_nosMet` (`id_nosMet`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `annonce`
--

INSERT INTO `annonce` (`id_ann`, `annonce`, `typeAnn`, `id_nosMet`) VALUES
(4, 'annonce', '0', 1);

-- --------------------------------------------------------

--
-- Structure de la table `chef`
--

CREATE TABLE IF NOT EXISTS `chef` (
  `id_lead` int(11) NOT NULL AUTO_INCREMENT,
  `imageLead` text NOT NULL,
  `nomLead` varchar(100) NOT NULL,
  `prenomLead` varchar(100) NOT NULL,
  `id_nosMet` int(11) NOT NULL,
  PRIMARY KEY (`id_lead`),
  KEY `id_nosMet` (`id_nosMet`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `chef`
--

INSERT INTO `chef` (`id_lead`, `imageLead`, `nomLead`, `prenomLead`, `id_nosMet`) VALUES
(1, 'motivation.png', 'null', 'Jeon', 1);

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

CREATE TABLE IF NOT EXISTS `competence` (
  `id_compet` int(11) NOT NULL AUTO_INCREMENT,
  `competence` text NOT NULL,
  `id_nosMet` int(11) NOT NULL,
  PRIMARY KEY (`id_compet`),
  KEY `id_nosMet` (`id_nosMet`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `competence`
--

INSERT INTO `competence` (`id_compet`, `competence`, `id_nosMet`) VALUES
(1, 'java', 1);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id_cont` int(11) NOT NULL AUTO_INCREMENT,
  `date_cont` date NOT NULL,
  `contact_cont` text NOT NULL,
  `id_visit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cont`),
  KEY `id_visit` (`id_visit`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `contact`
--

INSERT INTO `contact` (`id_cont`, `date_cont`, `contact_cont`, `id_visit`) VALUES
(1, '2023-06-07', 'salut 1;', 1),
(2, '2023-06-07', 'salut', 1),
(3, '2023-06-07', 'ok', 1);

-- --------------------------------------------------------

--
-- Structure de la table `contact_ext`
--

CREATE TABLE IF NOT EXISTS `contact_ext` (
  `id_contExt` int(11) NOT NULL AUTO_INCREMENT,
  `date_contExt` date NOT NULL,
  `contact_contExt` text NOT NULL,
  `nom_contExt` varchar(150) NOT NULL,
  `prenom_contEx` varchar(150) NOT NULL,
  `email_contExt` varchar(150) NOT NULL,
  PRIMARY KEY (`id_contExt`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `contact_ext`
--

INSERT INTO `contact_ext` (`id_contExt`, `date_contExt`, `contact_contExt`, `nom_contExt`, `prenom_contEx`, `email_contExt`) VALUES
(1, '2023-06-07', 'null', 'RAZAKARIVONY', 'Finoana Feno Fitiavana', 'fitiavanarazakarivony00@gmail.com'),
(2, '2023-06-07', 'salut!', 'RAZANADRASOA', 'Feno', 'feno@gmail.com'),
(3, '2023-06-07', 'bonjour', 'RAZAKARIVONY', 'finoana', 'finoana@gmail.com'),
(4, '2023-06-07', 'ma', 'RAZAKARIVONY', 'Finoana Feno Fitiavana', 'feno@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `demandeurexterne`
--

CREATE TABLE IF NOT EXISTS `demandeurexterne` (
  `id_eurExt` int(11) NOT NULL AUTO_INCREMENT,
  `nom_eurExt` varchar(100) NOT NULL,
  `prenom_eurExt` varchar(100) NOT NULL,
  `tel_eurExt` varchar(16) NOT NULL,
  `email_eurExt` varchar(150) NOT NULL,
  `adresse_eurExt` varchar(100) NOT NULL,
  `cv_demExt` varchar(50) NOT NULL,
  `id_demEx` int(11) NOT NULL,
  `id_ann` int(11) NOT NULL,
  `id_sexe` int(11) NOT NULL,
  PRIMARY KEY (`id_eurExt`),
  UNIQUE KEY `email_eurExt_3` (`email_eurExt`),
  UNIQUE KEY `tel_eurExt_2` (`tel_eurExt`),
  KEY `id_sexe` (`id_sexe`),
  KEY `tel_eurExt` (`tel_eurExt`) USING BTREE,
  KEY `email_eurExt_2` (`email_eurExt`),
  KEY `email_eurExt` (`email_eurExt`) USING BTREE,
  KEY `id_demEx` (`id_demEx`) USING BTREE,
  KEY `id_ann` (`id_ann`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Structure de la table `demandeurinterne`
--

CREATE TABLE IF NOT EXISTS `demandeurinterne` (
  `id_eurInt` int(11) NOT NULL AUTO_INCREMENT,
  `CV_eurInt` varchar(50) NOT NULL,
  `id_demI` varchar(50) NOT NULL,
  `id_ann` int(11) NOT NULL,
  `id_visit` int(11) NOT NULL,
  PRIMARY KEY (`id_eurInt`),
  UNIQUE KEY `id_ann_2` (`id_ann`),
  KEY `id_visit` (`id_visit`),
  KEY `id_ann` (`id_ann`),
  KEY `id_demI` (`id_demI`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `demandeurinterne`
--

INSERT INTO `demandeurinterne` (`id_eurInt`, `CV_eurInt`, `id_demI`, `id_ann`, `id_visit`) VALUES
(3, 'sdf', '1\r\n', 1, 1),
(4, 'fqsd', '1\r\n', 4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `demande_accext`
--

CREATE TABLE IF NOT EXISTS `demande_accext` (
  `id_eurExt` int(11) NOT NULL,
  PRIMARY KEY (`id_eurExt`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `demande_accint`
--

CREATE TABLE IF NOT EXISTS `demande_accint` (
  `id_eurInt` int(11) NOT NULL,
  PRIMARY KEY (`id_eurInt`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `demande_accint`
--

INSERT INTO `demande_accint` (`id_eurInt`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Structure de la table `demande_deme`
--

CREATE TABLE IF NOT EXISTS `demande_deme` (
  `id_demEx` int(11) NOT NULL AUTO_INCREMENT,
  `date_demEx` date NOT NULL,
  `objet_demEx` varchar(50) NOT NULL,
  `contenu_demEx` varchar(50) NOT NULL,
  PRIMARY KEY (`id_demEx`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `demande_deme`
--

INSERT INTO `demande_deme` (`id_demEx`, `date_demEx`, `objet_demEx`, `contenu_demEx`) VALUES
(4, '2023-06-07', 'conten', '1\r\n'),
(5, '2023-06-07', 'contenue', '1\r\n'),
(3, '2023-06-07', 'contenu', '1\r\n'),
(6, '2023-06-07', 'contenue', '1\r\n'),
(7, '2023-06-07', 'contenue', '1\r\n'),
(8, '2023-06-07', 'contenue', '1\r\n'),
(9, '2023-06-07', 'OJ', '1\r\n'),
(10, '2023-06-07', 'fsfqsd', '1\r\n'),
(11, '2023-06-07', 'fsfqsd', '1\r\n'),
(12, '2023-06-07', 'fsfqsd', '1\r\n'),
(13, '2023-06-07', 'fsfqsd', '1\r\n'),
(14, '2023-06-08', 'fdsfq', '1\r\n'),
(15, '2023-06-08', 'fdsqf', '1\r\n'),
(16, '2023-06-08', 'fdsqf', '1\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `demande_demi`
--

CREATE TABLE IF NOT EXISTS `demande_demi` (
  `id_demI` int(11) NOT NULL AUTO_INCREMENT,
  `contenu_demI` varchar(50) NOT NULL,
  `date_demI` date NOT NULL,
  `ficheDePoste_demI` varchar(50) NOT NULL,
  `id_objetDemI` int(11) NOT NULL,
  PRIMARY KEY (`id_demI`),
  KEY `id_objetDemI` (`id_objetDemI`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `demande_demi`
--

INSERT INTO `demande_demi` (`id_demI`, `contenu_demI`, `date_demI`, `ficheDePoste_demI`, `id_objetDemI`) VALUES
(1, 'fsqd', '2023-06-05', 'fqsdf', 1),
(2, 'fsd', '2023-06-06', 'sdf', 1),
(3, 'fqsf', '2023-06-06', 'sdf', 1),
(4, 'contenu', '2023-06-07', 'fiche', 1),
(5, 'contenu', '2023-06-07', 'fiche', 1),
(6, 'contenu', '2023-06-07', 'fiche', 1),
(7, 'fqs', '2023-06-07', 'fqsd', 1),
(8, 'fqsdf', '2023-06-09', 'dfqsf', 1),
(9, 'fdsqf', '2023-06-09', 'sdfq', 1),
(10, 'dfqsdf', '2023-06-09', 'sqdfq', 1),
(11, 'dfqsdf', '2023-06-09', 'sqdfq', 1),
(12, 'fsdf', '2023-06-09', 'sqdf', 1),
(13, 'fsqdf', '2023-06-09', 'sdfq', 1),
(14, 'fsqdf', '2023-06-09', 'sdfq', 1),
(15, 'fsdf', '2023-06-09', 'qsdfq', 1),
(16, 'gdsfg', '2023-06-09', 'dfsgs', 1),
(17, 'DFSQF', '2023-06-09', 'FQSDF', 1);

-- --------------------------------------------------------

--
-- Structure de la table `demande_refext`
--

CREATE TABLE IF NOT EXISTS `demande_refext` (
  `id_eurExt` int(11) NOT NULL,
  PRIMARY KEY (`id_eurExt`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `demande_refext`
--

INSERT INTO `demande_refext` (`id_eurExt`) VALUES
(1),
(2),
(5),
(6),
(7),
(8);

-- --------------------------------------------------------

--
-- Structure de la table `demande_refint`
--

CREATE TABLE IF NOT EXISTS `demande_refint` (
  `id_eurInt` int(11) NOT NULL,
  PRIMARY KEY (`id_eurInt`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `discuter`
--

CREATE TABLE IF NOT EXISTS `discuter` (
  `id_admin` int(11) NOT NULL,
  `id_visit` int(11) NOT NULL,
  `date_mess` date NOT NULL,
  `message` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_admin`,`id_visit`),
  KEY `id_visit` (`id_visit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `exm_demex`
--

CREATE TABLE IF NOT EXISTS `exm_demex` (
  `id_admin` int(11) NOT NULL,
  `id_demEx` int(11) NOT NULL,
  `note` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id_admin`,`id_demEx`),
  KEY `id_demEx` (`id_demEx`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `exm_demi`
--

CREATE TABLE IF NOT EXISTS `exm_demi` (
  `id_admin` int(11) NOT NULL,
  `id_demI` varchar(50) NOT NULL,
  `note` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id_admin`,`id_demI`),
  KEY `id_demI` (`id_demI`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `informsuppl`
--

CREATE TABLE IF NOT EXISTS `informsuppl` (
  `id_nosMet` int(11) NOT NULL,
  `salaire` varchar(200) NOT NULL,
  `horairTrav` varchar(40) NOT NULL,
  `id_typeContra` int(11) NOT NULL,
  PRIMARY KEY (`id_nosMet`),
  KEY `id_typeContra` (`id_typeContra`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `informsuppl`
--

INSERT INTO `informsuppl` (`id_nosMet`, `salaire`, `horairTrav`, `id_typeContra`) VALUES
(1, '500 000 ariary', '5h', 1);

-- --------------------------------------------------------

--
-- Structure de la table `nosmetier`
--

CREATE TABLE IF NOT EXISTS `nosmetier` (
  `id_nosMet` int(11) NOT NULL AUTO_INCREMENT,
  `nom_nosMet` varchar(100) NOT NULL,
  `description_nosMet` varchar(250) NOT NULL,
  PRIMARY KEY (`id_nosMet`),
  UNIQUE KEY `nom_nosMet` (`nom_nosMet`),
  UNIQUE KEY `description_nosMet` (`description_nosMet`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `nosmetier`
--

INSERT INTO `nosmetier` (`id_nosMet`, `nom_nosMet`, `description_nosMet`) VALUES
(1, 'BPO', ' Description de metiers BPO');

-- --------------------------------------------------------

--
-- Structure de la table `objet_demandei`
--

CREATE TABLE IF NOT EXISTS `objet_demandei` (
  `id_objetDemI` int(11) NOT NULL AUTO_INCREMENT,
  `objet_demandeI` varchar(100) NOT NULL,
  PRIMARY KEY (`id_objetDemI`),
  UNIQUE KEY `objet_demandeI` (`objet_demandeI`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `objet_demandei`
--

INSERT INTO `objet_demandei` (`id_objetDemI`, `objet_demandeI`) VALUES
(1, 'stage');

-- --------------------------------------------------------

--
-- Structure de la table `publication`
--

CREATE TABLE IF NOT EXISTS `publication` (
  `id_pub` int(11) NOT NULL AUTO_INCREMENT,
  `date_pub` date NOT NULL,
  `info_pub` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL,
  `id_tittrePub` int(11) NOT NULL,
  PRIMARY KEY (`id_pub`),
  UNIQUE KEY `image` (`image`),
  KEY `id_tittrePub` (`id_tittrePub`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `publication`
--

INSERT INTO `publication` (`id_pub`, `date_pub`, `info_pub`, `image`, `id_tittrePub`) VALUES
(9, '2023-06-05', 'nok', 'fitiavanaCV.jpg', 5);

-- --------------------------------------------------------

--
-- Structure de la table `sexe`
--

CREATE TABLE IF NOT EXISTS `sexe` (
  `id_sexe` int(11) NOT NULL AUTO_INCREMENT,
  `sexe` varchar(100) NOT NULL,
  PRIMARY KEY (`id_sexe`),
  UNIQUE KEY `sexe` (`sexe`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `sexe`
--

INSERT INTO `sexe` (`id_sexe`, `sexe`) VALUES
(1, 'madame'),
(2, 'monsieur');

-- --------------------------------------------------------

--
-- Structure de la table `soustitre_pub`
--

CREATE TABLE IF NOT EXISTS `soustitre_pub` (
  `id_sousTitre` int(11) NOT NULL AUTO_INCREMENT,
  `soustitre_pub` varchar(100) NOT NULL,
  `id_tittrePub` int(11) NOT NULL,
  PRIMARY KEY (`id_sousTitre`),
  UNIQUE KEY `soustitre_pub` (`soustitre_pub`),
  KEY `id_tittrePub` (`id_tittrePub`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `soustitre_pub`
--

INSERT INTO `soustitre_pub` (`id_sousTitre`, `soustitre_pub`, `id_tittrePub`) VALUES
(8, 'tana', 9),
(7, 'Andavamamba', 9);

-- --------------------------------------------------------

--
-- Structure de la table `titre_pub`
--

CREATE TABLE IF NOT EXISTS `titre_pub` (
  `id_tittrePub` int(11) NOT NULL AUTO_INCREMENT,
  `titre_pub` varchar(250) NOT NULL,
  PRIMARY KEY (`id_tittrePub`),
  UNIQUE KEY `titre_pub` (`titre_pub`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `titre_pub`
--

INSERT INTO `titre_pub` (`id_tittrePub`, `titre_pub`) VALUES
(10, 'Sport'),
(9, 'reboissement');

-- --------------------------------------------------------

--
-- Structure de la table `typecontrat`
--

CREATE TABLE IF NOT EXISTS `typecontrat` (
  `id_typeContra` int(11) NOT NULL AUTO_INCREMENT,
  `type_Contrat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_typeContra`),
  UNIQUE KEY `type_Contrat_3` (`type_Contrat`),
  KEY `type_Contrat_2` (`type_Contrat`),
  KEY `type_Contrat` (`type_Contrat`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `typecontrat`
--

INSERT INTO `typecontrat` (`id_typeContra`, `type_Contrat`) VALUES
(4, 'CDI'),
(3, 'CDD');

-- --------------------------------------------------------

--
-- Structure de la table `visiter`
--

CREATE TABLE IF NOT EXISTS `visiter` (
  `id_pub` int(11) NOT NULL,
  `id_visit` int(11) NOT NULL,
  `date_visiter` date NOT NULL,
  PRIMARY KEY (`id_pub`,`id_visit`),
  KEY `id_visit` (`id_visit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE IF NOT EXISTS `visiteur` (
  `id_visit` int(11) NOT NULL AUTO_INCREMENT,
  `nom_visit` varchar(150) NOT NULL,
  `prenom_visit` varchar(150) NOT NULL,
  `tel_visit` varchar(16) NOT NULL,
  `email_visit` varchar(250) NOT NULL,
  `motdepass_visit` varchar(11) NOT NULL,
  `adress_visit` varchar(100) NOT NULL,
  `type_visit` varchar(50) NOT NULL,
  `image_visit` varchar(250) NOT NULL,
  `pseudo_visit` varchar(50) NOT NULL,
  `id_nosMet` int(11) NOT NULL,
  `id_sexe` int(11) NOT NULL,
  PRIMARY KEY (`id_visit`),
  UNIQUE KEY `pseudo_visit` (`pseudo_visit`),
  UNIQUE KEY `email_visit` (`email_visit`),
  UNIQUE KEY `tel_visit` (`tel_visit`),
  KEY `id_nosMet` (`id_nosMet`),
  KEY `id_sexe` (`id_sexe`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `visiteur`
--

INSERT INTO `visiteur` (`id_visit`, `nom_visit`, `prenom_visit`, `tel_visit`, `email_visit`, `motdepass_visit`, `adress_visit`, `type_visit`, `image_visit`, `pseudo_visit`, `id_nosMet`, `id_sexe`) VALUES
(10, 'RAZAFY', 'Finoana Feno Fitiavana', '034578', 'fitiavanararivony00@gmail.com', '0000', 'lot CM', 'Travailleur', 'c1.jpg', 'mrazafy', 1, 1),
(7, 'RAZAKARIVONY', 'Finoana Feno Fitiavana', '0345783584', 'Finoana@gmail.ocm', '0000', 'lot CM', 'Travailleur', 'IMG_2809.jpg', 'Finoana Feno Fitiavana', 1, 1),
(8, 'RAZAKARIVONY', 'Finoana Feno Fitiavana', '0345783585', 'fitiavanarazakarivony00@gmail.com', '0000', 'lot CM', 'Travailleur', 'Finoana', 'Finoana', 1, 1),
(9, 'RAZAKARIVONY', 'Finoana Feno Fitiavana', '0345783589', 'karivony00@gmail.com', '0000', 'lot CM', 'Travailleur', 'IMG_2809.jpg', 'Fino', 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
