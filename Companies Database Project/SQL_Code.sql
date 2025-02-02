/*
*********************************************************************
http://www.mysqltutorial.org
*********************************************************************
Name: MySQL Sample Database classicmodels
Link: http://www.mysqltutorial.org/mysql-sample-database.aspx
Version 3.0
+ changed DATETIME to DATE for some colunmns
Version 2.0
+ changed table type to InnoDB
+ added foreign keys for all tables 
*********************************************************************
*/

/*
*********************************************************************
http://www.mysqltutorial.org
*********************************************************************
Name: MySQL Sample Database classicmodels
Link: http://www.mysqltutorial.org/mysql-sample-database.aspx
Version 3.0
+ changed DATETIME to DATE for some colunmns
Version 2.0
+ changed table type to InnoDB
+ added foreign keys for all tables 
*********************************************************************
*/

UNLOCK TABLES;

DROP SCHEMA IF EXISTS final_project;

CREATE SCHEMA final_project ;

USE final_project;

-- ----------------------------------------------------------------------

/*Table structure for table `territory` */

DROP TABLE IF EXISTS `territory`;

CREATE TABLE `territory` (
  `territory_id` int(11) NOT NULL auto_increment,
  `territory_name` varchar(50) NOT NULL,
  PRIMARY KEY (`territory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `territory` */

LOCK TABLES `territory` WRITE;

insert  into `territory`(`territory_name`) 
VALUES
('All other states'),
('CO, NM, TX'),
('CA'),
('IL, OH, IN'),
('AR, OK, TN'),
('IA, WI, MN'),
('MO, KS, NE')
;

UNLOCK TABLES;

-- ----------------------------------------------------------------------
/*Table structure for table `sales_rep` */

DROP TABLE IF EXISTS `sales_rep`;

CREATE TABLE `sales_rep` (
  `sales_rep_id` int(11) NOT NULL auto_increment,
  `sales_rep_lname` varchar(50) NOT NULL,
  `sales_rep_fname` varchar(50) NOT NULL,
  PRIMARY KEY (`sales_rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sales_rep` */

LOCK TABLES `sales_rep` WRITE;

insert  into `sales_rep`(`sales_rep_lname`, `sales_rep_fname`) 
VALUES
('Boyce', 'Raymond'),
('Bachman', 'Charles'),
('Chen', 'Peter'),
('Codd', 'Edgar'),
('Ellison', 'Larry'),
('Lovelace', 'Ida'),
('Tuple', 'Al')
;

UNLOCK TABLES;


-- ----------------------------------------------------------------------

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL auto_increment, -- primary key hidden from users
  `customer_number` int(11), -- id supplied in the data provided
  `customer_name` varchar(50) NOT NULL,
  `sales_rep_id` int(11),
  `bill_to_ship_address` BOOLEAN DEFAULT 0,
  PRIMARY KEY (`customer_id`),
  KEY `sales_rep_id` (`sales_rep_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`sales_rep_id`) REFERENCES `sales_rep` (`sales_rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customers` */

LOCK TABLES `customers` WRITE;

insert  into `customers`(`customer_number`, `customer_name`,`sales_rep_id`,`bill_to_ship_address`) 

VALUES
(1122,'Bill & Teds PC repair',3,0),
(1375,"Heston's 10 commands",7,0),
(1376, "Kelsos northtown",7,0),
(1835,"PC Loco",7,0),
(3724,"Databases 'R Us",7,0),
(2298,"Pyramid PC",7,0),
(2376,"Big Freds Mac emporium",7,0),
(1876,"Macs welcome here",7,0),
(2374,"PC master race",7,0),
(1313,"Pulcinella PC",2,0),
(1214,"Abo's workshop",7,0),
(1275,"Cosmic Computer",7,1),
(12,"Avantis Commodore",4,0),
(1728,"Gullivers traveling techs",4,0),
(1818,"Bits & Bytes",4,0),
(1276,"Alma PC connection",5,0),
(1456,"US PC",5,0),
(1568,"Walton Computers",4,0),
(1513,"Algiers applications",6,0),
(1,"Brickhouse Computers",6,0),
(2,"Hometown Help",6,0),
(3,"Michaels Dell Emporium",6,0)
;

UNLOCK TABLES;

-- ----------------------------------------------------------------------



/*Table structure for table `sales_rep_territory` */

DROP TABLE IF EXISTS `sales_rep_territory`;

CREATE TABLE `sales_rep_territory` (
  `sales_rep_id` int(11) NOT NULL,
  `territory_id` int(11) NOT NULL,
  PRIMARY KEY (`sales_rep_id`,`territory_id`),
  KEY `sales_rep_id` (`sales_rep_id`),
  KEY `territory_id` (`territory_id`),
  CONSTRAINT `sales_rep_territory_ibfk_2` FOREIGN KEY (`sales_rep_id`) REFERENCES `sales_rep` (`sales_rep_id`),
  CONSTRAINT `sales_rep_territory_ibfk_1` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`territory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sales_rep_territory` */

LOCK TABLES `sales_rep_territory` WRITE;

insert  into `sales_rep_territory`(`sales_rep_id`, `territory_id`) 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

UNLOCK TABLES;

-- ----------------------------------------------------------------------

/*Table structure for table `titles` */

DROP TABLE IF EXISTS `titles`;

CREATE TABLE `titles` (
  `title_id` int(11) NOT NULL auto_increment,
  `sales_rep_id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  PRIMARY KEY (`title_id`),
  KEY `sales_rep_id` (`sales_rep_id`),
  CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`sales_rep_id`) REFERENCES `sales_rep` (`sales_rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `titles` */

LOCK TABLES `titles` WRITE;

insert  into `titles`(`sales_rep_id`, `title`) 
VALUES
(1, 'VP of Sales'),
(2, 'Salesman'),
(3, 'Salesman'),
(4, 'Salesman'),
(5, 'Salesman'),
(6, 'Saleswoman'),
(7, 'Salesman')
;

UNLOCK TABLES;


-- ----------------------------------------------------------------------


/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL auto_increment,
  `product_desc` varchar(70) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `products` */

LOCK TABLES `products` WRITE;

insert  into `products`(`product_id`, `product_desc`, `unit_price`) 
VALUES
(1, '`ups`', 0),
(2,'usps',2),
(112, '5 1/4 floppy disks', .75),
(113, '3 1/2 disks', 1.25),
(221, 'Phone support hourly', 75.00),
(222, 'Phone support (family) hourly', 225),
(337, 'User encouragement device (electric)', 74.00),
(338, 'User encouragement device - club style (black)', 52.00),
(339, 'user encourangement device - club style (red)', 60.00),
(443, 'Really fine user manual', 327.00),
(445, 'Motivational poster (framed)', 17.50),
(1007, 'User Tolerance Assistance', 3.14)
;

UNLOCK TABLES;

-- ----------------------------------------------------------------------


/*Table structure for table `discounts` */

DROP TABLE IF EXISTS `discounts`;

CREATE TABLE `discounts` (
  `discount_id` int(11) NOT NULL auto_increment,
  `discount_type` varchar(60) NOT NULL,
  `discount_ratio` decimal(3,2) NOT NULL,
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `discounts` */

LOCK TABLES `discounts` WRITE;

insert  into `discounts`(`discount_id`, `discount_type`, `discount_ratio`) 
VALUES
(1, '10% discount for qty over 25,000', 0.90),
(2, 'free shipping',0.00);

UNLOCK TABLES;


-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `ship_method`;

CREATE TABLE `ship_method` (
  `ship_method_id` int(11) NOT NULL auto_increment,
  `ship_method_terms` varchar(20) NOT NULL,
  `ship_method_ratio` decimal(3,2) NOT NULL,
  PRIMARY KEY (`ship_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ship_method` */

LOCK TABLES `ship_method` WRITE;

insert  into `ship_method`(`ship_method_id`, `ship_method_terms`,`ship_method_ratio`) 
VALUES
(1,'FOB Shipping Point','1'),
(2,'FOB Destination Point','1.02');

UNLOCK TABLES;

-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS `sales_rep_contact`;

CREATE TABLE `sales_rep_contact` (
  `sales_rep_contact_id` int(11) NOT NULL auto_increment,
  `sales_rep_id` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(15) NOT NULL,
  `zip` varchar(15) NOT NULL,
  
  PRIMARY KEY (`sales_rep_contact_id`),
  KEY `sales_rep_id` (`sales_rep_id`),
  CONSTRAINT `sales_rep_contact_ibfk_1` FOREIGN KEY (`sales_rep_id`) REFERENCES `sales_rep` (`sales_rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sales_rep_contact` */

LOCK TABLES `sales_rep_contact` WRITE;

insert  into `sales_rep_contact`(`sales_rep_id`, `phone`, `address`, `city`, `state`,`zip`) 
VALUES
(1, '816-099-3120', '1 Arrowhead Drive', 'Kansas City', 'MO',64129),
(2, '720-020-2583', '1701 Bryant Street', 'Denver', 'CO', 80204),
(3, '213-003-7427', '1111 South Fibueroa St', 'LA', 'CA',90015),
(4, '773-001-1918', '1060 West Addison', 'Chicago', 'IL',60613),
(5, '615-000-0000', 'Opryland Drive', 'Nashville', 'TN',37214),
(6, '920-020-3232', '1265 Lombardi Avenue', 'Green Bay', 'WI',NULL),
(7, '913-012-3344', '321 Pine St', 'Lawrence', 'KS',66044);

UNLOCK TABLES;

-- ----------------------------------------------------------------------


DROP TABLE IF EXISTS `customer_address`;

CREATE TABLE `customer_address` (
  `address_id` int(11) NOT NULL auto_increment,
  `address` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(15) NOT NULL,
  `zip` varchar(15) NOT NULL,
  `is_main_address` BOOLEAN DEFAULT 0,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_address` */

LOCK TABLES `customer_address` WRITE;

insert  into `customer_address`(`address`, `city`, `state`, `zip`, `is_main_address`) 
VALUES
('775 Normal Lane', 'Relational', 'KS', 66110,1),
( '237 Boyce Avenue', 'Codd', 'KS', 67444,0)
;

UNLOCK TABLES;


-- ----------------------------------------------------------------------


DROP TABLE IF EXISTS `customer_contact`;

CREATE TABLE `customer_contact` (
  `customer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `contact_phone` varchar(20),
  `contact_name` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`,`address_id`),
  KEY `customer_id` (`customer_id`),
  KEY `address_id` (`customer_id`),
  CONSTRAINT `customer_contact_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
   CONSTRAINT `customer_contact_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `customer_address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_address` */

LOCK TABLES `customer_contact` WRITE;

insert  into `customer_contact`(`customer_id`,`address_id`, `contact_phone`, `contact_name`) 
VALUES
(5,1, '913-999-8877','mary parsons'),
(5,2, '913-787-0000',	'DBA (larry)');

UNLOCK TABLES;
-- -----------------------------------------------------------------------

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL auto_increment,
  `payment_due` date NOT NULL,
  `delivery_date` date,
  `payment_terms` varchar(30),
  `customer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `ship_method_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `address_id` (`address_id`),
  KEY `ship_method_id` (`ship_method_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `customer_address` (`address_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`ship_method_id`) REFERENCES `ship_method` (`ship_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

LOCK TABLES `orders` WRITE;

insert  into `orders`(`payment_due`, `delivery_date`, `payment_terms`, `customer_id`, `address_id`, `ship_method_id`) 
VALUES
('2020-12-18','2020-11-30','net30',5,2,1)
;

UNLOCK TABLES;

-- ----------------------------------------------------------------------


/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `order_detail_id` int(11) NOT NULL auto_increment,
  `quantity` int(11) NOT NULL,
  `is_discount_approved` BOOLEAN DEFAULT 0,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `discount_id` int(11),
  PRIMARY KEY (`order_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `discount_id` (`discount_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `order_details` */

LOCK TABLES `order_details` WRITE;

insert  into `order_details`( `order_id`, `quantity`, `product_id`,`is_discount_approved`,`unit_price`, `discount_id`) 
VALUES
(1,23,443,0,327,NULL),
(1,4,337,0,74,NULL),
(1,44000,1007,1,3.14,1),
(1,1,1,0,0,NULL)
;
UNLOCK TABLES;

-- ----------------------------------------------------------------------
#Query to return customer name, salesperson and order total.

SELECT 
	orders.order_id,
    customers.customer_name, 
    customers.customer_number,
    
    CONCAT(sales_rep.sales_rep_lname, ', ', sales_rep.sales_rep_fname) AS sales_rep, 
    CASE 
		WHEN customers.bill_to_ship_address=1 THEN CONCAT(customer_address.address, ', ',city,' ',state, ', ', zip) 
        ELSE (SELECT CONCAT(customer_address.address, ', ',city,' ',state, ', ', zip) 
				FROM customer_address
                LEFT JOIN customer_contact on customer_address.address_id=customer_contact.address_id
                JOIN customers on customer_contact.customer_id=customers.customer_id
                WHERE customer_address.is_main_address=1 AND customer_address.address_id=customer_contact.address_id)END AS billing_address,
	CASE 
		WHEN customers.bill_to_ship_address=1 THEN customer_contact.contact_phone #when bill to shipping adress, phone same as ship phone
        ELSE (SELECT customer_contact.contact_phone 
				FROM customer_address
                LEFT JOIN customer_contact on customer_address.address_id=customer_contact.address_id
                JOIN customers on customer_contact.customer_id=customers.customer_id
                WHERE customer_address.is_main_address=1 AND customer_address.address_id=customer_contact.address_id)END AS billing_phone,

	orders.payment_due,
    CONCAT(sales_rep.sales_rep_lname,', ',sales_rep.sales_rep_fname) AS sales_rep_name,
    orders.payment_terms,
    
    customer_contact.contact_name as recipient_name,
    CONCAT(customer_address.address, ', ',city,' ',state, ', ', zip) AS ship_address,
    customer_contact.contact_phone AS shipping_phone,
    orders.delivery_date,
    ship_method.ship_method_terms,
    FORMAT(SUM(order_details.quantity * products.unit_price * 
		(CASE 
			WHEN order_details.is_discount_approved=1 THEN discounts.discount_ratio 
            ELSE 1 END))
		*ship_method.ship_method_ratio,2) AS order_total
FROM orders
    JOIN customers ON orders.customer_id = customers.customer_id
    JOIN order_details ON orders.order_id = order_details.order_id
    JOIN products ON order_details.product_id = products.product_id
    JOIN sales_rep ON customers.sales_rep_id = sales_rep.sales_rep_id
    JOIN customer_address ON orders.address_id = customer_address.address_id
    LEFT JOIN customer_contact ON customer_address.address_id=customer_contact.address_id -- check joining on customer_address
    LEFT JOIN discounts ON order_details.discount_id = discounts.discount_id
    JOIN ship_method ON orders.ship_method_id = ship_method.ship_method_id
;




SELECT 
	order_details.order_id,
	order_details.quantity,
    order_details.product_id,
    products.product_desc,
    order_details.quantity,
    order_details.unit_price,
    (CASE 
		WHEN order_details.is_discount_approved=1 THEN discounts.discount_type ELSE 0 END) AS discount,
	FORMAT(order_details.quantity * order_details.unit_price * 
		(CASE 
			WHEN order_details.is_discount_approved=1 THEN discounts.discount_ratio 
			ELSE 1 END),2) AS line_total
	
FROM order_details
    JOIN orders ON order_details.order_id= orders.order_id
    JOIN products ON order_details.product_id = products.product_id
    LEFT JOIN discounts ON order_details.discount_id = discounts.discount_id
ORDER BY order_details.order_id
;



