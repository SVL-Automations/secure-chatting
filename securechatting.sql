-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2024 at 07:45 PM
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

--
-- Dumping data for table `imagechat`
--

INSERT INTO `imagechat` (`id`, `fromid`, `toid`, `image`, `time`) VALUES
(6, 12, 13, 'Letter Head SVL_13-01-2024 20-31-16.jpg', '2024-01-13 15:01:16'),
(7, 12, 13, 'ap692633499596_wide-fac8117c3eadfde4db40aa679720d75651223362-1500x843_28-02-2024 20-10-26.jpg', '2024-02-28 14:40:26'),
(8, 12, 13, 'ap692633499596_wide-fac8117c3eadfde4db40aa679720d75651223362-1500x843_28-02-2024 20-13-07.jpg', '2024-02-28 14:43:07'),
(9, 12, 13, '1701189410351_28-02-2024 20-15-57.jpg', '2024-02-28 14:45:57');

-- --------------------------------------------------------

--
-- Table structure for table `textchat`
--

CREATE TABLE `textchat` (
  `id` int(11) NOT NULL,
  `fromid` int(11) NOT NULL,
  `toid` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `textchat`
--

INSERT INTO `textchat` (`id`, `fromid`, `toid`, `time`, `message`) VALUES
(12, 13, 12, '2024-01-13 13:20:04', 'NtEC/PCxIpD0iYbGL0dsBOtnxwh39KIqH7AssNY//iYxxtspN9XykKQzIIl9NbHqXMrM3csOu6PR8tTUB0f894hRr3si7wXEt+lRlA7LsBv4OVuu7PzmJhgLz1T2TMNfpsVAIop0XK53RMIn0eerOxEZ6myGxp5ihN91h8ebfxw='),
(13, 12, 13, '2024-01-13 14:31:07', 'e8/G75nIRQ6NiKFQ2ed/cEhNLNu/JYdFdI95yKl1j7fM0QLJ1wETrlaeQPVOof9TMqfrQO5ZkiDZCjQAZBEIi1kxfXLm02tyl8IjEV4hV7vD63oF/XWp46ZKeR6C50X8+E+JNOWzPDn7qR1BkokvKgfvtCngchf5bbms3jTOgnI='),
(14, 12, 14, '2024-01-13 17:40:22', 'miaa4St2Yrc7b9Ul1/5sPIw9N4HjIMHk3/WmRbgFUGHi2vv3JfEA4Rhtah85BvQwDfNjIrYn2w3KBSSvOa9kE5MlNYEcuCybqLYoGQ4U8QB1KUZsy+/x/x6IVCfyB3whtT9GYXm46/MuAnMcIQF2bEQzhJo6rijrAgHQ16h0jjQ='),
(15, 13, 12, '2024-03-14 18:39:21', 'bKZMsKy8G4xAC6a88hDFQuOVOBvrLL/yVSyWiWXmFrnGXdFgbxaN46OAf00A3KHZnCv/WVP+/6wgHmM1S0gX2bb1zeUvKllLnqcBK6II1yJ6dK1/q+Y2XJm+aCZh1hxBBfTnz+HhuxulBJZAp+FsrugdeRcUWk2+38IHjEJgGJ0=');

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
(13, 'Amit Patil', 'punekaramit4@gmail.com', '8888763560', '7f125dd8c17fc02ab20338fbcf27abfe', 'Male', '1994-01-04', 'avatar5.png', 'Kolhapur', 1, '-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDXGwDNx3qJAe9/yK+C/4RbWT3+\nlg0ALBr+NKxKypYPs9uDuovWynmV1R0zOFllNIANk57BL9F0kr53Vedro1m7MBbO\nbVZ9yoKYTea02SBEwH7TJgk6F/ombGRoHRxnC36jfVD66OafbjwKhvkqIGOn7+/w\nm6BBF7l/HmMMy5IjwwIDAQAB\n-----END PUBLIC KEY-----\n', '-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANcbAM3HeokB73/I\nr4L/hFtZPf6WDQAsGv40rErKlg+z24O6i9bKeZXVHTM4WWU0gA2TnsEv0XSSvndV\n52ujWbswFs5tVn3KgphN5rTZIETAftMmCToX+iZsZGgdHGcLfqN9UPro5p9uPAqG\n+SogY6fv7/CboEEXuX8eYwzLkiPDAgMBAAECgYAB9ncdaZKOqXvb+KLRWS+F/dx4\n9DmOJNjiNOzVid+wqP15yDv6a8KMQXOQwhTevYnlldE/BgatP6GJSTlhXA43iMCK\nGcvqImOdy/P/nc+NAMYcvV808Qs95IVrFLstC8sPYVuVp2d7yvIcdDQPEjNRiOwg\nYSGQ6GnbJJZ5ivG68QJBAPkMDNi9EExZJJv3jZRRGm5NujoJYYNFPs0X6zTzHguM\nt3Xfud+5e9PVR7rXChOE6/xga88YiQGAr/i8ztzNQG0CQQDdHF75n3NbKjqDyapY\n26jl1bGLRetPRulvpbOjjmkeuOlIGX1m3rau/bT2uR/wcvfICkCfLPJQ+Mj2uQWs\nTDbvAkBfAKHF7BlTho3YkU6IzYdvnGb1zK5ODRQv2Hf48uT7MuqpJHcbSP5biHic\nZXuKhqIe3AlELu/UiuqV0DB5OjLhAkBo14IFNOD60jwqrx3Rwl4ElN35nu6jiYk4\ngkZ6gBVCFwWuRT/b3jCbKvt6nW8SkUECHjJkB2jikgSgUDzrZLwLAkEA3blIUWQ1\nHvmBgM4DvSWNAKvdB75snh+xeoyiUn9mJy38Xu4AcHoz5n4XnNQNMaOPYsCpTbN+\n4A9hTYprsIoH6g==\n-----END PRIVATE KEY-----\n'),
(14, 'Ashu', 'shdinde+1@gmail.com', '8888763561', 'e668353bf1bffccca0a796a0338f798c', 'Female', '2024-01-02', 'avatar5.png', 'Kolhapur', 1, '-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDFwQ38kZMT8EGKRur4bsFTGn2o\njiQCBAbwc70e9kShM/9R6rQlj7KTcnv/arwOY8xT262RjpJ30/ERZRbSFgnr1Asr\ntAxBTd417ki6TTQYX2l4YklTA9AdNlOGtuNW2RHwreTMFrOCS09Kn3yxXKvciobQ\nLquxQTVfWt9e8U8+yQIDAQAB\n-----END PUBLIC KEY-----\n', '-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMXBDfyRkxPwQYpG\n6vhuwVMafaiOJAIEBvBzvR72RKEz/1HqtCWPspNye/9qvA5jzFPbrZGOknfT8RFl\nFtIWCevUCyu0DEFN3jXuSLpNNBhfaXhiSVMD0B02U4a241bZEfCt5MwWs4JLT0qf\nfLFcq9yKhtAuq7FBNV9a317xTz7JAgMBAAECgYBmjDs1i0QK5d8G1snIdJ65+pXJ\nD5Sqmu4CSPJ8mNZ0BePT1fL/O2ouPgMBK5dDmwr9PYDfZ2Ca1QRAsfxIi3cusn2r\naajAz+KvkltwRB8hYjOsamf1cqdmE7s4bHkdRYzxQOLpPWIFwigeFSTLKEs5lXAm\n0BHKMYT8yO6w8lf9gQJBAPfn6XJoxuZ1lRhgWt6qi+fQUQEvBV7BuvEVcow6Q+6W\nqXdXqIAph0jjFhFB8x6WIyQ+2yFUdc38OnPqK07E1vkCQQDMNfSui62+BC7uycrv\nTIPBwAShVOECtE1Kc/G21zDzlFk9fsnH0t2+UfWeHAHe6dT237mSbLDl7islvVUS\njYpRAkAeRdixGvBnBibN0j5mgIcTKNIrhdVvC9NLS2Ywj5DqGsXZCABQnkGh+fEg\n7F/G9WiXLYHO4SR9ofZ1Xzwoo0rpAkBbQqGef32dtXDj9fpjBua6530qPCxycPE5\nnKcg9vpBYMKg4NB8JJhEPYxupEWRwR4TVdgwv7Iuj0lpDDvAltCBAkEAqP5lTKAZ\nm8yAp5U8HwANvnkx5sZ+FNVhdqF05hE4lzJcNSRwGJKBVOZ9kXiZGl0laFlW8PSM\noGrbue5cjWLvcQ==\n-----END PRIVATE KEY-----\n');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `textchat`
--
ALTER TABLE `textchat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
