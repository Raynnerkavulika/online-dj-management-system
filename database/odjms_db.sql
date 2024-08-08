-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2022 at 07:40 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `odjms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_list`
--

CREATE TABLE `booking_list` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `event_id` int(30) NOT NULL,
  `package_id` int(30) NOT NULL,
  `client_name` text NOT NULL,
  `client_contact` text NOT NULL,
  `client_address` text NOT NULL,
  `event_venue` text NOT NULL,
  `event_schedule` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_list`
--

INSERT INTO `booking_list` (`id`, `code`, `event_id`, `package_id`, `client_name`, `client_contact`, `client_address`, `event_venue`, `event_schedule`, `status`, `remarks`, `date_created`, `date_updated`) VALUES
(1, '202201-00001', 1, 1, 'Mark Cooper', '09123456789', 'Sample Address', 'Over There', '2022-02-01 17:00:00', 0, 'Sample other information only.', '2022-01-29 12:05:27', '2022-01-29 13:41:51'),
(2, '202201-00002', 2, 2, 'John D Smitn', '09456789123', 'Sample address2', 'Here', '2022-06-23 10:00:00', 0, 'Sample only', '2022-01-29 13:14:02', '2022-01-29 13:41:51'),
(3, '202201-00003', 4, 1, 'Claire Blake', '09784561236', 'Here City', 'There', '2022-02-04 22:00:00', 1, 'Test only', '2022-01-29 13:16:05', '2022-01-29 14:22:56'),
(4, '202201-00004', 3, 2, 'Mike Williams', '09123654987', 'Sample Address', 'In Our Company Building', '2022-01-28 09:00:00', 2, 'Sample', '2022-01-29 13:19:13', '2022-01-29 14:34:21'),
(6, '202201-00005', 3, 2, 'Samantha Lou', '089654654', 'Test', 'There', '2022-01-13 16:34:00', 3, '54564', '2022-01-29 14:35:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_list`
--

CREATE TABLE `event_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_list`
--

INSERT INTO `event_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Community Party', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vehicula urna nec mauris faucibus semper. Ut in ligula vitae risus lobortis tempor et sit amet purus. Aliquam risus ligula, commodo eu tincidunt eu, blandit ac ligula. Praesent iaculis vulputate felis, ut rhoncus tortor efficitur vel. Maecenas vel dapibus ligula. Proin tristique mi turpis, eu elementum felis faucibus quis. Curabitur consectetur dolor non sodales eleifend. Sed malesuada neque libero, non egestas diam suscipit nec. Nulla ut feugiat quam.', 1, 0, '2022-01-28 16:30:23', NULL),
(2, 'Wedding', 'Donec consectetur vulputate nibh ac hendrerit. Phasellus non dui pharetra, scelerisque enim vitae, efficitur dui. Vestibulum consectetur sed tortor eget consequat. Cras accumsan mi ut congue feugiat. Duis quis dui ac neque fringilla scelerisque eu at leo. Maecenas in finibus sem. Vivamus feugiat magna massa, et ornare tellus egestas at. Donec lorem leo, eleifend id pretium quis, dapibus sed urna. Praesent id nisi vitae odio iaculis rhoncus vel at sem.', 1, 0, '2022-01-28 16:31:12', NULL),
(3, 'Small Event ', 'Sed mattis vulputate massa, sit amet dignissim ipsum auctor sit amet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras eget sollicitudin nisi. Nam semper aliquam sapien, a imperdiet justo fermentum dapibus. Cras ut urna eget nisl posuere porta. Aenean id ultricies erat. Donec aliquam ante quis enim dapibus, sit amet varius enim porta. Donec sed ipsum in lectus pretium congue a vitae dolor. Vestibulum rutrum bibendum ex ut auctor. Donec nec eros at nisi ultrices porta sit amet iaculis dui.', 1, 0, '2022-01-28 16:31:33', NULL),
(4, 'Concert', 'Mauris laoreet, augue in mattis laoreet, massa massa scelerisque massa, vitae porttitor ex purus vel quam. Sed cursus nisi metus, commodo sollicitudin eros malesuada vehicula. Aenean faucibus enim consequat augue porttitor pulvinar vel eu magna. Proin eget elit in risus ullamcorper pretium. Aenean diam nisi, porta in magna id, faucibus luctus mauris. Pellentesque hendrerit neque nec dignissim tristique. Vivamus eu arcu interdum, elementum nunc sed, ultrices lorem. Pellentesque molestie pharetra ex. Donec sodales, justo vitae aliquet pretium, libero urna cursus ipsum, in facilisis justo lorem a leo. Sed at blandit enim. Nunc mollis tincidunt metus sed sollicitudin. Vivamus tincidunt a sem vitae auctor. Mauris imperdiet porta turpis, ut mattis mi tempus sit amet.', 1, 0, '2022-01-28 16:31:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message_list`
--

