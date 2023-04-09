-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2020 at 11:35 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `full_name` varchar(55) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `full_name`, `username`, `password`, `phone`, `address`) VALUES
(12, 'علی علی زاده', 'ali', '$2y$10$cDCN2woVtZc8dAN6xAGEQON2bU5JKQrosaISsH8XYl3IYj3DdOInu', '0912000000', 'address of ali');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_products` smallint(6) NOT NULL,
  `total_price` varchar(25) NOT NULL,
  `date_time` varchar(25) NOT NULL,
  `payment_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `total_products`, `total_price`, `date_time`, `payment_status`) VALUES
(23, 12, 2, '220000', '2020-08-06 13:59:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_details`
--

CREATE TABLE `orders_details` (
  `details_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` varchar(25) NOT NULL,
  `order_quantity` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_details`
--

INSERT INTO `orders_details` (`details_id`, `order_id`, `customer_id`, `product_id`, `product_price`, `order_quantity`) VALUES
(44, 23, 12, 60, '100000', 1),
(45, 23, 12, 59, '120000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `reg_date` varchar(20) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `caption`, `description`, `price`, `quantity`, `reg_date`, `image_url`) VALUES
(59, 'ماوس گیمینگ', '<p>در این بخش&nbsp;<strong>سورس برنامه مشاور املاک به زبان سی شارپ</strong>&nbsp;را برای شما آماده کرده ایم که در محیط&nbsp;<a href=\"https://sourcesara.com/visual-studio-2017-programming-software/\" target=\"_blank\">نرم افزار Visual Studio</a>&nbsp;و&nbsp;<a href=\"https://sourcesara.com/category/programms/c-sharp/\" target=\"_blank\">زبان برنامه نویسی سی شارپ</a>&nbsp;نوشته شده است. در ادامه می توانید توضیحات، تصاویر و همچنین فیلمی از نحوه کارکرد پروژه را مشاهده کنید.</p>\r\n\r\n<h3>توضیحات پروژه</h3>\r\n\r\n<p>در این پروژه بعد از اجرا شدن برنامه پنجره مربوط به لاگین نمایش داده می شود که به صورت پیش فرض دو کاربر زیر تعریف شده اند و می توانید با اطلاعات آن ها وارد شوید.</p>\r\n\r\n<p><strong>کاربر اول</strong></p>\r\n\r\n<p>Username: irfa</p>\r\n\r\n<p>Password: 110</p>\r\n\r\n<p><strong>کاربر دوم</strong></p>\r\n\r\n<p>Username: sam</p>\r\n\r\n<p>Password: 763</p>\r\n\r\n<p>بعد از ورود به داخل پنجره اصلی برنامه امکانات برنامه قابل دسترس خواهند بود. در لیست امکانات موجود در این پروژه را مشاهده می کنید.</p>\r\n\r\n<ul>\r\n	<li><strong>بخش درخواست:</strong>&nbsp;در این بخش کاربر می تواند اطلاعات فروشندگان املاک را ثبت ، ویرایش و یا حذف کند.</li>\r\n	<li><strong>بخش لیست املاک:</strong>&nbsp;در این بخش کاربر می تواند املاک مود نیاز خریداران را جستجو و مشاهده نماید.</li>\r\n	<li><strong>بخش فروش، رهن و اجاره:</strong>&nbsp;در این بخش کاربر می تواند املاکی که به فروش رفته و یا رهن و اجاره داده شده را ثبت و یا از جدول مورد نظر حذف کند.</li>\r\n	<li><strong>بخش املاک فروخته شده:</strong>&nbsp;در این بخش کاربر می تواند لیست املاک فروخته شده و یا رهن و اجاره داده شده را با اطلاعات کامل مشاهده کند.</li>\r\n	<li><strong>بخش کاربران:</strong>&nbsp;در این بخش کاربر می تواند، کاربران مجاز به استفاده از برنامه را اضافه و یا حذف نماید.</li>\r\n	<li><strong>بخش راهنما:</strong>&nbsp;در این بخش کاربر می تواند اطلاعاتی در باره ی نرم افزار و برنامه نویس آن به دست آورد.</li>\r\n</ul>\r\n\r\n<p><strong>نکات:</strong></p>\r\n\r\n<ul>\r\n	<li>این پروژه با استفاده از Visual Studio 2010 نوشته شده است.</li>\r\n	<li>برای مدیریت داده ها از پایگاه داده Microsoft Access 2007 استفاه شده است.</li>\r\n</ul>\r\n', '120000', 0, '2020-08-06 14:00:16', 'http://127.0.0.1/shop/products/1.jpg'),
(60, 'کیبورد', '<p>در این بخش&nbsp;<strong>سورس برنامه مشاور املاک به زبان سی شارپ</strong>&nbsp;را برای شما آماده کرده ایم که در محیط&nbsp;<a href=\"https://sourcesara.com/visual-studio-2017-programming-software/\" target=\"_blank\">نرم افزار Visual Studio</a>&nbsp;و&nbsp;<a href=\"https://sourcesara.com/category/programms/c-sharp/\" target=\"_blank\">زبان برنامه نویسی سی شارپ</a>&nbsp;نوشته شده است. در ادامه می توانید توضیحات، تصاویر و همچنین فیلمی از نحوه کارکرد پروژه را مشاهده کنید.</p>\r\n\r\n<h3>توضیحات پروژه</h3>\r\n\r\n<p>در این پروژه بعد از اجرا شدن برنامه پنجره مربوط به لاگین نمایش داده می شود که به صورت پیش فرض دو کاربر زیر تعریف شده اند و می توانید با اطلاعات آن ها وارد شوید.</p>\r\n\r\n<p><strong>کاربر اول</strong></p>\r\n\r\n<p>Username: irfa</p>\r\n\r\n<p>Password: 110</p>\r\n\r\n<p><strong>کاربر دوم</strong></p>\r\n\r\n<p>Username: sam</p>\r\n\r\n<p>Password: 763</p>\r\n\r\n<p>بعد از ورود به داخل پنجره اصلی برنامه امکانات برنامه قابل دسترس خواهند بود. در لیست امکانات موجود در این پروژه را مشاهده می کنید.</p>\r\n\r\n<ul>\r\n	<li><strong>بخش درخواست:</strong>&nbsp;در این بخش کاربر می تواند اطلاعات فروشندگان املاک را ثبت ، ویرایش و یا حذف کند.</li>\r\n	<li><strong>بخش لیست املاک:</strong>&nbsp;در این بخش کاربر می تواند املاک مود نیاز خریداران را جستجو و مشاهده نماید.</li>\r\n	<li><strong>بخش فروش، رهن و اجاره:</strong>&nbsp;در این بخش کاربر می تواند املاکی که به فروش رفته و یا رهن و اجاره داده شده را ثبت و یا از جدول مورد نظر حذف کند.</li>\r\n	<li><strong>بخش املاک فروخته شده:</strong>&nbsp;در این بخش کاربر می تواند لیست املاک فروخته شده و یا رهن و اجاره داده شده را با اطلاعات کامل مشاهده کند.</li>\r\n	<li><strong>بخش کاربران:</strong>&nbsp;در این بخش کاربر می تواند، کاربران مجاز به استفاده از برنامه را اضافه و یا حذف نماید.</li>\r\n	<li><strong>بخش راهنما:</strong>&nbsp;در این بخش کاربر می تواند اطلاعاتی در باره ی نرم افزار و برنامه نویس آن به دست آورد.</li>\r\n</ul>\r\n\r\n<p><strong>نکات:</strong></p>\r\n\r\n<ul>\r\n	<li>این پروژه با استفاده از Visual Studio 2010 نوشته شده است.</li>\r\n	<li>برای مدیریت داده ها از پایگاه داده Microsoft Access 2007 استفاه شده است.</li>\r\n</ul>\r\n', '100000', 7, '2020-08-06 13:59:20', 'http://127.0.0.1/shop/products/3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `username`, `password`) VALUES
(18, 'مدیریت', 'admin', '$2y$10$77dCKou4RDlXfhaaYdmtQebZpeWVY9eEf7Frini1wjgRd9dh7d6O2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`details_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
