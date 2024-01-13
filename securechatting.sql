-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2024 at 05:37 PM
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
-- Database: `securechatting`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `fromid` int(11) NOT NULL,
  `toid` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imagechat`
--

CREATE TABLE `imagechat` (
  `id` int(11) NOT NULL,
  `fromid` int(11) NOT NULL,
  `toid` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `textchat`
--

CREATE TABLE `textchat` (
  `id` int(11) NOT NULL,
  `fromid` int(11) NOT NULL,
  `toid` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `message` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `textchat`
--

INSERT INTO `textchat` (`id`, `fromid`, `toid`, `time`, `message`) VALUES
(4, 12, 13, '2024-01-04 14:36:27', 0xa7c85dad8ef47c54c770fe0f1398524ad491399bcd29fb2a92474a3c9f912f224943a859c7bec43ca7842cd16ebcfc06d45ce3f8d67e37912de27f957320a3f5ac5afdc47678728cbb7811ae2b61509940f628a3793a9550303a119e2714ff5b6345fe3ef91707c5c92b4fa774aabc193b7641d2cab36fbc0b572be3fb0a92cc),
(6, 13, 12, '2024-01-04 16:14:50', 0x1cad0f895db72ac3a7acc6b7ec80c83a19ac4f92af3cdd5fd134fd40081497c74cbba20ad89b32ec5fa8ccffb6bb7d13a5c3408a7eaa6d9f4e60edf294fd173dd43453640c3d488770ed34ccb4488020597557268257920ec81da5bb0bb585ecc671a59b92c0b3f9728008ad9a3e73cb742f14d81e686718bccd1cacbc09657d),
(7, 12, 13, '2024-01-04 16:24:03', 0x35bc3f02a0e12b791df6bfbc5141fc7949634ee7ffe8744a4ff9f47c6783e1d137a7dec54706abbe78222dbb22ab4d8dba68089b84356074490c3a3343bbd47d3bfc80a8b88262f4adcb8593ff6c018b0dca79fcd2da44f731af424399a65e73c6efc091dc32b8802c5dcd2a46a823853b330694fb87a37a5f999825efcb25cc);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `photo` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `status` int(11) NOT NULL,
  `publickey` longtext NOT NULL,
  `privatekey` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `mobile`, `password`, `gender`, `dob`, `photo`, `address`, `status`, `publickey`, `privatekey`) VALUES
(12, 'Shailesh Dinde', 'shdinde@gmail.com', '8888763564', 'e10adc3949ba59abbe56e057f20f883e', 'Male', '2024-01-01', 'avatar5.png', 'Kolhapur', 1, '-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCljPMs5W7w4fGIS8TXmvGFnnR+\n8CmUhY6KLXxpRwCd1SSyGzlyVTU+TmHhFDnReQCpSu0NaSrDrr5ehLPjSmeUZCNu\n1Vki69r9GrSM35fIq7eAwklsFu2HGjUfZeLbdIQ436tapp6Hihc9H/Y29B7DbnK2\n76UReV6w9zSK/+Wq8QIDAQAB\n-----END PUBLIC KEY-----\n', '-----BEGIN PRIVATE KEY-----\nMIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAKWM8yzlbvDh8YhL\nxNea8YWedH7wKZSFjootfGlHAJ3VJLIbOXJVNT5OYeEUOdF5AKlK7Q1pKsOuvl6E\ns+NKZ5RkI27VWSLr2v0atIzfl8irt4DCSWwW7YcaNR9l4tt0hDjfq1qmnoeKFz0f\n9jb0HsNucrbvpRF5XrD3NIr/5arxAgMBAAECgYAop4p4Ngeeg/3qeKDoSZaSN61o\nFtY/MOUmLbFlsRgHqnYOfv0GhMJEgL8spOjl9g8hg9Le/jqQP3NkhrYeVQFGXHdO\ntBnZP03oYfwNTIsH01nx0fD90+GpXFtXbSLNA1pRCgjDS+rwJzR6AMEQ5dTO45/P\nlIXe6hixcaI7PiLCIQJBANZiWS9VZ3Oi3U6tzw24rWCwn1sG0eDj5s2hiyyaU87O\n3UTyNF1HbS5PGf6Z1WkAsQgN1tlJDWbtopO2BYFBdIUCQQDFr9rmLD2hZhlfWIta\n0lf8hAvgKzky9bklFdNFDPEKqXw9MiU5z8z8nmk6EAj+SRqBZGkqJ+o9hdZkdCsT\ndo59AkBeTiMHRF1eq80IWELVuWBjQS7IXwaiE/6qhB5xv22QcsU5GAZa5hmsHlXD\n/q23I/u8HEJfkNgZZ/11VsOzKTT1AkBbZDNU2fscFLGCLNMwB7J5oSpEVnc5IfSY\nOoDTmWoOPdCcEgS3t2PTHgETwLoHpRBF5X/g51cZXjiBdFs9wj+ZAkAB2meoT6iU\nmkC3j1jNZ53Mi9CUzRCZNaFCx9Ft8sZBIubGxBCRsQ6RZFy+1HyJ3aKH2en7BHcn\nNPI4LERv6Zet\n-----END PRIVATE KEY-----\n'),
(13, 'Amit Patil', 'punekaramit4@gmail.com', '8888763560', '7f125dd8c17fc02ab20338fbcf27abfe', 'Male', '1994-01-04', 'avatar5.png', 'Kolhapur', 1, '-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDXGwDNx3qJAe9/yK+C/4RbWT3+\nlg0ALBr+NKxKypYPs9uDuovWynmV1R0zOFllNIANk57BL9F0kr53Vedro1m7MBbO\nbVZ9yoKYTea02SBEwH7TJgk6F/ombGRoHRxnC36jfVD66OafbjwKhvkqIGOn7+/w\nm6BBF7l/HmMMy5IjwwIDAQAB\n-----END PUBLIC KEY-----\n', '-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANcbAM3HeokB73/I\nr4L/hFtZPf6WDQAsGv40rErKlg+z24O6i9bKeZXVHTM4WWU0gA2TnsEv0XSSvndV\n52ujWbswFs5tVn3KgphN5rTZIETAftMmCToX+iZsZGgdHGcLfqN9UPro5p9uPAqG\n+SogY6fv7/CboEEXuX8eYwzLkiPDAgMBAAECgYAB9ncdaZKOqXvb+KLRWS+F/dx4\n9DmOJNjiNOzVid+wqP15yDv6a8KMQXOQwhTevYnlldE/BgatP6GJSTlhXA43iMCK\nGcvqImOdy/P/nc+NAMYcvV808Qs95IVrFLstC8sPYVuVp2d7yvIcdDQPEjNRiOwg\nYSGQ6GnbJJZ5ivG68QJBAPkMDNi9EExZJJv3jZRRGm5NujoJYYNFPs0X6zTzHguM\nt3Xfud+5e9PVR7rXChOE6/xga88YiQGAr/i8ztzNQG0CQQDdHF75n3NbKjqDyapY\n26jl1bGLRetPRulvpbOjjmkeuOlIGX1m3rau/bT2uR/wcvfICkCfLPJQ+Mj2uQWs\nTDbvAkBfAKHF7BlTho3YkU6IzYdvnGb1zK5ODRQv2Hf48uT7MuqpJHcbSP5biHic\nZXuKhqIe3AlELu/UiuqV0DB5OjLhAkBo14IFNOD60jwqrx3Rwl4ElN35nu6jiYk4\ngkZ6gBVCFwWuRT/b3jCbKvt6nW8SkUECHjJkB2jikgSgUDzrZLwLAkEA3blIUWQ1\nHvmBgM4DvSWNAKvdB75snh+xeoyiUn9mJy38Xu4AcHoz5n4XnNQNMaOPYsCpTbN+\n4A9hTYprsIoH6g==\n-----END PRIVATE KEY-----\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid5` (`fromid`),
  ADD KEY `userid6` (`toid`);

--
-- Indexes for table `imagechat`
--
ALTER TABLE `imagechat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `image` (`image`),
  ADD KEY `userid3` (`fromid`),
  ADD KEY `userid4` (`toid`);

--
-- Indexes for table `textchat`
--
ALTER TABLE `textchat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid1` (`fromid`),
  ADD KEY `userid2` (`toid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imagechat`
--
ALTER TABLE `imagechat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `textchat`
--
ALTER TABLE `textchat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `userid5` FOREIGN KEY (`fromid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `userid6` FOREIGN KEY (`toid`) REFERENCES `user` (`id`);

--
-- Constraints for table `imagechat`
--
ALTER TABLE `imagechat`
  ADD CONSTRAINT `userid3` FOREIGN KEY (`fromid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `userid4` FOREIGN KEY (`toid`) REFERENCES `user` (`id`);

--
-- Constraints for table `textchat`
--
ALTER TABLE `textchat`
  ADD CONSTRAINT `userid1` FOREIGN KEY (`fromid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `userid2` FOREIGN KEY (`toid`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
