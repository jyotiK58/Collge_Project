-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2023 at 12:26 PM
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
-- Database: `bakehub`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(11) NOT NULL,
  `AdminName` varchar(45) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'Smriti', 7894561238, 'admin@gmail.com', '3e7bf1383bcdd338f3d837f3dc948f80', '2023-04-05 07:16:39'),
(2, 'Admin', 'Jyoti', 7894561238, 'admin@gmail.com', '3e7bf1383bcdd338f3d837f3dc948f80', '2023-04-06 07:16:39');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `ID` int(5) NOT NULL,
  `CategoryName` varchar(120) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`ID`, `CategoryName`, `CreationDate`) VALUES
(3, 'Red Velvet Cake', '2023-04-05 10:36:01'),
(4, 'Chocolate Cake', '2023-04-05 10:36:25'),
(5, 'Coffee Cake', '2023-04-05 10:36:35'),
(6, 'Cheese Cake', '2023-04-05 10:36:47'),
(7, 'Fruit Cake', '2023-04-05 10:43:13'),
(9, 'Doughnut', '2023-04-24 05:43:08'),
(10, 'Cupcake', '2023-05-06 16:36:16'),
(11, 'Nutella Cake', '2023-07-16 12:36:43'),
(12, 'Bundt Cake', '2023-07-16 12:36:43'),
(13, 'Cookies', '2023-07-16 12:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontact`
--

CREATE TABLE `tblcontact` (
  `ID` int(10) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `EnquiryDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `IsRead` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcontact`
--

INSERT INTO `tblcontact` (`ID`, `Name`, `Email`, `Message`, `EnquiryDate`, `IsRead`) VALUES
(1, 'Romeo', 'Romeo@gmail.com', 'cost of valentine cake', '2023-07-05 07:26:24', 1),
(2, 'Miri', 'Miri@gmail.com', 'Delivery charge after 11 a.m?', '2023-07-09 12:48:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbldiscount`
--

CREATE TABLE `tbldiscount` (
  `discount_id` int(10) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `discount` double NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `offer` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  `UserId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbldiscount`
--

INSERT INTO `tbldiscount` (`discount_id`, `coupon_code`, `discount`, `title`, `description`, `offer`, `image`, `is_used`, `UserId`) VALUES
(12, 'BAKEHUB', 30, 'Use Coupon Code BAKEHUB to get 30% off.', 'Save your money upto Rs 300 in special items', 'Flat discount 30%', '../itemimages/offerimage/64ba16537cac5.jpg', 1, 0),
(19, 'BAKEHUB', 0, '', '', '', '', 0, 17),
(20, 'MYFIRSTORDER ', 40, 'Get 40% Off on your first order', 'Use Coupon Code MYFIRSTORDER to get 40% Off on you first order. Hurry Up!!!', 'Flat discount 40%', '../itemimages/offerimage/64bbae6cea5b9.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblfood`
--

CREATE TABLE `tblfood` (
  `ID` int(10) NOT NULL,
  `CategoryName` varchar(120) DEFAULT NULL,
  `ItemName` varchar(120) DEFAULT NULL,
  `ItemPrice` varchar(120) DEFAULT NULL,
  `ItemDes` varchar(500) DEFAULT NULL,
  `Image` varchar(120) DEFAULT NULL,
  `ItemQty` varchar(120) DEFAULT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblfood`
--

INSERT INTO `tblfood` (`ID`, `CategoryName`, `ItemName`, `ItemPrice`, `ItemDes`, `Image`, `ItemQty`, `Weight`, `CreationDate`) VALUES
(1, 'Red Velvet Cake', ' Valentine Cake', '900', ' A romantic twist on the classic red velvet cake, shaped like a heart and adorned with cream cheese frosting.', '../itemimages/redvelvet/heart_shapedCake.jpg', '1 pcs', '500 gm', '2023-07-16 03:20:28'),
(2, 'Red Velvet Cake', ' Birthday Cake', '600', 'A macabre twist on the classic red velvet cake, featuring a rich, deep red color and a dripping \"bloody\" glaze, creating a spooky and delicious dessert for Halloween or horror-themed events.', '../itemimages/redvelvet/birthdayCake.jpg', '1 pcs', '500 gm', '2023-07-16 03:20:28'),
(3, 'Red Velvet Cake', 'Mirror Velvet Cake', '850', ' Moist red velvet cake with a glossy mirror-like glaz', '../itemimages/redvelvet/mirror_redvelvet.jpg', '1 pcs', '500 gm', '2023-07-16 03:20:28'),
(4, 'Red Velvet Cake', ' Peppermint Cake', '200', 'A delicious twist on the classic cake roll, featuring a soft and moist red velvet cake rolled with a creamy peppermint filling, and finished with a dusting of powdered sugar', '../itemimages/redvelvet/Peppermint.jpg', '1 pcs', '500 gm', '2023-07-16 03:20:28'),
(5, 'Red Velvet Cake', 'Oreo Velvet', '999', ' Red velvet and Oreo truly are a match made in heaven, From its tender red velvet Oreo cake layers to its Oreo cream cheese frosting, this cake  is sure to be a new favorite!!', '../itemimages/redvelvet/OreoCake .jpg', '1 pcs', '500 gm', '2023-07-16 03:20:28'),
(6, 'Red Velvet Cake', ' ExtraCheesy Cake', '1000', 'An extravagant red velvet cake layered with luscious cream filling, topped with a generous amount of whipped cream and beautifully adorned with decorative elements for an eye-catching and delicious dessert.', '../itemimages/redvelvet/Extra_cheesy.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(7, 'Chocolate Cake', ' Blackout Chocolate ', '700', ' This is the cake for chocolate lovers! Ultra moist chocolate cake, layers of cream cheese chocolate frosting, and an awesome chocolate chip + chocolate drizzle exterior.', '../itemimages/chocolate_cake/BlackoutChocolate.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(8, 'Chocolate Cake', ' Espresso Choco', '700', ' Moist chocolate cake with a delightful espresso twist, topped with smooth chocolate ganache', '../itemimages/chocolate_cake/ChocolateEspresso .jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(9, 'Chocolate Cake', 'Chocolate Fudge ', '700', ' A decadent and indulgent chocolate cake with a dense and moist texture, rich chocolate flavor, and a luscious fudge frosting. Perfect for chocolate lovers craving a deeply satisfying dessert', '../itemimages/chocolate_cake/ChocolateFudge.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(10, 'Chocolate Cake', ' Hazelnut Choco', '700', ' A delectable combination of chocolate and hazelnuts, featuring a moist and tender chocolate cake infused with the nutty flavor of hazelnuts, and finished with a creamy hazelnut frosting. A heavenly treat for hazelnut and chocolate enthusiasts', '../itemimages/chocolate_cake/ChocolateHazelnut.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(11, 'Chocolate Cake', ' Raspberry Choco', '700', ' A delightful combination of rich chocolate cake layers and a luscious raspberry filling. This cake offers a perfect balance of sweet and tart flavors, making it a decadent treat for chocolate and raspberry lovers alike', '../itemimages/chocolate_cake/ChocoRaspberry.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(12, 'Coffee Cake', 'Cardamom Cake', '700', '  Made with the finest ingredients, our bulletproof frosting adds a decadent touch, balancing the spiced cake perfectly. This heavenly treat is sure to satisfy your cravings and leave you wanting more.', '../itemimages/coffe_cake/coffee1.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(13, 'Coffee Cake', 'Cinnamon Streusel ', '700', 'A delicious coffee cake infused with cinnamon and topped with a sweet streusel crumble.', '../itemimages/coffe_cake/coffee2.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(14, 'Coffee Cake', 'Coffee & Walnut Cake', '700', 'A classic coffee and walnut cake, featuring layers of moist sponge infused with coffee flavor and adorned with a generous amount of crunchy walnuts. ', '../itemimages/coffe_cake/coffee3.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(15, 'Coffee Cake', 'Pecan brittle', '700', 'indulge in a delectable coffee cake enhanced with the delightful crunch of pecan brittle. This irresistible treat combines the rich flavors of coffee with the nutty sweetness of caramelized pecans, creating a perfect balance of textures and tastes. ', '../itemimages/coffe_cake/coffee4.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(16, 'Coffee Cake', 'Crumb Coffee', '700', ' Savor the essence of espresso in every bite of this delectable coffee cake. Topped with a delectable crumbly streusel, this moist and flavorful cake is a true delight for coffee lovers, offering a harmonious blend of rich espresso and delightful texture.', '../itemimages/coffe_cake/cofffee5.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(17, 'Coffee Cake', 'Espresso martini cake ', '700', 'Indulge in a decadent espresso martini cake: a moist and velvety delight blending bold espresso and vodka flavors, topped with a luscious coffee-infused frosting. A perfect fusion of cocktail and dessert in every slice.', '../itemimages/coffe_cake/coffee6.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(18, 'Cheese Cake', 'Orange Mascarpone', '700', 'A tantalizing orange mascarpone cheesecake with a luxurious chocolate ganache topping. The creamy and citrus-infused mascarpone cheesecake pairs perfectly with the rich and velvety chocolate ganache, creating a harmonio', '../itemimages/cheese_cake/cheese1.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(19, 'Cheese Cake', ' Baileys Irish Cream', '700', 'This irresistible dessert combines the smooth and creamy richness of cheesecake with the delightful flavor of Baileys Irish Cream. Each bite offers a luxurious and decadent treat that is sure to satisfy any sweet tooth.', '../itemimages/cheese_cake/cheese2.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(20, 'Cheese Cake', 'blueberry cheese cake ', '700', 'Delight in a luscious blueberry cheesecake, where velvety smooth cheesecake meets the vibrant burst of juicy blueberries.', '../itemimages/cheese_cake/cheese3.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(21, 'Cheese Cake', 'Brown Sugar Cheesecake ', '700', 'Indulge in the ultimate treat of a brown sugar cheesecake with an irresistible oatmeal cookie crust and a luscious butterscotch topping.', '../itemimages/cheese_cake/cheese4.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(22, 'Cheese Cake', 'No-Bake Biscoff Cheesecake ', '700', 'Topped with a luscious Biscoff spread, every bite delivers a delightful combination of creamy richness and delectable cookie goodness, all without needing to turn on the oven.', '../itemimages/cheese_cake/cheese5.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(23, 'Fruit Cake', 'Strawberry Peach', '700', 'This heavenly cake is bursting with the sweet and juicy essence of fresh strawberries and peaches. Moist and tender layers of cake are beautifully complemented by the fruity goodness, creating a delectable treat that captures the essence of summer in every bite.', '../itemimages/fruit_cake/fruit1.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(24, 'Fruit Cake', 'Chocolate Raspberry cake ', '700', 'This irresistible dessert combines moist and velvety chocolate cake layers with a luscious raspberry filling, creating a harmonious balance of flavors.', '../itemimages/fruit_cake/fruit2.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(25, 'Fruit Cake', 'Mango Cream Cake ', '700', ' Each bite is a heavenly combination of light and fluffy cake with a luscious mango cream filling. Indulge in the refreshing taste of mangoes, creating a delightful treat that captures the essence of summer in every slice.', '../itemimages/fruit_cake/fruit3.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(26, 'Fruit Cake', 'Lime Yogurt cake ', '700', 'The moist and tender cake is infused with a refreshing lime essence, creating a perfect balance of sweet and tangy.', '../itemimages/fruit_cake/fruit4.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(27, 'Fruit Cake', 'Blood Orange Cake ', '700', ' This elegant dessert showcases the vibrant and unique flavors of blood oranges in a light and airy chiffon cake', '../itemimages/fruit_cake/fruit5.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(28, 'Fruit Cake', 'Mint Chip Mousee ', '700', ' This delectable dessert combines the creamy smoothness of cheesecake with the cool and invigorating flavor of mint. With delightful bites of chocolate chips scattered throughout, this airy and fluffy mousse is a delightful treat for mint lovers. ', '../itemimages/fruit_cake/fruit6.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(29, 'Doughnut', 'Baked Citrus Donuts', '700', ' These delectable treats feature a moist and fluffy donut infused with vibrant citrus flavors. Topped with a luscious glaze infused with the delicate essence of rosewater, each bite offers a harmonious blend of zesty citrus and floral sweetness. ', '../itemimages/Doughnut/doughnut1.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(30, 'Doughnut', 'Caramelised Doughnuts  ', '700', ' Each bite offers a luscious combination of sweet caramel and velvety white chocolate, creating a truly irresistible and decadent experience. ', '../itemimages/Doughnut/doughnut2.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(31, 'Doughnut', 'Hazelnut Doughnuts  ', '700', ' Topped with a luscious hazelnut glaze and sprinkled with crunchy hazelnut pieces, each bite is a harmonious combination of chocolatey goodness and nutty indulgence.', '../itemimages/Doughnut/doughnut3.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(32, 'Doughnut', 'Matcha Baked Doughnuts', '700', ' These delightful treats feature a moist and fluffy doughnut infused with the earthy and subtly bitter notes of matcha green tea.', '../itemimages/Doughnut/doughnut4.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(33, 'Doughnut', 'Vanilla Glazed Doughnuts ', '700', ' With a hint of aromatic vanilla in every bite, these doughnuts offer a simple yet satisfying treat that never goes out of style. ', '../itemimages/Doughnut/doughnut5.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(34, 'Doughnut', 'Strawberries and Cream Donuts ', '700', ' Topped with a creamy glaze and finished with a sprinkle of strawberry bits, these donuts offer a perfect balance of fruity sweetness and creamy indulgence. ', '../itemimages/Doughnut/doughnut6.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(36, 'Cupcake', ' Bumblebee & Flower Cupcake', '700', 'It features a moist and fluffy cupcake adorned with intricate frosting designs resembling vibrant flowers. To complete the whimsical touch, a cute bumblebee decoration sits atop the cupcake.', '../itemimages/cupcake/Cupcake1.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(37, 'Cupcake', 'Funfetti Vanilla Cupcake ', '700', ' This classic treat features a moist and fluffy vanilla cupcake dotted with colorful sprinkles throughout.', '../itemimages/cupcake/Cupcake2.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(38, 'Cupcake', 'Galaxy Cupcake ', '700', 'Adorned with shimmering edible glitter, vibrant swirls of cosmic colors, and perhaps a sprinkle of edible stars, these cupcakes evoke the beauty of a night sky. ', '../itemimages/cupcake/Cupcake3.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(39, 'Cupcake', 'Oreo-Cupcakes ', '700', 'With a creamy Oreo frosting and a whole Oreo cookie placed on top, these cupcakes are a true treat for Oreo lovers. ', '../itemimages/cupcake/Cupcake4.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(40, 'Cupcake', 'Marshmallow Frosting ', '700', ' These moist and flavorful cupcakes are infused with the warm and aromatic essence of pumpkin spice. Topped with a fluffy marshmallow frosting that adds a touch of sweetness and decadence, these cupcakes are a perfect seasonal treat.', '../itemimages/cupcake/Cupcake5.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(41, 'Cupcake', ' Red Velvet Cupcake', '700', 'The combination of the moist, tender cake and the creamy frosting creates a delightful indulgence that is both visually striking and delicious', '../itemimages/cupcake/Cupcake6.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(42, 'Cupcake', 'Vegan Halloween Cupcakes ', '700', 'Get into the spooky spirit with vegan Halloween cupcakes adorned with skull decorations. ', '../itemimages/cupcake/Cupcake7.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(43, 'Nutella Cake', ' Banana Nutella Cake', '700', '. This moist and fluffy banana cake is layered with a luscious Nutella filling, creating a delectable fusion of flavors. ', '../itemimages/nutella_cake/Banana Nutella Cake.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(44, 'Nutella Cake', 'Sunken Nutella cake with Baileys cream ', '700', ' This rich and moist cake features a sunken center filled with a luscious Nutella filling, creating a gooey and indulgent surprise. ', '../itemimages/nutella_cake/Sunken Nutella cake with Baileys cream.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(45, 'Nutella Cake', ' Molten Nutella Lava Cake', '700', '. This decadent dessert features a rich and moist chocolate cake with a luscious molten Nutella center that oozes out when you cut into it.', '../itemimages/nutella_cake/Molten Nutella Lava Cake.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(46, 'Nutella Cake', 'Chocolate Strawberry Nutella Cake ', '700', 'This exquisite dessert showcases layers of moist chocolate cake generously filled with Nutella and fresh strawberry slices.', '../itemimages/nutella_cake/Chocolate Strawberry Nutella Cake.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(47, 'Nutella Cake', 'Nutella Hazelnut Cake ', '700', ' Each slice offers a heavenly combination of creamy chocolate-hazelnut goodness and a satisfying crunch from the nuts, topped with a luscious Nutella frosting..', '../itemimages/nutella_cake/Nutella Hazelnut Cake.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(48, 'Nutella Cake', 'Nutella Chocolate Cake ', '700', 'This decadent dessert features layers of moist and rich chocolate cake generously filled and frosted with luscious Nutella. ', '../itemimages/nutella_cake/Nutella Chocolate Cake .jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(49, 'Bundt Cake', 'Brown Sugar Apple Bundt Cake ', '700', ' With a hint of cinnamon and a caramelized brown sugar glaze drizzled on top, each slice offers a perfect balance of sweetness and spiced apple goodness. ', '../itemimages/bundt/Brown Sugar Apple Bundt Cake .jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(50, 'Bundt Cake', 'Cranberry Orange Bundt Cake ', '700', ' This delightful cake combines the tartness of cranberries with the refreshing zest of oranges.', '../itemimages/bundt/Cranberry Orange Bundt Cake.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(51, 'Bundt Cake', 'Gingerbread Bundt Cake ', '700', 'This delightful cake is rich in flavor, combining the aromatic blend of ginger, cinnamon, nutmeg, and molasses.', '../itemimages/bundt/Gingerbread Bundt Cake.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(52, 'Bundt Cake', 'Lemon Bundt Cake with Berry Jam Filling ', '700', ' features a moist and tender crumb infused with zesty lemon zest. With a sweet and tangy berry jam filling swirled throughout the cake, each bite offers a burst of fruity goodness. ', '../itemimages/bundt/Lemon Bundt Cake with Berry Jam Filling.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(53, 'Bundt Cake', 'Lemon Olive Oil Cake ', '700', 'This moist and tender cake showcases the vibrant flavors of freshly squeezed lemons and the subtle richness of olive oil.', '../itemimages/bundt/Lemon Olive Oil Cake.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(54, 'Bundt Cake', 'Red Velvet Bundt Cake with Cream Cheese Icing  ', '700', 'This moist and velvety cake boasts a deep red color and a hint of cocoa, delivering a delightful balance of flavors', '../itemimages/bundt/Red Velvet Bundt Cake with Cream Cheese Icing .jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(55, 'Bundt Cake', 'Rocky Road Bundt Cake ', '700', 'Rich chocolate cake is studded with marshmallows, crunchy nuts, and decadent chocolate chunks, creating a perfect harmony of textures and flavors. ', '../itemimages/bundt/Rocky Road Bundt Cake.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(56, 'Cookies', ' backcat cookies', '700', 'These cookies are typically shaped like cats, with a black-colored dough or icing to resemble their furry appearance. ', '../itemimages/cookies/backcat cookies.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(57, 'Cookies', 'Chocolate Orange Brownie Cookies  ', '700', 'These delightful treats bring together the rich, fudgy texture of a brownie and the bright, citrusy flavor of orange', '../itemimages/cookies/Chocolate Orange Brownie Cookies .jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(58, 'Cookies', 'Red Velvet Brookies ', '700', 'These delightful treats combine the moist and velvety texture of red velvet cake with the rich and fudgy goodness of brownies.', '../itemimages/cookies/Red Velvet Brookies.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(59, 'Cookies', 'Coffee Bean Cookies  ', '700', 'These cookies are infused with the rich and aromatic flavor of coffee, delivering a delicious caffeine kick. ', '../itemimages/cookies/Coffee Bean Cookies .jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(60, 'Cookies', 'Chocolate Pistachio Cookies ', '700', 'These delectable treats feature a rich, chocolatey cookie dough mixed with chopped pistachios for added texture and flavor.', '../itemimages/cookies/Chocolate Pistachio Cookies.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(61, 'Cookies', 'Kit Kat Cookies with Chocolate Chunks  ', '700', '. These cookies are made with a buttery dough that is studded with chunks of Kit Kat bars and chocolate pieces, creating a delightful blend of textures and flavors. ', '../itemimages/cookies/Kit Kat Cookies with Chocolate Chunks .jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28'),
(62, 'Cookies', 'Vegan almond cookies ', '700', ' prepared with almond flour or ground almonds, creating a delicate and nutty flavor. Sweetened with a natural sweetener like maple syrup or coconut sugar, these cookies offer a delightful balance of sweetness and nuttiness. ', '../itemimages/cookies/Vegan almond cookies.jpg', '1 pcs', '980 gm', '2023-07-16 03:20:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblfoodtracking`
--

CREATE TABLE `tblfoodtracking` (
  `ID` int(10) NOT NULL,
  `OrderId` char(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `status` char(50) DEFAULT NULL,
  `StatusDate` timestamp NULL DEFAULT current_timestamp(),
  `OrderCanclledByUser` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblorderaddresses`
--

CREATE TABLE `tblorderaddresses` (
  `ID` int(11) NOT NULL,
  `UserId` char(100) DEFAULT NULL,
  `Ordernumber` char(100) DEFAULT NULL,
  `Flatnobuldngno` varchar(255) DEFAULT NULL,
  `StreetName` varchar(255) DEFAULT NULL,
  `Area` varchar(255) DEFAULT NULL,
  `Landmark` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `OrderTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `OrderFinalStatus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblorderaddresses`
--

INSERT INTO `tblorderaddresses` (`ID`, `UserId`, `Ordernumber`, `Flatnobuldngno`, `StreetName`, `Area`, `Landmark`, `City`, `OrderTime`, `OrderFinalStatus`) VALUES
(31, '17', '470428413', '12', 'lalitpur', 'lalitpur', '', 'lalitpur', '2023-07-22 10:08:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblorders`
--

CREATE TABLE `tblorders` (
  `ID` int(11) NOT NULL,
  `UserId` char(10) DEFAULT NULL,
  `FoodId` char(10) DEFAULT NULL,
  `IsOrderPlaced` int(11) DEFAULT NULL,
  `OrderNumber` char(100) DEFAULT NULL,
  `Mode` varchar(100) DEFAULT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `discount_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblorders`
--

INSERT INTO `tblorders` (`ID`, `UserId`, `FoodId`, `IsOrderPlaced`, `OrderNumber`, `Mode`, `OrderDate`, `discount_amount`) VALUES
(68, '16', '4', NULL, NULL, NULL, '2023-07-22 10:04:27', 0),
(69, '17', '8', 1, '470428413', 'Cash on Delivery', '2023-07-22 10:07:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` varchar(200) DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`) VALUES
(1, 'aboutus', 'About us', '<p class=\"MsoNormal\"><span style=\"font-size: 11.5pt; line-height: 115%; font-family: Roboto; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">We provide you a trustworthy and convenient platform\r\nto choose best gift for your family, friends etc. for every occasion like\r\nbirthdays, anniversaries, marriage, love, farewell and many more. We offer wide\r\nrange of products in various categories like cakes, egg-less cakes, drawing\r\ncakes, 3D cakes, photo cakes, collectibles, chocolates, bouquet, flowers bunch,\r\nsoft toys, greeting cards, candles, photo frames, handicrafts etc. We also\r\ncustomize gifts according to customer wish.</span></p>', NULL, NULL, '2021-07-16 06:44:44'),
(2, 'contactus', 'Contact Us', 'Koteshwor-32, Kathmandu, Nepal', 'BakeHub@gmail.com', 4654789791, '2023-06-01 14:35:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_used` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `FirstName`, `LastName`, `Email`, `MobileNumber`, `Password`, `RegDate`, `is_used`) VALUES
(13, 'Roseanne', 'Park', 'rosie@gmail.com', 9747828387, 'b2796b9d5f9448f049f85064b726280f', '2023-07-16 04:30:12', 0),
(16, 'Luffy', 'Hancock', 'luffy@gmail.com', 9801010101, '6cfbec608383fd05c271de92010d455f', '2023-07-22 09:41:57', 0),
(17, 'Dinesh', 'Rana', 'ranad4508@gmail.com', 9865747518, '9c9f1c65b1dc1f79498c9f09eb610e1a', '2023-07-22 10:06:54', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CategoryName` (`CategoryName`);

--
-- Indexes for table `tblcontact`
--
ALTER TABLE `tblcontact`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbldiscount`
--
ALTER TABLE `tbldiscount`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indexes for table `tblfood`
--
ALTER TABLE `tblfood`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblfoodtracking`
--
ALTER TABLE `tblfoodtracking`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblorderaddresses`
--
ALTER TABLE `tblorderaddresses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserId` (`UserId`,`Ordernumber`);

--
-- Indexes for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserId` (`UserId`,`FoodId`,`OrderNumber`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblcontact`
--
ALTER TABLE `tblcontact`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbldiscount`
--
ALTER TABLE `tbldiscount`
  MODIFY `discount_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tblfood`
--
ALTER TABLE `tblfood`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tblfoodtracking`
--
ALTER TABLE `tblfoodtracking`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblorderaddresses`
--
ALTER TABLE `tblorderaddresses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