CREATE TABLE `message_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message_list`
--

INSERT INTO `message_list` (`id`, `fullname`, `contact`, `email`, `message`, `status`, `date_created`) VALUES
(1, 'Mark Cooper', '09456123789', 'mcooper@sample.com', 'Sample Inquiry only', 1, '2022-01-06 09:13:14'),
(2, 'Mark Cooper', '09123456789', 'mcopper@sample.com', 'Sample Inquiry only.', 0, '2022-01-29 14:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `package_list`
--

CREATE TABLE `package_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package_list`
--

INSERT INTO `package_list` (`id`, `name`, `description`, `price`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Package 101', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum finibus lacus at eros porta, et tristique ipsum hendrerit. Proin at lectus quis felis interdum tincidunt vel ut dui. Nunc in viverra quam. Phasellus ut magna a turpis ornare iaculis ut aliquam mi. Nulla facilisi. Sed ac erat vitae justo aliquam vehicula in quis ligula. Fusce fermentum diam elit, at sodales arcu scelerisque id.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Ut sed lacinia turpis, vitae hendrerit magna. Vivamus egestas tincidunt orci eu volutpat. Curabitur velit quam, tempor ac lorem ut, feugiat venenatis elit. Quisque molestie nunc eu gravida ultrices. Integer accumsan interdum aliquam. Morbi ut sem sed nisl luctus bibendum. Quisque sollicitudin elit id feugiat varius. Morbi dolor lorem, pellentesque quis tellus a, tristique pretium elit. Proin facilisis ante in urna sollicitudin, a rhoncus magna eleifend. Nulla eu finibus odio. Vestibulum efficitur velit et risus scelerisque tempus.</p>', 3500, 1, 0, '2022-01-29 09:27:30', NULL),
(2, 'Package 102', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Cras at nisi et sem fermentum iaculis. Nulla quis metus et dolor feugiat placerat. Duis ornare justo non quam suscipit cursus. Integer erat dui, viverra quis metus sed, ullamcorper dignissim sem. Donec libero nulla, tempor hendrerit aliquam vel, porta placerat orci. Sed pharetra placerat volutpat. Pellentesque pharetra orci vitae varius faucibus. Donec ultrices tincidunt nulla ac condimentum. Nullam vel purus pulvinar, ornare nisl sit amet, aliquam quam. Vivamus molestie nisl mauris, et consequat nunc convallis vitae. Duis vel sollicitudin dolor.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Pellentesque vitae sem eu libero commodo semper et ullamcorper diam. Maecenas ornare dui ligula, quis gravida nisi ultrices id. Nunc eu lorem non purus luctus molestie. Aliquam rhoncus tellus nec mi pretium pellentesque. Aliquam egestas dolor vitae justo sodales, vel euismod neque eleifend. Vestibulum gravida risus quis orci cursus lacinia. Nullam ut mollis tellus, maximus varius nisi. Duis fringilla massa vestibulum dapibus lacinia. Morbi rutrum porta augue eu congue. Curabitur erat neque, dignissim sit amet finibus a, dignissim id turpis. Mauris non libero pellentesque, laoreet sem nec, aliquet diam. Morbi aliquam lorem at massa fermentum, ut convallis nisl laoreet. Cras vehicula tempus sem, in consectetur est pulvinar et.&lt;/p&gt;', 5500, 1, 0, '2022-01-29 09:29:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Online DJ Management System - PHP'),
(6, 'short_name', 'ODJMS- PHP'),
(11, 'logo', 'uploads/logo-1643357473.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1643357141.png'),
(15, 'content', 'Array'),
(16, 'email', 'info@xyzsoundsytem.com'),
(17, 'contact', '09854698789 / 78945632'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', 'XYZ Street, There City, Here, 2306');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '123', 'uploads/avatar-1.png?v=1639468007', NULL, 1, 1, '2021-01-20 14:02:37', '2021-12-14 15:47:08'),
(4, 'Smantha', NULL, 'Lou', 'slou', '123', 'uploads/avatar-4.png?v=1641346647', NULL, 2, 1, '2022-01-05 09:36:56', '2022-01-05 09:37:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `event_list`
--
ALTER TABLE `event_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_list`
--
ALTER TABLE `message_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_list`
--
ALTER TABLE `package_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_list`
--
ALTER TABLE `booking_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `event_list`
--
ALTER TABLE `event_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `message_list`
--
ALTER TABLE `message_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package_list`
--
ALTER TABLE `package_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD CONSTRAINT `booking_list_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_list_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
