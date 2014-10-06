DROP TABLE IF EXISTS `agency`;

CREATE TABLE `agency` (
    agency_id VARCHAR(100) NOT NULL PRIMARY KEY,
    transit_system VARCHAR(50) NOT NULL,
    agency_name VARCHAR(255) NOT NULL,
    agency_url VARCHAR(255) NOT NULL,
    agency_timezone VARCHAR(100) NOT NULL,
    agency_lang VARCHAR(100),
    agency_phone VARCHAR(100),
    agency_fare_url VARCHAR(100)
);

INSERT INTO `agency` (`agency_id`, `agency_name`, `agency_url`, `agency_timezone`, `agency_lang`, `agency_phone`)
VALUES
('NJB',"NJ TRANSIT BUS","http://www.njtransit.com/","America/New_York","en",""),
('NJT',"NJ TRANSIT RAIL","http://www.njtransit.com/","America/New_York","en","");
