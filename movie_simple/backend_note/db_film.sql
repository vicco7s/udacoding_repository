-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 24, 2020 at 05:33 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_film`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_fav`
--

CREATE TABLE `tb_fav` (
  `id` int(11) NOT NULL,
  `email` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_movie`
--

CREATE TABLE `tb_movie` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `rating` double NOT NULL,
  `year` int(7) NOT NULL,
  `genre` varchar(125) NOT NULL,
  `detail` text NOT NULL,
  `ytube` varchar(225) NOT NULL,
  `foto` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_movie`
--

INSERT INTO `tb_movie` (`id`, `title`, `country`, `duration`, `rating`, `year`, `genre`, `detail`, `ytube`, `foto`) VALUES
(1, 'One Piece : Stampade', 'Jepan', '1h 41m', 9.7, 2019, 'Adventure,Action', 'One Piece: Stampede ( Jepang : ワ ン ピ ー ス ス タ ン ピ ー ド , Hepburn : Wan Pīsu Sutanpīdo ) adalah film petualangan aksi fantasi animasi Jepang 2019 yang disutradarai oleh Takashi Otsuka dan diproduksi oleh Toei Animation . Ini adalah film fitur keempat belas dari seri film One Piece , berdasarkan manga dengan nama yang sama yang ditulis dan diilustrasikan oleh Eiichiro Oda , dan memperingati ulang tahun ke-20 anime tersebut. [8] Oda terlibat dalam film sebagai Pengawas Kreatif. [9] Film ini ditayangkan perdana di dunia di Osaka Station City Cinema di Osaka pada 1 Agustus 2019, dan kemudian dirilis di Jepang pada 9 Agustus 2019.', 'https://www.youtube.com/watch?v=vIZAj25z40c', 'https://cdn.idntimes.com/content-images/community/2019/10/mv5bmjnlzdiwyzuty2uwns00nja4lweyyjetywqyzmzjmzu3mwe1xkeyxkfqcgdeqxvyndqxnjcxnq-at-at-v1-sy1000-cr007061000-al-6147a973a9cd5f79f322abc0bd13e2e0_600x400.jpg'),
(2, 'Gundala Movie', 'Indonesia', '2h 3m', 9.37, 2019, 'Laga,Drama,Adventure,Movie SuperHero,Fiksi ilmiah', 'Gundala is a 2019 Indonesian superhero film based on the comics character Gundala created by Harya “Hasmi” Suraminata in 1969, co-produced by Screenplay Films and BumiLangit Studios, and distributed by Legacy Pictures. It is the first installment in the BumiLangit Cinematic Universe (BCU).[5] The film is directed and written by Joko Anwar, and stars Abimana Aryasatya as Sancaka / Gundala, alongside Tara Basro, Bront Palarae, Ario Bayu, Cecep Arif Rahman, Rio Dewanto, and Muzakki Ramdhan.[6] The first official news about the film was announced on April 4, 2018 on social media accounts of its director and production houses.[7] At Indonesia Comic Con on October 28, 2018, a press conference was held to introduce the main casts and the first look at video of the film with a release date set around mid 2019.[8] Filming has been done in September throughout October 2018.[9] Gundala had its local premiere on August 28, 2019, and released in Indonesia on August 29, 2019.[10] It had its International premiere at the 2019 Toronto International Film Festival on September 11, 2019.[2][11] The film received positive reviews from audience and critics with praise for Abimana\'s performance, Anwar\'s direction, visual effects, costume design and originality.', 'https://www.youtube.com/watch?v=WLM9ty5GzaI', 'https://m.media-amazon.com/images/M/MV5BYjk5MWVlMWUtZmJlYi00ZGQ0LWJkZDItOGViZjdhOTI4YWE5XkEyXkFqcGdeQXVyNDA1NDA2NTk@._V1_.jpg'),
(3, 'Janin (Fetus)', 'Indonesia', '1 j 25 m', 8.3, 2020, 'horor, Menegangkan', 'Randu dan Dinar, pasangan baru belum lama menikah. Keduanya sedang terlihat bahagia karena Dinar mengandung buah cinta mereka yang telah masuk bulan ke empat masa kehamilan. Namun kebahagiaan mereka perlahan menghilang saat seorang ibu paruh baya yang bernama Sukma menjadi tetangga baru mereka.', 'https://www.youtube.com/watch?v=I8bxIjEIiAc', 'https://cdn.cgv.id/uploads/movie/pictures/19045200.jpg'),
(4, 'Mangkujiwo', 'Indonesia', '1h 46m', 8.7, 2020, 'Drama, Seru', 'Setelah disingkirkan dari jabatannya di Keraton oleh Cokrokusumo, Brotoseno berniat membalas dendam. Brotoseno mengajak seorang perempuan bernama Kanti yang juga dipenuhi kebencian kepada Cokrokusumo.', 'https://www.youtube.com/watch?v=Yx0vzt0PufI', 'https://cdn0-production-images-kly.akamaized.net/DCDll1L3_nE65tuARxpFwjS9mpI=/640x853/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3040313/original/042902700_1580785826-Poster_Mangkujiwo.jpg'),
(5, 'The Last: Naruto the Movie', 'Jepan', '1h 52m', 7.3, 2014, 'Action,Animation', 'wo years after the Fourth Shinobi World War, Naruto must stop Toneri Otsutsuki, a descendant of Hamura Otsutsuki, after Toneri causes the moon to descend toward Earth.', 'https://www.youtube.com/watch?v=cNyhXbSSypI', 'https://upload.wikimedia.org/wikipedia/id/0/0c/TheLastNarutomovie.jpg'),
(6, 'Milea: Suara dari Dilan', 'Indonesia', '1 j 42 m', 6.1, 2020, 'Roman,Drama', 'Tidak ada kisah yang lebih Indah dari kisah cinta di SMA.Sama halnya dengan kisah cinta Dilan dan Milea.Dari yang awalnya benci hingga saling mencintai. Dari yang awalnya manis hingga menjadi rumit.Menjelang reuni akbar,Dilan memutuskan untuk menceritakan kembali masa masa itu.', 'https://www.youtube.com/watch?v=4zVIcW7Baf4', 'https://cdn.cgv.id/uploads/movie/pictures/20000900.jpg'),
(7, 'Sonic the Hedgehog', 'USA', '1h 40m', 6.5, 2020, 'Family,Comedy', 'The world needed a hero -- it got a hedgehog. Powered with incredible speed, Sonic embraces his new home on Earth -- until he accidentally knocks out the power grid, sparking the attention of uncool evil genius Dr. Robotnik. Now, it\'s supervillain vs. supersonic in an all-out race across the globe to stop Robotnik from using Sonic\'s unique power to achieve world domination.', 'https://www.youtube.com/watch?v=SPNc_i86kpQ', 'https://upload.wikimedia.org/wikipedia/en/thumb/c/c1/Sonic_the_Hedgehog_poster.jpg/220px-Sonic_the_Hedgehog_poster.jpg'),
(8, 'Punyakoti', 'india', '1 j 25 m', 8.8, 2020, 'Animasi,Adventure', 'Punyakoti (transl. meritorious act), also released as A Truthful Mother, is a 2020 Indian Sanskrit-language animated film directed by Ravishankar Venkateswaran.[2][3][4] It is the first animated feature film in Sanskrit.[5]\r\n\r\nPunyakoti is an adaptation of a picture book for children written by Ravishankar,[6] was produced through crowdsourcing and it is the first Sanskrit animated film. The film got certificate from Central Board of Film Certification on 18 March 2020, but its theatrical release was halted due to Corona pandemic. Finally Samskrita Bharati premiered the film through online streaming platform Vimeo on 25 March 2020 and Netflix added the film to its platform on 31 March 2020.', 'https://www.youtube.com/watch?v=EnSo8QvC9_o', 'https://upload.wikimedia.org/wikipedia/en/f/f8/Punyakotiposter2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `email`, `password`) VALUES
(1, 'mamang', 'mamang@mail.com', '20eabe5d64b0e216796e834f52d61fd0b70332fc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_fav`
--
ALTER TABLE `tb_fav`
  ADD KEY `id` (`id`);

--
-- Indexes for table `tb_movie`
--
ALTER TABLE `tb_movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_movie`
--
ALTER TABLE `tb_movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_fav`
--
ALTER TABLE `tb_fav`
  ADD CONSTRAINT `tb_fav_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tb_movie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
