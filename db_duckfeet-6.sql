-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 24, 2022 lúc 07:03 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_duckfeet`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id_user` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `sl_sp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_chitiet_order`
--

CREATE TABLE `tbl_chitiet_order` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `Soluong` int(11) NOT NULL,
  `Gia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_danhmuc`
--

CREATE TABLE `tbl_danhmuc` (
  `id_dm` int(11) NOT NULL,
  `ten_dm` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_danhmuc`
--

INSERT INTO `tbl_danhmuc` (`id_dm`, `ten_dm`) VALUES
(1, 'Giày CLASSIC'),
(2, 'Giày BOOST'),
(3, 'Giày SANDAL'),
(4, 'Giày CAO GÓT'),
(5, 'Dép');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id_order` int(11) NOT NULL,
  `tenKH` varchar(200) NOT NULL,
  `SDT` int(11) NOT NULL,
  `DiaChi` varchar(200) NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_sanpham`
--

CREATE TABLE `tbl_sanpham` (
  `id_sp` int(11) NOT NULL,
  `ten_sp` varchar(100) NOT NULL,
  `mota` text NOT NULL,
  `gia` int(11) NOT NULL,
  `id_dm` int(11) NOT NULL,
  `img_sp` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_sanpham`
--

INSERT INTO `tbl_sanpham` (`id_sp`, `ten_sp`, `mota`, `gia`, `id_dm`, `img_sp`) VALUES
(1, 'CLASSIC B1646', 'Mã sản phẩm: B1646	</br>\nKiểu dáng: Giày Thể Thao	</br>\nKiểu lót: Lót rời	</br>\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt	</br>\nĐộ cao: ~ 3 cm	</br>\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\nChất liệu:  Da PU	</br>\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\n', 330000, 1, 'https://product.hstatic.net/200000382351/product/1_3d381111070b4cbf8e4262935ae047ec_master.png'),
(2, 'CLASSIC B1624', 'Mã sản phẩm: B1624	</br>\nKiểu dáng: Giày Thể Thao	</br>\nKiểu lót: Lót rời	</br>\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt	</br>\nĐộ cao: ~ 3 cm	</br>\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\nChất liệu:  Vải 	</br>\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\n', 320000, 1, 'https://product.hstatic.net/200000382351/product/1_c54e581d2bec4213a9c1ad6ae28af871_master.png'),
(3, 'CLASSIC B1655', 'Mã sản phẩm: B1655</br>\nKiểu dáng: Giày Thể Thao</br>\nKiểu lót: Lót rời</br>\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt</br>\nĐộ cao: ~ 3 cm</br>\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân</br>\nChất liệu:  Da PU</br>\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40</br>', 340000, 1, 'https://product.hstatic.net/200000382351/product/3_e3b27402e1ad4c239ca6b1ca12c7b023_master.png'),
(4, 'CLASSIC  B1650', 'Mã sản phẩm: B1650	</br>\nKiểu dáng: Giày Thể Thao	</br>\nKiểu lót: Lót rời	</br>\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt	</br>\nĐộ cao: ~ 4 cm	</br>\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\nChất liệu:  Vải Canvas	</br>\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\n', 320000, 1, 'https://product.hstatic.net/200000382351/product/1_880379827baa4f689db2ea2e50ac378e_master.png'),
(5, 'CLASSIC B1641', 'Mã sản phẩm: B1641	</br>\nKiểu dáng: Giày Thể Thao	</br>\nKiểu lót: Lót rời	</br>\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt	</br>\nĐộ cao: ~  3.5 cm	</br>\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\nChất liệu:  Da PU	</br>\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\n', 285000, 1, 'https://product.hstatic.net/200000382351/product/2_febe932a825c4cc0aeaff0860757b1c1_master.png'),
(6, 'CLASSIC B1638', 'Mã sản phẩm: B1638	</br>\nKiểu dáng: Giày Thể Thao	</br>\nKiểu lót: Lót rời	</br>\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt	</br>\nĐộ cao: ~  3.5 cm	</br>\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\nChất liệu:  Da PU	</br>\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\n', 320000, 1, 'https://product.hstatic.net/200000382351/product/1_b7ba72a6af4b4a7897455f5e7d1c95d0_master.png'),
(7, 'CLASSIC B1637', 'Mã sản phẩm: B1637	</br>\nKiểu dáng: Giày Thể Thao	</br>\nKiểu lót: Lót rời	</br>\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt	</br>\nĐộ cao: ~  3.5 cm	</br>\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\nChất liệu:  Da PU	</br>\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\n', 295000, 1, 'https://product.hstatic.net/200000382351/product/4_6527e6a681274df5a626e05107e9a167_master.png'),
(8, 'CLASSIC B1645', 'Mã sản phẩm: B1645	</br>\nKiểu dáng: Giày Thể Thao	</br>\nKiểu lót: Lót rời	</br>\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt	</br>\nĐộ cao: ~ 6 cm	</br>\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\nChất liệu:  Vải Canvas	</br>\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\n', 350000, 1, 'https://product.hstatic.net/200000382351/product/4_0eda3b0b079b494b827567d67bf2076e_master.png'),
(9, 'CLASSIC B1636', 'Mã sản phẩm: B1636	</br>\r\nKiểu dáng: Giày Thể Thao	</br>\r\nKiểu lót: Lót rời	</br>\r\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt	</br>\r\nĐộ cao: ~ 3 cm	</br>\r\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\r\nChất liệu:  Da PU	</br>\r\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 320000, 1, 'https://product.hstatic.net/200000382351/product/1_bfefb7283f17488caf8dceb3fbcb3399_master.png'),
(10, 'CLASSIC B1639', 'Mã sản phẩm: B1639	</br>\r\nKiểu dáng: Giày Thể Thao	</br>\r\nKiểu lót: Lót rời	</br>\r\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt	</br>\r\nĐộ cao: ~ 3.5 cm	</br>\r\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\r\nChất liệu:  Vải Canvas	</br>\r\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 330000, 1, 'https://product.hstatic.net/200000382351/product/3_77d5d936a4ab41eb80951b6a823059ac_master.png'),
(11, 'CLASSIC B1631', 'Mã sản phẩm: B1631	</br>\r\nKiểu dáng: Giày Thể Thao	</br>\r\nKiểu lót: Lót rời	</br>\r\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt	</br>\r\nĐộ cao: ~ 3 cm	</br>\r\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\r\nChất liệu:  Da PU	</br>\r\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 330000, 1, 'https://product.hstatic.net/200000382351/product/9_68803314d866438598b3ef7be2c6ee82_master.png'),
(12, 'CLASSIC B1623', 'Mã sản phẩm: B1623	</br>\r\nKiểu dáng: Giày Thể Thao	</br>\r\nKiểu lót: Lót rời	</br>\r\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt	</br>\r\nĐộ cao: ~5 cm	</br>\r\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\r\nChất liệu:  Da Pu tổng hợp	</br>\r\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 330000, 1, 'https://product.hstatic.net/200000382351/product/1_51130c5b636b49adbbbd75f9087a92e9_master.png'),
(13, 'CLASSIC L1632', 'Mã sản phẩm: B1632	</br>\r\nKiểu dáng: Giày Thể Thao	</br>\r\nKiểu lót: Lót rời	</br>\r\nKiểu đế: Đế đúc cao su non có rãnh tạo ma sát chống trượt	</br>\r\nĐộ cao: ~ 4.5 cm	</br>\r\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\r\nChất liệu:  Da PU	</br>\r\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 490000, 1, 'https://product.hstatic.net/200000382351/product/1_7f900e1120774d3098af42029dd85ee1_master.png'),
(14, 'CLASSIC B1625', 'Mã sản phẩm: B1625	</br>\r\nKiểu dáng: Giày Bata	</br>\r\nKiểu lót: Lót rời	</br>\r\nKiểu đế: Đế đúc cao su 	</br>\r\nĐộ cao: ~3cm	</br>\r\nCổ giày: Loại cổ thấp 	</br>\r\nChất liệu: Vải Canvas	</br>\r\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 340000, 1, 'https://product.hstatic.net/200000382351/product/3_2__e57c30dd35554ab492ed1e47a6df3cda_master.png'),
(15, 'CLASSIC B1615', 'Mã sản phẩm: B1615	</br>\r\nKiểu dáng: Giày Bata	</br>\r\nKiểu lót: Lót rời	</br>\r\nKiểu đế: Đế đúc cao su 	</br>\r\nĐộ cao: ~3cm	</br>\r\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\r\nChất liệu: Vải kết hợp Da Pu	</br>\r\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 340000, 1, 'https://product.hstatic.net/200000382351/product/5_58f0df6f2e2a41ad908721b0c4369c72_master.png'),
(16, 'CLASSIC B1614', 'Mã sản phẩm: B1614	</br>\r\nKiểu dáng: Giày Bata	</br>\r\nKiểu lót: Lót rời	</br>\r\nKiểu đế: Đế đúc cao su 	</br>\r\nĐộ cao: ~4.5cm	</br>\r\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\r\nChất liệu: Vải Canvas có sợi kim tuyến	</br>\r\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 320000, 1, 'https://product.hstatic.net/200000382351/product/3_9b393802f474465e8121a2fb38cfb1c1_master.png'),
(17, 'CLASSIC B1613', 'Mã sản phẩm: B1613	</br>\r\nKiểu dáng: Giày Bata	</br>\r\nKiểu lót: Lót rời	</br>\r\nKiểu đế: Đế đúc cao su 	</br>\r\nĐộ cao: ~4cm	</br>\r\nCổ giày: Vải Canvas	</br>\r\nChất liệu: Vải Canvas	</br>\r\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 290000, 1, 'https://product.hstatic.net/200000382351/product/5_b245af5f6e1d4d42bd3039a679e9dadf_master.png'),
(18, 'CLASSIC B1612', 'Mã sản phẩm: B1612	</br>\r\nKiểu dáng: Giày Bata	</br>\r\nKiểu lót: Lót rời	</br>\r\nKiểu đế: Đế đúc cao su 	</br>\r\nĐộ cao: ~4cm	</br>\r\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\r\nChất liệu: Vải Canvas	</br>\r\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 290000, 1, 'https://product.hstatic.net/200000382351/product/6_fa73a4c5f9c745ed8f443d1cb376890e_master.png'),
(19, 'CLASSIC B1611', 'Mã sản phẩm: B1611	</br>\r\nKiểu dáng: Giày Bata	</br>\r\nKiểu lót: Lót rời	</br>\r\nKiểu đế: Đế đúc cao su 	</br>\r\nĐộ cao: ~3cm	</br>\r\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\r\nChất liệu: Vải Canvas	</br>\r\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 290000, 1, 'https://product.hstatic.net/200000382351/product/1_1__6a6da650023243cb98f9a46fecd65a56_master.png'),
(20, 'CLASSIC PU L1598', 'Mã sản phẩm: L1598	</br>\r\nKiểu dáng: Giày Bata	</br>\r\nKiểu lót: Lót rời	</br>\r\nKiểu đế: Đế đúc cao su 	</br>\r\nĐộ cao: ~3.5cm	</br>\r\nCổ giày: Loại cổ thấp có lưỡi gà đệm chân	</br>\r\nChất liệu: Canvas	</br>\r\nKích cỡ: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 320000, 1, 'https://product.hstatic.net/200000382351/product/1_0a2ccbe52a92439b80d0bcfc4fd3e491_master.png'),
(21, 'BOOT B1185', 'Mã sản phẩm: B1185	</br>\r\nKiểu dáng: Giày Boot	</br>\r\nCổ giày: Cổ cao có lưỡi gà rời đệm chân	</br>\r\nKiểu đế: Đế đúc cao su non	</br>\r\nĐộ cao: ~3.5cm	</br>\r\nChất liệu: Da PU tổng hợp 	</br>\r\nSize: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 370000, 2, 'https://product.hstatic.net/200000382351/product/32_cb6c53946dac46838318cca98e5bac21_master.png'),
(22, 'BOOT B1528', 'Mã sản phẩm: B1528	</br>\r\nKiểu dáng: Giày Boot	</br>\r\nCổ giày: Cổ cao có lưỡi gà rời đệm chân	</br>\r\nKiểu đế: Đế đúc cao su non	</br>\r\nĐộ cao: ~3.5cm	</br>\r\nChất liệu: Da PU tổng hợp 	</br>\r\nSize: 35 - 36 - 37 - 38 - 39 	</br>\r\n', 360000, 2, 'https://product.hstatic.net/200000382351/product/50_990f40dea78c448994ac0b5c18a7fb60_master.png'),
(23, 'BOOT B1186', 'Mã sản phẩm: B1186	</br>\r\nKiểu dáng: Giày Boot	</br>\r\nCổ giày: Cổ cao có lưỡi gà rời đệm chân	</br>\r\nKiểu đế: Đế đúc cao su non	</br>\r\nĐộ cao: ~3.5cm	</br>\r\nChất liệu: Da PU tổng hợp 	</br>\r\nSize: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 340000, 2, 'https://product.hstatic.net/200000382351/product/b1186_3_a90b3ee91dc3476481cb0fe84a50d900_master.png'),
(24, 'BOOT B1635', 'Mã sản phẩm: B1635	</br>\r\nKiểu dáng: Giày Boot	</br>\r\nCổ giày: Cổ cao có lưỡi gà rời đệm chân	</br>\r\nKiểu đế: Đế đúc cao su non	</br>\r\nĐộ cao: ~ 4.5 cm	</br>\r\nChất liệu: Da PU tổng hợp 	</br>\r\nSize: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 380000, 2, 'https://product.hstatic.net/200000382351/product/8_52a6355c69c64a988f753cd0ff59117a_master.png'),
(25, 'BOOT B1620', 'Mã sản phẩm: B1620	</br>\r\nKiểu dáng: Giày Boot	</br>\r\nCổ giày: Cổ cao có lưỡi gà rời đệm chân	</br>\r\nKiểu đế: Đế đúc cao su non	</br>\r\nĐộ cao: ~ 5 cm	</br>\r\nChất liệu: Da PU tổng hợp 	</br>\r\nSize: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 370000, 2, 'https://product.hstatic.net/200000382351/product/7_13d7104c61d9458b98ef5608d3414802_master.png'),
(26, 'BOOT B1489', 'Mã sản phẩm: B1489	</br>\r\nKiểu dáng: Giày Boot	</br>\r\nCổ giày: Cổ cao có lưỡi gà rời đệm chân	</br>\r\nKiểu đế: Đế đúc cao su non	</br>\r\nĐộ cao: ~3cm	</br>\r\nChất liệu: Da PU tổng hợp 	</br>\r\nSize: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 330000, 2, 'https://product.hstatic.net/200000382351/product/24_b386ab12f40e4a60b37cc6ceed31ac02_master.png'),
(27, 'BOOT B1498', 'Mã sản phẩm: B1498	</br>\r\nKiểu dáng: Giày Boot	</br>\r\nCổ giày: Cổ cao có lưỡi gà rời đệm chân	</br>\r\nKiểu đế: Đế đúc cao su non	</br>\r\nĐộ cao: ~3.5cm	</br>\r\nChất liệu: Da PU tổng hợp 	</br>\r\nSize: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 299000, 2, 'https://product.hstatic.net/200000382351/product/41_7c217e123bd44a968d08faa998a4fce9_master.png'),
(28, 'BOOT B1626', 'Mã sản phẩm: B1626	</br>\r\nKiểu dáng: Giày Boot	</br>\r\nCổ giày: Cổ cao có lưỡi gà rời đệm chân	</br>\r\nKiểu đế: Đế đúc cao su non	</br>\r\nĐộ cao: ~ 5 cm	</br>\r\nChất liệu: Da PU tổng hợp 	</br>\r\nSize: 35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 380000, 2, 'https://product.hstatic.net/200000382351/product/1_6162d89aa70a44b29d57e26046f926dd_master.png'),
(29, 'SANDAL B1308', 'Mã sản phẩm: B1308	</br>\r\nLoại sản phẩm: Giày sandal	</br>\r\nKiểu đế: Đế đúc cao su non	</br>\r\nĐộ cao: ~5.5cm	</br>\r\nQuai: Quai hậu có thể tùy chỉnh theo kích thước chân	</br>\r\nChất liệu: Canvas	</br>\r\nSize:  35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 290000, 3, 'https://product.hstatic.net/200000382351/product/30_dc11a387b1424311b5192d8efec4e62d_master.png'),
(30, 'SANDAL S01', 'Mã sản phẩm: S01	</br>\r\nLoại sản phẩm: Giày sandal	</br>\r\nKiểu đế: Đế đúc cao su non	</br>\r\nĐộ cao: ~2cm	</br>\r\nQuai: Quai hậu có thể tùy chỉnh theo kích thước chân	</br>\r\nChất liệu: Da PU tổng hợp	</br>\r\nSize:  35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 190000, 3, 'https://product.hstatic.net/200000382351/product/s01_4_3bd261dea734459789750445dd42e9a8_master.png'),
(31, 'SANDAL B1157', 'Mã sản phẩm: B1157	</br>\r\nLoại sản phẩm: Giày sandal	</br>\r\nKiểu đế: Đế đúc cao su non	</br>\r\nĐộ cao: 4cm	</br>\r\nQuai: Quai hậu có thể tùy chỉnh theo kích thước chân	</br>\r\nChất liệu: Da PU	</br>\r\nSize:  35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 320000, 3, 'https://product.hstatic.net/200000382351/product/1_96d4a9fcbebb4a1688091138d9356ba9_master.png'),
(32, 'SANDAL B1411', 'Mã sản phẩm: B1411	</br>\r\nLoại sản phẩm: Giày sandal	</br>\r\nKiểu đế: Đế TPR	</br>\r\nĐộ cao: ~4cm	</br>\r\nQuai: Quai hậu có thể tùy chỉnh theo kích thước chân	</br>\r\nChất liệu: Da PU	</br>\r\nSize:  35 - 36 - 37 - 38 - 39 - 40	</br>\r\n', 290000, 3, 'https://product.hstatic.net/200000382351/product/b1411__1__15549a57cf0b4eb4b946cedd137f4e08_master.png'),
(33, 'GB00134', 'Mã sản phẩm: GB00134	</br>\r\nKiểu dáng: Giày cao gót	</br>\r\nLoại mũi: Mũi vuông	</br>\r\nKiểu gót: Gót vuông	</br>\r\nĐộ cao: 5cm	</br>\r\nKiểu quai: Quai ngang ôm mũi chân và cột dây.	</br>\r\nChất liệu: Da tổng hợp	</br>\r\nMàu sắc: Đen - Trắng	</br>\r\nKích cỡ: 35-36-37-38-39	</br>\r\n', 290000, 4, 'https://product.hstatic.net/200000382351/product/capture_one_catalog0261_copy_296ebe55f1d644cd99301fbd485c2cba_master.jpg'),
(34, 'GB00128\r\n', 'Mã sản phẩm: GB00128	</br>\r\nKiểu dáng: Giày cao gót	</br>\r\nLoại mũi: Mũi vuông	</br>\r\nKiểu gót: Gót vuông	</br>\r\nĐộ cao: 3cm 	</br>\r\nKiểu quai: Quai ngang mảnh ôm cổ chân và quai ôm mũi bản vừa. 	</br>\r\nChất liệu: Da tổng hợp	</br>\r\nMàu sắc: Vàng - Đen	</br>\r\nKích cỡ: 35-36-37-38-39	</br>\r\n', 330000, 4, 'https://product.hstatic.net/200000382351/product/gb00128_9_4bad239e8b244024920c17621c9ce109_master.jpg'),
(35, 'GB00125', 'Mã sản phẩm: GB00125	</br>\r\nKiểu dáng: Giày cao gót	</br>\r\nLoại mũi: Mũi tròn	</br>\r\nKiểu gót: Gót tròn	</br>\r\nĐộ cao: 4cm	</br>\r\nKiểu quai: Dây quai ngang. Quai hậu mảnh ôm cổ chân có nút khóa	</br>\r\nChất liệu: Da nhân tạo	</br>\r\nMàu sắc: Đen - Trắng - Nâu	</br>\r\nKích cỡ: 35-36-37-38-39	</br>\r\n', 330000, 4, 'https://product.hstatic.net/200000382351/product/img_3422_jpg_185f88ba27084f70ac3bd7dbd5d5cc92_master.jpg'),
(36, 'GB00126', 'Mã sản phẩm: GB00126	</br>\r\nKiểu dáng: Giày cao gót	</br>\r\nLoại mũi: Mũi nhọn	</br>\r\nKiểu gót: Gót vuông	</br>\r\nĐộ cao: 4cm	</br>\r\nKiểu quai: mũi mules	</br>\r\nChất liệu: Da nhân tạo cao cấp	</br>\r\nKích cỡ: 35-36-37-38-39	</br>\r\nXuất xứ: Việt Nam	</br>\r\n', 340000, 4, 'https://product.hstatic.net/200000382351/product/bom4.53248_9f6182dbe83d421889d9a807c518a4a2_master.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `user_phone` varchar(10) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id_user`,`id_sp`),
  ADD KEY `id_sp` (`id_sp`);

--
-- Chỉ mục cho bảng `tbl_chitiet_order`
--
ALTER TABLE `tbl_chitiet_order`
  ADD PRIMARY KEY (`id`,`id_order`,`id_sp`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `tbl_chitiet_order_ibfk_2` (`id_sp`);

--
-- Chỉ mục cho bảng `tbl_danhmuc`
--
ALTER TABLE `tbl_danhmuc`
  ADD PRIMARY KEY (`id_dm`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id_order`);

--
-- Chỉ mục cho bảng `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  ADD PRIMARY KEY (`id_sp`,`ten_sp`),
  ADD KEY `id_dm` (`id_dm`);

--
-- Chỉ mục cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_chitiet_order`
--
ALTER TABLE `tbl_chitiet_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_danhmuc`
--
ALTER TABLE `tbl_danhmuc`
  MODIFY `id_dm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  MODIFY `id_sp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD CONSTRAINT `tbl_cart_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`),
  ADD CONSTRAINT `tbl_cart_ibfk_2` FOREIGN KEY (`id_sp`) REFERENCES `tbl_sanpham` (`id_sp`);

--
-- Các ràng buộc cho bảng `tbl_chitiet_order`
--
ALTER TABLE `tbl_chitiet_order`
  ADD CONSTRAINT `tbl_chitiet_order_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `tbl_order` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_chitiet_order_ibfk_2` FOREIGN KEY (`id_sp`) REFERENCES `tbl_sanpham` (`id_sp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  ADD CONSTRAINT `tbl_sanpham_ibfk_1` FOREIGN KEY (`id_dm`) REFERENCES `tbl_danhmuc` (`id_dm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
