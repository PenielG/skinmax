-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2023 at 08:47 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skinmax`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(20) DEFAULT NULL,
  `admin_pwd` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_username`, `admin_pwd`) VALUES
(1, 'admin', '1234'),
(2, 'admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('46ae2ef1ff9b');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`) VALUES
(1, 'St.ives'),
(2, 'Neutrogena'),
(3, 'Eucerin'),
(4, 'Cetaphil'),
(9, 'Cerave'),
(10, 'Bioderma');

-- --------------------------------------------------------

--
-- Table structure for table `lga`
--

CREATE TABLE `lga` (
  `lga_id` int(11) NOT NULL,
  `lga_stateid` int(11) NOT NULL,
  `lga_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lga`
--

INSERT INTO `lga` (`lga_id`, `lga_stateid`, `lga_name`) VALUES
(1, 1, 'Aba North'),
(2, 1, 'Aba South'),
(3, 1, 'Arochukwu'),
(4, 1, 'Bende'),
(5, 1, 'Ikwuano'),
(6, 1, 'Isiala-Ngwa North'),
(7, 1, 'Isiala-Ngwa South'),
(8, 1, 'Isikwuato'),
(9, 1, 'Nneochi'),
(10, 1, 'Obi-Ngwa'),
(11, 1, 'Ohafia'),
(12, 1, 'Osisioma'),
(13, 1, 'Ugwunagbo'),
(14, 1, 'Ukwa East'),
(15, 1, 'Ukwa West'),
(16, 1, 'Umuahia North'),
(17, 1, 'Umuahia South'),
(18, 2, 'Demsa'),
(19, 2, 'Fufore'),
(20, 2, 'Genye'),
(21, 2, 'Girei'),
(22, 2, 'Gombi'),
(23, 2, 'guyuk'),
(24, 2, 'Hong'),
(25, 2, 'Jada'),
(26, 2, 'Jimeta'),
(27, 2, 'Lamurde'),
(28, 2, 'Madagali'),
(29, 2, 'Maiha'),
(30, 2, 'Mayo Belwa'),
(31, 2, 'Michika'),
(32, 2, 'Mubi North'),
(33, 2, 'Mubi South'),
(34, 2, 'Numan'),
(35, 2, 'Shelleng'),
(36, 2, 'Song'),
(37, 2, 'Toungo'),
(38, 2, 'Yola'),
(39, 3, 'Abak'),
(40, 3, 'Eastern-Obolo'),
(41, 3, 'Eket'),
(42, 3, 'Ekpe-Atani'),
(43, 3, 'Essien-Udim'),
(44, 3, 'Esit Ekit'),
(45, 3, 'Etim-Ekpo'),
(46, 3, 'Etinam'),
(47, 3, 'Ibeno'),
(48, 3, 'Ibesikp-Asitan'),
(49, 3, 'Ibiono-Ibom'),
(50, 3, 'Ika'),
(51, 3, 'Ikono'),
(52, 3, 'Ikot-Abasi'),
(53, 3, 'Ikot-Ekpene'),
(54, 3, 'Ini'),
(55, 3, 'Itu'),
(56, 3, 'Mbo'),
(57, 3, 'Mkpae-Enin'),
(58, 3, 'Nsit-Ibom'),
(59, 3, 'Nsit-Ubium'),
(60, 3, 'Obot-Akara'),
(61, 3, 'Okobo'),
(62, 3, 'Onna'),
(63, 3, 'Oron'),
(64, 3, 'Oro-Anam'),
(65, 3, 'Udung-Uko'),
(66, 3, 'Ukanefun'),
(67, 3, 'Uru Offong Oruko'),
(68, 3, 'Uruan'),
(69, 3, 'Uquo Ibene'),
(70, 3, 'Uyo'),
(71, 4, 'Aguata'),
(72, 4, 'Anambra'),
(73, 4, 'Anambra West'),
(74, 4, 'Anocha'),
(75, 4, 'Awka- North'),
(76, 4, 'Awka-South'),
(77, 4, 'Ayamelum'),
(78, 4, 'Dunukofia'),
(79, 4, 'Ekwusigo'),
(80, 4, 'Idemili-North'),
(81, 4, 'Idemili-South'),
(82, 4, 'Ihiala'),
(83, 4, 'Njikoka'),
(84, 4, 'Nnewi-North'),
(85, 4, 'Nnewi-South'),
(86, 4, 'Ogbaru'),
(87, 4, 'Onisha North'),
(88, 4, 'Onitsha South'),
(89, 4, 'Orumba North'),
(90, 4, 'Orumba South'),
(91, 4, 'Oyi'),
(92, 5, 'Alkaleri'),
(93, 5, 'Bauchi'),
(94, 5, 'Bogoro'),
(95, 5, 'Damban'),
(96, 5, 'Darazo'),
(97, 5, 'Dass'),
(98, 5, 'Gamawa'),
(99, 5, 'Ganjuwa'),
(100, 5, 'Giade'),
(101, 5, 'Itas/Gadau'),
(102, 5, 'Jama\'are'),
(103, 5, 'Katagum'),
(104, 5, 'Kirfi'),
(105, 5, 'Misau'),
(106, 5, 'Ningi'),
(107, 5, 'Shira'),
(108, 5, 'Tafawa-Balewa'),
(109, 5, 'Toro'),
(110, 5, 'Warji'),
(111, 5, 'Zaki'),
(112, 6, 'Brass'),
(113, 6, 'Ekerernor'),
(114, 6, 'Kolokuma/Opokuma'),
(115, 6, 'Nembe'),
(116, 6, 'Ogbia'),
(117, 6, 'Sagbama'),
(118, 6, 'Southern-Ijaw'),
(119, 6, 'Yenegoa'),
(120, 6, 'Kembe'),
(121, 7, 'Ado'),
(122, 7, 'Agatu'),
(123, 7, 'Apa'),
(124, 7, 'Buruku'),
(125, 7, 'Gboko'),
(126, 7, 'Guma'),
(127, 7, 'Gwer-East'),
(128, 7, 'Gwer-West'),
(129, 7, 'Katsina-Ala'),
(130, 7, 'Konshisha'),
(131, 7, 'Kwande'),
(132, 7, 'Logo'),
(133, 7, 'Makurdi'),
(134, 7, 'Obi'),
(135, 7, 'Ogbadibo'),
(136, 7, 'Ohimini'),
(137, 7, 'Oju'),
(138, 7, 'Okpokwu'),
(139, 7, 'Otukpo'),
(140, 7, 'Tarkar'),
(141, 7, 'Vandeikya'),
(142, 7, 'Ukum'),
(143, 7, 'Ushongo'),
(144, 8, 'Abadan'),
(145, 8, 'Askira-Uba'),
(146, 8, 'Bama'),
(147, 8, 'Bayo'),
(148, 8, 'Biu'),
(149, 8, 'Chibok'),
(150, 8, 'Damboa'),
(151, 8, 'Dikwa'),
(152, 8, 'Gubio'),
(153, 8, 'Guzamala'),
(154, 8, 'Gwoza'),
(155, 8, 'Hawul'),
(156, 8, 'Jere'),
(157, 8, 'Kaga'),
(158, 8, 'Kala/Balge'),
(159, 8, 'Kukawa'),
(160, 8, 'Konduga'),
(161, 8, 'Kwaya-Kusar'),
(162, 8, 'Mafa'),
(163, 8, 'Magumeri'),
(164, 8, 'Maiduguri'),
(165, 8, 'Marte'),
(166, 8, 'Mobbar'),
(167, 8, 'Monguno'),
(168, 8, 'Ngala'),
(169, 8, 'Nganzai'),
(170, 8, 'Shani'),
(171, 9, 'Abi'),
(172, 9, 'Akamkpa'),
(173, 9, 'Akpabuyo'),
(174, 9, 'Bakassi'),
(175, 9, 'Bekwara'),
(176, 9, 'Biasi'),
(177, 9, 'Boki'),
(178, 9, 'Calabar-Municipal'),
(179, 9, 'Calabar-South'),
(180, 9, 'Etunk'),
(181, 9, 'Ikom'),
(182, 9, 'Obantiku'),
(183, 9, 'Ogoja'),
(184, 9, 'Ugep North'),
(185, 9, 'Yakurr'),
(186, 9, 'Yala'),
(187, 10, 'Aniocha North'),
(188, 10, 'Aniocha South'),
(189, 10, 'Bomadi'),
(190, 10, 'Burutu'),
(191, 10, 'Ethiope East'),
(192, 10, 'Ethiope West'),
(193, 10, 'Ika North East'),
(194, 10, 'Ika South'),
(195, 10, 'Isoko North'),
(196, 10, 'Isoko South'),
(197, 10, 'Ndokwa East'),
(198, 10, 'Ndokwa West'),
(199, 10, 'Okpe'),
(200, 10, 'Oshimili North'),
(201, 10, 'Oshimili South'),
(202, 10, 'Patani'),
(203, 10, 'Sapele'),
(204, 10, 'Udu'),
(205, 10, 'Ughilli North'),
(206, 10, 'Ughilli South'),
(207, 10, 'Ukwuani'),
(208, 10, 'Uvwie'),
(209, 10, 'Warri Central'),
(210, 10, 'Warri North'),
(211, 10, 'Warri South'),
(212, 11, 'Abakaliki'),
(213, 11, 'Ofikpo North'),
(214, 11, 'Ofikpo South'),
(215, 11, 'Ebonyi'),
(216, 11, 'Ezza North'),
(217, 11, 'Ezza South'),
(218, 11, 'ikwo'),
(219, 11, 'Ishielu'),
(220, 11, 'Ivo'),
(221, 11, 'Izzi'),
(222, 11, 'Ohaukwu'),
(223, 11, 'Ohaozara'),
(224, 11, 'Onicha'),
(225, 12, 'Akoko Edo'),
(226, 12, 'Egor'),
(227, 12, 'Esan Central'),
(228, 12, 'Esan North East'),
(229, 12, 'Esan South East'),
(230, 12, 'Esan West'),
(231, 12, 'Etsako-Central'),
(232, 12, 'Etsako-West'),
(233, 12, 'Igueben'),
(234, 12, 'Ikpoba-Okha'),
(235, 12, 'Oredo'),
(236, 12, 'Orhionmwon'),
(237, 12, 'Ovia North East'),
(238, 12, 'Ovia South West'),
(239, 12, 'owan east'),
(240, 12, 'Owan West'),
(241, 12, 'Umunniwonde'),
(242, 13, 'Ado Ekiti'),
(243, 13, 'Aiyedire'),
(244, 13, 'Efon'),
(245, 13, 'Ekiti-East'),
(246, 13, 'Ekiti-South West'),
(247, 13, 'Ekiti West'),
(248, 13, 'Emure'),
(249, 13, 'Ido Osi'),
(250, 13, 'Ijero'),
(251, 13, 'Ikere'),
(252, 13, 'Ikole'),
(253, 13, 'Ilejemeta'),
(254, 13, 'Irepodun/Ifelodun'),
(255, 13, 'Ise Orun'),
(256, 13, 'Moba'),
(257, 13, 'Oye'),
(258, 14, 'Aninri'),
(259, 14, 'Awgu'),
(260, 14, 'Enugu East'),
(261, 14, 'Enugu North'),
(262, 14, 'Enugu South'),
(263, 14, 'Ezeagu'),
(264, 14, 'Igbo Etiti'),
(265, 14, 'Igbo Eze North'),
(266, 14, 'Igbo Eze South'),
(267, 14, 'Isi Uzo'),
(268, 14, 'Nkanu East'),
(269, 14, 'Nkanu West'),
(270, 14, 'Nsukka'),
(271, 14, 'Oji-River'),
(272, 14, 'Udenu'),
(273, 14, 'Udi'),
(274, 14, 'Uzo Uwani'),
(275, 15, 'Akko'),
(276, 15, 'Balanga'),
(277, 15, 'Billiri'),
(278, 15, 'Dukku'),
(279, 15, 'Funakaye'),
(280, 15, 'Gombe'),
(281, 15, 'Kaltungo'),
(282, 15, 'Kwami'),
(283, 15, 'Nafada/Bajoga'),
(284, 15, 'Shomgom'),
(285, 15, 'Yamltu/Deba'),
(286, 16, 'Ahiazu-Mbaise'),
(287, 16, 'Ehime-Mbano'),
(288, 16, 'Ezinihtte'),
(289, 16, 'Ideato North'),
(290, 16, 'Ideato South'),
(291, 16, 'Ihitte/Uboma'),
(292, 16, 'Ikeduru'),
(293, 16, 'Isiala-Mbano'),
(294, 16, 'Isu'),
(295, 16, 'Mbaitoli'),
(296, 16, 'Ngor-Okpala'),
(297, 16, 'Njaba'),
(298, 16, 'Nkwerre'),
(299, 16, 'Nwangele'),
(300, 16, 'obowo'),
(301, 16, 'Oguta'),
(302, 16, 'Ohaji-Eggema'),
(303, 16, 'Okigwe'),
(304, 16, 'Onuimo'),
(305, 16, 'Orlu'),
(306, 16, 'Orsu'),
(307, 16, 'Oru East'),
(308, 16, 'Oru West'),
(309, 16, 'Owerri Municipal'),
(310, 16, 'Owerri North'),
(311, 16, 'Owerri West'),
(312, 17, 'Auyu'),
(313, 17, 'Babura'),
(314, 17, 'Birnin Kudu'),
(315, 17, 'Birniwa'),
(316, 17, 'Bosuwa'),
(317, 17, 'Buji'),
(318, 17, 'Dutse'),
(319, 17, 'Gagarawa'),
(320, 17, 'Garki'),
(321, 17, 'Gumel'),
(322, 17, 'Guri'),
(323, 17, 'Gwaram'),
(324, 17, 'Gwiwa'),
(325, 17, 'Hadejia'),
(326, 17, 'Jahun'),
(327, 17, 'Kafin Hausa'),
(328, 17, 'Kaugama'),
(329, 17, 'Kazaure'),
(330, 17, 'Kirikasanuma'),
(331, 17, 'Kiyawa'),
(332, 17, 'Maigatari'),
(333, 17, 'Malam Maduri'),
(334, 17, 'Miga'),
(335, 17, 'Ringim'),
(336, 17, 'Roni'),
(337, 17, 'Sule Tankarkar'),
(338, 17, 'Taura'),
(339, 17, 'Yankwashi'),
(340, 18, 'Birnin-Gwari'),
(341, 18, 'Chikun'),
(342, 18, 'Giwa'),
(343, 18, 'Gwagwada'),
(344, 18, 'Igabi'),
(345, 18, 'Ikara'),
(346, 18, 'Jaba'),
(347, 18, 'Jema\'a'),
(348, 18, 'Kachia'),
(349, 18, 'Kaduna North'),
(350, 18, 'Kagarko'),
(351, 18, 'Kajuru'),
(352, 18, 'Kaura'),
(353, 18, 'Kauru'),
(354, 18, 'Koka/Kawo'),
(355, 18, 'Kubah'),
(356, 18, 'Kudan'),
(357, 18, 'Lere'),
(358, 18, 'Makarfi'),
(359, 18, 'Sabon Gari'),
(360, 18, 'Sanga'),
(361, 18, 'Sabo'),
(362, 18, 'Tudun-Wada/Makera'),
(363, 18, 'Zango-Kataf'),
(364, 18, 'Zaria'),
(365, 19, 'Ajingi'),
(366, 19, ' Albasu'),
(367, 19, 'Bagwai'),
(368, 19, 'Bebeji'),
(369, 19, 'Bichi'),
(370, 19, 'Bunkure'),
(371, 19, 'Dala'),
(372, 19, 'Dambatta'),
(373, 19, 'Dawakin Kudu'),
(374, 19, 'Dawakin Tofa'),
(375, 19, 'Doguwa'),
(376, 19, 'Fagge'),
(377, 19, 'Gabasawa'),
(378, 19, 'Garko'),
(379, 19, 'Garun-Mallam'),
(380, 19, 'Gaya'),
(381, 19, 'Gezawa'),
(382, 19, 'Gwale'),
(383, 19, 'Gwarzo'),
(384, 19, 'Kabo'),
(385, 19, 'Kano Municipal'),
(386, 19, 'Karaye'),
(387, 19, 'Kibiya'),
(388, 19, 'Kiru'),
(389, 19, 'Kumbotso'),
(390, 19, 'Kunchi'),
(391, 19, 'Kura'),
(392, 19, 'Madobi'),
(393, 19, 'Makoda'),
(394, 19, 'Minjibir'),
(395, 19, 'Nasarawa'),
(396, 19, 'Rano'),
(397, 19, 'Rimin Gado'),
(398, 19, 'Rogo'),
(399, 19, 'Shanono'),
(400, 19, 'Sumaila'),
(401, 19, 'Takai'),
(402, 19, 'Tarauni'),
(403, 19, 'Tofa'),
(404, 19, 'Tsanyawa'),
(405, 19, 'Tudun Wada'),
(406, 19, 'Ngogo'),
(407, 19, 'Warawa'),
(408, 19, 'Wudil'),
(409, 20, 'Bakori'),
(410, 20, 'Batagarawa'),
(411, 20, 'Batsari'),
(412, 20, 'Baure'),
(413, 20, 'Bindawa'),
(414, 20, 'Charanchi'),
(415, 20, 'Danja'),
(416, 20, 'Danjume'),
(417, 20, 'Dan-Musa'),
(418, 20, 'Daura'),
(419, 20, 'Dutsi'),
(420, 20, 'Dutsinma'),
(421, 20, 'Faskari'),
(422, 20, 'Funtua'),
(423, 20, 'Ingara'),
(424, 20, 'Jibia'),
(425, 20, 'Kafur'),
(426, 20, 'Kaita'),
(427, 20, 'Kankara'),
(428, 20, 'Kankia'),
(429, 20, 'Katsina'),
(430, 20, 'Kurfi'),
(431, 20, 'Kusada'),
(432, 20, 'Mai Adua'),
(433, 20, 'Malumfashi'),
(434, 20, 'Mani'),
(435, 20, 'Mashi'),
(436, 20, 'Matazu'),
(437, 20, 'Musawa'),
(438, 20, 'Rimi'),
(439, 20, 'Sabuwa'),
(440, 20, 'Safana'),
(441, 20, 'Sandamu'),
(442, 20, 'Zango'),
(443, 21, 'Aleira'),
(444, 21, 'Arewa'),
(445, 21, 'Argungu'),
(446, 21, 'Augie'),
(447, 21, 'Bagudo'),
(448, 21, 'Birnin-Kebbi'),
(449, 21, 'Bumza'),
(450, 21, 'Dandi'),
(451, 21, 'Danko'),
(452, 21, 'Fakai'),
(453, 21, 'Gwandu'),
(454, 21, 'Jega'),
(455, 21, 'Kalgo'),
(456, 21, 'Koko-Besse'),
(457, 21, 'Maiyama'),
(458, 21, 'Ngaski'),
(459, 21, 'Sakaba'),
(460, 21, 'Shanga'),
(461, 21, 'Suru'),
(462, 21, 'Wasagu'),
(463, 21, 'Yauri'),
(464, 21, 'Zuru'),
(465, 22, 'Adavi'),
(466, 22, 'Ajaokuta'),
(467, 22, 'Ankpa'),
(468, 22, 'Bassa'),
(469, 22, 'Dekina'),
(470, 22, 'Ibaji'),
(471, 22, 'Idah'),
(472, 22, 'Igalamela'),
(473, 22, 'Ijumu'),
(474, 22, 'Kabba/Bunu'),
(475, 22, 'Kogi'),
(476, 22, 'Lokoja'),
(477, 22, 'Mopa-Muro-Mopi'),
(478, 22, 'Ofu'),
(479, 22, 'Ogori/Magongo'),
(480, 22, 'Okehi'),
(481, 22, 'Okene'),
(482, 22, 'Olamaboro'),
(483, 22, 'Omala'),
(484, 22, 'Oyi'),
(485, 22, 'Yagba-East'),
(486, 22, 'Yagba-West'),
(487, 23, 'Asa'),
(488, 23, 'Baruten'),
(489, 23, 'Edu'),
(490, 23, 'Ekiti'),
(491, 23, 'Ifelodun'),
(492, 23, 'Ilorin East'),
(493, 23, 'Ilorin South'),
(494, 23, 'Ilorin West'),
(495, 23, 'Irepodun'),
(496, 23, 'Isin'),
(497, 23, 'Kaiama'),
(498, 23, 'Moro'),
(499, 23, 'Offa'),
(500, 23, 'Oke-Ero'),
(501, 23, 'Oyun'),
(502, 23, 'Pategi'),
(503, 24, 'Agege'),
(504, 24, 'Ajeromi-Ifelodun'),
(505, 24, 'Alimosho'),
(506, 24, 'Amuwo-Odofin'),
(507, 24, 'Apapa'),
(508, 24, 'Bagagry'),
(509, 24, 'Epe'),
(510, 24, 'Eti-Osa'),
(511, 24, 'Ibeju-Lekki'),
(512, 24, 'Ifako-Ijaiye'),
(513, 24, 'Ikeja'),
(514, 24, 'Ikorodu'),
(515, 24, 'Kosofe'),
(516, 24, 'Lagos-Island'),
(517, 24, 'Lagos-Mainland'),
(518, 24, 'Mushin'),
(519, 24, 'Ojo'),
(520, 24, 'Oshodi-Isolo'),
(521, 24, 'Shomolu'),
(522, 24, 'Suru-Lere'),
(523, 25, 'Akwanga'),
(524, 25, 'Awe'),
(525, 25, 'Doma'),
(526, 25, 'Karu'),
(527, 25, 'Keana'),
(528, 25, 'Keffi'),
(529, 25, 'Kokona'),
(530, 25, 'Lafia'),
(531, 25, 'Nassarawa'),
(532, 25, 'Nassarawa Eggor'),
(533, 25, 'Obi'),
(534, 25, 'Toto'),
(535, 25, 'Wamba'),
(536, 26, 'Agaie'),
(537, 26, 'Agwara'),
(538, 26, 'Bida'),
(539, 26, 'Borgu'),
(540, 26, 'Bosso'),
(541, 26, 'Chanchaga'),
(542, 26, 'Edati'),
(543, 26, 'Gbako'),
(544, 26, 'Gurara'),
(545, 26, 'Katcha'),
(546, 26, 'Kontagora'),
(547, 26, 'Lapai'),
(548, 26, 'Lavum'),
(549, 26, 'Magama'),
(550, 26, 'Mariga'),
(551, 26, 'Mashegu'),
(552, 26, 'Mokwa'),
(553, 26, 'Muya'),
(554, 26, 'Paikoro'),
(555, 26, 'Rafi'),
(556, 26, 'Rajau'),
(557, 26, 'Shiroro'),
(558, 26, 'Suleja'),
(559, 26, 'Tafa'),
(560, 26, 'Wushishi'),
(561, 27, 'Abeokuta -North'),
(562, 27, 'Abeokuta -South'),
(563, 27, 'Ado-Odu/Ota'),
(564, 27, 'Yewa-North'),
(565, 27, 'Yewa-South'),
(566, 27, 'Ewekoro'),
(567, 27, 'Ifo'),
(568, 27, 'Ijebu East'),
(569, 27, 'Ijebu North'),
(570, 27, 'Ijebu North-East'),
(571, 27, 'Ijebu-Ode'),
(572, 27, 'Ikenne'),
(573, 27, 'Imeko-Afon'),
(574, 27, 'Ipokia'),
(575, 27, 'Obafemi -Owode'),
(576, 27, 'Odeda'),
(577, 27, 'Odogbolu'),
(578, 27, 'Ogun-Water Side'),
(579, 27, 'Remo-North'),
(580, 27, 'Shagamu'),
(581, 28, 'Akoko-North-East'),
(582, 28, 'Akoko-North-West'),
(583, 28, 'Akoko-South-West'),
(584, 28, 'Akoko-South-East'),
(585, 28, 'Akure- South'),
(586, 28, 'Akure-North'),
(587, 28, 'Ese-Odo'),
(588, 28, 'Idanre'),
(589, 28, 'Ifedore'),
(590, 28, 'Ilaje'),
(591, 28, 'Ile-Oluji-Okeigbo'),
(592, 28, 'Irele'),
(593, 28, 'Odigbo'),
(594, 28, 'Okitipupa'),
(595, 28, 'Ondo-West'),
(596, 28, 'Ondo East'),
(597, 28, 'Ose'),
(598, 28, 'Owo'),
(599, 29, 'Atakumosa'),
(600, 29, 'Atakumosa East'),
(601, 29, 'Ayeda-Ade'),
(602, 29, 'Ayedire'),
(603, 29, 'Boluwaduro'),
(604, 29, 'Boripe'),
(605, 29, 'Ede'),
(606, 29, 'Ede North'),
(607, 29, 'Egbedore'),
(608, 29, 'Ejigbo'),
(609, 29, 'Ife'),
(610, 29, 'Ife East'),
(611, 29, 'Ife North'),
(612, 29, 'Ife South'),
(613, 29, 'Ifedayo'),
(614, 29, 'Ifelodun'),
(615, 29, 'Ila'),
(616, 29, 'Ilesha'),
(617, 29, 'Ilesha-West'),
(618, 29, 'Irepodun'),
(619, 29, 'Irewole'),
(620, 29, 'Isokun'),
(621, 29, 'Iwo'),
(622, 29, 'Obokun'),
(623, 29, 'Odo-Otin'),
(624, 29, 'Ola Oluwa'),
(625, 29, 'Olorunda'),
(626, 29, 'Ori-Ade'),
(627, 29, 'Orolu'),
(628, 29, 'Osogbo'),
(629, 30, 'Afijio'),
(630, 30, 'Akinyele'),
(631, 30, 'Atiba'),
(632, 30, 'Atisbo'),
(633, 30, 'Egbeda'),
(634, 30, 'Ibadan-Central'),
(635, 30, 'Ibadan-North-East'),
(636, 30, 'Ibadan-North-West'),
(637, 30, 'Ibadan-South-East'),
(638, 30, 'Ibadan-South West'),
(639, 30, 'Ibarapa-Central'),
(640, 30, 'Ibarapa-East'),
(641, 30, 'Ibarapa-North'),
(642, 30, 'Ido'),
(643, 30, 'Ifedayo'),
(644, 30, 'Ifeloju'),
(645, 30, 'Irepo'),
(646, 30, 'Iseyin'),
(647, 30, 'Itesiwaju'),
(648, 30, 'Iwajowa'),
(649, 30, 'Kajola'),
(650, 30, 'Lagelu'),
(651, 30, 'Odo-Oluwa'),
(652, 30, 'Ogbomoso-North'),
(653, 30, 'Ogbomosho-South'),
(654, 30, 'Olorunsogo'),
(655, 30, 'Oluyole'),
(656, 30, 'Ona-Ara'),
(657, 30, 'Orelope'),
(658, 30, 'Ori-Ire'),
(659, 30, 'Oyo East'),
(660, 30, 'Oyo West'),
(661, 30, 'saki east'),
(662, 30, 'Saki West'),
(663, 30, 'Surulere'),
(664, 31, 'Barkin Ladi'),
(665, 31, 'Bassa'),
(666, 31, 'Bokkos'),
(667, 31, 'Jos-East'),
(668, 31, 'Jos-South'),
(669, 31, 'Jos-North'),
(670, 31, 'Kanam'),
(671, 31, 'Kanke'),
(672, 31, 'Langtang North'),
(673, 31, 'Langtang South'),
(674, 31, 'Mangu'),
(675, 31, 'Mikang'),
(676, 31, 'Pankshin'),
(677, 31, 'Quan\'pan'),
(678, 31, 'Riyom'),
(679, 31, 'Shendam'),
(680, 31, 'Wase'),
(681, 32, 'Abua/Odual'),
(682, 32, 'Ahoada East'),
(683, 32, 'Ahoada West'),
(684, 32, 'Akukutoru'),
(685, 32, 'Andoni'),
(686, 32, 'Asari-Toro'),
(687, 32, 'Bonny'),
(688, 32, 'Degema'),
(689, 32, 'Eleme'),
(690, 32, 'Emuoha'),
(691, 32, 'Etche'),
(692, 32, 'Gokana'),
(693, 32, 'Ikwerre'),
(694, 32, 'Khana'),
(695, 32, 'Obio/Akpor'),
(696, 32, 'Ogba/Egbama/Ndoni'),
(697, 32, 'Ogu/Bolo'),
(698, 32, 'Okrika'),
(699, 32, 'Omuma'),
(700, 32, 'Opobo/Nkoro'),
(701, 32, 'Oyigbo'),
(702, 32, 'Port-Harcourt'),
(703, 32, 'Tai'),
(704, 33, 'Binji'),
(705, 33, 'Bodinga'),
(706, 33, 'Dange-Shuni'),
(707, 33, 'Gada'),
(708, 33, 'Goronyo'),
(709, 33, 'Gudu'),
(710, 33, 'Gwadabawa'),
(711, 33, 'Illela'),
(712, 33, 'Isa'),
(713, 33, 'Kebbe'),
(714, 33, 'Kware'),
(715, 33, 'Raba'),
(716, 33, 'Sabon-Birni'),
(717, 33, 'Shagari'),
(718, 33, 'Silame'),
(719, 33, 'Sokoto North'),
(720, 33, 'Sokoto South'),
(721, 33, 'Tambuwal'),
(722, 33, 'Tanzaga'),
(723, 33, 'Tureta'),
(724, 33, 'Wamakko'),
(725, 33, 'Wurno'),
(726, 33, 'Yabo'),
(727, 34, 'Ardo Kola'),
(728, 34, 'Bali'),
(729, 34, 'Donga'),
(730, 34, 'Gashaka'),
(731, 34, 'Gassol'),
(732, 34, 'Ibi'),
(733, 34, 'Jalingo'),
(734, 34, 'Karim-Lamido'),
(735, 34, 'Kurmi'),
(736, 34, 'Lau'),
(737, 34, 'Sardauna'),
(738, 34, 'Takuni'),
(739, 34, 'Ussa'),
(740, 34, 'Wukari'),
(741, 34, 'Yarro'),
(742, 34, 'Zing'),
(743, 35, 'Bade'),
(744, 35, 'Bursali'),
(745, 35, 'Damaturu'),
(746, 35, 'Fuka'),
(747, 35, 'Fune'),
(748, 35, 'Geidam'),
(749, 35, 'Gogaram'),
(750, 35, 'Gujba'),
(751, 35, 'Gulani'),
(752, 35, 'Jakusko'),
(753, 35, 'Karasuwa'),
(754, 35, 'Machina'),
(755, 35, 'Nangere'),
(756, 35, 'Nguru'),
(757, 35, 'Potiskum'),
(758, 35, 'Tarmua'),
(759, 35, 'Yunisari'),
(760, 35, 'Yusufari'),
(761, 36, 'Anka'),
(762, 36, 'Bakure'),
(763, 36, 'Bukkuyum'),
(764, 36, 'Bungudo'),
(765, 36, 'Gumi'),
(766, 36, 'Gusau'),
(767, 36, 'Isa'),
(768, 36, 'Kaura-Namoda'),
(769, 36, 'Kiyawa'),
(770, 36, 'Maradun'),
(771, 36, 'Marau'),
(772, 36, 'Shinkafa'),
(773, 36, 'Talata-Mafara'),
(774, 36, 'Tsafe'),
(775, 36, 'Zurmi'),
(776, 9, 'Obudu'),
(777, 37, 'Abaji'),
(778, 37, 'Bwari'),
(779, 37, 'Gwagwalada'),
(780, 37, 'Kuje'),
(781, 37, 'Kwali'),
(782, 37, 'Municipal'),
(783, 12, 'Etsako-East'),
(784, 16, 'Ahiazu-Mbaise'),
(785, 38, 'Foreign'),
(786, 18, 'Kaduna South'),
(787, 16, 'Aboh-Mbaise'),
(788, 9, 'Odukpani');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `msg_id` int(11) NOT NULL,
  `msg_phoneno` varchar(255) NOT NULL,
  `msg_text` varchar(255) NOT NULL,
  `msg_date` datetime DEFAULT NULL,
  `msg_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `order_userid` int(11) NOT NULL,
  `order_productid` int(11) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_delivery_address` varchar(255) NOT NULL,
  `order_amount` float NOT NULL,
  `order_product_qty` int(11) NOT NULL,
  `order_unitprice` float NOT NULL,
  `order_state_id` int(11) NOT NULL,
  `order_lga_id` int(11) NOT NULL,
  `order_refno` varchar(100) NOT NULL,
  `order_status` enum('pending','failed','paid') NOT NULL DEFAULT 'pending',
  `order_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `order_userid`, `order_productid`, `order_date`, `order_delivery_address`, `order_amount`, `order_product_qty`, `order_unitprice`, `order_state_id`, `order_lga_id`, `order_refno`, `order_status`, `order_email`) VALUES
(1, 21, 14, '2023-07-05 08:45:46', 'sdfg', 3.40282e38, 1, 5000, 1, 4, '36636415', 'pending', NULL),
(2, 21, 14, '2023-07-05 08:45:55', 'sdfg', 3.40282e38, 3, 5000, 1, 4, '5396611', 'pending', NULL),
(3, 21, 14, '2023-07-05 08:47:06', 'sdfg', 3.40282e38, 3, 5000, 1, 4, '91619709', 'pending', NULL),
(4, 21, 14, '2023-07-05 08:49:34', 'Abia', 3.40282e38, 2, 5000, 1, 3, '7901945', 'pending', NULL),
(12, 21, 14, '2023-07-05 11:01:07', 'Ekiti', 10000, 2, 5000, 13, 7, '84952296', 'pending', NULL),
(13, 21, 14, '2023-07-05 12:36:28', 'abia', 20000, 4, 5000, 1, 7, '2571189', 'pending', NULL),
(14, 21, 14, '2023-07-05 14:09:30', 'abia', 10000, 2, 5000, 1, 7, '30539366', 'pending', 'ayomideh97@gmail.com'),
(15, 21, 14, '2023-07-05 14:11:12', 'Abia', 10000, 2, 5000, 1, 5, '86034937', 'pending', 'ayomideh97@gmail.com'),
(16, 21, 14, '2023-07-06 07:43:34', '', 10000, 2, 5000, 1, 1, '52923924', 'pending', 'ayomideh97@gmail.com'),
(17, 21, 14, '2023-07-06 07:45:31', '', 5000, 1, 5000, 1, 1, '56850876', 'pending', 'ayomideh97@gmail.com'),
(18, 21, 14, '2023-07-06 07:45:46', '', 25000, 5, 5000, 1, 1, '15006495', 'pending', 'ayomideh97@gmail.com'),
(19, 21, 14, '2023-07-06 08:47:50', '', 5000.05, 3, 5000, 1, 1, '84801953', 'pending', 'ayomideh97@gmail.com'),
(20, 21, 14, '2023-07-06 08:47:57', '', 5000.05, 3, 5000, 1, 1, '48263569', 'pending', 'ayomideh97@gmail.com'),
(21, 21, 14, '2023-07-06 08:51:43', '', 15000, 3, 5000, 1, 1, '1896655', 'pending', 'ayomideh97@gmail.com'),
(22, 21, 14, '2023-07-06 08:51:53', '', 15000, 3, 5000, 1, 1, '28515729', 'pending', 'ayomideh97@gmail.com'),
(23, 21, 14, '2023-07-06 08:52:19', '', 10000, 2, 5000, 1, 1, '87308590', 'pending', 'ayomideh97@gmail.com'),
(24, 21, 14, '2023-07-06 08:52:30', '', 15000, 3, 5000, 1, 1, '66081858', 'pending', 'ayomideh97@gmail.com'),
(25, 21, 14, '2023-07-06 08:52:47', '', 10000, 2, 5000, 1, 1, '98950813', 'pending', 'ayomideh97@gmail.com'),
(26, 21, 14, '2023-07-06 09:00:14', '', 20000, 4, 5000, 1, 1, '27293783', 'pending', 'ayomideh97@gmail.com'),
(27, 21, 14, '2023-07-06 09:52:32', 'Aba', 10000, 2, 5000, 1, 1, '59391179', 'pending', 'ayomideh97@gmail.com'),
(28, 16, 18, '2023-07-07 09:17:26', 'Abah', 6000, 1, 6000, 1, 1, '57323546', 'pending', NULL),
(29, 16, 18, '2023-07-07 09:19:56', '', 6000, 1, 6000, 1, 1, '4207269', 'pending', 'yemi@yahoo.com'),
(30, 16, 18, '2023-07-07 09:28:30', 'Abia', 18000, 3, 6000, 1, 1, '22355152', 'pending', 'yemi@yahoo.com'),
(31, 16, 18, '2023-07-07 10:50:40', '', 6000, 1, 6000, 1, 1, '58536112', 'pending', 'yemi@yahoo.com'),
(32, 16, 18, '2023-07-07 11:07:28', 'aba', 6000, 1, 6000, 1, 1, '22089935', 'pending', 'yemi@yahoo.com'),
(33, 24, 18, '2023-07-07 12:27:08', '', 6000, 1, 6000, 1, 1, '86705836', 'pending', 'ayomideh97@gmail.com'),
(34, 16, 18, '2023-07-07 15:03:48', '', 6000, 1, 6000, 1, 1, '59653174', 'pending', 'yemi@yahoo.com'),
(35, 16, 18, '2023-07-07 15:03:53', '', 6000, 1, 6000, 1, 1, '25977024', 'pending', 'yemi@yahoo.com'),
(36, 16, 18, '2023-07-07 15:04:05', '', 6000, 1, 6000, 1, 1, '38712350', 'pending', 'yemi@yahoo.com'),
(37, 16, 18, '2023-07-07 15:04:17', '', 6000, 1, 6000, 1, 1, '79808524', 'pending', 'yemi@yahoo.com'),
(38, 16, 18, '2023-07-07 15:05:23', '', 6000, 1, 6000, 1, 1, '52364951', 'pending', 'yemi@yahoo.com'),
(39, 16, 18, '2023-07-07 15:07:01', '', 6000, 1, 6000, 1, 1, '96185985', 'pending', 'yemi@yahoo.com'),
(40, 16, 18, '2023-07-07 15:13:47', '', 6000, 1, 6000, 1, 1, '571880', 'pending', 'yemi@yahoo.com'),
(41, 16, 18, '2023-07-07 15:24:59', '', 12000, 2, 6000, 1, 1, '28819502', 'pending', 'yemi@yahoo.com'),
(42, 16, 18, '2023-07-07 15:25:19', '', 6000, 1, 6000, 1, 1, '82975816', 'pending', 'yemi@yahoo.com'),
(43, 16, 18, '2023-07-07 15:25:49', '', 6000, 1, 6000, 1, 1, '84182408', 'pending', 'yemi@yahoo.com'),
(44, 16, 18, '2023-07-07 15:26:19', '', 12000, 2, 6000, 1, 1, '39033306', 'pending', 'yemi@yahoo.com'),
(45, 16, 19, '2023-07-07 15:48:56', '', 10000, 1, 10000, 1, 1, '60748092', 'pending', 'yemi@yahoo.com'),
(46, 16, 18, '2023-07-07 18:01:36', 'hhh', 6000, 1, 6000, 7, 1, '45189526', 'pending', 'yemi@yahoo.com'),
(47, 16, 18, '2023-07-07 19:02:10', 'Aguata', 6000, 1, 6000, 4, 71, '78250340', 'pending', 'yemi@yahoo.com'),
(48, 16, 18, '2023-07-08 17:28:04', 'Bauchi', 6000, 1, 6000, 5, 92, '23873061', 'pending', 'yemi@yahoo.com'),
(49, 16, 18, '2023-07-08 17:30:47', 'Akko', 6000, 1, 6000, 15, 275, '17936147', 'pending', 'yemi@yahoo.com'),
(50, 16, 18, '2023-07-08 17:33:47', 'Ahiazu', 12000, 2, 6000, 16, 286, '19840070', 'pending', 'yemi@yahoo.com'),
(51, 16, 18, '2023-07-08 17:34:34', 'Abakalilki', 12000, 2, 6000, 11, 212, '29538244', 'pending', 'yemi@yahoo.com'),
(52, 25, 18, '2023-07-10 13:54:28', 'Aguata', 12000, 2, 6000, 4, 71, '16474042', 'pending', 'goodheart9693@gmail.com'),
(53, 16, 19, '2023-07-13 10:08:03', 'Auyu road', 20000, 2, 10000, 17, 312, '65766186', 'pending', 'yemi@yahoo.com'),
(54, 26, 19, '2023-07-13 10:34:22', '2, Birnin Kaduna', 10000, 1, 10000, 18, 340, '48569310', 'pending', 'bala@gmail.com'),
(55, 26, 28, '2023-07-13 10:36:07', 'Auyu', 8000, 1, 8000, 17, 312, '27069487', 'pending', 'bala@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_userid` int(11) NOT NULL,
  `payment_orderid` int(11) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_status` tinyint(1) DEFAULT NULL,
  `pament_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_skintypeid` int(11) NOT NULL,
  `product_brand` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `product_desc` text DEFAULT NULL,
  `prod_cover` varchar(100) DEFAULT NULL,
  `product_slug` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_skintypeid`, `product_brand`, `product_name`, `product_price`, `product_desc`, `prod_cover`, `product_slug`) VALUES
(14, 3, 2, 'Neutrogena, Hydro Boost Water Gel', 5000, 'All skin types can benefit from Neutrogena Hydro Boost Water Gel, a powerfully hydrating gel. Hyaluronic acid and Trehalose are added to this product to assist plump the skin as well as lock in moisture. The oil-free formula and light, non-greasy texture of this water gel are guaranteed to leave the skin looking soft and velvety.', '72948.81940751175.png', NULL),
(18, 2, 2, 'Neutrogena, Hydro Boost Water Gel', 6000, 'fxfg', '568117.2475149912.png', 'neutrogena-hydro-boost-water-gel'),
(19, 2, 3, 'Eucerin hydro boost', 10000, 'Good for the oil skin', '795095.2232940466.jpg', 'eucerin-hydro-boost'),
(21, 1, 4, 'Cetaphil Face And Body Gentle Skin Cleanser For All Skin Types', 8000, 'CETAPHIL Gentle Skin Cleanser is a creamy, non-foaming daily cleanser for all skin types, ideal for dry, sensitive skin. This gentle yet effective face wash cleans deep to remove dirt, makeup and impurities without over-drying or stripping the skin, helping to maintain the skin\'s natural pH balance.', '20381.437042177542.png', 'cetaphil-face-and-body-gentle-skin-cleanser-for-all-skin-types'),
(25, 5, 3, 'Eucerin Sun Spray SPF 50+ Sensitive Skin 200 Ml	Sensitive Skin', 11000, 'Eucerin Sun Sensitive Protect Sun Spray SPF50+ is a practical spray-on sunscreen lotion that soothes and protects sensitive skin while reducing the risk of long-term skin damage. The Advanced Spectral Technology combines broadband and photostable UVA and UVB filters, for very high UV protection, with Licochalcone A, to neutralize free radicals caused by UV and HEVIS light. The formula also includes Glycyrrhetinic Acid, which supports the skin’s own DNA repair mechanism. Unperfumed and extra water-resistant, this product is clinically and dermatologically proven to be suitable for very sensitive skin, including skin with atopic dermatitis. The spray-on applicator allows for practical application and re-application on the go.', '946379.9916603648.jpeg', 'eucerin-sun-spray-spf-50-sensitive-skin-200-ml-sensitive-skin'),
(26, 2, 9, 'Cerave Foaming Cleanser For Normal To Oily Skin 236ml', 5000, 'Cerave Foaming Cleanser helps to retain the skin\'s natural moisture.Developed with dermatologists, CeraVe SA Smoothing Cleanser for Rough & Bumpy Skin has a unique formula that exfoliates and moisturises, while helping to protect the skin\'s natural barrier. Salicylic Acid gently exfoliates, for smoother and softer skin in just 3 days.', '821824.5405381535.jpg', 'cerave-foaming-cleanser-for-normal-to-oily-skin-236ml'),
(27, 3, 9, 'Cerave SA Smoothing Cleanser For Dry Rough Skin', 4000, 'Cerave SA Smoothing Cleanser For Dry Rough Skin was developed with dermatologists, the rich formula of the CeraVe SA Smoothing Cleanser gently exfoliates the skin with Salicylic Acid, to smooth dry rough & bumpy skin. It contains 3 essential ceramides to help protect the skin\'s natural barrier. Hyaluronic Acid helps to retain the skin\'s natural moisture.Developed with dermatologists, CeraVe SA Smoothing Cleanser for Rough & Bumpy Skin has a unique formula that exfoliates and moisturises, while helping to protect the skin\'s natural barrier. Salicylic Acid gently exfoliates, for smoother and softer skin in just 3 days.', '944224.576341688.jpg', 'cerave-sa-smoothing-cleanser-for-dry-rough-skin'),
(28, 1, 4, 'Cetaphil PRO DermaControl Foam Wash 8 oz', 8000, 'Cetaphil PRO DermaControl Foam Wash  was specially formulated to leave oily and acne-prone skin feeling fresh and clean, Cetaphil Dermacontrol Foam Wash removes excess surface oil and dirt in one step. This foaming cleanser contains Zinc technology to help skin look and feel less greasy and shiny. Gentle enough to use daily and with prescription acne treatments, the cleanser also helps maintain the healthy pH balance of the skin.', '48088.75631287091.jpg', 'cetaphil-pro-dermacontrol-foam-wash-8-oz'),
(29, 3, 4, 'Cetaphil Moisturising Cream Dry To Very Dry Sensitive Skin', 11000, 'Cetaphil Moisturizing CreamYou’ll love the long-lasting moisture that extra-strength softening and hydrating ingredients in this cream give to very dry skin..\r\nBenefits\r\nMoisture Lock technology to improve skin hydration from Day 1Intense moisturization and protection for 24 hoursImmediately absorbed and leaves the skin feeling smooth, soft and protectedGentle enough to care, powerful enough to support repairing the skinQuick-absorbing, rich, non-greasyNon-irritating, fragrance-free, non-comedogenicHow to Use\r\nApply liberally as often as needed or as directed by physician. Best results are obtained when it is used directly after bathing, wetting the skin or washing hands.', '653763.0283427311.jpg', 'cetaphil-moisturising-cream-dry-to-very-dry-sensitive-skin'),
(30, 5, 10, 'Bioderma Photoderm Max 100 SPF Fluid For Sensitive Skin 40ml', 15000, 'Guarantees optimum UVA/UVB protection against the harmful effects of the sun (sunburn, sun intolerance, etc.)\r\nActivates the skin\'s natural defences, protects from risks of cellular damage and combats premature cutaneous ageing.', '833572.4439529085.jpg', 'bioderma-photoderm-max-100-spf-fluid-for-sensitive-skin-40ml'),
(31, 1, 2, 'Neutrogena Ultra Sheer Dry Touch Sunblock 118ml', 4000, 'Neutrogena Ultra Sheer Dry-Touch Sunblock with SPF 50+ sunscreen for men and women\r\nBroad-spectrum SPF 50+ protection against the UVA UVB rays\r\nDermatologist Tested, Oil-free and the Non-Comedogenic\r\nUltra-Light with a non-shiny finish leaves  skin Soft & Smooth\r\nSuitable for all the skin types (oily, dry, normal)\r\nWaterproof & also Sweatproof\r\nit is Weightless Matte finish Sunscreen', '561631.4682072182.jpg', 'neutrogena-ultra-sheer-dry-touch-sunblock-118ml'),
(32, 1, 9, 'Cerave Moisturizing Face & Body Cream, 439g/19 Oz Normal-Dry Skin', 16000, 'Help restore your skin\'s protective barrier with CeraVe Moisturizing Cream, Face and Body Moisturizer for normal to dry skin. It\'s made with a unique formula that contains three essential ceramides and hyaluronic acid to help retain your skin\'s natural moisture. This 19-oz CeraVe moisturizing cream is non-irritating and provides 24 hours of hydration. It will not clog your pores and is non-greasy for easy application. Developed with dermatologists, this CeraVe moisturizer for normal to dry skin is also safe for sensitive skin. MVE technology: Ensures moisturizing ingredients are delivered to the skin slowly over time, lasting long after you apply it Hyaluronic Acid: Helps retain skin\'s natural moisture Ceramides: Help restore and maintain its natural protective barrier. Accepted by the National Eczema Association. CeraVe moisturizer for dry skin is suitable for sensitive skin.', '300576.29577668954.jpg', 'cerave-moisturizing-face-body-cream-439g-19-oz-normal-dry-skin');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `rev_id` int(11) NOT NULL,
  `rev_userid` int(11) NOT NULL,
  `rev_text` varchar(255) NOT NULL,
  `rev_title` varchar(255) NOT NULL,
  `rev_date` datetime DEFAULT NULL,
  `rev_productid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`rev_id`, `rev_userid`, `rev_text`, `rev_title`, `rev_date`, `rev_productid`) VALUES
(1, 16, 'The product is such a nice one', 'Neutrogena, Hydro Boost Water Gel', '2023-07-07 14:22:25', 18),
(2, 16, 'The product is such a nice one', 'Neutrogena, Hydro Boost Water Gel', '2023-07-07 14:24:36', 18),
(3, 16, 'It makes my skin glow so well', 'Neutrogena, Hydro Boost Water Gel', '2023-07-07 15:36:57', 18);

-- --------------------------------------------------------

--
-- Table structure for table `skintype`
--

CREATE TABLE `skintype` (
  `skintype_id` int(11) NOT NULL,
  `skintype_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skintype`
--

INSERT INTO `skintype` (`skintype_id`, `skintype_name`) VALUES
(1, 'Normal Skin'),
(2, 'Oil Skin'),
(3, 'Dry Skin'),
(4, 'Combination Skin'),
(5, 'Sensitive Skin');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Abia'),
(2, 'Adamawa'),
(3, 'Akwa Ibom'),
(4, 'Anambra'),
(5, 'Bauchi'),
(6, 'Bayelsa'),
(7, 'Benue'),
(8, 'Borno'),
(9, 'Cross River'),
(10, 'Delta'),
(11, 'Ebonyi'),
(12, 'Edo'),
(13, 'Ekiti'),
(14, 'Enugu'),
(15, 'Gombe'),
(16, 'Imo'),
(17, 'Jigawa'),
(18, 'Kaduna'),
(19, 'Kano'),
(20, 'Katsina'),
(21, 'Kebbi'),
(22, 'Kogi'),
(23, 'Kwara'),
(24, 'Lagos'),
(25, 'Nassarawa'),
(26, 'Niger'),
(27, 'Ogun'),
(28, 'Ondo'),
(29, 'Osun'),
(30, 'Oyo'),
(31, 'Plateau'),
(32, 'Rivers'),
(33, 'Sokoto'),
(34, 'Taraba'),
(35, 'Yobe'),
(36, 'Zamfara'),
(37, 'Abuje (FCT)'),
(38, 'Foreign');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_skintype_id` int(11) NOT NULL,
  `user_fullname` varchar(100) NOT NULL,
  `user_email` varchar(120) DEFAULT NULL,
  `user_pwd` varchar(120) DEFAULT NULL,
  `user_pix` varchar(120) DEFAULT NULL,
  `user_datereg` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_skintype_id`, `user_fullname`, `user_email`, `user_pwd`, `user_pix`, `user_datereg`) VALUES
(3, 3, 'Oluwatoyosi Ayomide', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$V0zWc07Py5or4dg3$2ae0c82b93969f4f140221c2b66909d9354db8a6d804427c0ae15fb8b6b1a0ea', NULL, '2023-06-22 15:24:27'),
(4, 3, 'Oluwatoyosi Ayomide', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$H2Ce83XWfGX7aFY5$0ade3bd4c68ba9f93b7e9c35fc7bf7d3d3e46cea18d96fc6179fe8f9b63ed58f', NULL, '2023-06-22 15:24:29'),
(6, 2, 'Jonathan Akpobasa', 'jonathan97@gmail.com', 'pbkdf2:sha256:600000$QJyAH7Ugnw5RgiRH$bded7b0deaf8c2ff86fafbb7e32d6b37d7f5578ebd89b7ec89071b1d735a752c', NULL, '2023-06-23 00:28:27'),
(7, 2, 'Yemi Rax', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$ujDPagY8V2uOYYXm$ba14ac6f917fa557db7ac49fac01e70a16ab78e3c9d8c13ad9e2e2537e6edaef', NULL, '2023-06-24 13:08:46'),
(8, 2, 'Yemi Rax', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$8L5yuXoEvZraShSC$7ef6407f1ea8927ccd368c369cf4b1bb33ac4075b5d825f73e37d250008a36c6', NULL, '2023-06-24 13:08:46'),
(9, 2, 'Yemi Rax', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$JS6AvD5KBHSb3oWi$497c3b9e118468f1145105a73d3139bcb2e4d83090857e967ec2fca590d1ed5b', NULL, '2023-06-24 13:08:48'),
(10, 2, 'Yemi Rax', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$8xW1jTDw0KVuRUzh$e376053b8cdc2fcf6d1fcddc0cb6278eeb33c540e59c06a7feb0d695e199cfb5', NULL, '2023-06-24 13:08:48'),
(11, 2, 'Yemi Rax', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$UApPpA2sXXnhjARz$7ef0433a8d2987c9f422d2f917c0c18e6ff5a49d9a2c295a112d0017759c6545', NULL, '2023-06-24 13:08:49'),
(12, 2, 'Yemi Rax', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$elROByH2gVNeAixS$d050d0ebadea462427fd6c085cd0f835939483cb21ff54ed5de2d755d4171a3f', NULL, '2023-06-24 13:08:49'),
(13, 2, 'Yemi Rax', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$chTtMptiV8rfSopd$a3d00e3485b5661fa56f5f9e82b0d50353b05848af5ef20e15bb84c45d913811', NULL, '2023-06-24 13:13:42'),
(14, 2, 'Yemi Rax', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$fWRH2PdSo6IsxVVR$a5cf6ed0b68408cceb674b55370cf07096b5910b89d1a25a9690bea57993b0da', NULL, '2023-06-24 13:13:42'),
(15, 1, 'Oluwatoyosi Ayomide', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$l9r9F6GrMqumvWBe$8d66b6ec67ecf4c08e79b60de972abc1c10379e106aba63782f6f6de9e33e537', NULL, '2023-06-24 13:28:30'),
(16, 2, 'Yemi Rax', 'yemi@yahoo.com', 'pbkdf2:sha256:600000$yF5riMi5pBMiJIzX$0795a9ad4fc73719d456e5caf1e4c8e7d227c21d6c210b68882b898c42cc23ce', 'pix1.jpg', '2023-06-24 13:30:20'),
(17, 2, 'Yemi Rax', 'yemi@yahoo.com', 'pbkdf2:sha256:600000$n28uopQ3KGJ9gfB7$17dd19bcbd7cfd133c9f2d2714fe9392fd63fbc43924fd83105ec092d3d0930e', NULL, '2023-06-24 13:31:19'),
(18, 2, 'Oluwatoyosi Ayomide', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$D0SSAawdsTcGuqWv$7961686fbb695ac9f05a6090c26f7038964fb983f3b7df1b7ac307a41d5c82e3', NULL, '2023-06-24 13:47:59'),
(19, 2, 'Oluwatoyosi Ayomide', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$Q2Y3uxWvtWRShI42$13ec97b288182fb21c4bc6310786fcc349799250410dcee39865310c5c5456d5', NULL, '2023-06-24 13:48:50'),
(20, 2, 'Oluwatoyosi Ayomide', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$bI4P9QfcJGsom3Go$261a6b01ec316909f9ef7ac8a3f9fa079b345e0e1da1978fead93240f8f3b5ba', 'pix1.jpg', '2023-06-24 13:48:50'),
(21, 4, 'Yemi Rax', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$qk6oRcJQuCrb3frP$58390365c28f4e844a151807329460cec607ec8076eb7433014554067f04ea42', NULL, '2023-06-24 13:57:32'),
(22, 1, 'Bolutife Oreniyi', 'bolutife@gmail.com', 'pbkdf2:sha256:600000$L4wIHP2lk9r6Yop9$4935796e8a29b6c8074dc4f60100893b1a24ac8232259a173df61e56d3ed61be', 'pix1.jpg', '2023-06-25 11:58:32'),
(23, 2, 'Jonathan Akpobasa', 'jonathanakpobasa@gmail.com', 'pbkdf2:sha256:600000$DEycJXo4WGVcXhYs$a1f5e3adae91f4afa3da194b2dd0ce88e48ab839503c181c12662e19bb2f8a29', 'mdo.jpg', '2023-06-29 12:56:19'),
(24, 1, 'Toyosi ayomide', 'ayomideh97@gmail.com', 'pbkdf2:sha256:600000$l6LejBLY3kOCf5rg$d8505dc4c1a6ef8d3b4d512a3ff56aec263674b016d0b2cb01fcbff7d78e3b2c', NULL, '2023-07-07 11:49:38'),
(25, 3, 'Tosin Olatunji', 'goodheart9693@gmail.com', 'pbkdf2:sha256:600000$h5yHAtwc0Y0FBsJv$d8a7c2cf71bfa4d0bbc320b1299d04b920c003f7bc65ba49f5dcc2a14b4a01e6', 'image3.jpg', '2023-07-10 13:51:38'),
(26, 2, 'George Bala', 'bala@gmail.com', 'pbkdf2:sha256:600000$QXQPTXFpxTCPWE0r$99aa11c8d15da6e29358042b53896755166568ae3e44a7e4f1e8128848625c59', 'pix11.png', '2023-07-13 10:32:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `lga`
--
ALTER TABLE `lga`
  ADD PRIMARY KEY (`lga_id`),
  ADD KEY `lga_stateid` (`lga_stateid`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_productid` (`order_productid`),
  ADD KEY `order_userid` (`order_userid`),
  ADD KEY `order_lga_id` (`order_lga_id`),
  ADD KEY `order_state_id` (`order_state_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_orderid` (`payment_orderid`),
  ADD KEY `payment_userid` (`payment_userid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_slug` (`product_slug`),
  ADD KEY `product_brand` (`product_brand`),
  ADD KEY `product_skintypeid` (`product_skintypeid`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`rev_id`),
  ADD KEY `rev_productid` (`rev_productid`),
  ADD KEY `rev_userid` (`rev_userid`);

--
-- Indexes for table `skintype`
--
ALTER TABLE `skintype`
  ADD PRIMARY KEY (`skintype_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_skintype_id` (`user_skintype_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lga`
--
ALTER TABLE `lga`
  MODIFY `lga_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=789;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `rev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `skintype`
--
ALTER TABLE `skintype`
  MODIFY `skintype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lga`
--
ALTER TABLE `lga`
  ADD CONSTRAINT `lga_ibfk_1` FOREIGN KEY (`lga_stateid`) REFERENCES `state` (`state_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`order_productid`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`order_userid`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`order_lga_id`) REFERENCES `lga` (`lga_id`),
  ADD CONSTRAINT `order_ibfk_5` FOREIGN KEY (`order_state_id`) REFERENCES `state` (`state_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`payment_orderid`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`payment_userid`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_brand`) REFERENCES `brand` (`brand_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`product_skintypeid`) REFERENCES `skintype` (`skintype_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`rev_productid`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`rev_userid`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_skintype_id`) REFERENCES `skintype` (`skintype_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
