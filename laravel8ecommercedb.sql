-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 04, 2022 lúc 01:27 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laravel8ecommercedb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_attribute_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'omnis eos', 'omnis-eos', '2022-10-29 21:35:54', '2022-10-29 21:35:54'),
(2, 'qui quidem', 'qui-quidem', '2022-10-29 21:35:54', '2022-10-29 21:35:54'),
(3, 'earum autem', 'earum-autem', '2022-10-29 21:35:54', '2022-10-29 21:35:54'),
(4, 'aut odio', 'aut-odio', '2022-10-29 21:35:54', '2022-10-29 21:35:54'),
(5, 'deleniti magnam', 'deleniti-magnam', '2022-10-29 21:35:54', '2022-10-29 21:35:54'),
(6, 'deserunt eum', 'deserunt-eum', '2022-10-29 21:35:54', '2022-10-29 21:35:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `created_at`, `updated_at`, `expiry_date`) VALUES
(1, 'OFF100', 'fixed', '100.00', '1000.00', '2022-11-10 04:22:52', '2022-11-11 09:30:21', '2022-11-20'),
(3, 'OFF200', 'fixed', '100.00', '1000.00', '2022-11-10 04:22:52', '2022-11-11 09:30:21', '2022-11-20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_categories`
--

CREATE TABLE `home_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sel_categories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_products` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `home_categories`
--

INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
(1, '1,2,3', '8', '2022-11-25 10:14:22', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `title`, `subtitle`, `price`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bé genshin', 'thằn bé con ranh genshin', '8500', 'http://127.0.0.1:8000/shop', '1667443853.jpg', 1, '2022-11-02 19:50:53', '2022-11-02 19:50:53'),
(2, 'Thằn mập mờ 1', 'Thằn thái mập mờ 1', '8700', 'http://127.0.0.1:8000/shop', '1667446688.jpg', 1, '2022-11-02 19:58:11', '2022-11-02 20:38:08'),
(4, 'Thằn Combat', 'vũ Combat', '9000', 'http://127.0.0.1:8000/shop', '1667448283.jpg', 1, '2022-11-02 21:04:43', '2022-11-02 21:04:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_10_25_090420_create_sessions_table', 1),
(7, '2022_10_30_035959_create_categories_table', 2),
(8, '2022_10_30_040201_create_products_table', 2),
(9, '2022_11_02_111348_create_home_sliders_table', 3),
(10, '2022_11_03_100701_create_home_categories_table', 4),
(11, '2022_11_04_102434_create_sales_table', 5),
(12, '2022_11_10_101434_create_coupons_table', 6),
(13, '2022_11_11_121103_add_expiry_date_to_coupons_table', 7),
(14, '2022_11_13_024330_create_orders_table', 8),
(15, '2022_11_13_024426_create_order_items_table', 8),
(16, '2022_11_13_024515_create_shippings_table', 8),
(17, '2022_11_13_024616_create_transactions_table', 8),
(18, '2022_11_15_065652_add_delivered_canceled_date_to_orders_table', 9),
(19, '2022_11_17_100140_create_reviews_table', 10),
(20, '2022_11_17_101015_add_rstatus_to_order_items_table', 10),
(21, '2022_11_18_093730_create_contacts_table', 11),
(22, '2022_11_18_110023_create_settings_table', 12),
(23, '2022_11_18_202022_create_shoppingcart_table', 13),
(24, '2022_11_18_205412_create_subcategories_table', 14),
(25, '2022_11_20_035744_add_subcategory_id_to_products_table', 15),
(26, '2022_11_20_064657_create_profiles_table', 16),
(27, '2022_11_21_050203_create_product_attributes_table', 17),
(28, '2022_11_21_231838_create_attribute_values_table', 18),
(29, '2022_11_22_051914_add_options_to_order_items_table', 19);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ordered','delivered','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rstatus` tinyint(1) NOT NULL DEFAULT 0,
  `options` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_status` enum('instock','outofstock') COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`, `subcategory_id`) VALUES
(1, 'aut voluptatem illum necessitatibus', 'aut-voluptatem-illum-necessitatibus', 'Excepturi nihil amet ipsum deleniti. Iure et accusamus et ipsam. Deleniti fugiat nam magni illo.', 'Accusamus consequuntur voluptate aperiam quis. Beatae blanditiis ipsa culpa. Quasi molestias suscipit veritatis quis enim. Labore magni laudantium et. Quod temporibus sint autem eos. Enim maxime amet impedit qui rerum quidem. Ea quo voluptatem sed id dolore sit et. Minima et quo magni nam officia natus sed. Ut sit accusamus sit qui necessitatibus. Aspernatur nisi blanditiis iure asperiores sit. Dicta in id sit enim sapiente quis. Ut excepturi hic rem alias.', '51.00', '40.00', 'DIGI480', 'instock', 0, 169, 'digital_14.jpg', NULL, 3, '2022-10-29 21:35:54', '2022-11-04 03:08:34', NULL),
(2, 'est sed incidunt repellat', 'est-sed-incidunt-repellat', 'Enim fugiat voluptatibus repellendus veniam aut est error. Odio ut ratione nemo deleniti quis. Aut sed tenetur qui explicabo.', 'Quia consequatur iste nihil ullam dolor cupiditate consequatur. Voluptatum quo veniam aperiam qui sunt. Et delectus est autem officiis. Modi aut eveniet fuga. Veniam ratione ut aliquam quas voluptas voluptatem. Dolore non soluta rerum sit. Voluptas dolores error sapiente. Nam et nisi ipsam eum temporibus. Voluptas beatae est alias consectetur.', '17.00', '10.00', 'DIGI143', 'instock', 0, 112, 'digital_6.jpg', NULL, 5, '2022-10-29 21:35:54', '2022-11-04 03:08:50', NULL),
(3, 'itaque adipisci dolore tenetur', 'itaque-adipisci-dolore-tenetur', 'Eos ab eius suscipit veritatis doloremque ipsa. Non impedit quod ratione illum enim deleniti. Ut autem delectus ipsam possimus in.', 'Totam reiciendis ullam eos repellat. Eos quo aut hic sequi. Libero voluptates architecto voluptatem voluptas consectetur ullam. Repellendus laborum deserunt molestiae dicta et. Omnis repudiandae et et omnis in. Omnis sequi sed nihil dolor tenetur ullam. Cum blanditiis asperiores natus ratione. Illo aut est consequuntur unde quo eos rerum aut.', '152.00', '132.00', 'DIGI211', 'instock', 0, 169, 'digital_21.jpg', NULL, 5, '2022-10-29 21:35:54', '2022-11-04 03:09:07', NULL),
(4, 'et saepe ea mollitia', 'et-saepe-ea-mollitia', 'Soluta consequatur laudantium unde ut neque. Ipsum similique et voluptatum voluptates sed aliquid qui.', 'Laboriosam alias vel labore voluptatibus. Vel fuga a quos doloremque earum dicta vel. Aliquam voluptas quaerat consequatur vitae repellendus quis ad nam. Voluptatem minima deserunt totam impedit velit neque. Animi autem facilis reprehenderit quae. Dignissimos quaerat est dolor quibusdam rerum et hic enim. Error quisquam culpa omnis vel et. Et consequatur libero quibusdam cupiditate molestiae vel eos.', '229.00', '200.00', 'DIGI295', 'instock', 0, 136, 'digital_16.jpg', NULL, 3, '2022-10-29 21:35:54', '2022-11-04 03:09:20', NULL),
(5, 'mollitia placeat similique perspiciatis', 'mollitia-placeat-similique-perspiciatis', 'Nihil laborum aut rerum qui incidunt atque nihil. Adipisci veritatis qui est facere occaecati ex accusantium sed. Est quaerat repellendus tenetur.', 'Aut repellat eveniet ducimus est quam. Minus sequi exercitationem et quo dolores recusandae ab est. Cupiditate nihil et nemo vitae quam consequuntur totam sunt. Deserunt delectus earum voluptas saepe qui sed quo. Ex quasi tempore sed nemo omnis minus iusto. Consequatur eligendi maxime quia consequatur quidem minus. Voluptatem esse libero sit ipsum voluptatem magnam aut.', '117.00', '107.00', 'DIGI402', 'instock', 0, 194, 'digital_22.jpg', NULL, 2, '2022-10-29 21:35:54', '2022-11-04 03:09:37', NULL),
(6, 'dolorem beatae reiciendis quis', 'dolorem-beatae-reiciendis-quis', 'Sunt sint a officiis est deleniti ut eligendi. Est est doloremque quaerat doloremque deserunt voluptatem laboriosam. Praesentium ducimus voluptatem nemo et id esse dolorem.', 'Magni amet qui fugit voluptates voluptatibus. Neque voluptate ut ullam iste eum autem mollitia. Earum voluptas officia consequatur tempore autem. Praesentium quaerat sunt autem labore delectus illum cumque officia. Quos excepturi facere quidem exercitationem tempore corrupti odit iusto. Distinctio est nihil incidunt inventore. Ut ut quos est et. Iusto consectetur fuga ducimus cumque distinctio.', '490.00', '460.00', 'DIGI201', 'instock', 0, 137, 'digital_5.jpg', NULL, 1, '2022-10-29 21:35:54', '2022-11-04 03:09:51', NULL),
(7, 'rerum rerum non fugiat', 'rerum-rerum-non-fugiat', 'Et sit libero ipsa qui nam voluptatem rem adipisci. Neque aut ut hic similique dolores deserunt. Voluptatem tempora laudantium tenetur ratione deleniti exercitationem.', 'Repellendus quo animi eum. Quod eligendi amet porro laboriosam explicabo accusamus excepturi libero. Reiciendis vel blanditiis eum voluptas nam dolor sit. Corrupti qui dolores quisquam est id. Officiis id eum soluta qui non ea deserunt. Dolor ad voluptates delectus id quo voluptatum in. Labore facere culpa iusto praesentium deleniti. Aut laborum excepturi deserunt voluptas et error. Eligendi animi aspernatur cum hic.', '98.00', '78.00', 'DIGI496', 'instock', 0, 149, 'digital_20.jpg', NULL, 3, '2022-10-29 21:35:54', '2022-11-04 03:10:05', NULL),
(8, 'perspiciatis asperiores consequuntur consequatur', 'perspiciatis-asperiores-consequuntur-consequatur', 'Dolor impedit dolorem quo enim recusandae sit. Sed aliquid dolorem enim. Sequi qui aut cumque cum autem architecto. Provident minima aut ut rerum.', 'Dolorem quas provident et alias totam id dolores. Odio labore voluptas nisi eveniet harum consequatur sunt. Voluptas nam cumque nostrum laudantium id aut sequi. Mollitia dolores rerum itaque nemo dolorem qui. Dolores ea sapiente quo provident facere vel. Dolor maxime explicabo aspernatur quia eaque. Sit magnam et molestiae nisi.', '232.00', '212.00', 'DIGI157', 'instock', 0, 152, 'digital_12.jpg', NULL, 4, '2022-10-29 21:35:54', '2022-11-04 03:10:24', NULL),
(9, 'in quaerat cum accusantium', 'in-quaerat-cum-accusantium', 'Praesentium ut porro et atque qui fugiat sunt. Velit suscipit ut odit aut nesciunt voluptas libero.', 'Aut nam voluptatem numquam error voluptatem. Quam similique voluptas illum voluptas. Adipisci excepturi expedita ut atque autem. Pariatur maxime labore earum provident doloremque aut. Iusto velit illo est non similique vel molestiae. Voluptatum quia nesciunt est officia quia repellat earum. Officiis cumque veritatis dolore molestiae ea aspernatur ut. Et molestiae perspiciatis ex error. Fugiat earum est velit ut est voluptates voluptate.', '63.00', NULL, 'DIGI218', 'instock', 0, 172, 'digital_13.jpg', NULL, 3, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(10, 'maiores numquam reiciendis sequi', 'maiores-numquam-reiciendis-sequi', 'Temporibus dicta libero rerum ab sunt dolor. Quia ea enim suscipit est. Excepturi est dolor qui aut.', 'Possimus laborum nesciunt illo veritatis ea et molestias. Aut beatae dignissimos laudantium et. Ut nihil ut minus et incidunt in. Qui voluptatum eveniet ipsa debitis. Quas et magnam quisquam ut ea autem aperiam. Dolorem in dolorem et ducimus pariatur. Consequatur aspernatur eos maiores consequatur eum itaque atque. Quaerat eveniet eaque ut nesciunt sit. Quis sint quia maiores eum perspiciatis delectus.', '285.00', NULL, 'DIGI387', 'instock', 0, 112, 'digital_4.jpg', NULL, 2, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(11, 'esse beatae molestias facilis', 'esse-beatae-molestias-facilis', 'Quaerat architecto corrupti et et. Et possimus soluta harum porro non modi repellat. Quasi incidunt vitae a. Est voluptate vel molestias velit illo.', 'Corrupti sint explicabo enim dolores repellat ipsam. Et nostrum aspernatur quibusdam atque accusamus dolorum fugiat. Qui rem quaerat ut. Fugiat reprehenderit consequatur sunt. Totam rerum delectus porro aspernatur et. Ut voluptas voluptatem nemo culpa beatae adipisci. Quo velit quasi consequuntur quia et voluptas. Assumenda odit exercitationem atque natus ipsum laboriosam fuga. Placeat et eum sunt minima. Sint consequatur ut ut dolores non eius itaque.', '98.00', NULL, 'DIGI442', 'instock', 0, 149, 'digital_18.jpg', NULL, 3, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(12, 'ab quod qui perferendis', 'ab-quod-qui-perferendis', 'Quo aliquam nesciunt recusandae voluptatem quidem. Voluptas rerum accusantium expedita ut eligendi laboriosam.', 'Inventore alias autem quaerat velit. Quos in delectus quia sit corrupti tempora consectetur. Voluptatibus eum doloribus vel voluptas fugit laborum. Et voluptas maxime esse corrupti. Maiores porro voluptatem qui omnis. Laboriosam omnis ipsa dolorum voluptate impedit. Ut repellat et error fugiat. Totam voluptas aut dolor quod et nemo. Ipsum quis omnis sed dolor.', '314.00', NULL, 'DIGI354', 'instock', 0, 189, 'digital_17.jpg', NULL, 4, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(13, 'sunt eos hic rerum', 'sunt-eos-hic-rerum', 'Sit quis est reiciendis. Quas repellendus cumque dolor sapiente autem. Nihil quo quia quidem asperiores amet voluptatum et est. Repudiandae quo et quod expedita dolores rerum.', 'Hic nam quas quis expedita quidem. Et qui voluptates dolorem et. Dolor odio voluptates voluptatem voluptas enim autem rem. Quidem laborum mollitia eius est dolores dicta. Esse velit dolore dolore nesciunt reiciendis. Culpa facilis id et est commodi animi. Tempore ex eaque optio assumenda. Nobis vel animi non. Error assumenda rerum vero non. Vel velit perferendis consequatur ut rem temporibus est. Optio qui illum iste aperiam.', '91.00', NULL, 'DIGI241', 'instock', 0, 118, 'digital_2.jpg', NULL, 4, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(14, 'recusandae qui aut quae', 'recusandae-qui-aut-quae', 'Earum fuga non consequatur. Enim officia voluptatibus et voluptatem et. Dolore voluptas cumque molestias quos.', 'Nihil maxime et sint rerum dolorem. Debitis enim fuga deserunt autem est officia animi. Iste tenetur quis excepturi nisi recusandae. Natus exercitationem occaecati repudiandae consequatur voluptate fugiat. Reiciendis atque nisi sunt labore rem sint deleniti culpa. Officiis officia totam ea beatae dolor dolores culpa. Unde laboriosam unde qui.', '293.00', NULL, 'DIGI120', 'instock', 0, 168, 'digital_9.jpg', NULL, 2, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(15, 'alias non explicabo odio', 'alias-non-explicabo-odio', 'Consectetur voluptates beatae porro iusto libero. Reiciendis explicabo aut dolorem quae voluptates.', 'Natus non quia sapiente similique nesciunt ab qui et. Hic quam quos illum aut ut odit suscipit. Qui molestiae labore facere sunt labore. Quae placeat dignissimos qui et amet. Quia consequuntur iusto sed. Temporibus nulla odio molestiae facere sunt aut ut. Earum aliquam ad quis earum dolorem consequatur. Ullam laudantium vel quia sint quod odio. Quisquam saepe autem ut suscipit tempora maxime excepturi voluptatem. Architecto hic maxime aut consequatur. Illum mollitia mollitia amet illum.', '26.00', NULL, 'DIGI101', 'instock', 0, 154, 'digital_1.jpg', NULL, 5, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(16, 'perspiciatis quo aut error', 'perspiciatis-quo-aut-error', 'Omnis veritatis soluta rerum minus tempora et omnis aut. Molestiae omnis et a nesciunt quisquam distinctio inventore. Itaque assumenda adipisci id nostrum officia architecto. Molestiae cumque qui et.', 'Ratione commodi aut aspernatur ratione autem quia ut. Ipsa asperiores reiciendis odit rem odio aut. Quos veniam repellat fuga quas rem qui provident. Sequi suscipit dignissimos et voluptatem autem. Error ut vero repudiandae aut est et corrupti. Laboriosam rerum accusantium officia cumque deserunt quo. Tempora minus voluptatem ab id. Alias minus itaque quia et veniam occaecati eaque illo. Ea nemo sequi explicabo quas velit. Aut libero dignissimos rem esse eos nemo.', '214.00', NULL, 'DIGI418', 'instock', 0, 120, 'digital_15.jpg', NULL, 4, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(17, 'totam consequatur sed nisi', 'totam-consequatur-sed-nisi', 'Laborum eaque pariatur minus assumenda aut voluptas. Est maxime nihil sunt vel adipisci qui voluptas. Dolores harum beatae consequatur facere ut non fugit.', 'Sapiente quod qui qui amet beatae. Omnis velit consequatur ullam voluptas quos. Eum necessitatibus sint quis molestiae. Aut consequatur non est rerum reprehenderit est sint. Corporis quo officiis aut minima. Voluptas dolor sed maiores. Fuga delectus modi ducimus quo ad. Eum sed qui velit dolorum odio laborum quidem. Quod accusamus vel ut molestias in optio aut. Iure eaque est quo maxime ut eos.', '263.00', NULL, 'DIGI360', 'instock', 0, 114, 'digital_3.jpg', NULL, 3, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(18, 'qui quae facere nemo', 'qui-quae-facere-nemo', 'Accusantium a assumenda et quo qui. Quia id velit aut nam odit adipisci.', 'Quisquam molestias corrupti omnis aspernatur. Sapiente perspiciatis ex labore ducimus autem ex ullam. Voluptas quia voluptatibus itaque doloremque voluptatum. Ducimus et nam sit sunt omnis veniam sequi qui. Officia magnam at et expedita dolore voluptatem. Soluta est qui praesentium vel ipsam. Quo occaecati veniam deserunt aut voluptate. Non ipsum blanditiis impedit pariatur voluptas vitae delectus.', '458.00', NULL, 'DIGI156', 'instock', 0, 156, 'digital_7.jpg', NULL, 5, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(19, 'eum soluta autem explicabo', 'eum-soluta-autem-explicabo', 'Aperiam eius cupiditate et ad. Aperiam et voluptatem autem unde.', 'Ut ratione ut sint et est voluptatem tempore. Temporibus suscipit necessitatibus odio consequatur aspernatur rem. Nesciunt sit possimus sed quia harum aliquid voluptatem. Deserunt consequatur et facilis ad. Deleniti error nihil molestias sint repudiandae. Distinctio aspernatur dolorum omnis similique quam. Velit omnis assumenda amet nihil ex aspernatur.', '364.00', NULL, 'DIGI268', 'instock', 0, 121, 'digital_11.jpg', NULL, 1, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(20, 'id dolores qui ut', 'id-dolores-qui-ut', 'Eaque asperiores non vitae id et qui vel. Voluptatem quis ut illum accusamus maxime. Voluptas ab rerum adipisci aut doloremque id totam.', 'Perspiciatis est voluptate illo molestiae reiciendis nostrum unde necessitatibus. Voluptatum sit tempore nemo et est aut. Exercitationem incidunt magni et dignissimos commodi odio. Quos omnis sunt iure eum laudantium odio autem maiores. Voluptates exercitationem eos et facere itaque recusandae. Ex laudantium neque doloribus aut. Officiis minus vero iusto nam ratione. Debitis impedit doloremque ea consequatur voluptatem velit animi ea. Aut earum velit qui optio voluptatum dolor.', '144.00', NULL, 'DIGI106', 'instock', 0, 123, 'digital_19.jpg', NULL, 1, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(21, 'incidunt dignissimos nostrum autem', 'incidunt-dignissimos-nostrum-autem', 'Consectetur ullam animi voluptates magnam possimus amet minus. Eligendi minima est optio et quasi hic eius. Nemo tenetur pariatur velit accusantium molestias fugit accusamus.', 'Quia in totam neque animi. Omnis et facere ad. Aut illo ut nesciunt assumenda explicabo quas. Nulla consectetur in reiciendis consectetur voluptatem natus. Eius reiciendis dignissimos aperiam doloremque id. Voluptates et laudantium magni dignissimos molestiae odit mollitia. Qui odit est tempore culpa non aspernatur laborum. Voluptate commodi nam similique ipsam repellendus aliquid. Repellendus sit aut ut earum similique reiciendis veniam. Similique unde repudiandae a iure aperiam aliquid illum.', '179.00', NULL, 'DIGI293', 'instock', 0, 177, 'digital_8.jpg', NULL, 3, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL),
(22, 'omnis vel fuga saepe', 'omnis-vel-fuga-saepe', 'Qui natus ut sit. Optio sunt accusamus dolore iure molestiae vitae. Qui rerum est quia nisi occaecati.', 'Omnis aliquid nisi neque veniam quia. Eligendi exercitationem aliquid qui voluptatem doloremque quia voluptatibus. Laudantium deserunt ipsum vero. Consequatur quia iure molestiae amet quis ducimus. Dicta et et quod aliquam eius voluptatem consequatur. Sapiente veniam veniam officiis nesciunt. Deserunt sed illum velit quasi. Omnis beatae et autem. Rem provident voluptatibus quod dolorem eos voluptas et.', '477.00', NULL, 'DIGI238', 'instock', 0, 102, 'digital_10.jpg', NULL, 1, '2022-10-29 21:35:54', '2022-10-29 21:35:54', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '2022-11-04 12:33:03', 1, '2022-11-25 10:14:22', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('phKWjIKd6M497zGKkaf4PScX22cQZIv3abFAMSiu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZUlQdm1ZS2pZTkVFcVZuY2lYbWVsOEdGZlpLSEJrcXVtOXNpMzllaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jYXJ0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo0OiJjYXJ0IjthOjI6e3M6NDoiY2FydCI7TzoyOToiSWxsdW1pbmF0ZVxTdXBwb3J0XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6Mjp7czozMjoiMDI3YzkxMzQxZmQ1Y2Y0ZDI1NzliNDljNGI2YTkwZGEiO086MzI6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtIjo5OntzOjU6InJvd0lkIjtzOjMyOiIwMjdjOTEzNDFmZDVjZjRkMjU3OWI0OWM0YjZhOTBkYSI7czoyOiJpZCI7aToxO3M6MzoicXR5IjtpOjExO3M6NDoibmFtZSI7czozNToiYXV0IHZvbHVwdGF0ZW0gaWxsdW0gbmVjZXNzaXRhdGlidXMiO3M6NToicHJpY2UiO2Q6NTE7czo3OiJvcHRpb25zIjtPOjM5OiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbU9wdGlvbnMiOjI6e3M6ODoiACoAaXRlbXMiO2E6MDp7fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo0OToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGFzc29jaWF0ZWRNb2RlbCI7czoxODoiQXBwXE1vZGVsc1xQcm9kdWN0IjtzOjQxOiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AdGF4UmF0ZSI7aToyMTtzOjQxOiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AaXNTYXZlZCI7YjowO31zOjMyOiIzNzBkMDg1ODUzNjBmNWM1NjhiMThkMWYyZTRjYTFkZiI7TzozMjoiR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0iOjk6e3M6NToicm93SWQiO3M6MzI6IjM3MGQwODU4NTM2MGY1YzU2OGIxOGQxZjJlNGNhMWRmIjtzOjI6ImlkIjtpOjI7czozOiJxdHkiO2k6NTtzOjQ6Im5hbWUiO3M6MjU6ImVzdCBzZWQgaW5jaWR1bnQgcmVwZWxsYXQiO3M6NToicHJpY2UiO2Q6MTc7czo3OiJvcHRpb25zIjtPOjM5OiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbU9wdGlvbnMiOjI6e3M6ODoiACoAaXRlbXMiO2E6MDp7fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo0OToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGFzc29jaWF0ZWRNb2RlbCI7czoxODoiQXBwXE1vZGVsc1xQcm9kdWN0IjtzOjQxOiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AdGF4UmF0ZSI7aToyMTtzOjQxOiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AaXNTYXZlZCI7YjowO319czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjEyOiJzYXZlRm9yTGF0ZXIiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjE6e3M6MzI6IjM3MGQwODU4NTM2MGY1YzU2OGIxOGQxZjJlNGNhMWRmIjtPOjMyOiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbSI6OTp7czo1OiJyb3dJZCI7czozMjoiMzcwZDA4NTg1MzYwZjVjNTY4YjE4ZDFmMmU0Y2ExZGYiO3M6MjoiaWQiO2k6MjtzOjM6InF0eSI7aToxO3M6NDoibmFtZSI7czoyNToiZXN0IHNlZCBpbmNpZHVudCByZXBlbGxhdCI7czo1OiJwcmljZSI7ZDoxNztzOjc6Im9wdGlvbnMiO086Mzk6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtT3B0aW9ucyI6Mjp7czo4OiIAKgBpdGVtcyI7YTowOnt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjQ5OiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AYXNzb2NpYXRlZE1vZGVsIjtzOjE4OiJBcHBcTW9kZWxzXFByb2R1Y3QiO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQB0YXhSYXRlIjtpOjIxO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBpc1NhdmVkIjtiOjA7fX1zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fX1zOjg6ImNoZWNrb3V0IjthOjQ6e3M6ODoiZGlzY291bnQiO2k6MDtzOjg6InN1YnRvdGFsIjtzOjY6IjY0Ni4wMCI7czozOiJ0YXgiO3M6NjoiMTM1LjY2IjtzOjU6InRvdGFsIjtzOjY6Ijc4MS42NiI7fX0=', 1668661008),
('qxKUaMDYhjDEnAjqk3cjYscsui0ytgnULd5ED0Va', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRFg3c0NsQWlLd3dYN2NvUTQ3OEtjTG9jeGxGVzRXYXZycWNzdk5iWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1668654683);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twiter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','declined','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USR for User or Customer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `utype`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$d6wed1v1xEbmTjodamOWsettlF/vxEbVjROmhsnzi4.5hHsy23X6u', NULL, NULL, NULL, NULL, NULL, NULL, 'ADM', '2022-10-25 02:30:23', '2022-10-25 02:30:23'),
(2, 'Người Dùng', 'user@gmail.com', NULL, '$2y$10$epAsjvw2JiJy.C4l/OEIPepY9FYOUHrgypJVz8c8DOJptP3XdpCvm', NULL, NULL, NULL, NULL, NULL, NULL, 'USR', '2022-10-25 02:31:46', '2022-10-25 02:31:46');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_product_attribute_id_foreign` (`product_attribute_id`),
  ADD KEY `attribute_values_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Chỉ mục cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_order_item_id_foreign` (`order_item_id`);

--
-- Chỉ mục cho bảng `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Chỉ mục cho bảng `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
