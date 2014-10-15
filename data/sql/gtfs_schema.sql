SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gtfs`
-- adapted from gtfs-mysql
-- https://github.com/mauryquijada/gtfs-mysql
--

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
CREATE TABLE `agency` (
  `id` INT(8) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `agency_id` VARCHAR(100),
  `agency_name` VARCHAR(255) NOT NULL,
  `agency_url` VARCHAR(255) NOT NULL,
  `agency_timezone` VARCHAR(100) NOT NULL,
  `agency_lang` VARCHAR(100),
  `agency_phone` VARCHAR(100),
  `agency_fare_url` VARCHAR(100)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calendar_dates`
--

DROP TABLE IF EXISTS `calendar_dates`;
CREATE TABLE `calendar_dates` (
    id INT(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    service_id VARCHAR(255) NOT NULL,
    `date` VARCHAR(8) NOT NULL,
    exception_type TINYINT(2) NOT NULL,
    KEY `service_id` (service_id),
    KEY `exception_type` (exception_type)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar` (
    id INT(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    service_id VARCHAR(255) NOT NULL,
    monday TINYINT(1) NOT NULL,
    tuesday TINYINT(1) NOT NULL,
    wednesday TINYINT(1) NOT NULL,
    thursday TINYINT(1) NOT NULL,
    friday TINYINT(1) NOT NULL,
    saturday TINYINT(1) NOT NULL,
    sunday TINYINT(1) NOT NULL,
    start_date VARCHAR(8) NOT NULL,
    end_date VARCHAR(8) NOT NULL,
    KEY `service_id` (service_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fare_attributes`
--

DROP TABLE IF EXISTS `fare_attributes`;
CREATE TABLE `fare_attributes` (
    id INT(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fare_id VARCHAR(100),
    price VARCHAR(50) NOT NULL,
    currency_type VARCHAR(50) NOT NULL,
    payment_method TINYINT(1) NOT NULL,
    transfers TINYINT(1) NOT NULL,
    transfer_duration VARCHAR(10),
    exception_type TINYINT(2) NOT NULL,
    agency_id INT(100),
    KEY `fare_id` (fare_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fare_rules`
--

DROP TABLE IF EXISTS `fare_rules`;
CREATE TABLE `fare_rules` (
    id INT(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fare_id VARCHAR(100),
    route_id VARCHAR(100),
    origin_id VARCHAR(100),
    destination_id VARCHAR(100),
    contains_id VARCHAR(100),
    KEY `fare_id` (fare_id),
    KEY `route_id` (route_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feed_info`
--

DROP TABLE IF EXISTS `feed_info`;
CREATE TABLE `feed_info` (
    id INT(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    feed_publisher_name VARCHAR(100),
    feed_publisher_url VARCHAR(255) NOT NULL,
    feed_lang VARCHAR(255) NOT NULL,
    feed_start_date VARCHAR(8),
    feed_end_date VARCHAR(8),
    feed_version VARCHAR(100)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frequencies`
--

DROP TABLE IF EXISTS `frequencies`;
CREATE TABLE `frequencies` (
    id INT(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    trip_id VARCHAR(100) NOT NULL,
    start_time VARCHAR(8) NOT NULL,
    end_time VARCHAR(8) NOT NULL,
    headway_secs VARCHAR(100) NOT NULL,
    exact_times TINYINT(1),
    KEY `trip_id` (trip_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
CREATE TABLE `routes` (
    id INT(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    route_id VARCHAR(100),
    agency_id VARCHAR(50),
    route_short_name VARCHAR(50) NOT NULL,
    route_long_name VARCHAR(255) NOT NULL,
    route_type VARCHAR(2) NOT NULL,
    route_text_color VARCHAR(255),
    route_color VARCHAR(255),
    route_url VARCHAR(255),
    route_desc VARCHAR(255),
    KEY `agency_id` (agency_id),
    KEY `route_type` (route_type)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shapes`
--

DROP TABLE IF EXISTS `shapes`;
CREATE TABLE `shapes` (
    id INT(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    shape_id VARCHAR(100) NOT NULL,
    shape_pt_lat DECIMAL(8,6) NOT NULL,
    shape_pt_lon DECIMAL(8,6) NOT NULL,
    shape_pt_sequence TINYINT(3) NOT NULL,
    shape_dist_traveled VARCHAR(50),
    KEY `shape_id` (shape_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stop_times`
--

DROP TABLE IF EXISTS `stop_times`;
CREATE TABLE `stop_times` (
    id INT(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    trip_id VARCHAR(100) NOT NULL,
    arrival_time VARCHAR(8) NOT NULL,
    arrival_time_seconds INT(100),
    departure_time VARCHAR(8) NOT NULL,
    departure_time_seconds INT(100),
    stop_id VARCHAR(100) NOT NULL,
    stop_sequence VARCHAR(100) NOT NULL,
    stop_headsign VARCHAR(50),
    pickup_type VARCHAR(2),
    drop_off_type VARCHAR(2),
    shape_dist_traveled VARCHAR(50),
    KEY `trip_id` (trip_id),
    KEY `arrival_time_seconds` (arrival_time_seconds),
    KEY `departure_time_seconds` (departure_time_seconds),
    KEY `stop_id` (stop_id),
    KEY `stop_sequence` (stop_sequence),
    KEY `pickup_type` (pickup_type),
    KEY `drop_off_type` (drop_off_type)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stops`
--

DROP TABLE IF EXISTS `stops`;
CREATE TABLE `stops` (
    id INT(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    stop_id VARCHAR(255),
    stop_code VARCHAR(50),
    stop_name VARCHAR(255) NOT NULL,
    stop_desc VARCHAR(255),
    stop_lat DECIMAL(10,6) NOT NULL,
    stop_lon DECIMAL(10,6) NOT NULL,
    zone_id VARCHAR(255),
    stop_url VARCHAR(255),
    location_type VARCHAR(2),
    parent_station VARCHAR(100),
    stop_timezone VARCHAR(50),
    wheelchair_boarding TINYINT(1),
    KEY `zone_id` (zone_id),
    KEY `stop_lat` (stop_lat),
    KEY `stop_lon` (stop_lon),
    KEY `location_type` (location_type),
    KEY `parent_station` (parent_station)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
CREATE TABLE `transfers` (
    id INT(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    from_stop_id INT(100) NOT NULL,
    to_stop_id VARCHAR(8) NOT NULL,
    transfer_type TINYINT(1) NOT NULL,
    min_transfer_time VARCHAR(100)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
CREATE TABLE `trips` (
    id INT(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    route_id VARCHAR(100) NOT NULL,
    service_id VARCHAR(100) NOT NULL,
    trip_id VARCHAR(255),
    trip_headsign VARCHAR(255),
    trip_short_name VARCHAR(255),
    direction_id TINYINT(1), #0 for one direction, 1 for another.
    block_id VARCHAR(11),
    shape_id VARCHAR(11),
    wheelchair_accessible TINYINT(1), #0 for no information, 1 for at
    # least one rider accommodated on wheel chair, 2 for no riders
    # accommodated.
    bikes_allowed TINYINT(1), #0 for no information, 1 for at least
    # one bicycle accommodated, 2 for no bicycles accommodated
    KEY `route_id` (route_id),
    KEY `service_id` (service_id),
    KEY `direction_id` (direction_id),
    KEY `block_id` (block_id),
    KEY `shape_id` (shape_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
