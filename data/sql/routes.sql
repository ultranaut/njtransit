DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
  route_id VARCHAR(32) NOT NULL PRIMARY KEY,
  agency_id VARCHAR(50),
  route_short_name VARCHAR(50) NOT NULL,
  route_long_name VARCHAR(255) NOT NULL,
  route_type TINYINT(2) UNSIGNED NOT NULL,
  route_url VARCHAR(255),
  route_color VARCHAR(255),
  KEY `agency_id` (agency_id),
  KEY `route_type` (route_type)
);

INSERT INTO `route` (`route_id`, `agency_id`, `route_short_name`, `route_long_name`, `route_type`, `route_url`, `route_color`) VALUES
(1,  "NJT", "", "Atlantic City Rail Line", 2, "", ""),
(2,  "NJT", "", "Montclair-Boonton Line", 2, "", ""),
(3,  "NJT", "", "Montclair-Boonton Line", 2, "", ""),
(4,  "NJT", "", "Hudson-Bergen Light Rail", 0, "", ""),
(5,  "NJT", "", "Main/Bergen County Line", 2, "", ""),
(6,  "NJT", "", "Port Jervis Line", 2, "", ""),
(7,  "NJT", "", "Morris & Essex Line", 2, "", ""),
(8,  "NJT", "", "Gladstone Branch", 2, "", ""),
(9,  "NJT", "", "Northeast Corridor", 2, "", ""),
(10, "NJT", "", "North Jersey Coast Line", 2, "", ""),
(11, "NJT", "", "North Jersey Coast Line", 2, "", ""),
(12, "NJT", "", "Newark Light Rail", 0, "", ""),
(13, "NJT", "", "Pascack Valley Line", 2, "", ""),
(14, "NJT", "", "Princeton Shuttle", 2, "", ""),
(15, "NJT", "", "Raritan Valley Line", 2, "", ""),
(16, "NJT", "", "Riverline Light Rail", 0, "", ""),
(17, "NJT", "", "Meadowlands Rail Line", 2, "", "");
