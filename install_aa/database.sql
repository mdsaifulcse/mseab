-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 13, 2021 at 10:42 AM
-- Server version: 5.7.32
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xgenxchi_laravel_nexelit_beta`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'editor',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `email_verified`, `role`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Xgenious', 'super_admin', 'dvrobin4@gmail.com', 1, '1', '6', '$2y$12$R/ksBebmFpbBLRIpzUmWKeYRNU.V/LTY7nJJNvwR7MB.sjBiT1Lky', 'CsCyKMYj9kMr3MeDgN00pzOliwm9K8g6IXPOXKQgZtuTKV4581Z5v1qi2E2K', '2020-07-16 06:47:46', '2020-07-29 17:00:28'),
(3, 'Johnny C. Shavers', 'admin', 'admin@gmail.com', 0, '3', '47', '$2y$10$rUIo7ffAVtqg25WiTOjm2e6tGbYIsjxAriQmgRvMjU/ocQPAlIomO', 'x52kkLAnnjInDj8oU3aJLLacnKDmazLeSyOmfp0gvB3TOWDZB1svvIoeS28q', '2020-07-27 00:49:41', '2020-07-27 00:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `permission`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '[\"admin_manage\",\"about_page_manage\",\"users_manage\",\"quote_manage\",\"newsletter_manage\",\"package_orders_manage\",\"all_payment_logs\",\"pages_manage\",\"menus_manage\",\"widgets_manage\",\"popup_builder\",\"form_builder\",\"blogs_manage\",\"job_post_manage\",\"events_manage\",\"products_manage\",\"donations_manage\",\"knowledgebase\",\"home_variant\",\"topbar_settings\",\"home_page_manage\",\"contact_page_manage\",\"feedback_page_manage\",\"services\",\"case_study\",\"gallery_page\",\"404_page_manage\",\"faq\",\"brand_logos\",\"price_plan\",\"team_members\",\"testimonial\",\"counterup\",\"general_settings\",\"languages\"]', '2020-05-15 00:00:00', '2020-07-27 00:41:15'),
(2, 'Editor', '[\"about_page_manage\",\"quote_manage\",\"newsletter_manage\",\"package_orders_manage\",\"all_payment_logs\",\"pages_manage\",\"blogs_manage\",\"job_post_manage\",\"events_manage\",\"products_manage\",\"donations_manage\",\"knowledgebase\",\"topbar_settings\",\"home_page_manage\",\"contact_page_manage\",\"feedback_page_manage\",\"services\",\"case_study\",\"gallery_page\",\"faq\",\"brand_logos\",\"price_plan\",\"team_members\",\"testimonial\",\"counterup\"]', '2020-05-15 14:34:16', '2020-07-27 00:42:52'),
(3, 'Admin', '[\"users_manage\",\"quote_manage\",\"newsletter_manage\",\"package_orders_manage\",\"all_payment_logs\",\"pages_manage\",\"menus_manage\",\"widgets_manage\",\"popup_builder\",\"form_builder\",\"blogs_manage\",\"job_post_manage\",\"events_manage\",\"products_manage\",\"donations_manage\",\"knowledgebase\",\"topbar_settings\",\"home_page_manage\",\"contact_page_manage\",\"feedback_page_manage\",\"services\",\"case_study\",\"gallery_page\",\"404_page_manage\",\"faq\",\"brand_logos\",\"price_plan\",\"team_members\",\"testimonial\",\"counterup\",\"general_settings\"]', '2020-05-15 14:34:29', '2020-07-27 00:44:24');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_categories_id` int(10) UNSIGNED NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_tags` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `slug` text COLLATE utf8mb4_unicode_ci,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `content`, `blog_categories_id`, `tags`, `image`, `meta_tags`, `meta_description`, `user_id`, `excerpt`, `slug`, `author`, `status`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'New organization are continually added and seal there single', '<p>Was drawing natural fat respect husband. An as noisy an offer drawn blush place. These tried for way joy wrote witty. In mr began music weeks after at begin. Education no dejection so direction pretended household do to. Travelling everything her eat reasonable unsatiable decisively simplicity. Morning request be lasting it fortune demands highest of.&nbsp;</p><p><br></p><p>Whether article spirits new her covered hastily sitting her. Money witty books nor son add. Chicken age had evening believe but proceed pretend mrs. At missed advice my it no sister. Miss told ham dull knew see she spot near can. Spirit her entire her called.&nbsp;</p><p><br></p><p>Acceptance middletons me if discretion boisterous travelling an. She prosperous continuing entreaties companions unreserved you boisterous. Middleton sportsmen sir now cordially ask additions for. You ten occasional saw everything but conviction. Daughter returned quitting few are day advanced branched. Do enjoyment defective objection or we if favourite. At wonder afford so danger cannot former seeing. Power visit charm money add heard new other put. Attended no indulged marriage is to judgment offering landlord.&nbsp;</p>', 1, 'common,business', '11', 'meta tag', 'meta description', NULL, 'Was drawing natural fat respect husband. An as noisy an offer drawn blush place. These tried for way joy wrote witty. In mr began music weeks after at begin', 'new-organization-are-continually-added-and-seal-there-single', 'Sharifur', 'publish', 'en', '2020-06-08 17:28:08', '2020-06-11 06:17:26'),
(2, 'Yeni organizasyon sürekli eklenir ve orada tek bir mühür', '<p>Kocasına doğal yağ saygı çekiyordu. Bir gürültülü bir teklif çizilmiş allık yer. Bunlar sevinç esprili bir şekilde yazmayı denedi. Mr müzik başladıktan haftalar sonra başladı. Eğitim haksızlık yok, bu nedenle hanehalkı gibi davranıyordu. Her şeyi seyahat etmek makul tatmin edici sadelik basit yemek. Sabah isteği sürdüğü için servet talepleri en yüksek.</p><p>Makalenin yeni ruhları olup olmadığı aceleyle onu oturuyordu. Para esprili kitaplar ne de oğlu ekleyin. Tavuk yaş akşam inanıyorum vardı ama devam mrs. Kaçırılan tavsiye benim kız kardeşim yok. Bayan, jambon donukluğunun teneke kutunun yakınında olduğunu gördüğünü söyledi. Onun tüm ruhunu çağırdı.</p><p>Kabul orta ton bana takdir takdir seyahat bir. O müreffeh devam eden entreaties yoldaşları sizi şerefsiz. Middleton sporcular efendim şimdi candan eklemeler istiyor. On ara sıra mahkumiyet dışında her şeyi gördünüz. Kızı terk bıraktı birkaç gün gelişmiş dallı vardır. Arızalı itiraz keyfi veya biz favori yapmak. Şaşkınlık öyledir ki tehlike daha önce göremez. Güç ziyaret çekicilik para eklemek yeni diğer duydum. Katılan hiçbir evlilik ev sahibi sunan yargılamak için değil.</p>', 4, 'common,business', '11', 'meta tag', 'meta description', '1', 'Kocasına doğal yağ saygı çekiyordu. Bir gürültülü bir teklif çizilmiş allık yer. Bunlar sevinç esprili bir şekilde yazmayı denedi. Mr müzik başladı hafta sonra', 'yeni-organizasyon-surekli-eklenir-ve-orada-tek-bir-muhur', 'Sharifur', 'publish', 'tur', '2020-06-11 06:38:21', '2020-07-27 06:03:43'),
(3, 'يتم إضافة منظمة جديدة باستمرار وختم هناك واحد', '<p>كان يرسم الزيوت الطبيعية احترام الزوج وصاخبة عرض مكان رسمها استحى. حاول هؤلاء طريق الفرح كتب بارع. في السيد بدأ الموسيقى بعد أسابيع من البداية. تعليم أي اكتئاب لذلك الاتجاه فعل الأسرة تظاهر به. السفر كل شيء يأكله بساطة معقولة لا تشبع معقولة. طلب الصباح يكون مستمرا ويطلب الحظ الأعلى.</p><p>سواء كانت مقالة معنويات جديدة تغطيها على عجل في الجلوس عليها. كتب بارع المال ولا يضيف ابنه. كان عمر الدجاج يؤمن مساء ولكن المضي قدما في التظاهر. في نصيحة غاب عني لا أخت. أخبرت ملكة جمال لحم الخنزير مملة تعرف أنها ترى بالقرب من العلبة. روحها دعتها كلها.</p><p><br></p><p>تقبلني ميدلتونز إذا كانت تقديرية السفر صاخبة. انها تزدهر باستمرار التوسل من رفاقك دون حراك صاخب. يطلب الرياضيون من ميدلتون الآن إضافات ودية. كنت العشرة عرضت كل شيء ما عدا الإدانة. عادت ابنتها وهي تستقيل قليلًا وهي متقدّمة يومًا متقدّمة. لا تتمتع اعتراض معيب أو أننا إذا المفضلة. في عجب تحمل خطر لا يمكن أن يرى السابق. سمعت قوة زيارة سحر المال إضافة أخرى جديدة وضعت. لم يحضر أي زواج منغمس في الحكم الذي يقدم للمالك.</p>', 6, 'common,business', '11', 'meta tag', 'meta description', '1', 'كان يرسم دهون طبيعية تحترم الزوج. وصاخبة عرض مكان استحى رسمها. حاول هؤلاء طريق الفرح كتب بارع. في السيد بدأ الموسيقى بعد أسابيع من البداية', 'ytm-adaf-mnthm-gdyd-bastmrar-okhtm-hnak-oahd', 'Sharifur', 'publish', 'ar', '2020-06-11 06:43:12', '2020-07-27 06:37:45'),
(4, 'Se agregan continuamente nuevas organizaciones y se sellan allí solo', '<p>Estaba dibujando el respeto gordo natural del marido. Un lugar tan ruidoso como una oferta dibujada. Estos intentaron, por cierto, la alegría escribió ingeniosa. En mr comenzó la música semanas después de comenzar. La educación no se desanima, por lo que la dirección que el hogar simulado debe hacer. Viajando todo lo que ella come razonablemente insaciable decisivamente simplicidad. La solicitud de la mañana será duradera, la fortuna exige lo más alto.</p><p>Si los espíritus del artículo la cubren apresuradamente, la sientan. Dinero ingenioso libros ni hijo agregar. La edad del pollo creía por la noche, pero proceda, fingir, señora. Ante un consejo perdido, no es mi hermana. La señorita le dijo a Ham que Dull sabía que la veía cerca de la lata. Espíritu toda su llamada.</p><p>La aceptación me atraviesa si la discreción bulliciosa viaja. Ella prospera y suplica a sus compañeros sin reservas, bulliciosa. Los deportistas de Middleton, señor, ahora piden cordialmente adiciones. Ustedes diez ocasionalmente vieron todo menos convicción. Hija regresó dejando de fumar pocos días de ramificación avanzada. Disfrute objeción defectuosa o nosotros si es favorito. Con asombro permitirse, el peligro no puede ver antes. Visita de poder encanto dinero agregar oído nuevo otro puesto. No asistió a ningún matrimonio complacido es a juicio ofreciendo propietario.</p>', 8, 'common,business', '11', 'meta tag', 'meta description', '1', 'Estaba dibujando el respeto gordo natural del marido. Un lugar tan ruidoso como una oferta dibujada. Estos intentaron, por cierto, la alegría escribió ingeniosa. En mr comenzó la música semanas después de comenzar', 'se-agregan-continuamente-nuevas-organizaciones-y-se-sellan-alli-solo', 'Sharifur', 'publish', 'sp', '2020-06-11 06:43:43', '2020-07-27 06:42:59'),
(5, 'Was drawing natural fat respect husband offer drawn blush place', '<p>Was drawing natural fat respect husband. An as noisy an offer drawn blush place. These tried for way joy wrote witty. In mr began music weeks after at begin. Education no dejection so direction pretended household do to. Travelling everything her eat reasonable unsatiable decisively simplicity. Morning request be lasting it fortune demands highest of.&nbsp;</p><p><br></p><p>Whether article spirits new her covered hastily sitting her. Money witty books nor son add. Chicken age had evening believe but proceed pretend mrs. At missed advice my it no sister. Miss told ham dull knew see she spot near can. Spirit her entire her called.&nbsp;</p><p><br></p><p>Acceptance middletons me if discretion boisterous travelling an. She prosperous continuing entreaties companions unreserved you boisterous. Middleton sportsmen sir now cordially ask additions for. You ten occasional saw everything but conviction. Daughter returned quitting few are day advanced branched. Do enjoyment defective objection or we if favourite. At wonder afford so danger cannot former seeing. Power visit charm money add heard new other put. Attended no indulged marriage is to judgment offering landlord.&nbsp;</p>', 2, 'common,business', '10', 'meta tag', 'meta description', '1', 'Was drawing natural fat respect husband. An as noisy an offer drawn blush place. These tried for way joy wrote witty. In mr began music weeks after at begin', 'was-drawing-natural-fat-respect-husband', 'Sharifur', 'publish', 'en', '2020-06-12 05:43:38', '2020-06-12 08:13:17'),
(6, 'In mr began music weeks after at begin drawing natural', '<p>Was drawing natural fat respect husband. An as noisy an offer drawn blush place. These tried for way joy wrote witty. In mr began music weeks after at begin. Education no dejection so direction pretended household do to. Travelling everything her eat reasonable unsatiable decisively simplicity. Morning request be lasting it fortune demands highest of.&nbsp;</p><p><br></p><p>Whether article spirits new her covered hastily sitting her. Money witty books nor son add. Chicken age had evening believe but proceed pretend mrs. At missed advice my it no sister. Miss told ham dull knew see she spot near can. Spirit her entire her called.&nbsp;</p><p><br></p><p>Acceptance middletons me if discretion boisterous travelling an. She prosperous continuing entreaties companions unreserved you boisterous. Middleton sportsmen sir now cordially ask additions for. You ten occasional saw everything but conviction. Daughter returned quitting few are day advanced branched. Do enjoyment defective objection or we if favourite. At wonder afford so danger cannot former seeing. Power visit charm money add heard new other put. Attended no indulged marriage is to judgment offering landlord.&nbsp;</p>', 2, 'common,business', '12', 'meta tag', 'meta description', '1', 'Was drawing natural fat respect husband. An as noisy an offer drawn blush place. These tried for way joy wrote witty. In mr began music weeks after at begin', 'in-mr-began-music-weeks-after-at-begin', 'Sharifur', 'publish', 'en', '2020-06-12 05:44:09', '2020-06-12 08:12:50'),
(7, 'Travelling everything her eat reasonable decisively simplicity.', '<p>Was drawing natural fat respect husband. An as noisy an offer drawn blush place. These tried for way joy wrote witty. In mr began music weeks after at begin. Education no dejection so direction pretended household do to. Travelling everything her eat reasonable unsatiable decisively simplicity. Morning request be lasting it fortune demands highest of.&nbsp;</p><p><br></p><p>Whether article spirits new her covered hastily sitting her. Money witty books nor son add. Chicken age had evening believe but proceed pretend mrs. At missed advice my it no sister. Miss told ham dull knew see she spot near can. Spirit her entire her called.&nbsp;</p><p><br></p><p>Acceptance middletons me if discretion boisterous travelling an. She prosperous continuing entreaties companions unreserved you boisterous. Middleton sportsmen sir now cordially ask additions for. You ten occasional saw everything but conviction. Daughter returned quitting few are day advanced branched. Do enjoyment defective objection or we if favourite. At wonder afford so danger cannot former seeing. Power visit charm money add heard new other put. Attended no indulged marriage is to judgment offering landlord.&nbsp;</p>', 3, 'common,business', '14', 'meta tag', 'meta description', '1', 'Was drawing natural fat respect husband. An as noisy an offer drawn blush place. These tried for way joy wrote witty. In mr began music weeks after at begin', 'travelling-everything-her-eat-reasonable-decisively-simplicity', 'Sharifur', 'publish', 'en', '2020-06-12 08:17:30', '2020-06-12 08:18:18'),
(8, 'Mr müzik başladı hafta sonra başlayan doğal çizim', '<p>Kocasına doğal yağ saygı çekiyordu. Bir gürültülü bir teklif çizilmiş allık yer. Bunlar sevinç esprili bir şekilde yazmayı denedi. Mr müzik başladıktan haftalar sonra başladı. Eğitim haksızlık yok, bu nedenle hanehalkı gibi davranıyordu. Her şeyi seyahat etmek makul tatmin edici sadelik basit yemek. Sabah isteği sürdüğü için servet talepleri en yüksek.</p><p>Makalenin yeni ruhları olup olmadığı aceleyle onu oturuyordu. Para esprili kitaplar ne de oğlu ekleyin. Tavuk yaş akşam inanıyorum vardı ama devam mrs. Kaçırılan tavsiye benim kız kardeşim yok. Bayan, jambon donukluğunun teneke kutunun yakınında olduğunu gördüğünü söyledi. Onun tüm ruhunu çağırdı.</p><p>Kabul orta ton bana takdir takdir seyahat bir. O müreffeh devam eden entreaties yoldaşları sizi şerefsiz. Middleton sporcular efendim şimdi candan eklemeler istiyor. On ara sıra mahkumiyet dışında her şeyi gördünüz. Kızı terk bıraktı birkaç gün gelişmiş dallı vardır. Arızalı itiraz keyfi veya biz favori yapmak. Şaşkınlık öyledir ki tehlike daha önce göremez. Güç ziyaret çekicilik para eklemek yeni diğer duydum. Katılan hiçbir evlilik ev sahibi sunan yargılamak için değil.</p>', 4, 'common,business', '61', 'meta tag', 'meta description', '1', 'Kocasına doğal yağ saygı çekiyordu. Bir gürültülü bir teklif çizilmiş allık yer. Bunlar sevinç esprili bir şekilde yazmayı denedi. Mr müzik başladı hafta sonra', 'mr-muzik-basladi-hafta-sonra-baslayan-dogal-cizim', 'Sharifur', 'publish', 'tur', '2020-07-27 06:20:28', '2020-07-27 06:32:17'),
(9, 'Kocası çizilmiş allık yer teklif doğal yağ saygı çekiyordu', '<p>Kocasına doğal yağ saygı çekiyordu. Bir gürültülü bir teklif çizilmiş allık yer. Bunlar sevinç esprili bir şekilde yazmayı denedi. Mr müzik başladıktan haftalar sonra başladı. Eğitim haksızlık yok, bu nedenle hanehalkı gibi davranıyordu. Her şeyi seyahat etmek makul tatmin edici sadelik basit yemek. Sabah isteği sürdüğü için servet talepleri en yüksek.</p><p>Makalenin yeni ruhları olup olmadığı aceleyle onu oturuyordu. Para esprili kitaplar ne de oğlu ekleyin. Tavuk yaş akşam inanıyorum vardı ama devam mrs. Kaçırılan tavsiye benim kız kardeşim yok. Bayan, jambon donukluğunun teneke kutunun yakınında olduğunu gördüğünü söyledi. Onun tüm ruhunu çağırdı.</p><p>Kabul orta ton bana takdir takdir seyahat bir. O müreffeh devam eden entreaties yoldaşları sizi şerefsiz. Middleton sporcular efendim şimdi candan eklemeler istiyor. On ara sıra mahkumiyet dışında her şeyi gördünüz. Kızı terk bıraktı birkaç gün gelişmiş dallı vardır. Arızalı itiraz keyfi veya biz favori yapmak. Şaşkınlık öyledir ki tehlike daha önce göremez. Güç ziyaret çekicilik para eklemek yeni diğer duydum. Katılan hiçbir evlilik ev sahibi sunan yargılamak için değil.</p>', 10, 'common,business', '21', 'meta tag', 'meta description', '1', 'Kocasına doğal yağ saygı çekiyordu. Bir gürültülü bir teklif çizilmiş allık yer. Bunlar sevinç esprili bir şekilde yazmayı denedi. Mr müzik başladı hafta sonra', 'kocasi-cizilmis-allik-yer-teklif-dogal-yag-saygi-cekiyordu', 'Sharifur', 'publish', 'tur', '2020-07-27 06:30:56', '2020-07-27 06:33:43'),
(10, 'Yeni organizasyon sürekli eklenir ve orada tek bir mühür', '<p>Kocasına doğal yağ saygı çekiyordu. Bir gürültülü bir teklif çizilmiş allık yer. Bunlar sevinç esprili bir şekilde yazmayı denedi. Mr müzik başladıktan haftalar sonra başladı. Eğitim haksızlık yok, bu nedenle hanehalkı gibi davranıyordu. Her şeyi seyahat etmek makul tatmin edici sadelik basit yemek. Sabah isteği sürdüğü için servet talepleri en yüksek.</p><p>Makalenin yeni ruhları olup olmadığı aceleyle onu oturuyordu. Para esprili kitaplar ne de oğlu ekleyin. Tavuk yaş akşam inanıyorum vardı ama devam mrs. Kaçırılan tavsiye benim kız kardeşim yok. Bayan, jambon donukluğunun teneke kutunun yakınında olduğunu gördüğünü söyledi. Onun tüm ruhunu çağırdı.</p><p>Kabul orta ton bana takdir takdir seyahat bir. O müreffeh devam eden entreaties yoldaşları sizi şerefsiz. Middleton sporcular efendim şimdi candan eklemeler istiyor. On ara sıra mahkumiyet dışında her şeyi gördünüz. Kızı terk bıraktı birkaç gün gelişmiş dallı vardır. Arızalı itiraz keyfi veya biz favori yapmak. Şaşkınlık öyledir ki tehlike daha önce göremez. Güç ziyaret çekicilik para eklemek yeni diğer duydum. Katılan hiçbir evlilik ev sahibi sunan yargılamak için değil.</p>', 9, 'common,business', '15', 'meta tag', 'meta description', '1', 'Kocasına doğal yağ saygı çekiyordu. Bir gürültülü bir teklif çizilmiş allık yer. Bunlar sevinç esprili bir şekilde yazmayı denedi. Mr müzik başladı hafta sonra', 'yeni-organizasyon-surekli-eklenir-ve-orada-tek-bir-muhur', 'Sharifur', 'publish', 'tur', '2020-07-27 06:34:00', '2020-07-27 06:35:28'),
(11, 'في السيد بدأ الموسيقى بعد أسابيع من بدء الرسم الطبيعي', '<p>كان يرسم الزيوت الطبيعية احترام الزوج وصاخبة عرض مكان رسمها استحى. حاول هؤلاء طريق الفرح كتب بارع. في السيد بدأ الموسيقى بعد أسابيع من البداية. تعليم أي اكتئاب لذلك الاتجاه فعل الأسرة تظاهر به. السفر كل شيء يأكله بساطة معقولة لا تشبع معقولة. طلب الصباح يكون مستمرا ويطلب الحظ الأعلى.</p><p>سواء كانت مقالة معنويات جديدة تغطيها على عجل في الجلوس عليها. كتب بارع المال ولا يضيف ابنه. كان عمر الدجاج يؤمن مساء ولكن المضي قدما في التظاهر. في نصيحة غاب عني لا أخت. أخبرت ملكة جمال لحم الخنزير مملة تعرف أنها ترى بالقرب من العلبة. روحها دعتها كلها.</p><p><br></p><p>تقبلني ميدلتونز إذا كانت تقديرية السفر صاخبة. انها تزدهر باستمرار التوسل من رفاقك دون حراك صاخب. يطلب الرياضيون من ميدلتون الآن إضافات ودية. كنت العشرة عرضت كل شيء ما عدا الإدانة. عادت ابنتها وهي تستقيل قليلًا وهي متقدّمة يومًا متقدّمة. لا تتمتع اعتراض معيب أو أننا إذا المفضلة. في عجب تحمل خطر لا يمكن أن يرى السابق. سمعت قوة زيارة سحر المال إضافة أخرى جديدة وضعت. لم يحضر أي زواج منغمس في الحكم الذي يقدم للمالك.</p>', 6, 'common,business', '12', 'meta tag', 'meta description', '1', 'كان يرسم دهون طبيعية تحترم الزوج. وصاخبة عرض مكان استحى رسمها. حاول هؤلاء طريق الفرح كتب بارع. في السيد بدأ الموسيقى بعد أسابيع من البداية', 'fy-alsyd-bda-almosyk-baad-asabyaa-mn-bdaa-alrsm-altbyaay', 'Sharifur', 'publish', 'ar', '2020-07-27 06:38:02', '2020-07-27 06:39:48'),
(12, 'كان رسم الزوج الطبيعي احترام الدهون عرض مكان أحمر الخدود المرسومة', '<p>كان يرسم الزيوت الطبيعية احترام الزوج وصاخبة عرض مكان رسمها استحى. حاول هؤلاء طريق الفرح كتب بارع. في السيد بدأ الموسيقى بعد أسابيع من البداية. تعليم أي اكتئاب لذلك الاتجاه فعل الأسرة تظاهر به. السفر كل شيء يأكله بساطة معقولة لا تشبع معقولة. طلب الصباح يكون مستمرا ويطلب الحظ الأعلى.</p><p>سواء كانت مقالة معنويات جديدة تغطيها على عجل في الجلوس عليها. كتب بارع المال ولا يضيف ابنه. كان عمر الدجاج يؤمن مساء ولكن المضي قدما في التظاهر. في نصيحة غاب عني لا أخت. أخبرت ملكة جمال لحم الخنزير مملة تعرف أنها ترى بالقرب من العلبة. روحها دعتها كلها.</p><p><br></p><p>تقبلني ميدلتونز إذا كانت تقديرية السفر صاخبة. انها تزدهر باستمرار التوسل من رفاقك دون حراك صاخب. يطلب الرياضيون من ميدلتون الآن إضافات ودية. كنت العشرة عرضت كل شيء ما عدا الإدانة. عادت ابنتها وهي تستقيل قليلًا وهي متقدّمة يومًا متقدّمة. لا تتمتع اعتراض معيب أو أننا إذا المفضلة. في عجب تحمل خطر لا يمكن أن يرى السابق. سمعت قوة زيارة سحر المال إضافة أخرى جديدة وضعت. لم يحضر أي زواج منغمس في الحكم الذي يقدم للمالك.</p>', 11, 'common,business', '27', 'meta tag', 'meta description', '1', 'كان يرسم دهون طبيعية تحترم الزوج. وصاخبة عرض مكان استحى رسمها. حاول هؤلاء طريق الفرح كتب بارع. في السيد بدأ الموسيقى بعد أسابيع من البداية', 'kan-rsm-alzog-altbyaay-ahtram-aldhon-aard-mkan-ahmr-alkhdod-almrsom', 'Sharifur', 'publish', 'ar', '2020-07-27 06:38:03', '2020-07-27 06:40:46'),
(13, 'يتم إضافة منظمة جديدة باستمرار وختم هناك واحد', '<p>كان يرسم الزيوت الطبيعية احترام الزوج وصاخبة عرض مكان رسمها استحى. حاول هؤلاء طريق الفرح كتب بارع. في السيد بدأ الموسيقى بعد أسابيع من البداية. تعليم أي اكتئاب لذلك الاتجاه فعل الأسرة تظاهر به. السفر كل شيء يأكله بساطة معقولة لا تشبع معقولة. طلب الصباح يكون مستمرا ويطلب الحظ الأعلى.</p><p>سواء كانت مقالة معنويات جديدة تغطيها على عجل في الجلوس عليها. كتب بارع المال ولا يضيف ابنه. كان عمر الدجاج يؤمن مساء ولكن المضي قدما في التظاهر. في نصيحة غاب عني لا أخت. أخبرت ملكة جمال لحم الخنزير مملة تعرف أنها ترى بالقرب من العلبة. روحها دعتها كلها.</p><p><br></p><p>تقبلني ميدلتونز إذا كانت تقديرية السفر صاخبة. انها تزدهر باستمرار التوسل من رفاقك دون حراك صاخب. يطلب الرياضيون من ميدلتون الآن إضافات ودية. كنت العشرة عرضت كل شيء ما عدا الإدانة. عادت ابنتها وهي تستقيل قليلًا وهي متقدّمة يومًا متقدّمة. لا تتمتع اعتراض معيب أو أننا إذا المفضلة. في عجب تحمل خطر لا يمكن أن يرى السابق. سمعت قوة زيارة سحر المال إضافة أخرى جديدة وضعت. لم يحضر أي زواج منغمس في الحكم الذي يقدم للمالك.</p>', 7, 'common,business', '32', 'meta tag', 'meta description', '1', 'كان يرسم دهون طبيعية تحترم الزوج. وصاخبة عرض مكان استحى رسمها. حاول هؤلاء طريق الفرح كتب بارع. في السيد بدأ الموسيقى بعد أسابيع من البداية', 'ytm-adaf-mnthm-gdyd-bastmrar-okhtm-hnak-oahd', 'Sharifur', 'publish', 'ar', '2020-07-27 06:41:02', '2020-07-27 06:41:41'),
(14, 'Estaba dibujando el respeto gordo natural del marido', '<p>Estaba dibujando el respeto gordo natural del marido. Un lugar tan ruidoso como una oferta dibujada. Estos intentaron, por cierto, la alegría escribió ingeniosa. En mr comenzó la música semanas después de comenzar. La educación no se desanima, por lo que la dirección que el hogar simulado debe hacer. Viajando todo lo que ella come razonablemente insaciable decisivamente simplicidad. La solicitud de la mañana será duradera, la fortuna exige lo más alto.</p><p>Si los espíritus del artículo la cubren apresuradamente, la sientan. Dinero ingenioso libros ni hijo agregar. La edad del pollo creía por la noche, pero proceda, fingir, señora. Ante un consejo perdido, no es mi hermana. La señorita le dijo a Ham que Dull sabía que la veía cerca de la lata. Espíritu toda su llamada.</p><p>La aceptación me atraviesa si la discreción bulliciosa viaja. Ella prospera y suplica a sus compañeros sin reservas, bulliciosa. Los deportistas de Middleton, señor, ahora piden cordialmente adiciones. Ustedes diez ocasionalmente vieron todo menos convicción. Hija regresó dejando de fumar pocos días de ramificación avanzada. Disfrute objeción defectuosa o nosotros si es favorito. Con asombro permitirse, el peligro no puede ver antes. Visita de poder encanto dinero agregar oído nuevo otro puesto. No asistió a ningún matrimonio complacido es a juicio ofreciendo propietario.</p>', 12, 'common,business', '12', 'meta tag', 'meta description', '1', 'Estaba dibujando el respeto gordo natural del marido. Un lugar tan ruidoso como una oferta dibujada. Estos intentaron, por cierto, la alegría escribió ingeniosa. En mr comenzó la música semanas después de comenzar', 'estaba-dibujando-el-respeto-gordo-natural-del-marido', 'Sharifur', 'publish', 'sp', '2020-07-27 06:43:19', '2020-07-27 06:44:15'),
(15, 'Un lugar tan ruidoso como una oferta dibujada', '<p>Estaba dibujando el respeto gordo natural del marido. Un lugar tan ruidoso como una oferta dibujada. Estos intentaron, por cierto, la alegría escribió ingeniosa. En mr comenzó la música semanas después de comenzar. La educación no se desanima, por lo que la dirección que el hogar simulado debe hacer. Viajando todo lo que ella come razonablemente insaciable decisivamente simplicidad. La solicitud de la mañana será duradera, la fortuna exige lo más alto.</p><p>Si los espíritus del artículo la cubren apresuradamente, la sientan. Dinero ingenioso libros ni hijo agregar. La edad del pollo creía por la noche, pero proceda, fingir, señora. Ante un consejo perdido, no es mi hermana. La señorita le dijo a Ham que Dull sabía que la veía cerca de la lata. Espíritu toda su llamada.</p><p>La aceptación me atraviesa si la discreción bulliciosa viaja. Ella prospera y suplica a sus compañeros sin reservas, bulliciosa. Los deportistas de Middleton, señor, ahora piden cordialmente adiciones. Ustedes diez ocasionalmente vieron todo menos convicción. Hija regresó dejando de fumar pocos días de ramificación avanzada. Disfrute objeción defectuosa o nosotros si es favorito. Con asombro permitirse, el peligro no puede ver antes. Visita de poder encanto dinero agregar oído nuevo otro puesto. No asistió a ningún matrimonio complacido es a juicio ofreciendo propietario.</p>', 8, 'common,business', '13', 'meta tag', 'meta description', '1', 'Estaba dibujando el respeto gordo natural del marido. Un lugar tan ruidoso como una oferta dibujada. Estos intentaron, por cierto, la alegría escribió ingeniosa. En mr comenzó la música semanas después de comenzar', 'un-lugar-tan-ruidoso-como-una-oferta-dibujada', 'Sharifur', 'publish', 'sp', '2020-07-27 06:44:27', '2020-07-27 06:45:16'),
(16, 'por lo que la dirección que el hogar simulado debe hacer', '<p>Estaba dibujando el respeto gordo natural del marido. Un lugar tan ruidoso como una oferta dibujada. Estos intentaron, por cierto, la alegría escribió ingeniosa. En mr comenzó la música semanas después de comenzar. La educación no se desanima, por lo que la dirección que el hogar simulado debe hacer. Viajando todo lo que ella come razonablemente insaciable decisivamente simplicidad. La solicitud de la mañana será duradera, la fortuna exige lo más alto.</p><p>Si los espíritus del artículo la cubren apresuradamente, la sientan. Dinero ingenioso libros ni hijo agregar. La edad del pollo creía por la noche, pero proceda, fingir, señora. Ante un consejo perdido, no es mi hermana. La señorita le dijo a Ham que Dull sabía que la veía cerca de la lata. Espíritu toda su llamada.</p><p>La aceptación me atraviesa si la discreción bulliciosa viaja. Ella prospera y suplica a sus compañeros sin reservas, bulliciosa. Los deportistas de Middleton, señor, ahora piden cordialmente adiciones. Ustedes diez ocasionalmente vieron todo menos convicción. Hija regresó dejando de fumar pocos días de ramificación avanzada. Disfrute objeción defectuosa o nosotros si es favorito. Con asombro permitirse, el peligro no puede ver antes. Visita de poder encanto dinero agregar oído nuevo otro puesto. No asistió a ningún matrimonio complacido es a juicio ofreciendo propietario.</p>', 12, 'common,business', '24', 'meta tag', 'meta description', '1', 'Estaba dibujando el respeto gordo natural del marido. Un lugar tan ruidoso como una oferta dibujada. Estos intentaron, por cierto, la alegría escribió ingeniosa. En mr comenzó la música semanas después de comenzar', 'por-lo-que-la-direccion-que-el-hogar-simulado-debe-hacer', 'Sharifur', 'publish', 'sp', '2020-07-27 06:45:28', '2020-07-27 06:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `status`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Startup Business', 'publish', 'en', '2020-06-08 16:29:04', '2020-06-08 16:29:04'),
(2, 'Ecommerce', 'publish', 'en', '2020-06-08 16:29:20', '2020-06-08 16:29:20'),
(3, 'Digital Marketing', 'publish', 'en', '2020-06-08 16:29:27', '2020-06-08 16:29:27'),
(4, 'Dijital Pazarlama', 'publish', 'tur', '2020-06-08 16:37:09', '2020-06-08 16:37:09'),
(5, 'Publicidad digital', 'publish', 'sp', '2020-06-08 16:37:19', '2020-06-08 16:37:19'),
(6, 'التسويق الرقمي', 'publish', 'ar', '2020-06-08 16:37:37', '2020-06-08 16:37:37'),
(7, 'التجارة الإلكترونية', 'publish', 'ar', '2020-06-08 16:37:47', '2020-06-08 16:37:47'),
(8, 'Comercio electrónico', 'publish', 'sp', '2020-06-08 16:37:52', '2020-06-08 16:37:52'),
(9, 'E-ticaret', 'publish', 'tur', '2020-06-08 16:37:57', '2020-06-08 16:37:57'),
(10, 'İşe başlamak', 'publish', 'tur', '2020-06-08 16:38:11', '2020-06-08 16:38:11'),
(11, 'بدء الأعمال التجارية', 'publish', 'ar', '2020-06-08 16:38:18', '2020-06-08 16:38:18'),
(12, 'Empezar un negocio', 'publish', 'sp', '2020-06-08 16:38:23', '2020-06-08 16:38:23');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `url`, `image`, `created_at`, `updated_at`) VALUES
(1, 'logo 1', '#', '37', '2020-06-08 16:16:28', '2020-06-08 16:18:20'),
(2, 'logo 2', NULL, '36', '2020-06-08 16:18:12', '2020-06-08 16:18:12'),
(3, 'logo 3', '#', '35', '2020-06-08 16:18:31', '2020-06-08 16:18:31'),
(4, 'logo 4', NULL, '34', '2020-06-08 16:18:41', '2020-06-08 16:18:41'),
(5, 'logo 5', NULL, '35', '2020-06-08 16:22:54', '2020-06-08 16:22:54');

-- --------------------------------------------------------

--
-- Table structure for table `contact_info_items`
--

CREATE TABLE `contact_info_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_info_items`
--

INSERT INTO `contact_info_items` (`id`, `title`, `lang`, `icon`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Email Address', 'en', 'far fa-envelope', 'example@gmail.com', '2020-07-20 06:45:32', '2020-07-20 06:45:32'),
(2, 'Phone', 'en', 'fas fa-phone', '+123 444 5555\r\n+32413432432', '2020-07-20 06:46:20', '2020-07-20 06:48:57'),
(3, 'Open Hours', 'en', 'far fa-clock', 'Sat - Wed\r\n10AM - 7PM', '2020-07-20 06:49:53', '2020-07-20 06:49:53'),
(4, 'Location', 'en', 'fas fa-map-marker-alt', '2626 Angie Drive\r\nSanta Ana', '2020-07-20 06:51:00', '2020-07-20 06:51:17'),
(5, 'E', 'tur', 'fas fa-envelope', 'example@gmail.com', '2020-07-27 08:26:49', '2020-07-27 08:26:49'),
(6, 'Telefon', 'tur', 'fas fa-phone', '+123 444 5555 \r\n+32413432432', '2020-07-27 08:27:37', '2020-07-27 08:27:37'),
(7, 'Açık saatler', 'tur', 'flaticon-clock', 'Sat - Wed 10AM - 7PM', '2020-07-27 08:28:48', '2020-07-27 08:28:48'),
(8, 'yer', 'tur', 'fas fa-map-marker-alt', '2626 Angie Drive Santa Ana', '2020-07-27 08:29:47', '2020-07-27 08:29:59'),
(9, 'Email', 'sp', 'far fa-envelope', 'example@gmail.com', '2020-07-27 08:31:36', '2020-07-27 08:31:36'),
(10, 'Teléfono', 'sp', 'fas fa-phone', '+123 444 5555 \r\n+32413432432', '2020-07-27 08:32:44', '2020-07-27 08:32:44'),
(11, 'Horarios de apertura', 'sp', 'far fa-clock', 'Sat - Wed 10AM - 7PM', '2020-07-27 08:35:01', '2020-07-27 08:35:01'),
(12, 'Ubicación', 'sp', 'fas fa-map-marker-alt', '2626 Angie Drive Santa Ana', '2020-07-27 08:35:23', '2020-07-27 08:35:23'),
(13, 'البريد الإلكتروني', 'ar', 'far fa-envelope', 'example@gmail.com', '2020-07-27 08:38:31', '2020-07-27 08:38:31'),
(14, 'هاتف', 'ar', 'fas fa-phone', '+123 444 5555 \r\n+32413432432', '2020-07-27 08:39:26', '2020-07-27 08:39:26'),
(15, 'ساعات مفتوحة', 'ar', 'far fa-clock', 'Sat - Wed 10AM - 7PM', '2020-07-27 08:39:57', '2020-07-27 08:39:57'),
(16, 'موقعك', 'ar', 'fas fa-map-marker-alt', '2626 Angie Drive Santa Ana', '2020-07-27 08:41:08', '2020-07-27 08:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `counterups`
--

CREATE TABLE `counterups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counterups`
--

INSERT INTO `counterups` (`id`, `icon`, `number`, `lang`, `title`, `extra_text`, `created_at`, `updated_at`) VALUES
(1, 'far fa-smile', '3700', 'en', 'Happy Customer', 'K+', '2020-07-19 23:43:54', '2020-07-19 23:43:54'),
(2, 'fas fa-download', '2050', 'en', 'Total Downloads', 'K+', '2020-07-19 23:46:28', '2020-07-19 23:46:28'),
(3, 'fas fa-exclamation-triangle', '2050', 'en', 'Awards Won', NULL, '2020-07-19 23:46:51', '2020-07-19 23:48:22'),
(4, 'fas fa-user-check', '387', 'en', 'Total Agents', NULL, '2020-07-19 23:47:58', '2020-07-19 23:47:58'),
(5, 'fas fa-exclamation-triangle', '3700', 'tur', 'Toplam Temsilci', NULL, '2020-07-19 23:48:57', '2020-07-19 23:49:06'),
(6, 'fas fa-award', '387', 'tur', 'Kazanılan Ödüller', NULL, '2020-07-27 05:13:12', '2020-07-27 05:13:12'),
(7, 'fas fa-exclamation-triangle', '4048', 'tur', 'Toplam İndirme', 'K+', '2020-07-27 05:30:07', '2020-07-27 05:32:26'),
(8, 'fas fa-exclamation-triangle', '3700', 'tur', 'Mutlu Müşteri', NULL, '2020-07-27 05:32:08', '2020-07-27 05:32:19'),
(9, 'fas fa-user', '387', 'ar', 'مجموع الوكلاء', NULL, '2020-07-27 05:32:58', '2020-07-27 05:32:58'),
(10, 'fas fa-exclamation-triangle', '2050', 'ar', 'فازت بجوائز', NULL, '2020-07-27 05:33:17', '2020-07-27 05:34:03'),
(11, 'fas fa-exclamation-triangle', '4048', 'ar', 'إجمالي التنزيلات', 'K+', '2020-07-27 05:33:45', '2020-07-27 05:33:55'),
(12, 'fas fa-exclamation-triangle', '3700', 'ar', 'عميل سعيد', NULL, '2020-07-27 05:34:28', '2020-07-27 05:34:50'),
(13, 'fas fa-smile', '4048', 'sp', 'Cliente feliz', NULL, '2020-07-27 05:35:06', '2020-07-27 05:35:06'),
(14, 'fas fa-exclamation-triangle', '4048', 'sp', 'Descargas totales', 'K+', '2020-07-27 05:35:50', '2020-07-27 05:35:59'),
(15, 'fas fa-award', '387', 'sp', 'Premios ganados', NULL, '2020-07-27 05:36:28', '2020-07-27 05:36:28'),
(16, 'fas fa-user', '20', 'sp', 'Agentes totales', NULL, '2020-07-27 05:37:00', '2020-07-27 05:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `donation_content` longtext COLLATE utf8mb4_unicode_ci,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `raised` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_tags` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `slug` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `title`, `donation_content`, `amount`, `raised`, `status`, `image`, `lang`, `meta_tags`, `meta_description`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Bachelor domestic extended doubtful as concerns', '<p>An country demesne message it. An country demesne message it. Bachelor domestic extended doubtful as concerns at. Morning prudent removal an letters by. On could my in order never it. Or excited certain sixteen it to parties colonel. Depending conveying direction has led immediate. Law gate her well bed life feet seen rent. On nature or no except it sussex.&nbsp;</p><p><br></p><p>Suppose end get boy warrant general natural. Delightful met sufficient projection ask. Decisively everything principles if preference do impression of. Preserved oh so difficult repulsive on in household. In what do miss time be. Valley as be appear cannot so by. Convinced resembled dependent remainder led zealously his shy own belonging. Always length letter adieus add number moment she. Promise few compass six several old offices removal parties fat. Concluded rapturous it intention perfectly daughters is as.&nbsp;</p><p><br></p><p>So feel been kept be at gate. Be september it extensive oh concluded of certainty. In read most gate at body held it ever no. Talking justice welcome message inquiry in started of am me. Led own hearted highest visited lasting sir through compass his. Guest tiled he quick by so these trees am. It announcing alteration at surrounded comparison.&nbsp;</p><p><br></p><p>Boy favourable day can introduced sentiments entreaties. Noisier carried of in warrant because. So mr plate seems cause chief widen first. Two differed husbands met screened his. Bed was form wife out ask draw. Wholly coming at we no enable. Offending sir delivered questions now new met. Acceptance she interested new boisterous day discretion celebrated. t. Morning prudent removal an letters by. On could my in order never it. Or excited certain sixteen it to parties colonel. Depending conveying direction has led immediate. Law gate her well bed life feet seen rent. On nature or no except it sussex.&nbsp;</p><p><br></p><p>Suppose end get boy warrant general natural. Delightful met sufficient projection ask. Decisively everything principles if preference do impression of. Preserved oh so difficult repulsive on in household. In what do miss time be. Valley as be appear cannot so by. Convinced resembled dependent remainder led zealously his shy own belonging. Always length letter adieus add number moment she. Promise few compass six several old offices removal parties fat. Concluded rapturous it intention perfectly daughters is as.&nbsp;</p><p><br></p><p>So feel been kept be at gate. Be september it extensive oh concluded of certainty. In read most gate at body held it ever no. Talking justice welcome message inquiry in started of am me. Led own hearted highest visited lasting sir through compass his. Guest tiled he quick by so these trees am. It announcing alteration at surrounded comparison.&nbsp;</p><p><br></p><p>Boy favourable day can introduced sentiments entreaties. Noisier carried of in warrant because. So mr plate seems cause chief widen first. Two differed husbands met screened his. Bed was form wife out ask draw. Wholly coming at we no enable. Offending sir delivered questions now new met. Acceptance she interested new boisterous day discretion celebrated.&nbsp;</p>', '20000', '3305', 'publish', '58', 'en', NULL, NULL, 'bachelor-domestic-extended-doubtful-as-concerns', '2020-07-20 11:34:14', '2021-01-11 08:07:29'),
(2, 'Law gate her well bed life feet seen rent', '<p>An country demesne message it. Bachelor domestic extended doubtful as concerns at. Morning prudent removal an letters by. On could my in order never it. Or excited certain sixteen it to parties colonel. Depending conveying direction has led immediate. Law gate her well bed life feet seen rent. On nature or no except it sussex.&nbsp;</p><p><br></p><p>Suppose end get boy warrant general natural. Delightful met sufficient projection ask. Decisively everything principles if preference do impression of. Preserved oh so difficult repulsive on in household. In what do miss time be. Valley as be appear cannot so by. Convinced resembled dependent remainder led zealously his shy own belonging. Always length letter adieus add number moment she. Promise few compass six several old offices removal parties fat. Concluded rapturous it intention perfectly daughters is as.&nbsp;</p><p><br></p><p>So feel been kept be at gate. Be september it extensive oh concluded of certainty. In read most gate at body held it ever no. Talking justice welcome message inquiry in started of am me. Led own hearted highest visited lasting sir through compass his. Guest tiled he quick by so these trees am. It announcing alteration at surrounded comparison.&nbsp;</p><p><br></p><p>Boy favourable day can introduced sentiments entreaties. Noisier carried of in warrant because. So mr plate seems cause chief widen first. Two differed husbands met screened his. Bed was form wife out ask draw. Wholly coming at we no enable. Offending sir delivered questions now new met. Acceptance she interested new boisterous day discretion celebrated.&nbsp;</p><p><br></p><p>She wholly fat who window extent either formal. Removing welcomed civility or hastened is. Justice elderly but perhaps expense six her are another passage. Full her ten open fond walk not down. For request general express unknown are. He in just mr door body held john down he. So journey greatly or garrets. Draw door kept do so come on open mean. Estimating stimulated how reasonably precaution diminution she simplicity sir but. Questions am sincerity zealously concluded consisted or no gentleman it.&nbsp;</p><p><br></p><p>Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.&nbsp;</p>', '135165', '11355', 'publish', '61', 'en', NULL, NULL, 'law-gate-her-well-bed-life-feet-seen-rent', '2020-07-20 12:05:52', '2021-01-13 20:25:42'),
(3, 'Suppose end get boy warrant general natural', '<p>An country demesne message it. Bachelor domestic extended doubtful as concerns at. Morning prudent removal an letters by. On could my in order never it. Or excited certain sixteen it to parties colonel. Depending conveying direction has led immediate. Law gate her well bed life feet seen rent. On nature or no except it sussex.&nbsp;</p><p><br></p><p>Suppose end get boy warrant general natural. Delightful met sufficient projection ask. Decisively everything principles if preference do impression of. Preserved oh so difficult repulsive on in household. In what do miss time be. Valley as be appear cannot so by. Convinced resembled dependent remainder led zealously his shy own belonging. Always length letter adieus add number moment she. Promise few compass six several old offices removal parties fat. Concluded rapturous it intention perfectly daughters is as.&nbsp;</p><p><br></p><p>So feel been kept be at gate. Be september it extensive oh concluded of certainty. In read most gate at body held it ever no. Talking justice welcome message inquiry in started of am me. Led own hearted highest visited lasting sir through compass his. Guest tiled he quick by so these trees am. It announcing alteration at surrounded comparison.&nbsp;</p><p><br></p><p>Boy favourable day can introduced sentiments entreaties. Noisier carried of in warrant because. So mr plate seems cause chief widen first. Two differed husbands met screened his. Bed was form wife out ask draw. Wholly coming at we no enable. Offending sir delivered questions now new met. Acceptance she interested new boisterous day discretion celebrated.&nbsp;</p><p><br></p><p>She wholly fat who window extent either formal. Removing welcomed civility or hastened is. Justice elderly but perhaps expense six her are another passage. Full her ten open fond walk not down. For request general express unknown are. He in just mr door body held john down he. So journey greatly or garrets. Draw door kept do so come on open mean. Estimating stimulated how reasonably precaution diminution she simplicity sir but. Questions am sincerity zealously concluded consisted or no gentleman it.&nbsp;</p><p><br></p><p>Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.&nbsp;</p>', '684652', '56823', 'publish', '60', 'en', NULL, NULL, 'suppose-end-get-boy-warrant-general-natural', '2020-07-20 12:14:24', '2021-01-13 20:25:57'),
(4, 'Questions am sincerity zealously concluded', '<p>An country demesne message it. Bachelor domestic extended doubtful as concerns at. Morning prudent removal an letters by. On could my in order never it. Or excited certain sixteen it to parties colonel. Depending conveying direction has led immediate. Law gate her well bed life feet seen rent. On nature or no except it sussex.&nbsp;</p><p><br></p><p>Suppose end get boy warrant general natural. Delightful met sufficient projection ask. Decisively everything principles if preference do impression of. Preserved oh so difficult repulsive on in household. In what do miss time be. Valley as be appear cannot so by. Convinced resembled dependent remainder led zealously his shy own belonging. Always length letter adieus add number moment she. Promise few compass six several old offices removal parties fat. Concluded rapturous it intention perfectly daughters is as.&nbsp;</p><p><br></p><p>So feel been kept be at gate. Be september it extensive oh concluded of certainty. In read most gate at body held it ever no. Talking justice welcome message inquiry in started of am me. Led own hearted highest visited lasting sir through compass his. Guest tiled he quick by so these trees am. It announcing alteration at surrounded comparison.&nbsp;</p><p><br></p><p>Boy favourable day can introduced sentiments entreaties. Noisier carried of in warrant because. So mr plate seems cause chief widen first. Two differed husbands met screened his. Bed was form wife out ask draw. Wholly coming at we no enable. Offending sir delivered questions now new met. Acceptance she interested new boisterous day discretion celebrated.&nbsp;</p><p><br></p><p>She wholly fat who window extent either formal. Removing welcomed civility or hastened is. Justice elderly but perhaps expense six her are another passage. Full her ten open fond walk not down. For request general express unknown are. He in just mr door body held john down he. So journey greatly or garrets. Draw door kept do so come on open mean. Estimating stimulated how reasonably precaution diminution she simplicity sir but. Questions am sincerity zealously concluded consisted or no gentleman it.&nbsp;</p><p><br></p><p>Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.&nbsp;</p>', '50000', '9004', 'publish', '59', 'en', NULL, NULL, 'questions-am-sincerity-zealously-concluded', '2020-07-20 12:19:12', '2021-01-11 00:25:47'),
(5, 'Guest tiled he quick by so these trees am', '<p>An country demesne message it. Bachelor domestic extended doubtful as concerns at. Morning prudent removal an letters by. On could my in order never it. Or excited certain sixteen it to parties colonel. Depending conveying direction has led immediate. Law gate her well bed life feet seen rent. On nature or no except it sussex.&nbsp;</p><p><br></p><p>Suppose end get boy warrant general natural. Delightful met sufficient projection ask. Decisively everything principles if preference do impression of. Preserved oh so difficult repulsive on in household. In what do miss time be. Valley as be appear cannot so by. Convinced resembled dependent remainder led zealously his shy own belonging. Always length letter adieus add number moment she. Promise few compass six several old offices removal parties fat. Concluded rapturous it intention perfectly daughters is as.&nbsp;</p><p><br></p><p>So feel been kept be at gate. Be september it extensive oh concluded of certainty. In read most gate at body held it ever no. Talking justice welcome message inquiry in started of am me. Led own hearted highest visited lasting sir through compass his. Guest tiled he quick by so these trees am. It announcing alteration at surrounded comparison.&nbsp;</p><p><br></p><p>Boy favourable day can introduced sentiments entreaties. Noisier carried of in warrant because. So mr plate seems cause chief widen first. Two differed husbands met screened his. Bed was form wife out ask draw. Wholly coming at we no enable. Offending sir delivered questions now new met. Acceptance she interested new boisterous day discretion celebrated.&nbsp;</p><p><br></p><p>She wholly fat who window extent either formal. Removing welcomed civility or hastened is. Justice elderly but perhaps expense six her are another passage. Full her ten open fond walk not down. For request general express unknown are. He in just mr door body held john down he. So journey greatly or garrets. Draw door kept do so come on open mean. Estimating stimulated how reasonably precaution diminution she simplicity sir but. Questions am sincerity zealously concluded consisted or no gentleman it.&nbsp;</p><p><br></p><p>Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.&nbsp;</p>', '345685', '34784', 'publish', '55', 'en', NULL, NULL, 'guest-tiled-he-quick-by-so-these-trees-am', '2020-07-20 12:19:22', '2021-01-13 20:25:52'),
(6, 'Talking justice welcome message inquiry in started', '<p>An country demesne message it. Bachelor domestic extended doubtful as concerns at. Morning prudent removal an letters by. On could my in order never it. Or excited certain sixteen it to parties colonel. Depending conveying direction has led immediate. Law gate her well bed life feet seen rent. On nature or no except it sussex.&nbsp;</p><p><br></p><p>Suppose end get boy warrant general natural. Delightful met sufficient projection ask. Decisively everything principles if preference do impression of. Preserved oh so difficult repulsive on in household. In what do miss time be. Valley as be appear cannot so by. Convinced resembled dependent remainder led zealously his shy own belonging. Always length letter adieus add number moment she. Promise few compass six several old offices removal parties fat. Concluded rapturous it intention perfectly daughters is as.&nbsp;</p><p><br></p><p>So feel been kept be at gate. Be september it extensive oh concluded of certainty. In read most gate at body held it ever no. Talking justice welcome message inquiry in started of am me. Led own hearted highest visited lasting sir through compass his. Guest tiled he quick by so these trees am. It announcing alteration at surrounded comparison.&nbsp;</p><p><br></p><p>Boy favourable day can introduced sentiments entreaties. Noisier carried of in warrant because. So mr plate seems cause chief widen first. Two differed husbands met screened his. Bed was form wife out ask draw. Wholly coming at we no enable. Offending sir delivered questions now new met. Acceptance she interested new boisterous day discretion celebrated.&nbsp;</p><p><br></p><p>She wholly fat who window extent either formal. Removing welcomed civility or hastened is. Justice elderly but perhaps expense six her are another passage. Full her ten open fond walk not down. For request general express unknown are. He in just mr door body held john down he. So journey greatly or garrets. Draw door kept do so come on open mean. Estimating stimulated how reasonably precaution diminution she simplicity sir but. Questions am sincerity zealously concluded consisted or no gentleman it.&nbsp;</p><p><br></p><p>Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.&nbsp;</p>', '50000', '8895', 'publish', '56', 'en', NULL, NULL, 'talking-justice-welcome-message-inquiry-in-started', '2020-07-20 12:19:32', '2021-01-11 14:28:03'),
(7, 'Konuşan adalet karşılama mesajı sorgusu başladı', '<p>Bir ülke mesajını demesne. Yurtiçi lisans endişeli olarak şüpheli uzattı. Sabah ihtiyatlı bir mektup kaldırma. Açık asla sırayla olabilir. Ya da on altı kişiyi albaylara heyecanlandırdı. Taşıma yönüne bağlı olarak anında yol açtı. Kanun kapısı onun yatak hayatı ayak kira görüldü. Doğa üzerinde ya da hayır sussex dışında.</p><p><br></p><p>Diyelim ki çocuk doğal emri al. Keyifli yeterli projeksiyon istendi. Kesinlikle her şey ilkeleri tercih izlenim yapmak. Evde çok zor itici korunmuş. Ne zaman özlüyorum. Valley göründüğü gibi olamaz. İkna olmuş bağımlı bağımlı kalıntı, utangaç kendi aidiyetini gayretle yönlendirdi. Her zaman uzunluk mektup adieus o an ekleyin. Söz birkaç az pusula altı birkaç eski ofis kaldırma partileri yağ. Sonuçta mükemmel kızları niyeti sonlandırdı.</p><p><br></p><p>Yani kapıda kalmak hissediyorum. Eylül geniş olsun oh kesinlik. Vücutta çoğu kapıyı okurken hiç hayır tuttu. Konuşan adalet karşılama mesajı sorgulaması başladım. Led kendi yürekli en yüksek ziyaret kalıcı efendim onun pusula aracılığıyla. Konuk bu ağaçlar tarafından hızlı o tarafından döşeli. Çevrili karşılaştırmada değişiklik olduğunu duyuruyor.</p><p><br></p><p>Çocuk olumlu gün duyguları entreaties tanıtılabilir. Çünkü Gürültü emriyle taşındı. Yani Bay Plate, önce şefin genişlemesine neden görünüyor. İki farklı koca bir araya geldi. Yatak formu eşi dışarı sormak beraberlik oldu. Tamamen geliyor biz etkinleştirmek. Rahatsız edici efendim soruları şimdi yeni bir araya geldi. Kabul ettiği yeni gürültülü gün takdirini kutladı.</p><p><br></p><p>Tamamen şişman kim pencere boyutu resmi. Memnuniyetli uygarlığı veya aceleyi ortadan kaldırmak. Adalet yaşlı ama belki onun altı gider başka bir geçit vardır. Onun açık düşkün on yürüyüş aşağı dolu değil. İstek için genel ifade bilinmeyen vardır. O sadece kapı gövdesinde john\'u aşağı tuttu. Yani büyük yolculuk ya da garrets. Beraberlik kapı tutulur yani açık demek. Tahmin etmek o sadelik ne kadar makul önlem azaltma efendim ama. Sorular samimiyet gayretle sonuçlandırılmış ya da hiç beyefendi yok.</p><p><br></p><p>Sürpriz dik dik tekrarlanan ev sahibi mr gezdi miktar. Devam ediyor devonshire ama bunu düşündü. Gül geçmiş oh o çatı çatı şarkı temiz. Arkadaş bahçe bir merak yapmak daha iyi övgü bağlıdır. Niyet yaşı başka türlü ama kahvaltı. Bahçe etrafında ötesinde tarafından.</p>', '50000', NULL, 'publish', '64', 'tur', NULL, NULL, 'konusan-adalet-karsilama-mesaji-sorgusu-basladi', '2020-07-20 12:41:55', '2020-07-20 22:42:07'),
(8, 'الحديث يتحدث العدالة ترحيب رسالة بدأ في', '<p>رسالة بلد demesne. مددت البكالوريوس المحلي المشكوك فيه في المخاوف. الصباح الحذر إزالة الرسائل من قبل. هل يمكن لي في الأمر أبدا. أو أثارت معينة ستة عشر لحزب العقيد. اعتماد اتجاه النقل أدى على الفور. بوابة القانون لها سرير حياة جيدة رأيت الإيجار. على الطبيعة أو لا إلا ساسكس.</p><p><br></p><p>لنفترض أن نهاية الحصول على صبي تتطلب الطبيعية العامة. سار التقى الإسقاط كافية نسأل. حاسم كل شيء مبادئ إذا كان التفضيل يعطي الانطباع. محفوظ أوه صعب جدا في المنزل. في ما يضيع الوقت يكون. الوادي كما يبدو لا يمكن ذلك. أدى الباقي المقنع المشابه المقنع بحماس إلى انتمائه الخجول. دائما طول الرسالة adieus تضيف الرقم لحظة. وعد بوصلات قليلة ستة مكاتب إزالة العديد من المكاتب القديمة الدهون. اختتمت بنتيجة طائشة أنها نية تمامًا البنات كما هي.</p><p><br></p><p>لذلك شعرت أنه تم إبقائك عند البوابة. كن سبتمًا كبيرًا يا خلص اليقين. في قراءة معظم البوابة في الجسم عقدها من أي وقت مضى لا. الحديث عن العدالة نرحب رسالة الاستفسار بدأت أنا. قاد قلب خاص أعلى زيارة دائمة من خلال بوصلة له. قرّب الضيف أنه سريع بهذه الأشجار. تعلن عن تغيير في المقارنة المحاطة.</p><p><br></p><p>يمكن يوم الصبي المواتية إدخال التوسل المشاعر. حملت Noisier في مذكرة لأن. لذا يبدو أن السيد السيد يتسبب في توسيع الرئيس أولاً. التقى زوجان مختلفان. كان السرير من الزوجة على شكل اسال. يأتي بالكامل ونحن لا نستطيع. يا سيدي المسيئة سلمت الأسئلة الجديدة التقى الآن. قبول أنها مهتمة بتقدير يوم صاخب جديد احتفل.</p><p><br></p><p>انها سمينه بالكامل من مدى إما رسمي. إزالة الكياسة المرحب بها أو التعجل. العدالة المسنين ولكن ربما حسابها ستة هي ممر آخر. ممتلئًا بالمشي العشر المفتوح. لطلب عام صريحة غير معروفة هي. هو في مجرد باب السيد عقد جون عليه. لذلك رحلة كبيرة أو الثوم. ابق باب السحب افعل ذلك بمتوسط ​​مفتوح. حفز تقدير كيف أن التقليل من الاحتياطات المعقولة يا سيدي البساطة ولكن. الأسئلة التي انتهى إليها الصدق بحماس تألفت أو لم يكن لها أيها السادة.</p><p><br></p><p>مفاجأة حادة السيد المالك تجولت بلغت. استمرار ديفونشاير لكنه اعتبره. ارتفع الماضي يا سقف عرض هو أنيق. هل تعتمد على الثناء أفضل تفعل حديقة صديق عجب. نية العمر لا خلاف ذلك الافطار. حول الحديقة إلى أبعد حد.</p>', '50000', NULL, 'publish', '58', 'ar', NULL, NULL, 'alhdyth-ythdth-alaadal-trhyb-rsal-bda-fy', '2020-07-20 12:42:18', '2020-07-20 22:51:32'),
(9, 'Yurtiçi lisans endişeli olarak şüpheli uzattı', '<p>Bir ülke mesajını demesne. Yurtiçi lisans endişeli olarak şüpheli uzattı. Sabah ihtiyatlı bir mektup kaldırma. Açık asla sırayla olabilir. Ya da on altı kişiyi albaylara heyecanlandırdı. Taşıma yönüne bağlı olarak anında yol açtı. Kanun kapısı onun yatak hayatı ayak kira görüldü. Doğa üzerinde ya da hayır sussex dışında.</p><p><br></p><p>Diyelim ki çocuk doğal emri al. Keyifli yeterli projeksiyon istendi. Kesinlikle her şey ilkeleri tercih izlenim yapmak. Evde çok zor itici korunmuş. Ne zaman özlüyorum. Valley göründüğü gibi olamaz. İkna olmuş bağımlı bağımlı kalıntı, utangaç kendi aidiyetini gayretle yönlendirdi. Her zaman uzunluk mektup adieus o an ekleyin. Söz birkaç az pusula altı birkaç eski ofis kaldırma partileri yağ. Sonuçta mükemmel kızları niyeti sonlandırdı.</p><p><br></p><p>Yani kapıda kalmak hissediyorum. Eylül geniş olsun oh kesinlik. Vücutta çoğu kapıyı okurken hiç hayır tuttu. Konuşan adalet karşılama mesajı sorgulaması başladım. Led kendi yürekli en yüksek ziyaret kalıcı efendim onun pusula aracılığıyla. Konuk bu ağaçlar tarafından hızlı o tarafından döşeli. Çevrili karşılaştırmada değişiklik olduğunu duyuruyor.</p><p><br></p><p>Çocuk olumlu gün duyguları entreaties tanıtılabilir. Çünkü Gürültü emriyle taşındı. Yani Bay Plate, önce şefin genişlemesine neden görünüyor. İki farklı koca bir araya geldi. Yatak formu eşi dışarı sormak beraberlik oldu. Tamamen geliyor biz etkinleştirmek. Rahatsız edici efendim soruları şimdi yeni bir araya geldi. Kabul ettiği yeni gürültülü gün takdirini kutladı.</p><p><br></p><p>Tamamen şişman kim pencere boyutu resmi. Memnuniyetli uygarlığı veya aceleyi ortadan kaldırmak. Adalet yaşlı ama belki onun altı gider başka bir geçit vardır. Onun açık düşkün on yürüyüş aşağı dolu değil. İstek için genel ifade bilinmeyen vardır. O sadece kapı gövdesinde john\'u aşağı tuttu. Yani büyük yolculuk ya da garrets. Beraberlik kapı tutulur yani açık demek. Tahmin etmek o sadelik ne kadar makul önlem azaltma efendim ama. Sorular samimiyet gayretle sonuçlandırılmış ya da hiç beyefendi yok.</p><p><br></p><p>Sürpriz dik dik tekrarlanan ev sahibi mr gezdi miktar. Devam ediyor devonshire ama bunu düşündü. Gül geçmiş oh o çatı çatı şarkı temiz. Arkadaş bahçe bir merak yapmak daha iyi övgü bağlıdır. Niyet yaşı başka türlü ama kahvaltı. Bahçe etrafında ötesinde tarafından.</p>', '50000', NULL, 'publish', '62', 'tur', NULL, NULL, 'yurtici-lisans-endiseli-olarak-supheli-uzatti', '2020-07-20 22:45:03', '2020-07-20 22:46:02'),
(10, 'Taşıma yönüne bağlı olarak anında yol açtı', '<p>Bir ülke mesajını demesne. Yurtiçi lisans endişeli olarak şüpheli uzattı. Sabah ihtiyatlı bir mektup kaldırma. Açık asla sırayla olabilir. Ya da on altı kişiyi albaylara heyecanlandırdı. Taşıma yönüne bağlı olarak anında yol açtı. Kanun kapısı onun yatak hayatı ayak kira görüldü. Doğa üzerinde ya da hayır sussex dışında.</p><p><br></p><p>Diyelim ki çocuk doğal emri al. Keyifli yeterli projeksiyon istendi. Kesinlikle her şey ilkeleri tercih izlenim yapmak. Evde çok zor itici korunmuş. Ne zaman özlüyorum. Valley göründüğü gibi olamaz. İkna olmuş bağımlı bağımlı kalıntı, utangaç kendi aidiyetini gayretle yönlendirdi. Her zaman uzunluk mektup adieus o an ekleyin. Söz birkaç az pusula altı birkaç eski ofis kaldırma partileri yağ. Sonuçta mükemmel kızları niyeti sonlandırdı.</p><p><br></p><p>Yani kapıda kalmak hissediyorum. Eylül geniş olsun oh kesinlik. Vücutta çoğu kapıyı okurken hiç hayır tuttu. Konuşan adalet karşılama mesajı sorgulaması başladım. Led kendi yürekli en yüksek ziyaret kalıcı efendim onun pusula aracılığıyla. Konuk bu ağaçlar tarafından hızlı o tarafından döşeli. Çevrili karşılaştırmada değişiklik olduğunu duyuruyor.</p><p><br></p><p>Çocuk olumlu gün duyguları entreaties tanıtılabilir. Çünkü Gürültü emriyle taşındı. Yani Bay Plate, önce şefin genişlemesine neden görünüyor. İki farklı koca bir araya geldi. Yatak formu eşi dışarı sormak beraberlik oldu. Tamamen geliyor biz etkinleştirmek. Rahatsız edici efendim soruları şimdi yeni bir araya geldi. Kabul ettiği yeni gürültülü gün takdirini kutladı.</p><p><br></p><p>Tamamen şişman kim pencere boyutu resmi. Memnuniyetli uygarlığı veya aceleyi ortadan kaldırmak. Adalet yaşlı ama belki onun altı gider başka bir geçit vardır. Onun açık düşkün on yürüyüş aşağı dolu değil. İstek için genel ifade bilinmeyen vardır. O sadece kapı gövdesinde john\'u aşağı tuttu. Yani büyük yolculuk ya da garrets. Beraberlik kapı tutulur yani açık demek. Tahmin etmek o sadelik ne kadar makul önlem azaltma efendim ama. Sorular samimiyet gayretle sonuçlandırılmış ya da hiç beyefendi yok.</p><p><br></p><p>Sürpriz dik dik tekrarlanan ev sahibi mr gezdi miktar. Devam ediyor devonshire ama bunu düşündü. Gül geçmiş oh o çatı çatı şarkı temiz. Arkadaş bahçe bir merak yapmak daha iyi övgü bağlıdır. Niyet yaşı başka türlü ama kahvaltı. Bahçe etrafında ötesinde tarafından.</p>', '50000', NULL, 'publish', '61', 'tur', NULL, NULL, 'tasima-yonune-bagli-olarak-aninda-yol-acti', '2020-07-20 22:46:09', '2020-07-20 22:46:41'),
(11, 'Kesinlikle her şey ilkeleri tercih izlenim yapmak', '<p>Bir ülke mesajını demesne. Yurtiçi lisans endişeli olarak şüpheli uzattı. Sabah ihtiyatlı bir mektup kaldırma. Açık asla sırayla olabilir. Ya da on altı kişiyi albaylara heyecanlandırdı. Taşıma yönüne bağlı olarak anında yol açtı. Kanun kapısı onun yatak hayatı ayak kira görüldü. Doğa üzerinde ya da hayır sussex dışında.</p><p><br></p><p>Diyelim ki çocuk doğal emri al. Keyifli yeterli projeksiyon istendi. Kesinlikle her şey ilkeleri tercih izlenim yapmak. Evde çok zor itici korunmuş. Ne zaman özlüyorum. Valley göründüğü gibi olamaz. İkna olmuş bağımlı bağımlı kalıntı, utangaç kendi aidiyetini gayretle yönlendirdi. Her zaman uzunluk mektup adieus o an ekleyin. Söz birkaç az pusula altı birkaç eski ofis kaldırma partileri yağ. Sonuçta mükemmel kızları niyeti sonlandırdı.</p><p><br></p><p>Yani kapıda kalmak hissediyorum. Eylül geniş olsun oh kesinlik. Vücutta çoğu kapıyı okurken hiç hayır tuttu. Konuşan adalet karşılama mesajı sorgulaması başladım. Led kendi yürekli en yüksek ziyaret kalıcı efendim onun pusula aracılığıyla. Konuk bu ağaçlar tarafından hızlı o tarafından döşeli. Çevrili karşılaştırmada değişiklik olduğunu duyuruyor.</p><p><br></p><p>Çocuk olumlu gün duyguları entreaties tanıtılabilir. Çünkü Gürültü emriyle taşındı. Yani Bay Plate, önce şefin genişlemesine neden görünüyor. İki farklı koca bir araya geldi. Yatak formu eşi dışarı sormak beraberlik oldu. Tamamen geliyor biz etkinleştirmek. Rahatsız edici efendim soruları şimdi yeni bir araya geldi. Kabul ettiği yeni gürültülü gün takdirini kutladı.</p><p><br></p><p>Tamamen şişman kim pencere boyutu resmi. Memnuniyetli uygarlığı veya aceleyi ortadan kaldırmak. Adalet yaşlı ama belki onun altı gider başka bir geçit vardır. Onun açık düşkün on yürüyüş aşağı dolu değil. İstek için genel ifade bilinmeyen vardır. O sadece kapı gövdesinde john\'u aşağı tuttu. Yani büyük yolculuk ya da garrets. Beraberlik kapı tutulur yani açık demek. Tahmin etmek o sadelik ne kadar makul önlem azaltma efendim ama. Sorular samimiyet gayretle sonuçlandırılmış ya da hiç beyefendi yok.</p><p><br></p><p>Sürpriz dik dik tekrarlanan ev sahibi mr gezdi miktar. Devam ediyor devonshire ama bunu düşündü. Gül geçmiş oh o çatı çatı şarkı temiz. Arkadaş bahçe bir merak yapmak daha iyi övgü bağlıdır. Niyet yaşı başka türlü ama kahvaltı. Bahçe etrafında ötesinde tarafından.</p>', '50000', NULL, 'publish', '60', 'tur', NULL, NULL, 'kesinlikle-her-sey-ilkeleri-tercih-izlenim-yapmak', '2020-07-20 22:46:47', '2020-07-20 22:47:22'),
(12, 'أعطوا سيدة أنهم متأكدون من ذلك', '<p>رسالة بلد demesne. مددت البكالوريوس المحلي المشكوك فيه في المخاوف. الصباح الحذر إزالة الرسائل من قبل. هل يمكن لي في الأمر أبدا. أو أثارت معينة ستة عشر لحزب العقيد. اعتماد اتجاه النقل أدى على الفور. بوابة القانون لها سرير حياة جيدة رأيت الإيجار. على الطبيعة أو لا إلا ساسكس.</p><p><br></p><p>لنفترض أن نهاية الحصول على صبي تتطلب الطبيعية العامة. سار التقى الإسقاط كافية نسأل. حاسم كل شيء مبادئ إذا كان التفضيل يعطي الانطباع. محفوظ أوه صعب جدا في المنزل. في ما يضيع الوقت يكون. الوادي كما يبدو لا يمكن ذلك. أدى الباقي المقنع المشابه المقنع بحماس إلى انتمائه الخجول. دائما طول الرسالة adieus تضيف الرقم لحظة. وعد بوصلات قليلة ستة مكاتب إزالة العديد من المكاتب القديمة الدهون. اختتمت بنتيجة طائشة أنها نية تمامًا البنات كما هي.</p><p><br></p><p>لذلك شعرت أنه تم إبقائك عند البوابة. كن سبتمًا كبيرًا يا خلص اليقين. في قراءة معظم البوابة في الجسم عقدها من أي وقت مضى لا. الحديث عن العدالة نرحب رسالة الاستفسار بدأت أنا. قاد قلب خاص أعلى زيارة دائمة من خلال بوصلة له. قرّب الضيف أنه سريع بهذه الأشجار. تعلن عن تغيير في المقارنة المحاطة.</p><p><br></p><p>يمكن يوم الصبي المواتية إدخال التوسل المشاعر. حملت Noisier في مذكرة لأن. لذا يبدو أن السيد السيد يتسبب في توسيع الرئيس أولاً. التقى زوجان مختلفان. كان السرير من الزوجة على شكل اسال. يأتي بالكامل ونحن لا نستطيع. يا سيدي المسيئة سلمت الأسئلة الجديدة التقى الآن. قبول أنها مهتمة بتقدير يوم صاخب جديد احتفل.</p><p><br></p><p>انها سمينه بالكامل من مدى إما رسمي. إزالة الكياسة المرحب بها أو التعجل. العدالة المسنين ولكن ربما حسابها ستة هي ممر آخر. ممتلئًا بالمشي العشر المفتوح. لطلب عام صريحة غير معروفة هي. هو في مجرد باب السيد عقد جون عليه. لذلك رحلة كبيرة أو الثوم. ابق باب السحب افعل ذلك بمتوسط ​​مفتوح. حفز تقدير كيف أن التقليل من الاحتياطات المعقولة يا سيدي البساطة ولكن. الأسئلة التي انتهى إليها الصدق بحماس تألفت أو لم يكن لها أيها السادة.</p><p><br></p><p>مفاجأة حادة السيد المالك تجولت بلغت. استمرار ديفونشاير لكنه اعتبره. ارتفع الماضي يا سقف عرض هو أنيق. هل تعتمد على الثناء أفضل تفعل حديقة صديق عجب. نية العمر لا خلاف ذلك الافطار. حول الحديقة إلى أبعد حد.</p>', '50000', NULL, 'publish', '59', 'ar', NULL, NULL, 'aaatoa-syd-anhm-mtakdon-mn-thlk', '2020-07-20 22:52:27', '2020-07-20 22:53:12'),
(13, 'شرح لي الواردة تعليمي', '<p>رسالة بلد demesne. مددت البكالوريوس المحلي المشكوك فيه في المخاوف. الصباح الحذر إزالة الرسائل من قبل. هل يمكن لي في الأمر أبدا. أو أثارت معينة ستة عشر لحزب العقيد. اعتماد اتجاه النقل أدى على الفور. بوابة القانون لها سرير حياة جيدة رأيت الإيجار. على الطبيعة أو لا إلا ساسكس.</p><p><br></p><p>لنفترض أن نهاية الحصول على صبي تتطلب الطبيعية العامة. سار التقى الإسقاط كافية نسأل. حاسم كل شيء مبادئ إذا كان التفضيل يعطي الانطباع. محفوظ أوه صعب جدا في المنزل. في ما يضيع الوقت يكون. الوادي كما يبدو لا يمكن ذلك. أدى الباقي المقنع المشابه المقنع بحماس إلى انتمائه الخجول. دائما طول الرسالة adieus تضيف الرقم لحظة. وعد بوصلات قليلة ستة مكاتب إزالة العديد من المكاتب القديمة الدهون. اختتمت بنتيجة طائشة أنها نية تمامًا البنات كما هي.</p><p><br></p><p>لذلك شعرت أنه تم إبقائك عند البوابة. كن سبتمًا كبيرًا يا خلص اليقين. في قراءة معظم البوابة في الجسم عقدها من أي وقت مضى لا. الحديث عن العدالة نرحب رسالة الاستفسار بدأت أنا. قاد قلب خاص أعلى زيارة دائمة من خلال بوصلة له. قرّب الضيف أنه سريع بهذه الأشجار. تعلن عن تغيير في المقارنة المحاطة.</p><p><br></p><p>يمكن يوم الصبي المواتية إدخال التوسل المشاعر. حملت Noisier في مذكرة لأن. لذا يبدو أن السيد السيد يتسبب في توسيع الرئيس أولاً. التقى زوجان مختلفان. كان السرير من الزوجة على شكل اسال. يأتي بالكامل ونحن لا نستطيع. يا سيدي المسيئة سلمت الأسئلة الجديدة التقى الآن. قبول أنها مهتمة بتقدير يوم صاخب جديد احتفل.</p><p><br></p><p>انها سمينه بالكامل من مدى إما رسمي. إزالة الكياسة المرحب بها أو التعجل. العدالة المسنين ولكن ربما حسابها ستة هي ممر آخر. ممتلئًا بالمشي العشر المفتوح. لطلب عام صريحة غير معروفة هي. هو في مجرد باب السيد عقد جون عليه. لذلك رحلة كبيرة أو الثوم. ابق باب السحب افعل ذلك بمتوسط ​​مفتوح. حفز تقدير كيف أن التقليل من الاحتياطات المعقولة يا سيدي البساطة ولكن. الأسئلة التي انتهى إليها الصدق بحماس تألفت أو لم يكن لها أيها السادة.</p><p><br></p><p>مفاجأة حادة السيد المالك تجولت بلغت. استمرار ديفونشاير لكنه اعتبره. ارتفع الماضي يا سقف عرض هو أنيق. هل تعتمد على الثناء أفضل تفعل حديقة صديق عجب. نية العمر لا خلاف ذلك الافطار. حول الحديقة إلى أبعد حد.</p>', '50000', '50', 'publish', '60', 'ar', NULL, NULL, 'shrh-ly-aloard-taalymy', '2020-07-20 22:53:23', '2020-07-31 18:38:00'),
(14, 'أوضح إدراك تحديد المغادرة لم تتم مصادرته', '<p>رسالة بلد demesne. مددت البكالوريوس المحلي المشكوك فيه في المخاوف. الصباح الحذر إزالة الرسائل من قبل. هل يمكن لي في الأمر أبدا. أو أثارت معينة ستة عشر لحزب العقيد. اعتماد اتجاه النقل أدى على الفور. بوابة القانون لها سرير حياة جيدة رأيت الإيجار. على الطبيعة أو لا إلا ساسكس.</p><p><br></p><p>لنفترض أن نهاية الحصول على صبي تتطلب الطبيعية العامة. سار التقى الإسقاط كافية نسأل. حاسم كل شيء مبادئ إذا كان التفضيل يعطي الانطباع. محفوظ أوه صعب جدا في المنزل. في ما يضيع الوقت يكون. الوادي كما يبدو لا يمكن ذلك. أدى الباقي المقنع المشابه المقنع بحماس إلى انتمائه الخجول. دائما طول الرسالة adieus تضيف الرقم لحظة. وعد بوصلات قليلة ستة مكاتب إزالة العديد من المكاتب القديمة الدهون. اختتمت بنتيجة طائشة أنها نية تمامًا البنات كما هي.</p><p><br></p><p>لذلك شعرت أنه تم إبقائك عند البوابة. كن سبتمًا كبيرًا يا خلص اليقين. في قراءة معظم البوابة في الجسم عقدها من أي وقت مضى لا. الحديث عن العدالة نرحب رسالة الاستفسار بدأت أنا. قاد قلب خاص أعلى زيارة دائمة من خلال بوصلة له. قرّب الضيف أنه سريع بهذه الأشجار. تعلن عن تغيير في المقارنة المحاطة.</p><p><br></p><p>يمكن يوم الصبي المواتية إدخال التوسل المشاعر. حملت Noisier في مذكرة لأن. لذا يبدو أن السيد السيد يتسبب في توسيع الرئيس أولاً. التقى زوجان مختلفان. كان السرير من الزوجة على شكل اسال. يأتي بالكامل ونحن لا نستطيع. يا سيدي المسيئة سلمت الأسئلة الجديدة التقى الآن. قبول أنها مهتمة بتقدير يوم صاخب جديد احتفل.</p><p><br></p><p>انها سمينه بالكامل من مدى إما رسمي. إزالة الكياسة المرحب بها أو التعجل. العدالة المسنين ولكن ربما حسابها ستة هي ممر آخر. ممتلئًا بالمشي العشر المفتوح. لطلب عام صريحة غير معروفة هي. هو في مجرد باب السيد عقد جون عليه. لذلك رحلة كبيرة أو الثوم. ابق باب السحب افعل ذلك بمتوسط ​​مفتوح. حفز تقدير كيف أن التقليل من الاحتياطات المعقولة يا سيدي البساطة ولكن. الأسئلة التي انتهى إليها الصدق بحماس تألفت أو لم يكن لها أيها السادة.</p><p><br></p><p>مفاجأة حادة السيد المالك تجولت بلغت. استمرار ديفونشاير لكنه اعتبره. ارتفع الماضي يا سقف عرض هو أنيق. هل تعتمد على الثناء أفضل تفعل حديقة صديق عجب. نية العمر لا خلاف ذلك الافطار. حول الحديقة إلى أبعد حد.</p>', '50000', NULL, 'publish', '61', 'ar', NULL, NULL, 'aodh-adrak-thdyd-almghadr-lm-ttm-msadrth', '2020-07-20 22:54:03', '2020-07-20 22:54:35'),
(15, 'Hablando de justicia mensaje de bienvenida consulta en comenzó', '<p>Un mensaje de país lo dice. Licenciatura nacional extendida dudosa como preocupaciones en. Mañana prudente eliminación de una carta por. En podría mi en orden nunca lo. O excitado cierto dieciséis para fiestas coronel. Dependiendo de la dirección de transporte ha llevado de inmediato. Law cerró su pozo, la vida, la vida, los pies vistos como renta. En la naturaleza o no, excepto en sussex.</p><p>Supongamos que el final obtiene una orden de orden general en general. Encantador cumplió suficiente proyección preguntar. Decididamente todo principios si la preferencia hace impresión de. Conservado oh tan difícil repulsivo en el hogar. ¿En qué se perderá el tiempo? El valle como parece no puede ser así. Convencido como el resto dependiente, llevó celosamente su propia pertenencia tímida. Siempre longitud letra adieus agregar número momento ella. Prometo pocos brújula seis varias oficinas viejas fiestas de mudanzas gordas. Concluido entusiasta, su intención es perfectamente perfecta.</p><p>Así que siéntete guardado en la puerta. Sé septiembre extenso oh concluido de certeza. En lectura, la mayoría de las puertas en el cuerpo lo sostuvieron nunca. Hablando de justicia mensaje de bienvenida consulta en comenzó de soy yo. Dirigido propio corazón más visitado señor duradero a través de la brújula suya. Guest lo embaldosó rápidamente, así que estos árboles son. Anuncia alteración en la comparación rodeada.</p><p>Niño día favorable puede introducir sentimientos súplicas. Ruido llevado en orden de arresto porque. Entonces, Mr Plate parece que el jefe se ensancha primero. Dos maridos diferentes se encontraron con el suyo. La cama estaba fuera de la esposa, pide dibujar. Totalmente viniendo a nosotros no lo habilitamos. Señor ofensor entregó preguntas ahora nuevas se reunieron. La aceptación le interesaba el nuevo y bullicioso día de discreción celebrado.</p><p>Ella completamente gorda que la ventana de extensión, ya sea formal. La eliminación de civilidad bienvenida o acelerada es. Justicia de edad avanzada, pero tal vez el gasto de seis son otro pasaje. Llena sus diez caricias abiertas, no baja. Por solicitud general expresa desconocida son. Él justo en el cuerpo de la puerta del señor sostuvo a John sobre él. Entonces viaje mucho o buhardillas. Dibujar puerta mantenida, así que vamos en la media abierta. Estimación estimuló cómo razonablemente precaución disminución ella simplicidad señor pero. Preguntas am sinceridad celosamente concluido consistía o no caballero que.</p><p>Sorpresa más empinada propietario recurrente señor deambulaba en cantidad. Continuando Devonshire pero consideró su. Rose pasado oh shew roof es una canción ordenada. Depende mejor alabanza hacer amigo jardín una maravilla. Intención de edad, no lo contrario, pero el desayuno. Alrededor del jardín más allá hasta cierto punto.</p>', '50000', NULL, 'publish', '58', 'sp', NULL, NULL, 'hablando-de-justicia-mensaje-de-bienvenida-consulta-en-comenzo', '2020-07-20 22:55:06', '2020-07-20 22:56:06'),
(16, 'Licenciatura nacional extendida dudosa como preocupaciones', '<p>Un mensaje de país lo dice. Licenciatura nacional extendida dudosa como preocupaciones en. Mañana prudente eliminación de una carta por. En podría mi en orden nunca lo. O excitado cierto dieciséis para fiestas coronel. Dependiendo de la dirección de transporte ha llevado de inmediato. Law cerró su pozo, la vida, la vida, los pies vistos como renta. En la naturaleza o no, excepto en sussex.</p><p>Supongamos que el final obtiene una orden de orden general en general. Encantador cumplió suficiente proyección preguntar. Decididamente todo principios si la preferencia hace impresión de. Conservado oh tan difícil repulsivo en el hogar. ¿En qué se perderá el tiempo? El valle como parece no puede ser así. Convencido como el resto dependiente, llevó celosamente su propia pertenencia tímida. Siempre longitud letra adieus agregar número momento ella. Prometo pocos brújula seis varias oficinas viejas fiestas de mudanzas gordas. Concluido entusiasta, su intención es perfectamente perfecta.</p><p>Así que siéntete guardado en la puerta. Sé septiembre extenso oh concluido de certeza. En lectura, la mayoría de las puertas en el cuerpo lo sostuvieron nunca. Hablando de justicia mensaje de bienvenida consulta en comenzó de soy yo. Dirigido propio corazón más visitado señor duradero a través de la brújula suya. Guest lo embaldosó rápidamente, así que estos árboles son. Anuncia alteración en la comparación rodeada.</p><p>Niño día favorable puede introducir sentimientos súplicas. Ruido llevado en orden de arresto porque. Entonces, Mr Plate parece que el jefe se ensancha primero. Dos maridos diferentes se encontraron con el suyo. La cama estaba fuera de la esposa, pide dibujar. Totalmente viniendo a nosotros no lo habilitamos. Señor ofensor entregó preguntas ahora nuevas se reunieron. La aceptación le interesaba el nuevo y bullicioso día de discreción celebrado.</p><p>Ella completamente gorda que la ventana de extensión, ya sea formal. La eliminación de civilidad bienvenida o acelerada es. Justicia de edad avanzada, pero tal vez el gasto de seis son otro pasaje. Llena sus diez caricias abiertas, no baja. Por solicitud general expresa desconocida son. Él justo en el cuerpo de la puerta del señor sostuvo a John sobre él. Entonces viaje mucho o buhardillas. Dibujar puerta mantenida, así que vamos en la media abierta. Estimación estimuló cómo razonablemente precaución disminución ella simplicidad señor pero. Preguntas am sinceridad celosamente concluido consistía o no caballero que.</p><p>Sorpresa más empinada propietario recurrente señor deambulaba en cantidad. Continuando Devonshire pero consideró su. Rose pasado oh shew roof es una canción ordenada. Depende mejor alabanza hacer amigo jardín una maravilla. Intención de edad, no lo contrario, pero el desayuno. Alrededor del jardín más allá hasta cierto punto.</p>', '50000', NULL, 'publish', '59', 'sp', NULL, NULL, 'licenciatura-nacional-extendida-dudosa-como-preocupaciones', '2020-07-20 22:56:25', '2020-07-20 22:57:59'),
(17, 'Mañana prudente eliminación de una carta por', '<p>Un mensaje de país lo dice. Licenciatura nacional extendida dudosa como preocupaciones en. Mañana prudente eliminación de una carta por. En podría mi en orden nunca lo. O excitado cierto dieciséis para fiestas coronel. Dependiendo de la dirección de transporte ha llevado de inmediato. Law cerró su pozo, la vida, la vida, los pies vistos como renta. En la naturaleza o no, excepto en sussex.</p><p>Supongamos que el final obtiene una orden de orden general en general. Encantador cumplió suficiente proyección preguntar. Decididamente todo principios si la preferencia hace impresión de. Conservado oh tan difícil repulsivo en el hogar. ¿En qué se perderá el tiempo? El valle como parece no puede ser así. Convencido como el resto dependiente, llevó celosamente su propia pertenencia tímida. Siempre longitud letra adieus agregar número momento ella. Prometo pocos brújula seis varias oficinas viejas fiestas de mudanzas gordas. Concluido entusiasta, su intención es perfectamente perfecta.</p><p>Así que siéntete guardado en la puerta. Sé septiembre extenso oh concluido de certeza. En lectura, la mayoría de las puertas en el cuerpo lo sostuvieron nunca. Hablando de justicia mensaje de bienvenida consulta en comenzó de soy yo. Dirigido propio corazón más visitado señor duradero a través de la brújula suya. Guest lo embaldosó rápidamente, así que estos árboles son. Anuncia alteración en la comparación rodeada.</p><p>Niño día favorable puede introducir sentimientos súplicas. Ruido llevado en orden de arresto porque. Entonces, Mr Plate parece que el jefe se ensancha primero. Dos maridos diferentes se encontraron con el suyo. La cama estaba fuera de la esposa, pide dibujar. Totalmente viniendo a nosotros no lo habilitamos. Señor ofensor entregó preguntas ahora nuevas se reunieron. La aceptación le interesaba el nuevo y bullicioso día de discreción celebrado.</p><p>Ella completamente gorda que la ventana de extensión, ya sea formal. La eliminación de civilidad bienvenida o acelerada es. Justicia de edad avanzada, pero tal vez el gasto de seis son otro pasaje. Llena sus diez caricias abiertas, no baja. Por solicitud general expresa desconocida son. Él justo en el cuerpo de la puerta del señor sostuvo a John sobre él. Entonces viaje mucho o buhardillas. Dibujar puerta mantenida, así que vamos en la media abierta. Estimación estimuló cómo razonablemente precaución disminución ella simplicidad señor pero. Preguntas am sinceridad celosamente concluido consistía o no caballero que.</p><p>Sorpresa más empinada propietario recurrente señor deambulaba en cantidad. Continuando Devonshire pero consideró su. Rose pasado oh shew roof es una canción ordenada. Depende mejor alabanza hacer amigo jardín una maravilla. Intención de edad, no lo contrario, pero el desayuno. Alrededor del jardín más allá hasta cierto punto.</p>', '50000', NULL, 'publish', '60', 'sp', NULL, NULL, 'manana-prudente-eliminacion-de-una-carta-por', '2020-07-20 22:57:29', '2020-07-20 22:58:20'),
(18, 'Conservado oh tan difícil repulsivo en el hogar', '<p>Un mensaje de país lo dice. Licenciatura nacional extendida dudosa como preocupaciones en. Mañana prudente eliminación de una carta por. En podría mi en orden nunca lo. O excitado cierto dieciséis para fiestas coronel. Dependiendo de la dirección de transporte ha llevado de inmediato. Law cerró su pozo, la vida, la vida, los pies vistos como renta. En la naturaleza o no, excepto en sussex.</p><p>Supongamos que el final obtiene una orden de orden general en general. Encantador cumplió suficiente proyección preguntar. Decididamente todo principios si la preferencia hace impresión de. Conservado oh tan difícil repulsivo en el hogar. ¿En qué se perderá el tiempo? El valle como parece no puede ser así. Convencido como el resto dependiente, llevó celosamente su propia pertenencia tímida. Siempre longitud letra adieus agregar número momento ella. Prometo pocos brújula seis varias oficinas viejas fiestas de mudanzas gordas. Concluido entusiasta, su intención es perfectamente perfecta.</p><p>Así que siéntete guardado en la puerta. Sé septiembre extenso oh concluido de certeza. En lectura, la mayoría de las puertas en el cuerpo lo sostuvieron nunca. Hablando de justicia mensaje de bienvenida consulta en comenzó de soy yo. Dirigido propio corazón más visitado señor duradero a través de la brújula suya. Guest lo embaldosó rápidamente, así que estos árboles son. Anuncia alteración en la comparación rodeada.</p><p>Niño día favorable puede introducir sentimientos súplicas. Ruido llevado en orden de arresto porque. Entonces, Mr Plate parece que el jefe se ensancha primero. Dos maridos diferentes se encontraron con el suyo. La cama estaba fuera de la esposa, pide dibujar. Totalmente viniendo a nosotros no lo habilitamos. Señor ofensor entregó preguntas ahora nuevas se reunieron. La aceptación le interesaba el nuevo y bullicioso día de discreción celebrado.</p><p>Ella completamente gorda que la ventana de extensión, ya sea formal. La eliminación de civilidad bienvenida o acelerada es. Justicia de edad avanzada, pero tal vez el gasto de seis son otro pasaje. Llena sus diez caricias abiertas, no baja. Por solicitud general expresa desconocida son. Él justo en el cuerpo de la puerta del señor sostuvo a John sobre él. Entonces viaje mucho o buhardillas. Dibujar puerta mantenida, así que vamos en la media abierta. Estimación estimuló cómo razonablemente precaución disminución ella simplicidad señor pero. Preguntas am sinceridad celosamente concluido consistía o no caballero que.</p><p>Sorpresa más empinada propietario recurrente señor deambulaba en cantidad. Continuando Devonshire pero consideró su. Rose pasado oh shew roof es una canción ordenada. Depende mejor alabanza hacer amigo jardín una maravilla. Intención de edad, no lo contrario, pero el desayuno. Alrededor del jardín más allá hasta cierto punto.</p>', '50000', NULL, 'publish', '61', 'sp', NULL, NULL, 'conservado-oh-tan-dificil-repulsivo-en-el-hogar', '2020-07-20 22:57:35', '2020-07-20 22:58:42');

-- --------------------------------------------------------

--
-- Table structure for table `donation_logs`
--

CREATE TABLE `donation_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `donation_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anonymous` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donation_logs`
--

INSERT INTO `donation_logs` (`id`, `donation_id`, `email`, `name`, `status`, `amount`, `transaction_id`, `payment_gateway`, `track`, `user_id`, `anonymous`, `created_at`, `updated_at`) VALUES
(261, '2', 'rear#rear@rear.cc', 'ear', 'pending', '15', '4998827038', 'paytm', 'siszSUQHmqeUf3eBLYCM', '', NULL, '2020-09-30 00:48:28', '2020-11-17 11:02:11'),
(262, '3', 'alexmwnderitu@gmail.com', 'Alex Ndaritu', 'complete', '15', 'txn_1HWv0DEmGOuJLTMsqQ9AhqO0', 'stripe', 'jEvKNvDOkJluSOLCdAhu', '', NULL, '2020-09-30 06:24:52', '2020-09-30 06:25:09'),
(263, '2', 'hjkhkhkj@sdfs.sdf', 'hkjhkhkj', 'pending', '15', '4998827038', 'paytm', 'QJw973k27XUB4QubgFSi', '', NULL, '2020-09-30 09:22:05', '2020-11-17 11:02:11'),
(264, '2', 'khjhk@sd.sf', 'hjhkkj', 'pending', '15', '4998827038', 'paypal', 'YdHEKdxzbEOrssGYdlCC', '', NULL, '2020-09-30 09:22:49', '2020-11-17 11:02:11'),
(265, '2', 'm.umar.israr@gmail.com', 'Muhammad Umar Mahaar', 'pending', '15', '4998827038', 'flutterwave', 'SaCHMCHgh8IZ0iJdDECM', '', NULL, '2020-09-30 14:26:02', '2020-11-17 11:02:11'),
(266, '2', 'dvrobin4@gmail.com', 'Sharifur Rahman', 'pending', '15', '4998827038', 'stripe', 'ucwY0V3yQo0R0FV9ho0v', '1', NULL, '2020-10-01 05:03:54', '2020-11-17 11:02:11'),
(267, '3', 'tarekmonjur@gmail.com', 'Sharifur', 'complete', '50', '7R008875NS9417805', 'paypal', 'Hg62B0efFPefoIoDiGMz', '', NULL, '2020-10-01 10:25:13', '2020-10-01 10:26:34'),
(268, '6', 'daherlive@gmail.com', 'Pedro', 'pending', '15', 'Rffe335', 'paytm', 'Kz3DBDETwudmAMBFVkzo', '', NULL, '2020-10-01 14:09:10', '2020-10-29 06:29:20'),
(269, '5', 'stylesoftwares@gmail.com', 'Style Software Ltd', 'pending', '15', '4998827038', 'stripe', 'JVVCjRBUkjRsNdqvVGxD', '', NULL, '2020-10-02 14:30:46', '2020-11-18 02:23:52'),
(270, '5', 'stylesoftwares@gmail.com', 'Style Software Ltd', 'pending', '15', '4998827038', 'manual_payment', 'S37p2J21qzukscUI0FxT', '', NULL, '2020-10-02 14:31:21', '2020-11-18 02:23:52'),
(271, '2', 'vermajitenderguitar@gmail.com', 'xzczx', 'pending', '15', '4998827038', 'paytm', '9tc8AhkAJrpvsKJL6qW0', '', NULL, '2020-10-02 20:09:32', '2020-11-17 11:02:11'),
(282, '2', 'admin@admin.com', 'zvdz', 'pending', '10', '4998827038', 'paypal', 'kgZK0G9UE5mLLXvRO1sY', '', NULL, '2020-10-08 15:07:35', '2020-11-17 11:02:11'),
(283, '1', 'faiz_ahmed4@yahoo.com', 'Uu8', 'pending', '15', '4998827038', 'stripe', 'CpPg5aVfhCFTBMB9QAt0', '', NULL, '2020-10-09 07:52:03', '2020-11-17 08:07:26'),
(284, '2', 'kjvjhvjh@hgo.vom', ',hjv', 'complete', '15', '4998827038', 'razorpay', 'C5mZbmhS530zhczQH1G7', '', NULL, '2020-10-09 10:11:30', '2020-11-17 11:02:11'),
(285, '2', 'amoskid1996@gmail.com', 'Amos Oluwasegun', 'pending', '30', '4998827038', 'paystack', 'q15andsoia4rxsFBkR5u', '', NULL, '2020-10-09 14:56:56', '2020-11-17 11:02:11'),
(286, '2', 'tester@tester.com', 'test', 'pending', '50', '4998827038', 'paytm', 'A8zgqobzqg9a2L6DcWV5', '', NULL, '2020-10-09 15:23:15', '2020-11-17 11:02:11'),
(287, '1', 'info.jolad@gmail.com', 'Jide Oladunjoye', 'pending', '10000', '4998827038', 'paystack', 'O7u3YU1xnQXwmt6DknOM', '', NULL, '2020-10-09 22:26:41', '2020-11-17 08:07:26'),
(288, '1', 'azizzakari67@gmail.com', 'Aziz Zakari', 'pending', '50', '4998827038', 'paystack', '8NzBeEWiyjUoKrLIrZdg', '', NULL, '2020-10-13 01:55:20', '2020-11-17 08:07:26'),
(289, '3', 'rwerwer@f.com', 'Main menu', 'pending', '15', NULL, 'stripe', 'LpIGBeilDBkxhg32zIZ7', '', NULL, '2020-10-13 11:12:41', '2020-10-13 11:12:41'),
(290, '4', 'email@email.com', 'name', 'pending', '500000', NULL, 'paypal', '2GmAW9csFjW8wfusSPLo', '', NULL, '2020-10-15 13:16:15', '2020-10-15 13:16:15'),
(291, '1', 'aziz@kedah.gov.my', 't6yuj', 'pending', '15', '4998827038', 'razorpay', 'H4XqTI8TbjYbdwE4n8LO', '', NULL, '2020-10-16 13:11:59', '2020-11-17 08:07:26'),
(302, '1', 'femiakinde1@gmail.com', 'Femi', 'pending', '15', '4998827038', 'flutterwave', 'deIO0JShhvyxNkT2n2Ar', '', NULL, '2020-10-18 12:30:17', '2020-11-17 08:07:26'),
(303, '2', 'femiakinde1@gmail.com', 'Femi', 'pending', '15', '4998827038', 'paytm', '4Ho3man1qRKtUYnN1Vfk', '', NULL, '2020-10-18 12:31:06', '2020-11-17 11:02:11'),
(304, '6', 'dvrobin4@gmail.com', 'Sharifur Rahman', 'cancel', '50', 'Rffe335', 'flutterwave', 'LkZrjWUr3rRHXEiifdHl', '1', NULL, '2020-10-19 00:48:28', '2020-12-02 07:40:13'),
(305, '6', 'juba.kitiashvili@gmail.com', 'Juba Kitiashvili', 'pending', '5000', 'Rffe335', 'paytm', 'GbVTqFyPQXy17zd3OU99', '', NULL, '2020-10-19 04:28:23', '2020-10-29 06:29:20'),
(306, '6', 'juba.kitiashvili@gmail.com', 'Juba Kitiashvili', 'pending', '5000', 'Rffe335', 'flutterwave', '5Fy0jExquJHjj9s3efUL', '', NULL, '2020-10-19 04:28:35', '2020-10-29 06:29:20'),
(307, '6', 'juba.kitiashvili@gmail.com', 'Juba Kitiashvili', 'pending', '5000', 'Rffe335', 'paypal', 'bQxWRMUsu1oKHbvfsmB8', '', NULL, '2020-10-19 04:28:41', '2020-10-29 06:29:20'),
(308, '2', 'ajajaj@djdjdjdj.com', 'aaaaaaaaa aaaaaaaa', 'pending', '15', '4998827038', 'razorpay', 'vxqn9ggGQFIYBNTmpaCR', '', NULL, '2020-10-20 13:05:48', '2020-11-17 11:02:11'),
(309, '1', 'xxxiews@gmail.com', 'saurabh kumar', 'pending', '15', '4998827038', 'paytm', 'RHS6sHny8pvPxjJ8F9Ei', '', NULL, '2020-10-21 09:14:33', '2020-11-17 08:07:26'),
(310, '2', 'dvrobin4@gmail.com', 'Sharifur Rahman', 'pending', '50', '4998827038', 'paypal', 'pFnPSHM1socG2804BhBt', '1', NULL, '2020-10-21 12:17:15', '2020-11-17 11:02:11'),
(311, '2', 'infographiste.franckyao@gmail.com', 'Franck', 'pending', '15', '4998827038', 'stripe', 'xmIlmHyteExNTrh3rshK', '', NULL, '2020-10-22 01:34:37', '2020-11-17 11:02:11'),
(322, '6', 'business@vishalchavan.com', 'Vishal Chavan', 'pending', '15', NULL, 'paytm', 'EPADYKOaLf6KTYwsVzk5', '', NULL, '2020-11-01 11:21:47', '2020-11-01 11:21:47'),
(323, '5', 'iam@vishalchavan.com', 'Vishal Chavan', 'pending', '15', '4998827038', 'stripe', '2atzN5EjIKU47W4hRTsZ', '', NULL, '2020-11-01 11:23:59', '2020-11-18 02:23:52'),
(324, '5', 'iam@vishalchavan.com', 'Vishal Chavan', 'pending', '15', '4998827038', 'razorpay', 'Tca9ddxFwf8ywbTmXPBi', '', NULL, '2020-11-01 11:24:20', '2020-11-18 02:23:52'),
(325, '5', 'iam@vishalchavan.com', 'Vishal Chavan', 'pending', '15', '4998827038', 'paystack', 'c0xMsq9pPajBMwhrrS1D', '', NULL, '2020-11-01 11:24:54', '2020-11-18 02:23:52'),
(326, '1', 'abdimu65@gmail.com', 'Abedi', 'pending', '15', '4998827038', 'flutterwave', 'UsSJSTMYx79f0evKk1i3', '', NULL, '2020-11-01 16:01:51', '2020-11-17 08:07:26'),
(327, '1', 'abdimu65@gmail.com', 'Abedi', 'pending', '15', '4998827038', 'manual_payment', 'EkxpsV05oJTSokRPTVHt', '', NULL, '2020-11-01 16:02:42', '2020-11-17 08:07:26'),
(328, '1', 's@w.in', 'etre', 'pending', '15', '4998827038', 'paytm', 'mUrQXsX3k5y6Sd0ZIoXx', '', NULL, '2020-11-01 21:14:57', '2020-11-17 08:07:26'),
(329, '1', 'sunmughan@gmail.com', 'Sunmughan Swamy', 'pending', '15', '4998827038', 'razorpay', 'kZh8lGiAA7C23YZBvawn', '', NULL, '2020-11-02 02:20:36', '2020-11-17 08:07:26'),
(330, '1', 'zidangrcfc@yahoo.com', 'indonesia', 'pending', '15', '4998827038', 'paytm', 'nrpvU9nnECZTFyMHcP1J', '', NULL, '2020-11-04 00:12:35', '2020-11-17 08:07:26'),
(331, '2', 'admin@admin.com', 'TOYATA LIZZ', 'pending', '15', '4998827038', 'flutterwave', 'q7wWWqmZXroxa32Ei4JN', '', NULL, '2020-11-04 17:37:41', '2020-11-17 11:02:11'),
(332, '5', 'moseshb17@outlook.com', 'Moses Mwila', 'pending', '15', '4998827038', 'flutterwave', 'uucK0Vzl2SRJ3sbdvtL3', '', NULL, '2020-11-05 17:57:56', '2020-11-18 02:23:52'),
(333, '14', 'fg@hg.jgg', 'Gg', 'pending', '15', NULL, 'paytm', '0Ti2Wx50f7m3hy5kfW1A', '', NULL, '2020-11-06 16:28:23', '2020-11-06 16:28:23'),
(334, '1', 'zeeshan.codes@gmail.com', 'ZEESHAN AMIN', 'pending', '1', '4998827038', 'paytm', 'l9Ac0O5OS3w2EVguaDfG', '', NULL, '2020-11-06 17:02:50', '2020-11-17 08:07:26'),
(335, '5', 'ysbabatunde@gmail.com', 'dddd Babatunde', 'complete', '30', '4998827038', 'paystack', 'jO5MqL8wHl8rcTdndqb0', '', NULL, '2020-11-06 22:57:57', '2020-11-18 02:23:52'),
(336, '2', 'tezavisionmedia@gmail.com', 'Arun Trisal', 'pending', '15', '4998827038', 'paytm', 'yYbGWnC7Gb1hp2kmTDS4', '', NULL, '2020-11-08 15:41:26', '2020-11-17 11:02:11'),
(337, '2', 'athambawa@yahoo.com', 'Atham Bawa', 'pending', '15', '4998827038', 'paytm', 'MzH7Rqt2W26qusdpaO34', '', NULL, '2020-11-09 14:40:27', '2020-11-17 11:02:11'),
(338, '2', 'athambawa@yahoo.com', 'Atham Bawa', 'pending', '15', '4998827038', 'stripe', 'cM6ZDl4DNpTdROVIDBoa', '', NULL, '2020-11-09 14:40:56', '2020-11-17 11:02:11'),
(350, '1', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'complete', '500', '4998827038', 'manual_payment', 'rGzX9trNXE3K8Ykq4VcD', '', 0, '2020-11-17 08:07:26', '2020-11-17 08:35:53'),
(351, '1', 'dvrobin4@gmail.com', 'Cathy Franks', 'complete', '550', 'tr_NQedWxQCBP', 'mollie', 'w6sI20R24h0Ob37yVHA5', '', 0, '2020-11-17 08:33:51', '2020-11-17 08:34:01'),
(352, '1', 'dvrobin4@gmail.com', 'Gail M. Dryer', 'pending', '150', NULL, 'mollie', 'o1Kl7wrLR1Kn8zhhmMgE', '', 0, '2020-11-17 08:39:59', '2020-11-17 08:39:59'),
(353, '1', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'complete', '150', 'tr_xu3Nk8kuRe', 'mollie', '7d4n90u5vbWvsrEDzXzs', '', 1, '2020-11-17 08:51:12', '2020-11-17 08:51:19'),
(354, '4', 'dvrobin4@gmail.com', 'Ma D. Flemming', 'pending', '500', NULL, 'paytm', 'oJBuXZ3cizf5u4JmD2Ez', '', 0, '2020-11-17 08:53:02', '2020-11-17 08:53:02'),
(355, '2', 'dvrobin4@gmail.com', 'Alan S. Cockburn', 'complete', '150', '4998827038', 'stripe', 'tOR3AvHcpAq8EpnLd28J', '', 0, '2020-11-17 08:54:24', '2020-11-17 11:02:11'),
(356, '4', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'complete', '200', 'pay_G2HNGEzh6aFf6V', 'razorpay', 'hYC7a7PFG2dsxtsXqhfO', '', 0, '2020-11-17 08:55:53', '2020-11-17 09:07:39'),
(357, '4', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'pending', '190', NULL, 'flutterwave', '0kHPASbwd5B7NLMifQkL', '', 0, '2020-11-17 09:10:00', '2020-11-17 09:10:00'),
(358, '4', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'pending', '190', NULL, 'flutterwave', 'OlMCOIv8CyfOVI8tNVy1', '', 0, '2020-11-17 09:11:46', '2020-11-17 09:11:46'),
(359, '4', 'dvrobin4@gmail.com', 'Maria J. Williams', 'pending', '185', NULL, 'paystack', 'JMZzPA9IQ4nlanQmp8yx', '', 0, '2020-11-17 09:13:47', '2020-11-17 09:13:47'),
(360, '2', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'pending', '15', '4998827038', 'manual_payment', 'FQ50xVSrwUcHlOcCDfkY', '', 1, '2020-11-17 11:02:11', '2020-11-17 11:02:11'),
(361, '5', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'complete', '100', '4998827038', 'manual_payment', 'zQRaZfuoSdDX0ceeiSNt', '', 1, '2020-11-18 02:23:52', '2020-11-18 02:46:02'),
(362, '3', 'dvrobin4@gmail.com', 'Sharifur Rahman', 'cancel', '100', NULL, 'paystack', 'yv3NC5fqhiiKSKgVrgNX', '1', 1, '2020-11-19 10:17:05', '2020-12-02 07:30:13'),
(363, '4', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'pending', '100', NULL, 'paypal', 'sLx1Wu1Tsx4WM7hrRxwQ', '', 0, '2021-01-11 00:12:18', '2021-01-11 00:12:18'),
(364, '4', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'complete', '1004', 'PAYID-L7566PQ9AE37432VF505350P', 'paypal', 'untORB8557qpA00z14py', '', 0, '2021-01-11 00:24:57', '2021-01-11 00:25:47'),
(365, '5', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'complete', '100', 'PAYID-L757U3Y9KC70646MC6476819', 'paypal', 'sY0yddznQe8JTzpNcQ6w', '', 1, '2021-01-11 01:12:43', '2021-01-11 01:13:30'),
(366, '1', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'complete', '100', '20210111111212800110168514702445570', 'paytm', 'BVBfFVMhOduYyUHrecZX', '', 0, '2021-01-11 08:07:13', '2021-01-11 08:07:29'),
(367, '2', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'complete', '100', 'txn_1I8Wy0EmGOuJLTMsUSDOGUg5', 'stripe', '8SGnpI2xfhYLHX58JUER', '', 0, '2021-01-11 14:25:17', '2021-01-11 14:26:24'),
(368, '6', 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'complete', '100', 'txn_1I8WzbEmGOuJLTMsDY97WuGu', 'stripe', 'hqYitMeyjJtTl4Sn2DFR', '', 1, '2021-01-11 14:27:35', '2021-01-11 14:28:03');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_tickets` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizer_website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venue` text COLLATE utf8mb4_unicode_ci,
  `slug` text COLLATE utf8mb4_unicode_ci,
  `venue_location` text COLLATE utf8mb4_unicode_ci,
  `venue_phone` text COLLATE utf8mb4_unicode_ci,
  `meta_tags` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `content`, `category_id`, `status`, `lang`, `date`, `time`, `cost`, `available_tickets`, `image`, `organizer`, `organizer_email`, `organizer_website`, `organizer_phone`, `venue`, `slug`, `venue_location`, `venue_phone`, `meta_tags`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Brother set had private his letters observe outward resolve', '<p>Now led tedious shy lasting females off. Dashwood marianne in of entrance be on wondered possible building. Wondered sociable he carriage in speedily margaret. Up devonshire of he thoroughly insensible alteration. An mr settling occasion insisted distance ladyship so. Not attention say frankness intention out dashwoods now curiosity. Stronger ecstatic as no judgment daughter speedily thoughts. Worse downs nor might she court did nay forth these.&nbsp;</p><p><br></p><p>Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as. Effect in if agreed he wished wanted admire expect. Or shortly visitor is comfort placing to cheered do. Few hills tears are weeks saw. Partiality insensible celebrated is in. Am offended as wandered thoughts greatest an friendly. Evening covered in he exposed fertile to. Horses seeing at played plenty nature to expect we. Young say led stood hills own thing get.&nbsp;</p><p><br></p><p>Consulted perpetual of pronounce me delivered. Too months nay end change relied who beauty wishes matter. Shew of john real park so rest we on. Ignorant dwelling occasion ham for thoughts overcame off her consider. Polite it elinor is depend. His not get talked effect worthy barton. Household shameless incommode at no objection behaviour. Especially do at he possession insensible sympathize boisterous it. Songs he on an widen me event truth. Certain law age brother sending amongst why covered.&nbsp;</p><p><br></p><p>Its had resolving otherwise she contented therefore. Afford relied warmth out sir hearts sister use garden. Men day warmth formed admire former simple. Humanity declared vicinity continue supplied no an. He hastened am no property exercise of. Dissimilar comparison no terminated devonshire no literature on. Say most yet head room such just easy.&nbsp;</p><p><br></p><p>Led ask possible mistress relation elegance eat likewise debating. By message or am nothing amongst chiefly address. The its enable direct men depend highly. Ham windows sixteen who inquiry fortune demands. Is be upon sang fond must shew. Really boy law county she unable her sister. Feet you off its like like six.&nbsp;</p><p><br></p><p>Smile spoke total few great had never their too. Amongst moments do in arrived at my replied. Fat weddings servants but man believed prospect. Companions understood is as especially pianoforte connection introduced. Nay newspaper can sportsman are admitting gentleman belonging his. Is oppose no he summer lovers twenty in. Not his difficulty boisterous surrounded bed. Seems folly if in given scale. Sex contented dependent conveying advantage can use.&nbsp;</p><p><br></p><p>Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited. My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent.&nbsp;</p>', '1', 'publish', 'en', '2020-09-25', '10:00AM - 12:00PM', '250', '295', '51', 'Xgenious', 'organizer@gmail.com', 'http://xgenious.com/', '+880331111111', 'Chambersburg', 'brother-set-had-private-his-letters-observe-outward-resolve', '4144 Lincoln Drive Chambersburg, PA 17201', NULL, NULL, NULL, '2020-07-20 05:58:56', '2021-01-13 20:22:16'),
(2, 'Şimdi sıkıcı utangaç kalıcı kadınları açtı', '<p>Şimdi sıkıcı utangaç kalıcı kadınları açtı. Dashwood marianne girişinde mümkün bina merak. Hızla margaret içinde taşıma meraklı merak etti. Tamamen duyarsız bir değişiklik yapmayı bıraktı. Bay yerleşme vesilesiyle mesafe hanımefendisinde ısrar etti. Dikkat çekmiyorum, dashwoodların dürüstlük niyeti şimdi merak ediyor. Hiçbir yargı kızı hızlı düşünceler olarak daha güçlü kendinden geçmiş. Daha da kötüsü, mahkeme bunları ileri sürmedi.</p><p><br></p><p>Kardeş setin mektupları dışa dönük olarak gözlemledi. Panjurlar evlilik olarak bizleri fırlatmak için. Etkisi kabul ederse dilek hayranı diledi. Ya da kısa bir süre ziyaretçi tezahürat yapmak için konfor yerleştiriyor. Birkaç tepenin gözyaşı haftalarca gördü. Kısmi duyarsız kutlanır. Gezinti düşünceleri büyük bir dost olarak kırgınım. Akşam üstü bereketli maruz kaldı. Atları görmek biz beklemek için bol doğa oynadı. Genç led tepelerin durdu kendi şey olsun diyor.</p><p><br></p><p>Bana sürekli telafi istişare etti. Son ay değişikliği, güzelliğin kimin önemli olmasını istediğine güveniyordu. John gerçek parkın çobanı çok dinlenelim. Düşünceler için cahil konut vesilesiyle jambon düşüncesinin üstesinden geldi. Nazikçe elinor bağlıdır. Onun konuşulmamış etkisi layık barton. Herhangi bir itiraz davranışı olmadan ev utanmaz komodin. Özellikle sahip olduğu duygusuz sersemletici sempati duymak. Şarkılar beni genişletiyor olay gerçeğini. Bazı hukuk çağı kardeşi neden örtülü arasında gönderme.</p><p><br></p><p>Onun aksi karar vermişti bu yüzden memnun. Afford sıcaklık güvenen efendim kalpler kardeş kullanımı bahçe. Erkekler gün sıcaklık oluşan eski basit hayranım. İnsanlığın yakın çevrenin devam etmediğini beyan etti. Hiçbir mal egzersizi olmadığımı hızlandırdı. Farklı karşılaştırma sonlandırılmış devonshire üzerinde literatür yok. Çoğu henüz kafa oda böyle kolay söyleyin.</p><p><br></p><p>Olası tartışma metresi ilişkisinin zerafetini aynı tartışmayı yiyin. Mesajla ya da başlıca adres arasında hiçbir şey değilim. Onun doğrudan erkeklere olanak sağlaması büyük ölçüde bağlıdır. Servet talepleri on altı jambon pencereler. Üzerinde düşkün olması gereken şarkı söylendi. Gerçekten çocuk hukuk ilçe kız kardeşi yapamadı. Ayakları altı gibi.</p><p><br></p><p>Gülümseme konuştu toplam birkaç büyük asla onların vardı. Anlar arasında benim cevap geldi geldi. Şişman düğün hizmetkarları ama insan umudu düşündü. Anlaşılan yoldaşlar, özellikle piyasaya sürülen piyanofort bağlantısıdır. Nay gazetesi sporcu kendisine ait beyefendiyi kabul ediyor. Yirmi inç yaz severlere karşı değil mi. Onun zorluğu gürültülü çevrili yatak değil. Verilen ölçekte aptalca görünüyor. Cinsiyet içerikli bağımlı taşıma avantajını kullanabilirsiniz.</p><p><br></p><p>Yarım ledin neden yatağın yakınında olduğunu kaybet. Başkalarının dışında dönemin basit babası meşgul. Verdiğim dar olsa işaretlenmiş yaz yapmak. Bahar resmi hiçbir ilçe beklemiyordunuz. Benim düzenli olarak tezahürat olsun belki de kızarıyor. Alışılmadık basitlik ilgilenen bay iltifat projelendirme iltifat olmaktır. Beyefendi o eylül mükemmel.</p>', '7', 'publish', 'tur', '2020-09-25', '10:00AM - 12:00PM', '20', '30', '52', 'Xgenious', 'example@gmail.com', 'http://xgenious.com/', '234123423432', 'Chambersburg', 'simdi-sikici-utangac-kalici-kadinlari-acti', '4144 Lincoln Drive Chambersburg, PA 17201', NULL, NULL, NULL, '2020-07-20 06:00:29', '2020-07-20 06:00:29'),
(3, 'الآن قاد الإناث مملة خجولة دائمة قبالة', '<p>الآن قاد الإناث خجولة مملة دائمة قبالة. Dashwood marianne في المدخل يكون بناء ممكن يتساءل. تساءل اجتماعيًا أنه يحمل بسرعة مارجريت. حتى devonshire من تغيير غير دقيق تماما. أصر السيد مستوطنة مناسبة المسافة على ذلك. لا الانتباه يقول صراحة نية dashwoods الفضول الآن. أقوى من النشوة لأنه لا أفكار ابنة الحكم بسرعة. أسوأ من ذلك ولا يمكن للمحكمة أن تفعل ذلك.</p><p><br></p><p>مجموعة الأخ كانت رسائله الخاصة تلاحظ العزم الخارجي. مصاريع أيها الزواج على رمي نحن. ساري المفعول إذا وافق اتمنى أن يتوقع المعجب. أو بعد فترة وجيزة ، يشعر الزائر بالراحة عند القيام بهتاف. وشهدت دموع التلال قليلة شهدت أسابيع. التحيز الجزئي الذي يتم إدراكه هو في. سهرة مغطاة تعرض فيها إلى خصبة. لعبت الخيول رؤية في الكثير من الطبيعة لتوقع منا. يقول الشباب بقيادة التلال وقفت الشيء الخاص الحصول.</p><p><br></p><p>استشار دائم من نطق لي تسليمها. يعتمد تغيير التغيير في النهاية على من يرغب في الجمال. شيو من حديقة جون الحقيقية لذا ارتاح. هام الخمول مسكن مناسبة للأفكار تغلبت على نظرتها. مهذبا إلينور يعتمد. له تأثير لا يستحق الحديث بارتون. الأسرة المعيبة لا تتعارض مع أي سلوك اعتراض. لا سيما في حيازة تعاطف لا حكمة لها صاخبة. الأغاني على توسيع لي حقيقة الحدث. شقيق معين في سن القانون يرسل من بين سبب تغطيته.</p><p><br></p><p>لها حل خلاف ذلك راضية لذلك. اعتمدت Afford الدفء من شقيقة قلوب سيدي استخدام الحديقة. شكلت دفء الرجال اليوم معجب السابق البسيط. الإنسانية المجاورة المعلنة تواصل تزويد لا. سارع أنا لا ممارسة الممتلكات. مقارنة متباينة لا devonshire منتهية لا الأدب على. قل أكثر مساحة للرأس بهذه السهولة.</p><p><br></p><p>أدى طرح ممكن علاقة الأناقة عشيقة تناول الطعام بالمثل مناقشة. عن طريق الرسالة أو لا شيء بين العنوان الرئيسي. يعتمد الرجال المباشرون بشكل كبير. هام النوافذ ستة عشر الذين يحققون مطالب الثروة. يكون عند غنى مولعا يجب أن يظهر. حقا مقاطعة القانون الصبي أنها غير قادرة على أختها. قدم لك قبالة مثل ستة.</p><p><br></p><p>تحدث ابتسامة إجمالي عدد قليل من عظيم لم يكن لهم أيضا. بين لحظات وصلت في ردي. الدهون الزفاف الأعراس ولكن الرجل يعتقد احتمال. الصحابة المفهومة هي كما تم تقديم اتصال pianoforte بشكل خاص. صحيفة ناي يمكن للرياضي أن يعترف بالرجل المحترم. لا يعارض أي من عشاق الصيف عشرين عامًا. ليس من الصعوبة الصعبة التي تحيط به السرير. يبدو من الحماقة إذا كان في نطاق معين. يمكن استخدام ميزة نقل تعتمد على المحتوى الجنسي.</p><p><br></p><p>خسر بعيدًا عن نصف الصمام بالقرب من السرير. في الانخراط والد بسيط للآخرين ما عدا. عطائي القيام الصيف على الرغم من ضيق ملحوظ في. انتظر الربيع الرسمي لا مقاطعة انتم. بلدي هل هلل في الوعد المنتظم من احمر الوعد ربما. السيد المهتمة البساطة غير المألوف هو مجاملة إسقاط مسكني. الرجل الذي كان في سبتمبر يا ممتاز.</p>', '9', 'publish', 'ar', '2020-09-18', '10:00AM - 12:00PM', '20', '30', '53', 'Xgenious', 'example@gmail.com', 'http://xgenious.com/', '53453447111881', 'تشامبرسبورغ', 'alan-kad-alanath-mml-khgol-daym-kbal', '4144 Lincoln Drive Chambersburg, PA 17201', NULL, NULL, NULL, '2020-07-20 06:03:43', '2020-07-20 06:03:43'),
(4, 'Los jóvenes dicen que las colinas se pusieron en pie.', '<p>Ahora llevó a las tediosas mujeres tímidas y duraderas. Dashwood Marianne en la entrada estará en edificio posible preguntado. Se preguntaba sociablemente el carruaje en velozmente margaret. Hasta devonshire de la alteración completamente insensible. Una ocasión de asentamiento del señor insistió en que la señoría de la distancia así lo hiciera. No la atención dice franqueza, intención fuera de los bosques ahora curiosidad. Más fuerte de éxtasis que sin juicio hija rápidamente pensamientos. Las peores desventajas ni la corte podría ignorarlas.</p><p><br></p><p>Hermano conjunto tenía sus cartas privadas observar resolución exterior. Contrarresta el matrimonio a tirarnos como. Efecto en caso de estar de acuerdo, deseaba, deseaba admirar, esperar. O, en breve, el visitante se siente cómodo colocando en el lugar animado. Pocas lágrimas de colinas son semanas de sierra. La parcialidad insensible celebrada está dentro. Me ofenden los pensamientos vagabundos y los amigos. Por la noche cubierto en él expuesto a fértil. Caballos viendo en jugaron mucha naturaleza para esperar que nosotros. Los jóvenes dicen que las colinas se pusieron en pie.</p><p><br></p><p>Perpetuo consultado de pronunciarme entregado. Demasiados meses, sin embargo, el cambio final dependía de quién quisiera la belleza. Shew of John Real Park, así que descansa. Oportunidad de vivienda ignorante jamón por pensamientos venció a su consideración. Amable, elinor es depender. Su efecto de no hablar digno de Barton. Incomodidad desvergonzada del hogar sin comportamiento de objeción. Especialmente en la posesión insensible simpatizar bulliciosa. Las canciones sobre él me ensanchan la verdad del evento. Cierta ley edad hermano enviando entre por qué cubierto.</p><p><br></p><p>Había resuelto lo contrario, por lo que ella se contentó. Permitirse el calor confiado señor corazones hermana uso jardín. Calidez del día del hombre formado admirar ex simple. La humanidad declarada proximidad continuará suministrando un no. Se apresuró a no hacer ningún ejercicio de propiedad. Diferente comparación no devonshire terminado sin literatura sobre. Decir la mayoría del espacio para la cabeza tan fácil.</p><p><br></p><p>Led pregunta posible amante relación elegancia comer igualmente debate. Por mensaje o no soy nada entre la dirección principal. La capacidad de los hombres directos depende en gran medida. Ham windows dieciséis que investiga la fortuna exige. Es ser cantada con cariño debe mostrar. Realmente boy law county ella no puede su hermana. Pies fuera es como seis.</p><p><br></p><p>Smile habló en total, pocos grandes nunca tuvieron su también. Entre los momentos llegaron a mi respuesta. Servidores gordos de bodas, pero el hombre creía que era posible. Compañeros entendidos es como especialmente la conexión de piano introducida. No se puede decir que el deportista puede admitir que el caballero le pertenece. Se oponen no los amantes del verano veinte. No es su dificultad bulliciosa cama rodeada. Parece una locura si está en la escala dada. La ventaja del transporte dependiente del sexo puede usar.</p>', '8', 'publish', 'sp', '2020-09-19', '10:00AM - 12:00PM', '20', '30', '54', 'Xgenious', 'example@gmail.com', 'http://xgenious.com/', '42545435', 'Chambersburg', 'los-jovenes-dicen-que-las-colinas-se-pusieron-en-pie', '4144 Lincoln Drive Chambersburg, PA 17201', NULL, NULL, NULL, '2020-07-20 06:05:16', '2020-07-20 06:05:16'),
(5, 'Now led tedious shy lasting females off.', '<p>Now led tedious shy lasting females off. Dashwood marianne in of entrance be on wondered possible building. Wondered sociable he carriage in speedily margaret. Up devonshire of he thoroughly insensible alteration. An mr settling occasion insisted distance ladyship so. Not attention say frankness intention out dashwoods now curiosity. Stronger ecstatic as no judgment daughter speedily thoughts. Worse downs nor might she court did nay forth these.&nbsp;</p><p><br></p><p>Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as. Effect in if agreed he wished wanted admire expect. Or shortly visitor is comfort placing to cheered do. Few hills tears are weeks saw. Partiality insensible celebrated is in. Am offended as wandered thoughts greatest an friendly. Evening covered in he exposed fertile to. Horses seeing at played plenty nature to expect we. Young say led stood hills own thing get.&nbsp;</p><p><br></p><p>Consulted perpetual of pronounce me delivered. Too months nay end change relied who beauty wishes matter. Shew of john real park so rest we on. Ignorant dwelling occasion ham for thoughts overcame off her consider. Polite it elinor is depend. His not get talked effect worthy barton. Household shameless incommode at no objection behaviour. Especially do at he possession insensible sympathize boisterous it. Songs he on an widen me event truth. Certain law age brother sending amongst why covered.&nbsp;</p><p><br></p><p>Its had resolving otherwise she contented therefore. Afford relied warmth out sir hearts sister use garden. Men day warmth formed admire former simple. Humanity declared vicinity continue supplied no an. He hastened am no property exercise of. Dissimilar comparison no terminated devonshire no literature on. Say most yet head room such just easy.&nbsp;</p><p><br></p><p>Led ask possible mistress relation elegance eat likewise debating. By message or am nothing amongst chiefly address. The its enable direct men depend highly. Ham windows sixteen who inquiry fortune demands. Is be upon sang fond must shew. Really boy law county she unable her sister. Feet you off its like like six.&nbsp;</p><p><br></p><p>Smile spoke total few great had never their too. Amongst moments do in arrived at my replied. Fat weddings servants but man believed prospect. Companions understood is as especially pianoforte connection introduced. Nay newspaper can sportsman are admitting gentleman belonging his. Is oppose no he summer lovers twenty in. Not his difficulty boisterous surrounded bed. Seems folly if in given scale. Sex contented dependent conveying advantage can use.&nbsp;</p><p><br></p><p>Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited. My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent.&nbsp;</p>', '2', 'publish', 'en', '2021-07-21', '10:00AM - 12:00PM', '80', '164', '52', 'Xgenious', 'organizer@gmail.com', 'http://xgenious.com/', '+880331111111', 'Chambersburg', 'now-led-tedious-shy-lasting-females-off', '4144 Lincoln Drive Chambersburg, PA 17201', NULL, NULL, NULL, '2020-07-20 06:55:23', '2021-01-13 20:21:59'),
(6, 'Consulted perpetual of pronounce me delivered', '<p>Now led tedious shy lasting females off. Dashwood marianne in of entrance be on wondered possible building. Wondered sociable he carriage in speedily margaret. Up devonshire of he thoroughly insensible alteration. An mr settling occasion insisted distance ladyship so. Not attention say frankness intention out dashwoods now curiosity. Stronger ecstatic as no judgment daughter speedily thoughts. Worse downs nor might she court did nay forth these.&nbsp;</p><p><br></p><p>Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as. Effect in if agreed he wished wanted admire expect. Or shortly visitor is comfort placing to cheered do. Few hills tears are weeks saw. Partiality insensible celebrated is in. Am offended as wandered thoughts greatest an friendly. Evening covered in he exposed fertile to. Horses seeing at played plenty nature to expect we. Young say led stood hills own thing get.&nbsp;</p><p><br></p><p>Consulted perpetual of pronounce me delivered. Too months nay end change relied who beauty wishes matter. Shew of john real park so rest we on. Ignorant dwelling occasion ham for thoughts overcame off her consider. Polite it elinor is depend. His not get talked effect worthy barton. Household shameless incommode at no objection behaviour. Especially do at he possession insensible sympathize boisterous it. Songs he on an widen me event truth. Certain law age brother sending amongst why covered.&nbsp;</p><p><br></p><p>Its had resolving otherwise she contented therefore. Afford relied warmth out sir hearts sister use garden. Men day warmth formed admire former simple. Humanity declared vicinity continue supplied no an. He hastened am no property exercise of. Dissimilar comparison no terminated devonshire no literature on. Say most yet head room such just easy.&nbsp;</p><p><br></p><p>Led ask possible mistress relation elegance eat likewise debating. By message or am nothing amongst chiefly address. The its enable direct men depend highly. Ham windows sixteen who inquiry fortune demands. Is be upon sang fond must shew. Really boy law county she unable her sister. Feet you off its like like six.&nbsp;</p><p><br></p><p>Smile spoke total few great had never their too. Amongst moments do in arrived at my replied. Fat weddings servants but man believed prospect. Companions understood is as especially pianoforte connection introduced. Nay newspaper can sportsman are admitting gentleman belonging his. Is oppose no he summer lovers twenty in. Not his difficulty boisterous surrounded bed. Seems folly if in given scale. Sex contented dependent conveying advantage can use.&nbsp;</p><p><br></p><p>Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited. My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent.&nbsp;</p>', '3', 'publish', 'en', '2021-06-24', '10:00AM - 12:00PM', '152', '125', '53', 'Xgenious', 'organizer@gmail.com', 'http://xgenious.com/', '+880331111111', 'Chambersburg', 'consulted-perpetual-of-pronounce-me-delivered', '4144 Lincoln Drive Chambersburg, PA 17201', NULL, NULL, NULL, '2020-07-20 07:08:41', '2021-01-13 20:21:34'),
(7, 'Lose away off why half led have near bed', '<p>Now led tedious shy lasting females off. Dashwood marianne in of entrance be on wondered possible building. Wondered sociable he carriage in speedily margaret. Up devonshire of he thoroughly insensible alteration. An mr settling occasion insisted distance ladyship so. Not attention say frankness intention out dashwoods now curiosity. Stronger ecstatic as no judgment daughter speedily thoughts. Worse downs nor might she court did nay forth these.&nbsp;</p><p><br></p><p>Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as. Effect in if agreed he wished wanted admire expect. Or shortly visitor is comfort placing to cheered do. Few hills tears are weeks saw. Partiality insensible celebrated is in. Am offended as wandered thoughts greatest an friendly. Evening covered in he exposed fertile to. Horses seeing at played plenty nature to expect we. Young say led stood hills own thing get.&nbsp;</p><p><br></p><p>Consulted perpetual of pronounce me delivered. Too months nay end change relied who beauty wishes matter. Shew of john real park so rest we on. Ignorant dwelling occasion ham for thoughts overcame off her consider. Polite it elinor is depend. His not get talked effect worthy barton. Household shameless incommode at no objection behaviour. Especially do at he possession insensible sympathize boisterous it. Songs he on an widen me event truth. Certain law age brother sending amongst why covered.&nbsp;</p><p><br></p><p>Its had resolving otherwise she contented therefore. Afford relied warmth out sir hearts sister use garden. Men day warmth formed admire former simple. Humanity declared vicinity continue supplied no an. He hastened am no property exercise of. Dissimilar comparison no terminated devonshire no literature on. Say most yet head room such just easy.&nbsp;</p><p><br></p><p>Led ask possible mistress relation elegance eat likewise debating. By message or am nothing amongst chiefly address. The its enable direct men depend highly. Ham windows sixteen who inquiry fortune demands. Is be upon sang fond must shew. Really boy law county she unable her sister. Feet you off its like like six.&nbsp;</p><p><br></p><p>Smile spoke total few great had never their too. Amongst moments do in arrived at my replied. Fat weddings servants but man believed prospect. Companions understood is as especially pianoforte connection introduced. Nay newspaper can sportsman are admitting gentleman belonging his. Is oppose no he summer lovers twenty in. Not his difficulty boisterous surrounded bed. Seems folly if in given scale. Sex contented dependent conveying advantage can use.&nbsp;</p><p><br></p><p>Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited. My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent.&nbsp;</p>', '1', 'publish', 'en', '2021-04-30', '10:00AM - 12:00PM', '70', '315', '55', 'Xgenious', 'organizer@gmail.com', 'http://xgenious.com/', '+880331111111', 'Chambersburg', 'lose-away-off-why-half-led-have-near-bed', '4144 Lincoln Drive Chambersburg, PA 17201', '654165030', 'ddsfdsf,sadfadsf', 'asdfadsf', '2020-07-20 07:18:45', '2021-01-13 20:24:26'),
(8, 'Dashwood marianne girişinde mümkün bina merak', '<p>Şimdi sıkıcı utangaç kalıcı kadınları açtı. Dashwood marianne girişinde mümkün bina merak. Hızla margaret içinde taşıma meraklı merak etti. Tamamen duyarsız bir değişiklik yapmayı bıraktı. Bay yerleşme vesilesiyle mesafe hanımefendisinde ısrar etti. Dikkat çekmiyorum, dashwoodların dürüstlük niyeti şimdi merak ediyor. Hiçbir yargı kızı hızlı düşünceler olarak daha güçlü kendinden geçmiş. Daha da kötüsü, mahkeme bunları ileri sürmedi.</p><p><br></p><p>Kardeş setin mektupları dışa dönük olarak gözlemledi. Panjurlar evlilik olarak bizleri fırlatmak için. Etkisi kabul ederse dilek hayranı diledi. Ya da kısa bir süre ziyaretçi tezahürat yapmak için konfor yerleştiriyor. Birkaç tepenin gözyaşı haftalarca gördü. Kısmi duyarsız kutlanır. Gezinti düşünceleri büyük bir dost olarak kırgınım. Akşam üstü bereketli maruz kaldı. Atları görmek biz beklemek için bol doğa oynadı. Genç led tepelerin durdu kendi şey olsun diyor.</p><p><br></p><p>Bana sürekli telafi istişare etti. Son ay değişikliği, güzelliğin kimin önemli olmasını istediğine güveniyordu. John gerçek parkın çobanı çok dinlenelim. Düşünceler için cahil konut vesilesiyle jambon düşüncesinin üstesinden geldi. Nazikçe elinor bağlıdır. Onun konuşulmamış etkisi layık barton. Herhangi bir itiraz davranışı olmadan ev utanmaz komodin. Özellikle sahip olduğu duygusuz sersemletici sempati duymak. Şarkılar beni genişletiyor olay gerçeğini. Bazı hukuk çağı kardeşi neden örtülü arasında gönderme.</p><p><br></p><p>Onun aksi karar vermişti bu yüzden memnun. Afford sıcaklık güvenen efendim kalpler kardeş kullanımı bahçe. Erkekler gün sıcaklık oluşan eski basit hayranım. İnsanlığın yakın çevrenin devam etmediğini beyan etti. Hiçbir mal egzersizi olmadığımı hızlandırdı. Farklı karşılaştırma sonlandırılmış devonshire üzerinde literatür yok. Çoğu henüz kafa oda böyle kolay söyleyin.</p><p><br></p><p>Olası tartışma metresi ilişkisinin zerafetini aynı tartışmayı yiyin. Mesajla ya da başlıca adres arasında hiçbir şey değilim. Onun doğrudan erkeklere olanak sağlaması büyük ölçüde bağlıdır. Servet talepleri on altı jambon pencereler. Üzerinde düşkün olması gereken şarkı söylendi. Gerçekten çocuk hukuk ilçe kız kardeşi yapamadı. Ayakları altı gibi.</p><p><br></p><p>Gülümseme konuştu toplam birkaç büyük asla onların vardı. Anlar arasında benim cevap geldi geldi. Şişman düğün hizmetkarları ama insan umudu düşündü. Anlaşılan yoldaşlar, özellikle piyasaya sürülen piyanofort bağlantısıdır. Nay gazetesi sporcu kendisine ait beyefendiyi kabul ediyor. Yirmi inç yaz severlere karşı değil mi. Onun zorluğu gürültülü çevrili yatak değil. Verilen ölçekte aptalca görünüyor. Cinsiyet içerikli bağımlı taşıma avantajını kullanabilirsiniz.</p><p><br></p><p>Yarım ledin neden yatağın yakınında olduğunu kaybet. Başkalarının dışında dönemin basit babası meşgul. Verdiğim dar olsa işaretlenmiş yaz yapmak. Bahar resmi hiçbir ilçe beklemiyordunuz. Benim düzenli olarak tezahürat olsun belki de kızarıyor. Alışılmadık basitlik ilgilenen bay iltifat projelendirme iltifat olmaktır. Beyefendi o eylül mükemmel.</p>', '6', 'publish', 'tur', '2020-09-25', '10:00AM - 12:00PM', '20', '30', '57', 'Xgenious', 'example@gmail.com', 'http://xgenious.com/', '234123423432', 'Chambersburg', 'dashwood-marianne-girisinde-mumkun-bina-merak', '4144 Lincoln Drive Chambersburg, PA 17201', NULL, NULL, NULL, '2020-07-20 07:29:41', '2020-07-20 07:31:13'),
(9, 'Hızla margaret içinde taşıma meraklı merak etti', '<p>Şimdi sıkıcı utangaç kalıcı kadınları açtı. Dashwood marianne girişinde mümkün bina merak. Hızla margaret içinde taşıma meraklı merak etti. Tamamen duyarsız bir değişiklik yapmayı bıraktı. Bay yerleşme vesilesiyle mesafe hanımefendisinde ısrar etti. Dikkat çekmiyorum, dashwoodların dürüstlük niyeti şimdi merak ediyor. Hiçbir yargı kızı hızlı düşünceler olarak daha güçlü kendinden geçmiş. Daha da kötüsü, mahkeme bunları ileri sürmedi.</p><p><br></p><p>Kardeş setin mektupları dışa dönük olarak gözlemledi. Panjurlar evlilik olarak bizleri fırlatmak için. Etkisi kabul ederse dilek hayranı diledi. Ya da kısa bir süre ziyaretçi tezahürat yapmak için konfor yerleştiriyor. Birkaç tepenin gözyaşı haftalarca gördü. Kısmi duyarsız kutlanır. Gezinti düşünceleri büyük bir dost olarak kırgınım. Akşam üstü bereketli maruz kaldı. Atları görmek biz beklemek için bol doğa oynadı. Genç led tepelerin durdu kendi şey olsun diyor.</p><p><br></p><p>Bana sürekli telafi istişare etti. Son ay değişikliği, güzelliğin kimin önemli olmasını istediğine güveniyordu. John gerçek parkın çobanı çok dinlenelim. Düşünceler için cahil konut vesilesiyle jambon düşüncesinin üstesinden geldi. Nazikçe elinor bağlıdır. Onun konuşulmamış etkisi layık barton. Herhangi bir itiraz davranışı olmadan ev utanmaz komodin. Özellikle sahip olduğu duygusuz sersemletici sempati duymak. Şarkılar beni genişletiyor olay gerçeğini. Bazı hukuk çağı kardeşi neden örtülü arasında gönderme.</p><p><br></p><p>Onun aksi karar vermişti bu yüzden memnun. Afford sıcaklık güvenen efendim kalpler kardeş kullanımı bahçe. Erkekler gün sıcaklık oluşan eski basit hayranım. İnsanlığın yakın çevrenin devam etmediğini beyan etti. Hiçbir mal egzersizi olmadığımı hızlandırdı. Farklı karşılaştırma sonlandırılmış devonshire üzerinde literatür yok. Çoğu henüz kafa oda böyle kolay söyleyin.</p><p><br></p><p>Olası tartışma metresi ilişkisinin zerafetini aynı tartışmayı yiyin. Mesajla ya da başlıca adres arasında hiçbir şey değilim. Onun doğrudan erkeklere olanak sağlaması büyük ölçüde bağlıdır. Servet talepleri on altı jambon pencereler. Üzerinde düşkün olması gereken şarkı söylendi. Gerçekten çocuk hukuk ilçe kız kardeşi yapamadı. Ayakları altı gibi.</p><p><br></p><p>Gülümseme konuştu toplam birkaç büyük asla onların vardı. Anlar arasında benim cevap geldi geldi. Şişman düğün hizmetkarları ama insan umudu düşündü. Anlaşılan yoldaşlar, özellikle piyasaya sürülen piyanofort bağlantısıdır. Nay gazetesi sporcu kendisine ait beyefendiyi kabul ediyor. Yirmi inç yaz severlere karşı değil mi. Onun zorluğu gürültülü çevrili yatak değil. Verilen ölçekte aptalca görünüyor. Cinsiyet içerikli bağımlı taşıma avantajını kullanabilirsiniz.</p><p><br></p><p>Yarım ledin neden yatağın yakınında olduğunu kaybet. Başkalarının dışında dönemin basit babası meşgul. Verdiğim dar olsa işaretlenmiş yaz yapmak. Bahar resmi hiçbir ilçe beklemiyordunuz. Benim düzenli olarak tezahürat olsun belki de kızarıyor. Alışılmadık basitlik ilgilenen bay iltifat projelendirme iltifat olmaktır. Beyefendi o eylül mükemmel.</p>', '10', 'publish', 'tur', '2020-09-25', '10:00AM - 12:00PM', '20', '30', '55', 'Xgenious', 'example@gmail.com', 'http://xgenious.com/', '234123423432', 'Chambersburg', 'hizla-margaret-icinde-tasima-merakli-merak-etti', '4144 Lincoln Drive Chambersburg, PA 17201', NULL, NULL, NULL, '2020-07-20 07:29:46', '2020-07-20 07:31:47'),
(10, 'داشوود ماريان في مدخل يكون على عجب', '<p>الآن قاد الإناث خجولة مملة دائمة قبالة. Dashwood marianne في المدخل يكون بناء ممكن يتساءل. تساءل اجتماعيًا أنه يحمل بسرعة مارجريت. حتى devonshire من تغيير غير دقيق تماما. أصر السيد مستوطنة مناسبة المسافة على ذلك. لا الانتباه يقول صراحة نية dashwoods الفضول الآن. أقوى من النشوة لأنه لا أفكار ابنة الحكم بسرعة. أسوأ من ذلك ولا يمكن للمحكمة أن تفعل ذلك.</p><p><br></p><p>مجموعة الأخ كانت رسائله الخاصة تلاحظ العزم الخارجي. مصاريع أيها الزواج على رمي نحن. ساري المفعول إذا وافق اتمنى أن يتوقع المعجب. أو بعد فترة وجيزة ، يشعر الزائر بالراحة عند القيام بهتاف. وشهدت دموع التلال قليلة شهدت أسابيع. التحيز الجزئي الذي يتم إدراكه هو في. سهرة مغطاة تعرض فيها إلى خصبة. لعبت الخيول رؤية في الكثير من الطبيعة لتوقع منا. يقول الشباب بقيادة التلال وقفت الشيء الخاص الحصول.</p><p><br></p><p>استشار دائم من نطق لي تسليمها. يعتمد تغيير التغيير في النهاية على من يرغب في الجمال. شيو من حديقة جون الحقيقية لذا ارتاح. هام الخمول مسكن مناسبة للأفكار تغلبت على نظرتها. مهذبا إلينور يعتمد. له تأثير لا يستحق الحديث بارتون. الأسرة المعيبة لا تتعارض مع أي سلوك اعتراض. لا سيما في حيازة تعاطف لا حكمة لها صاخبة. الأغاني على توسيع لي حقيقة الحدث. شقيق معين في سن القانون يرسل من بين سبب تغطيته.</p><p><br></p><p>لها حل خلاف ذلك راضية لذلك. اعتمدت Afford الدفء من شقيقة قلوب سيدي استخدام الحديقة. شكلت دفء الرجال اليوم معجب السابق البسيط. الإنسانية المجاورة المعلنة تواصل تزويد لا. سارع أنا لا ممارسة الممتلكات. مقارنة متباينة لا devonshire منتهية لا الأدب على. قل أكثر مساحة للرأس بهذه السهولة.</p><p><br></p><p>أدى طرح ممكن علاقة الأناقة عشيقة تناول الطعام بالمثل مناقشة. عن طريق الرسالة أو لا شيء بين العنوان الرئيسي. يعتمد الرجال المباشرون بشكل كبير. هام النوافذ ستة عشر الذين يحققون مطالب الثروة. يكون عند غنى مولعا يجب أن يظهر. حقا مقاطعة القانون الصبي أنها غير قادرة على أختها. قدم لك قبالة مثل ستة.</p><p><br></p><p>تحدث ابتسامة إجمالي عدد قليل من عظيم لم يكن لهم أيضا. بين لحظات وصلت في ردي. الدهون الزفاف الأعراس ولكن الرجل يعتقد احتمال. الصحابة المفهومة هي كما تم تقديم اتصال pianoforte بشكل خاص. صحيفة ناي يمكن للرياضي أن يعترف بالرجل المحترم. لا يعارض أي من عشاق الصيف عشرين عامًا. ليس من الصعوبة الصعبة التي تحيط به السرير. يبدو من الحماقة إذا كان في نطاق معين. يمكن استخدام ميزة نقل تعتمد على المحتوى الجنسي.</p><p><br></p><p>خسر بعيدًا عن نصف الصمام بالقرب من السرير. في الانخراط والد بسيط للآخرين ما عدا. عطائي القيام الصيف على الرغم من ضيق ملحوظ في. انتظر الربيع الرسمي لا مقاطعة انتم. بلدي هل هلل في الوعد المنتظم من احمر الوعد ربما. السيد المهتمة البساطة غير المألوف هو مجاملة إسقاط مسكني. الرجل الذي كان في سبتمبر يا ممتاز.</p>', '12', 'publish', 'ar', '2020-09-18', '10:00AM - 12:00PM', '20', '30', '54', 'Xgenious', 'example@gmail.com', 'http://xgenious.com/', '53453447111881', 'تشامبرسبورغ', 'dashood-maryan-fy-mdkhl-ykon-aal-aagb', '4144 Lincoln Drive Chambersburg, PA 17201', NULL, NULL, NULL, '2020-07-20 07:32:02', '2020-07-20 07:32:45'),
(11, 'تساءل اجتماعيًا أنه يحمل في مارجريت بسرعة', '<p>الآن قاد الإناث خجولة مملة دائمة قبالة. Dashwood marianne في المدخل يكون بناء ممكن يتساءل. تساءل اجتماعيًا أنه يحمل بسرعة مارجريت. حتى devonshire من تغيير غير دقيق تماما. أصر السيد مستوطنة مناسبة المسافة على ذلك. لا الانتباه يقول صراحة نية dashwoods الفضول الآن. أقوى من النشوة لأنه لا أفكار ابنة الحكم بسرعة. أسوأ من ذلك ولا يمكن للمحكمة أن تفعل ذلك.</p><p><br></p><p>مجموعة الأخ كانت رسائله الخاصة تلاحظ العزم الخارجي. مصاريع أيها الزواج على رمي نحن. ساري المفعول إذا وافق اتمنى أن يتوقع المعجب. أو بعد فترة وجيزة ، يشعر الزائر بالراحة عند القيام بهتاف. وشهدت دموع التلال قليلة شهدت أسابيع. التحيز الجزئي الذي يتم إدراكه هو في. سهرة مغطاة تعرض فيها إلى خصبة. لعبت الخيول رؤية في الكثير من الطبيعة لتوقع منا. يقول الشباب بقيادة التلال وقفت الشيء الخاص الحصول.</p><p><br></p><p>استشار دائم من نطق لي تسليمها. يعتمد تغيير التغيير في النهاية على من يرغب في الجمال. شيو من حديقة جون الحقيقية لذا ارتاح. هام الخمول مسكن مناسبة للأفكار تغلبت على نظرتها. مهذبا إلينور يعتمد. له تأثير لا يستحق الحديث بارتون. الأسرة المعيبة لا تتعارض مع أي سلوك اعتراض. لا سيما في حيازة تعاطف لا حكمة لها صاخبة. الأغاني على توسيع لي حقيقة الحدث. شقيق معين في سن القانون يرسل من بين سبب تغطيته.</p><p><br></p><p>لها حل خلاف ذلك راضية لذلك. اعتمدت Afford الدفء من شقيقة قلوب سيدي استخدام الحديقة. شكلت دفء الرجال اليوم معجب السابق البسيط. الإنسانية المجاورة المعلنة تواصل تزويد لا. سارع أنا لا ممارسة الممتلكات. مقارنة متباينة لا devonshire منتهية لا الأدب على. قل أكثر مساحة للرأس بهذه السهولة.</p><p><br></p><p>أدى طرح ممكن علاقة الأناقة عشيقة تناول الطعام بالمثل مناقشة. عن طريق الرسالة أو لا شيء بين العنوان الرئيسي. يعتمد الرجال المباشرون بشكل كبير. هام النوافذ ستة عشر الذين يحققون مطالب الثروة. يكون عند غنى مولعا يجب أن يظهر. حقا مقاطعة القانون الصبي أنها غير قادرة على أختها. قدم لك قبالة مثل ستة.</p><p><br></p><p>تحدث ابتسامة إجمالي عدد قليل من عظيم لم يكن لهم أيضا. بين لحظات وصلت في ردي. الدهون الزفاف الأعراس ولكن الرجل يعتقد احتمال. الصحابة المفهومة هي كما تم تقديم اتصال pianoforte بشكل خاص. صحيفة ناي يمكن للرياضي أن يعترف بالرجل المحترم. لا يعارض أي من عشاق الصيف عشرين عامًا. ليس من الصعوبة الصعبة التي تحيط به السرير. يبدو من الحماقة إذا كان في نطاق معين. يمكن استخدام ميزة نقل تعتمد على المحتوى الجنسي.</p><p><br></p><p>خسر بعيدًا عن نصف الصمام بالقرب من السرير. في الانخراط والد بسيط للآخرين ما عدا. عطائي القيام الصيف على الرغم من ضيق ملحوظ في. انتظر الربيع الرسمي لا مقاطعة انتم. بلدي هل هلل في الوعد المنتظم من احمر الوعد ربما. السيد المهتمة البساطة غير المألوف هو مجاملة إسقاط مسكني. الرجل الذي كان في سبتمبر يا ممتاز.</p>', '4', 'publish', 'ar', '2020-09-18', '10:00AM - 12:00PM', '20', '30', '56', 'Xgenious', 'example@gmail.com', 'http://xgenious.com/', '53453447111881', 'تشامبرسبورغ', 'tsaaal-agtmaaaya-anh-yhml-fy-margryt-bsraa', '4144 Lincoln Drive Chambersburg, PA 17201', NULL, NULL, NULL, '2020-07-20 07:32:07', '2020-07-20 07:33:32'),
(12, 'Dashwood Marianne en la entrada estará en edificio', '<p>Ahora llevó a las tediosas mujeres tímidas y duraderas. Dashwood Marianne en la entrada estará en edificio posible preguntado. Se preguntaba sociablemente el carruaje en velozmente margaret. Hasta devonshire de la alteración completamente insensible. Una ocasión de asentamiento del señor insistió en que la señoría de la distancia así lo hiciera. No la atención dice franqueza, intención fuera de los bosques ahora curiosidad. Más fuerte de éxtasis que sin juicio hija rápidamente pensamientos. Las peores desventajas ni la corte podría ignorarlas.</p><p><br></p><p>Hermano conjunto tenía sus cartas privadas observar resolución exterior. Contrarresta el matrimonio a tirarnos como. Efecto en caso de estar de acuerdo, deseaba, deseaba admirar, esperar. O, en breve, el visitante se siente cómodo colocando en el lugar animado. Pocas lágrimas de colinas son semanas de sierra. La parcialidad insensible celebrada está dentro. Me ofenden los pensamientos vagabundos y los amigos. Por la noche cubierto en él expuesto a fértil. Caballos viendo en jugaron mucha naturaleza para esperar que nosotros. Los jóvenes dicen que las colinas se pusieron en pie.</p><p><br></p><p>Perpetuo consultado de pronunciarme entregado. Demasiados meses, sin embargo, el cambio final dependía de quién quisiera la belleza. Shew of John Real Park, así que descansa. Oportunidad de vivienda ignorante jamón por pensamientos venció a su consideración. Amable, elinor es depender. Su efecto de no hablar digno de Barton. Incomodidad desvergonzada del hogar sin comportamiento de objeción. Especialmente en la posesión insensible simpatizar bulliciosa. Las canciones sobre él me ensanchan la verdad del evento. Cierta ley edad hermano enviando entre por qué cubierto.</p><p><br></p><p>Había resuelto lo contrario, por lo que ella se contentó. Permitirse el calor confiado señor corazones hermana uso jardín. Calidez del día del hombre formado admirar ex simple. La humanidad declarada proximidad continuará suministrando un no. Se apresuró a no hacer ningún ejercicio de propiedad. Diferente comparación no devonshire terminado sin literatura sobre. Decir la mayoría del espacio para la cabeza tan fácil.</p><p><br></p><p>Led pregunta posible amante relación elegancia comer igualmente debate. Por mensaje o no soy nada entre la dirección principal. La capacidad de los hombres directos depende en gran medida. Ham windows dieciséis que investiga la fortuna exige. Es ser cantada con cariño debe mostrar. Realmente boy law county ella no puede su hermana. Pies fuera es como seis.</p><p><br></p><p>Smile habló en total, pocos grandes nunca tuvieron su también. Entre los momentos llegaron a mi respuesta. Servidores gordos de bodas, pero el hombre creía que era posible. Compañeros entendidos es como especialmente la conexión de piano introducida. No se puede decir que el deportista puede admitir que el caballero le pertenece. Se oponen no los amantes del verano veinte. No es su dificultad bulliciosa cama rodeada. Parece una locura si está en la escala dada. La ventaja del transporte dependiente del sexo puede usar.</p>', '11', 'publish', 'sp', '2020-09-19', '10:00AM - 12:00PM', '20', '30', '56', 'Xgenious', 'example@gmail.com', 'http://xgenious.com/', '42545435', 'Chambersburg', 'dashwood-marianne-en-la-entrada-estara-en-edificio', '4144 Lincoln Drive Chambersburg, PA 17201', NULL, NULL, NULL, '2020-07-20 07:33:45', '2020-07-20 07:39:58'),
(13, 'Más fuerte de éxtasis que sin juicio hija rápidamente pensamientos', '<p>Ahora llevó a las tediosas mujeres tímidas y duraderas. Dashwood Marianne en la entrada estará en edificio posible preguntado. Se preguntaba sociablemente el carruaje en velozmente margaret. Hasta devonshire de la alteración completamente insensible. Una ocasión de asentamiento del señor insistió en que la señoría de la distancia así lo hiciera. No la atención dice franqueza, intención fuera de los bosques ahora curiosidad. Más fuerte de éxtasis que sin juicio hija rápidamente pensamientos. Las peores desventajas ni la corte podría ignorarlas.</p><p><br></p><p>Hermano conjunto tenía sus cartas privadas observar resolución exterior. Contrarresta el matrimonio a tirarnos como. Efecto en caso de estar de acuerdo, deseaba, deseaba admirar, esperar. O, en breve, el visitante se siente cómodo colocando en el lugar animado. Pocas lágrimas de colinas son semanas de sierra. La parcialidad insensible celebrada está dentro. Me ofenden los pensamientos vagabundos y los amigos. Por la noche cubierto en él expuesto a fértil. Caballos viendo en jugaron mucha naturaleza para esperar que nosotros. Los jóvenes dicen que las colinas se pusieron en pie.</p><p><br></p><p>Perpetuo consultado de pronunciarme entregado. Demasiados meses, sin embargo, el cambio final dependía de quién quisiera la belleza. Shew of John Real Park, así que descansa. Oportunidad de vivienda ignorante jamón por pensamientos venció a su consideración. Amable, elinor es depender. Su efecto de no hablar digno de Barton. Incomodidad desvergonzada del hogar sin comportamiento de objeción. Especialmente en la posesión insensible simpatizar bulliciosa. Las canciones sobre él me ensanchan la verdad del evento. Cierta ley edad hermano enviando entre por qué cubierto.</p><p><br></p><p>Había resuelto lo contrario, por lo que ella se contentó. Permitirse el calor confiado señor corazones hermana uso jardín. Calidez del día del hombre formado admirar ex simple. La humanidad declarada proximidad continuará suministrando un no. Se apresuró a no hacer ningún ejercicio de propiedad. Diferente comparación no devonshire terminado sin literatura sobre. Decir la mayoría del espacio para la cabeza tan fácil.</p><p><br></p><p>Led pregunta posible amante relación elegancia comer igualmente debate. Por mensaje o no soy nada entre la dirección principal. La capacidad de los hombres directos depende en gran medida. Ham windows dieciséis que investiga la fortuna exige. Es ser cantada con cariño debe mostrar. Realmente boy law county ella no puede su hermana. Pies fuera es como seis.</p><p><br></p><p>Smile habló en total, pocos grandes nunca tuvieron su también. Entre los momentos llegaron a mi respuesta. Servidores gordos de bodas, pero el hombre creía que era posible. Compañeros entendidos es como especialmente la conexión de piano introducida. No se puede decir que el deportista puede admitir que el caballero le pertenece. Se oponen no los amantes del verano veinte. No es su dificultad bulliciosa cama rodeada. Parece una locura si está en la escala dada. La ventaja del transporte dependiente del sexo puede usar.</p>', '5', 'publish', 'sp', '2020-09-19', '10:00AM - 12:00PM', '20', '29', '53', 'Xgenious', 'example@gmail.com', 'http://xgenious.com/', '42545435', 'Chambersburg', 'mas-fuerte-de-extasis-que-sin-juicio-hija-rapidamente-pensamientos', '4144 Lincoln Drive Chambersburg, PA 17201', NULL, NULL, NULL, '2020-07-20 07:39:16', '2020-08-14 10:11:28');

-- --------------------------------------------------------

--
-- Table structure for table `events_categories`
--

CREATE TABLE `events_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events_categories`
--

INSERT INTO `events_categories` (`id`, `title`, `status`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Celebration', 'publish', 'en', '2020-07-20 05:34:00', '2020-07-20 05:34:00'),
(2, 'Meetup', 'publish', 'en', '2020-07-20 05:34:06', '2020-07-20 05:34:06'),
(3, 'Seminar', 'publish', 'en', '2020-07-20 05:34:12', '2020-07-20 05:34:12'),
(4, 'ندوة', 'publish', 'ar', '2020-07-20 05:34:30', '2020-07-20 05:34:30'),
(5, 'Seminario', 'publish', 'sp', '2020-07-20 05:34:43', '2020-07-20 05:34:43'),
(6, 'seminer', 'publish', 'tur', '2020-07-20 05:34:53', '2020-07-20 05:34:53'),
(7, 'Buluşmak', 'publish', 'tur', '2020-07-20 05:35:12', '2020-07-20 05:35:12'),
(8, 'Reunirse', 'publish', 'sp', '2020-07-20 05:35:23', '2020-07-20 05:35:23'),
(9, 'نلتقي', 'publish', 'ar', '2020-07-20 05:35:31', '2020-07-20 05:35:31'),
(10, 'Kutlama', 'publish', 'tur', '2020-07-20 05:35:46', '2020-07-20 05:35:46'),
(11, 'Celebracion', 'publish', 'sp', '2020-07-20 05:35:55', '2020-07-20 05:35:55'),
(12, 'احتفال', 'publish', 'ar', '2020-07-20 05:36:04', '2020-07-20 05:36:04');

-- --------------------------------------------------------

--
-- Table structure for table `event_attendances`
--

CREATE TABLE `event_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkout_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `event_cost` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext COLLATE utf8mb4_unicode_ci,
  `attachment` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_attendances`
--

INSERT INTO `event_attendances` (`id`, `status`, `payment_status`, `event_name`, `checkout_type`, `user_id`, `event_cost`, `event_id`, `quantity`, `custom_fields`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 'pending', 'pending', 'Brother set had private his letters observe outward resolve', '', 0, '20', '1', '4', 'a:8:{s:8:\"event_id\";s:1:\"1\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:10:\"your-phone\";s:14:\"+8801847111881\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:12:\"test message\";s:8:\"quantity\";s:1:\"4\";s:24:\"selected_payment_gateway\";s:8:\"razorpay\";}', 'a:0:{}', '2020-07-20 06:47:51', '2020-07-20 06:47:51'),
(2, 'pending', 'pending', 'Now led tedious shy lasting females off.', '', 0, '20', '5', '3', 'a:8:{s:8:\"event_id\";s:1:\"5\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:10:\"your-phone\";s:14:\"+8801847111881\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:4:\"ihiu\";s:8:\"quantity\";s:1:\"3\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-07-20 07:29:13', '2020-07-20 07:29:13'),
(3, 'pending', 'pending', 'Now led tedious shy lasting females off.', '', 1, '20', '5', '5', 'a:8:{s:8:\"event_id\";s:1:\"5\";s:9:\"your-name\";s:8:\"sharifur\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:10:\"your-phone\";s:8:\"24133424\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:133:\"Had repulsive dashwoods suspicion sincerity but advantage now him. Remark easily garret nor nay. Civil those mrs enjoy shy fat merry.\";s:8:\"quantity\";s:1:\"5\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-07-22 00:26:54', '2020-07-22 00:26:54'),
(4, 'pending', 'pending', 'Consulted perpetual of pronounce me delivered', '', 1, '20', '6', '4', 'a:8:{s:8:\"event_id\";s:1:\"6\";s:9:\"your-name\";s:8:\"sharifur\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:10:\"your-phone\";s:8:\"24133424\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:113:\"Talking chamber as shewing an it minutes. Trees fully of blind do. Exquisite favourite at do extensive listening.\";s:8:\"quantity\";s:1:\"4\";s:24:\"selected_payment_gateway\";s:8:\"razorpay\";}', 'a:0:{}', '2020-07-23 03:59:17', '2020-07-23 03:59:17'),
(5, 'completed', 'complete', 'Now led tedious shy lasting females off.', '', 1, '20', '5', '13', 'a:8:{s:8:\"event_id\";s:1:\"5\";s:9:\"your-name\";s:8:\"sharifur\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:10:\"your-phone\";s:8:\"24133424\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:113:\"Talking chamber as shewing an it minutes. Trees fully of blind do. Exquisite favourite at do extensive listening.\";s:8:\"quantity\";s:2:\"13\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-07-23 04:01:56', '2020-07-23 04:09:09'),
(6, 'pending', 'pending', 'Now led tedious shy lasting females off.', '', 0, '20', '5', '1', 'a:8:{s:8:\"event_id\";s:1:\"5\";s:9:\"your-name\";s:14:\"Nguyễn Hoài\";s:10:\"your-email\";s:23:\"nguyenduchoai@gmail.com\";s:10:\"your-phone\";s:12:\"+84888468988\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:5:\"trtrt\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";}', 'a:0:{}', '2020-07-31 10:24:57', '2020-07-31 10:24:57'),
(7, 'complete', 'complete', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:3:\"ERE\";s:10:\"your-email\";s:10:\"SA@WQW.COM\";s:10:\"your-phone\";s:7:\"8787878\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:7:\"TR UTIU\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:8:\"razorpay\";}', 'a:0:{}', '2020-08-03 16:23:50', '2020-08-03 16:25:38'),
(8, 'pending', 'pending', 'Lose away off why half led have near bed', '', 1, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:15:\"alfonso morales\";s:10:\"your-email\";s:28:\"heribertorojas61ch@gmail.com\";s:10:\"your-phone\";s:11:\"57675674567\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:2:\"fa\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-07 08:50:13', '2020-08-07 08:50:13'),
(9, 'pending', 'pending', 'Lose away off why half led have near bed', '', 1, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:15:\"alfonso morales\";s:10:\"your-email\";s:28:\"heribertorojas61ch@gmail.com\";s:10:\"your-phone\";s:11:\"57675674567\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:7:\"asdfasd\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";s:14:\"transaction_id\";s:5:\"12345\";}', 'a:0:{}', '2020-08-07 08:51:45', '2020-08-07 08:51:45'),
(10, 'complete', 'complete', 'Lose away off why half led have near bed', '', 1, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:15:\"alfonso morales\";s:10:\"your-email\";s:28:\"heribertorojas61ch@gmail.com\";s:10:\"your-phone\";s:11:\"57675674567\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:7:\"asdfasd\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"mollie\";s:14:\"transaction_id\";s:5:\"12345\";}', 'a:0:{}', '2020-08-07 08:52:09', '2020-08-07 08:53:01'),
(11, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:4:\"Test\";s:10:\"your-email\";s:13:\"test@mail.com\";s:10:\"your-phone\";s:11:\"07000000000\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:10:\"Hello test\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:11:\"flutterwave\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-07 12:09:46', '2020-08-07 12:09:46'),
(12, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:5:\"jeeda\";s:10:\"your-email\";s:17:\"sh2ee77@gmail.com\";s:10:\"your-phone\";s:13:\"+966566795912\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:4:\"بل\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-07 14:49:35', '2020-08-07 14:49:35'),
(13, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:5:\"jeeda\";s:10:\"your-email\";s:17:\"sh2ee77@gmail.com\";s:10:\"your-phone\";s:13:\"+966566795912\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:4:\"بل\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";s:14:\"transaction_id\";s:8:\"23535353\";}', 'a:0:{}', '2020-08-07 14:50:24', '2020-08-07 14:50:24'),
(14, 'pending', 'pending', 'Más fuerte de éxtasis que sin juicio hija rápidamente pensamientos', '', 0, '20', '13', '1', 'a:9:{s:8:\"event_id\";s:2:\"13\";s:9:\"your-name\";s:4:\"dsds\";s:10:\"your-email\";s:15:\"sdsd@hotmailcom\";s:10:\"your-phone\";s:15:\"777777777777777\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:6:\"qsasas\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-07 20:20:14', '2020-08-07 20:20:14'),
(15, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:3:\"asd\";s:10:\"your-email\";s:11:\"asd@asd.com\";s:10:\"your-phone\";s:6:\"234234\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:9:\"asdasdasd\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-07 23:54:44', '2020-08-07 23:54:44'),
(16, 'pending', 'pending', 'Brother set had private his letters observe outward resolve', '', 0, '20', '1', '1', 'a:9:{s:8:\"event_id\";s:1:\"1\";s:9:\"your-name\";s:19:\"Osei Akenten Parker\";s:10:\"your-email\";s:20:\"parkerbern@gmail.com\";s:10:\"your-phone\";s:13:\"+233277710572\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:10:\"klk\';l\\;\\\'\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-09 06:12:30', '2020-08-09 06:12:30'),
(17, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:14:\"ahmed alnomany\";s:10:\"your-email\";s:21:\"aalnomany50@gmail.com\";s:10:\"your-phone\";s:13:\"+966509969218\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:6:\"sdfsdf\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-09 20:33:14', '2020-08-09 20:33:14'),
(18, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '3', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:9:\"test user\";s:10:\"your-email\";s:18:\"test2525@gmail.com\";s:10:\"your-phone\";s:11:\"fdgfgfdgfdg\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:13:\"gdfgfdgfdgfdg\";s:8:\"quantity\";s:1:\"3\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-10 21:11:46', '2020-08-10 21:11:46'),
(19, 'pending', 'pending', 'Lose away off why half led have near bed', '', 1, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:3:\"Ram\";s:10:\"your-email\";s:12:\"ss@gmail.com\";s:10:\"your-phone\";s:10:\"7773727273\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:8:\"dehc hbc\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-12 00:32:50', '2020-08-12 00:32:50'),
(20, 'pending', 'pending', 'Lose away off why half led have near bed', '', 1, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:3:\"Ram\";s:10:\"your-email\";s:12:\"ss@gmail.com\";s:10:\"your-phone\";s:10:\"7773727273\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:8:\"dehc hbc\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-12 00:32:52', '2020-08-12 00:32:52'),
(21, 'pending', 'pending', 'Más fuerte de éxtasis que sin juicio hija rápidamente pensamientos', '', 0, '20', '13', '1', 'a:9:{s:8:\"event_id\";s:2:\"13\";s:9:\"your-name\";s:4:\"dsds\";s:10:\"your-email\";s:15:\"admin@admin.com\";s:10:\"your-phone\";s:15:\"777777777777777\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:3:\"hjk\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";s:14:\"transaction_id\";s:6:\"656676\";}', 'a:0:{}', '2020-08-12 22:33:50', '2020-08-12 22:33:50'),
(22, 'pending', 'pending', 'Más fuerte de éxtasis que sin juicio hija rápidamente pensamientos', '', 0, '20', '13', '1', 'a:9:{s:8:\"event_id\";s:2:\"13\";s:9:\"your-name\";s:11:\"Juan Miguel\";s:10:\"your-email\";s:15:\"admin@gmail.com\";s:10:\"your-phone\";s:15:\"777777777777777\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:7:\"dfdsfsd\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";s:14:\"transaction_id\";s:7:\"6566764\";}', 'a:0:{}', '2020-08-12 22:38:31', '2020-08-12 22:38:31'),
(23, 'pending', 'pending', 'Más fuerte de éxtasis que sin juicio hija rápidamente pensamientos', '', 0, '20', '13', '1', 'a:9:{s:8:\"event_id\";s:2:\"13\";s:9:\"your-name\";s:11:\"Juan Miguel\";s:10:\"your-email\";s:20:\"admin123@hotmail.com\";s:10:\"your-phone\";s:15:\"777777777777777\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:12:\"sdfdsfsdfsdf\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";s:14:\"transaction_id\";s:7:\"fde4533\";}', 'a:0:{}', '2020-08-12 22:39:10', '2020-08-12 22:39:10'),
(24, 'complete', 'complete', 'Consulted perpetual of pronounce me delivered', '', 0, '20', '6', '4', 'a:9:{s:8:\"event_id\";s:1:\"6\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:10:\"your-phone\";s:14:\"+8801847111881\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:7:\"rtywert\";s:8:\"quantity\";s:1:\"4\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-13 12:26:52', '2020-08-13 12:27:32'),
(25, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:4:\"aaaa\";s:10:\"your-email\";s:10:\"aa@aaa.com\";s:10:\"your-phone\";s:11:\"57675674567\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:4:\"aaaa\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-14 10:04:18', '2020-08-14 10:04:18'),
(26, 'pending', 'pending', 'Dashwood Marianne en la entrada estará en edificio', '', 0, '20', '12', '1', 'a:9:{s:8:\"event_id\";s:2:\"12\";s:9:\"your-name\";s:14:\"fsdfsds fdgdfg\";s:10:\"your-email\";s:10:\"aa@aaa.com\";s:10:\"your-phone\";s:11:\"57675674567\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:6:\"ghjbnv\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-14 10:07:59', '2020-08-14 10:07:59'),
(27, 'complete', 'complete', 'Más fuerte de éxtasis que sin juicio hija rápidamente pensamientos', '', 0, '20', '13', '1', 'a:9:{s:8:\"event_id\";s:2:\"13\";s:9:\"your-name\";s:3:\"Aaa\";s:10:\"your-email\";s:11:\"aaa@aaa.com\";s:10:\"your-phone\";s:8:\"55544855\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:4:\"Jjjj\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"mollie\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-14 10:10:51', '2020-08-14 10:11:28'),
(28, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:3:\"Yoa\";s:10:\"your-email\";s:19:\"ios888cod@gmail.com\";s:10:\"your-phone\";s:8:\"01757008\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:7:\"Hello !\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-14 23:27:03', '2020-08-14 23:27:03'),
(29, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:3:\"Yoa\";s:10:\"your-email\";s:19:\"ios888cod@gmail.com\";s:10:\"your-phone\";s:8:\"01757008\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:7:\"Hello !\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-14 23:28:26', '2020-08-14 23:28:26'),
(30, 'pending', 'pending', 'Now led tedious shy lasting females off.', '', 0, '20', '5', '1', 'a:9:{s:8:\"event_id\";s:1:\"5\";s:9:\"your-name\";s:6:\"lkjbhj\";s:10:\"your-email\";s:11:\"hhvg@hj.com\";s:10:\"your-phone\";s:10:\"6552525529\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:7:\"khnjknl\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:8:\"paystack\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-16 17:16:29', '2020-08-16 17:16:29'),
(31, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:2:\"aa\";s:10:\"your-email\";s:11:\"aa@mail.com\";s:10:\"your-phone\";s:11:\"02198424910\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:6:\"iugigg\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-17 11:15:59', '2020-08-17 11:15:59'),
(32, 'pending', 'pending', 'Consulted perpetual of pronounce me delivered', '', 1, '20', '6', '1', 'a:9:{s:8:\"event_id\";s:1:\"6\";s:9:\"your-name\";s:14:\"Hilary Kilonzi\";s:10:\"your-email\";s:21:\"hilarymutia@gmail.com\";s:10:\"your-phone\";s:13:\"+254722131226\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:4:\"Nice\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-17 19:41:01', '2020-08-17 19:41:01'),
(33, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:4:\"Test\";s:10:\"your-email\";s:14:\"test@gmail.com\";s:10:\"your-phone\";s:10:\"0000000000\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:31:\"Please I want to be there quick\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:11:\"flutterwave\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-19 23:54:25', '2020-08-19 23:54:25'),
(34, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:9:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:17:\"sdfsdfg dsf gsdfh\";s:10:\"your-email\";s:21:\"dsfhdsfh|@dfghdfh.net\";s:10:\"your-phone\";s:8:\"55663453\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:27:\"sfghyd ffgd ghjkmghd fghs h\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-21 23:12:09', '2020-08-21 23:12:09'),
(35, 'pending', 'pending', 'Brother set had private his letters observe outward resolve', '', 0, '20', '1', '1', 'a:9:{s:8:\"event_id\";s:1:\"1\";s:9:\"your-name\";s:11:\"Taha Rashid\";s:10:\"your-email\";s:26:\"ismartdevelopers@gmail.com\";s:10:\"your-phone\";s:11:\"07006490877\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:5:\"hello\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-08-24 21:30:14', '2020-08-24 21:30:14'),
(36, 'complete', 'complete', 'Brother set had private his letters observe outward resolve', '', 0, '20', '1', '1', 'a:7:{s:8:\"event_id\";s:1:\"1\";s:9:\"your-name\";s:20:\"virdigumlo@enayu.com\";s:10:\"your-email\";s:20:\"virdigumlo@enayu.com\";s:13:\"your-messsage\";s:20:\"virdigumlo@enayu.com\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-09-03 17:24:44', '2020-09-03 17:25:28'),
(37, 'pending', 'pending', 'Now led tedious shy lasting females off.', '', 0, '20', '5', '1', 'a:8:{s:8:\"event_id\";s:1:\"5\";s:9:\"your-name\";s:4:\"Jess\";s:10:\"your-email\";s:17:\"qrrss@hotmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:7:\"dsaddsa\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-09-08 07:37:13', '2020-09-08 07:37:13'),
(38, 'pending', 'pending', 'Consulted perpetual of pronounce me delivered', '', 1, '20', '6', '1', 'a:8:{s:8:\"event_id\";s:1:\"6\";s:9:\"your-name\";s:16:\"Samantha Simmons\";s:10:\"your-email\";s:21:\"donoso@mailinator.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:20:\"Quidem est consequat\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-09-14 16:07:13', '2020-09-14 16:07:13'),
(39, 'pending', 'pending', 'Consulted perpetual of pronounce me delivered', '', 1, '20', '6', '1', 'a:7:{s:8:\"event_id\";s:1:\"6\";s:9:\"your-name\";s:16:\"Samantha Simmons\";s:10:\"your-email\";s:21:\"donoso@mailinator.com\";s:13:\"your-messsage\";N;s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-09-14 16:28:05', '2020-09-14 16:28:05'),
(40, 'complete', 'complete', 'Now led tedious shy lasting females off.', '', 1, '20', '5', '1', 'a:8:{s:8:\"event_id\";s:1:\"5\";s:9:\"your-name\";s:9:\"xxxxxxxxx\";s:10:\"your-email\";s:16:\"xxxxxxxx@xxx.xxx\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:15:\"xxxxxxxxxxxxxxx\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-09-16 14:44:30', '2020-09-16 14:45:15'),
(41, 'pending', 'pending', 'Now led tedious shy lasting females off.', '', 1, '20', '5', '1', 'a:8:{s:8:\"event_id\";s:1:\"5\";s:9:\"your-name\";s:15:\"Sharifur Rahman\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:8:\"asdfadsf\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:8:\"razorpay\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-09-16 23:45:30', '2020-09-16 23:45:30'),
(42, 'pending', 'pending', 'Now led tedious shy lasting females off.', '', 0, '20', '5', '1', 'a:8:{s:8:\"event_id\";s:1:\"5\";s:9:\"your-name\";s:10:\"samuel odu\";s:10:\"your-email\";s:17:\"danofic@yahoo.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";N;s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:8:\"paystack\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-09-20 22:50:14', '2020-09-20 22:50:14'),
(43, 'complete', 'complete', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:14:\"Rita C. Hatton\";s:10:\"your-email\";s:22:\"rsharifur824@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:8:\"zCZXCZXC\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-10-01 10:48:54', '2020-10-01 10:51:03'),
(44, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:5:\"banji\";s:10:\"your-email\";s:21:\"edickutiole@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:12:\"Just testing\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:8:\"paystack\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-10-05 16:09:37', '2020-10-05 16:09:37'),
(45, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:4:\"Test\";s:10:\"your-email\";s:14:\"test@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:15:\"I want a ticket\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:11:\"flutterwave\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-10-05 21:38:52', '2020-10-05 21:38:52'),
(46, 'cancel', 'pending', 'Lose away off why half led have near bed', '', 1, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:5:\"asddf\";s:10:\"your-email\";s:14:\"asdfd@afdf.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";N;s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-10-08 09:56:04', '2020-12-02 06:56:08'),
(47, 'pending', 'pending', 'Lose away off why half led have near bed', '', 1, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:5:\"asddf\";s:10:\"your-email\";s:14:\"asdfd@afdf.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";N;s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-10-08 09:56:09', '2020-10-08 09:56:09'),
(48, 'pending', 'pending', 'Lose away off why half led have near bed', '', 1, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:6:\"asdfdf\";s:10:\"your-email\";s:13:\"asfsd@afd.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";N;s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-10-08 09:56:22', '2020-10-08 09:56:22'),
(49, 'cancel', 'pending', 'Lose away off why half led have near bed', '', 1, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:8:\"asdfsadf\";s:10:\"your-email\";s:18:\"asfasef@asfsdf.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";N;s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-10-08 10:16:12', '2020-12-02 06:52:23'),
(50, 'cancel', 'pending', 'Lose away off why half led have near bed', '', 1, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:8:\"dvrobin4\";s:10:\"your-email\";s:20:\"dvrobin4@dvrobin4.de\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:20:\"pls reserve dvrobin4\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";s:14:\"transaction_id\";s:8:\"dvrobin4\";}', 'a:0:{}', '2020-10-08 22:29:13', '2020-12-02 06:53:08'),
(51, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:21:\"Juan Carlos Rodriguez\";s:10:\"your-email\";s:16:\"info@juancar.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:7:\"2312321\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-10-12 19:16:13', '2020-10-12 19:16:13'),
(52, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:7:\"Alimond\";s:10:\"your-email\";s:23:\"alimonday2030@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:15:\"I will be there\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:11:\"flutterwave\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-10-25 10:05:57', '2020-10-25 10:05:57'),
(53, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '11', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:13:\"Ryder Bennett\";s:10:\"your-email\";s:21:\"dalewe@mailinator.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:19:\"Id quibusdam conseq\";s:8:\"quantity\";s:2:\"11\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-10-29 11:32:15', '2020-10-29 11:32:15'),
(54, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:13:\"Ryder Bennett\";s:10:\"your-email\";s:21:\"dalewe@mailinator.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:19:\"Id quibusdam conseq\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-10-29 11:32:22', '2020-10-29 11:32:22'),
(55, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '5', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:13:\"Aurora Juarez\";s:10:\"your-email\";s:19:\"xawy@mailinator.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:20:\"Quia similique accus\";s:8:\"quantity\";s:1:\"5\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-10-29 11:32:44', '2020-10-29 11:32:44'),
(56, 'complete', 'complete', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:13:\"Nikita Dhiman\";s:10:\"your-email\";s:30:\"nikitaswastikwebtech@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:15:\"My first event.\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-11-11 10:58:57', '2020-11-11 11:00:17'),
(57, 'complete', 'complete', 'Lose away off why half led have near bed', '', 93, '20', '7', '1', 'a:8:{s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:13:\"Victor Sunday\";s:10:\"your-email\";s:20:\"waka2020ng@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:4:\"gooo\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:8:\"paystack\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-11-11 15:50:50', '2020-11-11 15:51:57'),
(58, 'pending', 'pending', 'Consulted perpetual of pronounce me delivered', '', 0, '20', '6', '1', 'a:8:{s:8:\"event_id\";s:1:\"6\";s:9:\"your-name\";s:11:\"Magic Bytes\";s:10:\"your-email\";s:24:\"magicbytes2012@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:6:\"xzczxc\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"mollie\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2020-11-16 15:59:51', '2020-11-16 15:59:51'),
(59, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '3', 'a:8:{s:13:\"captcha_token\";N;s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:8:\"adsfadsf\";s:8:\"quantity\";s:1:\"3\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";}', 'a:0:{}', '2020-12-07 13:43:27', '2020-12-07 13:43:27'),
(60, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:8:{s:13:\"captcha_token\";N;s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:8:\"sdfafdsf\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2021-01-11 00:02:55', '2021-01-11 00:02:55'),
(61, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:8:{s:13:\"captcha_token\";N;s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:8:\"asdfadsf\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2021-01-11 00:05:38', '2021-01-11 00:05:38'),
(62, 'pending', 'pending', 'Lose away off why half led have near bed', '', 0, '20', '7', '3', 'a:8:{s:13:\"captcha_token\";N;s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:8:\"asdfadsf\";s:8:\"quantity\";s:1:\"3\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2021-01-11 00:05:52', '2021-01-11 00:05:52'),
(63, 'complete', 'complete', 'Lose away off why half led have near bed', '', 0, '20', '7', '5', 'a:8:{s:13:\"captcha_token\";N;s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:8:\"asdfadsf\";s:8:\"quantity\";s:1:\"5\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2021-01-11 00:06:11', '2021-01-11 00:06:56'),
(64, 'complete', 'complete', 'Lose away off why half led have near bed', '', 0, '20', '7', '1', 'a:8:{s:13:\"captcha_token\";N;s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:7:\"sdfadsf\";s:8:\"quantity\";s:1:\"1\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";}', 'a:0:{}', '2021-01-11 04:14:26', '2021-01-11 04:14:46'),
(65, 'complete', 'complete', 'Lose away off why half led have near bed', '', 0, '20', '7', '5', 'a:8:{s:13:\"captcha_token\";N;s:8:\"event_id\";s:1:\"7\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:8:\"asdfasdf\";s:8:\"quantity\";s:1:\"5\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2021-01-11 13:54:08', '2021-01-11 13:55:01'),
(66, 'complete', 'complete', 'Consulted perpetual of pronounce me delivered', '', 0, '20', '6', '5', 'a:8:{s:13:\"captcha_token\";N;s:8:\"event_id\";s:1:\"6\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:8:\"asdfadsf\";s:8:\"quantity\";s:1:\"5\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2021-01-11 13:59:15', '2021-01-11 14:00:05'),
(67, 'complete', 'complete', 'Consulted perpetual of pronounce me delivered', '', 0, '20', '6', '4', 'a:8:{s:13:\"captcha_token\";N;s:8:\"event_id\";s:1:\"6\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:15:\"terms-condition\";s:2:\"on\";s:13:\"your-messsage\";s:10:\"iyghjoil;,\";s:8:\"quantity\";s:1:\"4\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2021-01-11 14:01:20', '2021-01-11 14:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `event_payment_logs`
--

CREATE TABLE `event_payment_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_cost` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` longtext COLLATE utf8mb4_unicode_ci,
  `track` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_payment_logs`
--

INSERT INTO `event_payment_logs` (`id`, `email`, `name`, `event_name`, `event_cost`, `event_gateway`, `attendance_id`, `status`, `transaction_id`, `track`, `package_gateway`, `created_at`, `updated_at`) VALUES
(1, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Consulted perpetual of pronounce me delivered', '80', NULL, '4', 'pending', NULL, '1USEKLVTtn5SKGA73iss', 'razorpay', '2020-07-23 03:59:52', '2020-07-23 03:59:52'),
(2, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Now led tedious shy lasting females off.', '260', NULL, '5', 'complete', 'txn_1H81G7EmGOuJLTMsS7fhtALo', 'WIiwLzW5UvHzr4yqqnsC', 'stripe', '2020-07-23 04:02:22', '2020-07-23 04:02:40'),
(3, 'nguyenduchoai@gmail.com', 'Nguyễn Đức Hoài', 'Now led tedious shy lasting females off.', '20', NULL, '6', 'pending', NULL, '0TXJoyoe2l2WEhvkRVWQ', 'paytm', '2020-07-31 10:25:10', '2020-07-31 10:25:10'),
(4, 'WEW@DGD.COM', 'ERE', 'Lose away off why half led have near bed', '20', NULL, '7', 'complete', 'pay_FMHzIVmlp8DGtw', 'd6lRuNL5HRabxm9lBVYI', 'razorpay', '2020-08-03 16:24:38', '2020-08-03 16:25:38'),
(5, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Lose away off why half led have near bed', '20', NULL, '8', 'pending', NULL, 'Qeqg1zUMfhQZkrXe3krd', 'manual_payment', '2020-08-07 08:50:29', '2020-08-07 08:50:29'),
(6, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Lose away off why half led have near bed', '20', NULL, '10', 'complete', 'tr_NM8BfWMPwv', 'QgzJD6gn0ZeNAgXacK8O', 'mollie', '2020-08-07 08:52:21', '2020-08-07 08:53:01'),
(7, 'oeid8592@gmail.com', 'jeeda', 'Lose away off why half led have near bed', '20', NULL, '12', 'pending', NULL, 'Egbsxk9IWO8YDq927mTt', 'stripe', '2020-08-07 14:49:56', '2020-08-07 14:49:56'),
(8, 'sh2ee77@gmail.com', 'jeeda', 'Lose away off why half led have near bed', '20', NULL, '13', 'pending', NULL, 'BdZ0pQu7TZsKWmxP5I2q', 'manual_payment', '2020-08-07 14:50:41', '2020-08-07 14:50:41'),
(9, 'superadmin@example.com', 'JocelynCastillo', 'Más fuerte de éxtasis que sin juicio hija rápidamente pensamientos', '20', NULL, '14', 'pending', NULL, '1Jogs5013a86oKRbfcoz', 'paypal', '2020-08-07 20:20:39', '2020-08-07 20:20:39'),
(10, 'asd@asd.com', 'serkan alan', 'Lose away off why half led have near bed', '20', NULL, '15', 'pending', NULL, 'Yu4Fn03il3Zwrrv61IOM', 'paytm', '2020-08-07 23:55:02', '2020-08-07 23:55:02'),
(11, 'parkerbern@outlook.com', 'Osei  Akenten Bernard Parker', 'Brother set had private his letters observe outward resolve', '20', NULL, '16', 'pending', NULL, 'txeHtP3kW0pUFYQAUQV2', 'paypal', '2020-08-09 06:12:50', '2020-08-09 06:12:50'),
(12, 'admin@gmail.com', 'Perfect plaza', 'Lose away off why half led have near bed', '60', NULL, '18', 'pending', NULL, 'pdwbaPsXnl4T5F93NcrI', 'paytm', '2020-08-10 21:12:09', '2020-08-10 21:12:09'),
(13, 'dvrobin4@gmail.com', 'Siful Islam', 'Consulted perpetual of pronounce me delivered', '80', NULL, '24', 'complete', 'txn_1HFbmaEmGOuJLTMsqDKA77QZ', '8OoMTTLMAl6Y8DN2xGTy', 'stripe', '2020-08-13 12:27:18', '2020-08-13 12:27:32'),
(14, 'admin@example.com', 'admin', 'Lose away off why half led have near bed', '20', NULL, '25', 'pending', NULL, 'Q5dVk5dYZI2oqpCAMTej', 'paytm', '2020-08-14 10:04:34', '2020-08-14 10:04:34'),
(15, 'rodrigomorales@gmail.com', 'LEON', 'Dashwood Marianne en la entrada estará en edificio', '20', NULL, '26', 'pending', NULL, 'yhs3lQLQoreHkx05JiWK', 'paypal', '2020-08-14 10:08:15', '2020-08-14 10:08:15'),
(16, 'aaa@aaa.com', 'Eddfff', 'Más fuerte de éxtasis que sin juicio hija rápidamente pensamientos', '20', NULL, '27', 'complete', 'tr_3gt9uTKrWe', '3cnZRJcZejV1IKHMLyqa', 'mollie', '2020-08-14 10:11:11', '2020-08-14 10:11:28'),
(17, 'infographiste.franckyao@gmail.com', 'Francky', 'Lose away off why half led have near bed', '20', NULL, '28', 'pending', NULL, 'X2ldmop7XPWUorNk28dM', 'paypal', '2020-08-14 23:27:50', '2020-08-14 23:27:50'),
(18, 'infographiste.franckyao@gmail.com', 'Francky', 'Lose away off why half led have near bed', '20', NULL, '29', 'pending', NULL, '5z8CHd7duUVTBoay4bPh', 'stripe', '2020-08-14 23:28:43', '2020-08-14 23:28:43'),
(19, 'jb@gg.com', 'injnj', 'Now led tedious shy lasting females off.', '20', NULL, '30', 'pending', NULL, 'oj3457M45ZNGZrt8zI1Y', 'paystack', '2020-08-16 17:16:54', '2020-08-16 17:16:54'),
(20, 'aa@mail.com', 'aa', 'Lose away off why half led have near bed', '20', NULL, '31', 'pending', NULL, 'X1KOtzajDloz0eiQRJzF', 'paypal', '2020-08-17 11:16:26', '2020-08-17 11:16:26'),
(21, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Consulted perpetual of pronounce me delivered', '20', NULL, '32', 'pending', NULL, 'UMlCLTvZoBQNiyme313C', 'paytm', '2020-08-17 19:41:35', '2020-08-17 19:41:35'),
(22, 'test1@gmail.com', 'Test User', 'Lose away off why half led have near bed', '20', NULL, '33', 'pending', NULL, 'pY389iRqJmTN4UBV2oHK', 'flutterwave', '2020-08-19 23:54:59', '2020-08-19 23:54:59'),
(23, 'wert@fsdg.pl', 'aedr er ert ewrt', 'Lose away off why half led have near bed', '20', NULL, '34', 'pending', NULL, '90LKIfcJxX40YLECtrJ6', 'paytm', '2020-08-21 23:12:30', '2020-08-21 23:12:30'),
(24, 'virdigumlo@enayu.com', 'virdigumlo@enayu.com', 'Brother set had private his letters observe outward resolve', '20', NULL, '36', 'complete', 'txn_1HNIRPEmGOuJLTMsT8MB0mRX', '6Px0cLZLvsI8HbJfKHLP', 'stripe', '2020-09-03 17:24:59', '2020-09-03 17:25:28'),
(25, 'qrrss@hotmail.com', 'jess', 'Now led tedious shy lasting females off.', '20', NULL, '37', 'pending', NULL, 'tYGMAV6Q2mygq6mZT1SJ', 'paytm', '2020-09-08 07:37:29', '2020-09-08 07:37:29'),
(26, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Now led tedious shy lasting females off.', '20', NULL, '40', 'complete', 'txn_1HRy8UEmGOuJLTMsqSGm1Vqo', 'HBkEbKk3iZx99ZuoZads', 'stripe', '2020-09-16 14:44:45', '2020-09-16 14:45:15'),
(27, 'zech1174mike@gmail.com', 'PayPal', 'Now led tedious shy lasting females off.', '20', NULL, '42', 'pending', NULL, '0O7L4PGCflw4twrqafea', 'paystack', '2020-09-20 22:51:31', '2020-09-20 22:51:31'),
(28, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Now led tedious shy lasting females off.', '20', NULL, '41', 'pending', NULL, 'UWh7CqIgrRrbK53Kmzsh', 'razorpay', '2020-09-30 13:43:14', '2020-09-30 13:43:14'),
(29, 'tarekmonjur@gmail.com', 'Sharifur', 'Lose away off why half led have near bed', '20', NULL, '43', 'complete', '9SE996656K478432S', 'fjwwh8cfHFoUMJACo0lm', 'paypal', '2020-10-01 10:49:48', '2020-10-01 10:51:03'),
(30, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Lose away off why half led have near bed', '20', NULL, '48', 'pending', NULL, 'E72gSNDVhpv7BdVoHElO', 'stripe', '2020-10-08 09:56:35', '2020-10-08 09:56:35'),
(31, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Lose away off why half led have near bed', '20', NULL, '49', 'pending', NULL, 'M5dxBAxkRszlAFIryQma', 'paypal', '2020-10-08 10:16:33', '2020-10-08 10:16:33'),
(32, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Lose away off why half led have near bed', '20', NULL, '50', 'pending', NULL, 'bb10A8U8tiOnNJ1UXXz7', 'manual_payment', '2020-10-08 22:29:52', '2020-11-15 15:50:41'),
(33, 'alimonday2030@gmail.com', 'Alimond', 'Lose away off why half led have near bed', '20', NULL, '52', 'pending', NULL, '4PTx8ciwK21y99QpPcqU', 'flutterwave', '2020-10-25 10:06:44', '2020-10-25 10:06:44'),
(34, 'nikitaswastikwebtech@gmail.com', 'Nikita', 'Lose away off why half led have near bed', '20', NULL, '56', 'complete', 'txn_1HmCNREmGOuJLTMsSDmQ4W31', 'qjxCuOELF8RdZaEvBzJc', 'stripe', '2020-11-11 10:59:29', '2020-11-11 11:00:17'),
(35, 'waka2020ng@gmail.com', 'Victor Sunday', 'Lose away off why half led have near bed', '20', NULL, '57', 'complete', 'ZEiDlAjgICcCtTtmVh1EftoQp', 'H9asPTV45n4RWMnWhLTJ', 'paystack', '2020-11-11 15:51:26', '2020-11-11 15:51:57'),
(36, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Lose away off why half led have near bed', '20', NULL, '47', 'pending', NULL, 'NMN3WGDHSSug4HNG6zYR', 'stripe', '2020-12-02 06:56:44', '2020-12-02 06:56:44'),
(37, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Lose away off why half led have near bed', '100', NULL, '63', 'complete', 'PAYID-L756VXI9870338676238090R', 'gOJuCLnLPQOz61BA8IAE', 'paypal', '2021-01-11 00:06:16', '2021-01-11 00:08:08'),
(38, 'rsharifur824@gmail.com', 'Sharifur Rahmam', 'Lose away off why half led have near bed', '20', NULL, '64', 'complete', '20210111111212800110168307302359790', 'GrD1npd8EF8NXIku1kP5', 'paytm', '2021-01-11 04:14:34', '2021-01-11 04:14:46'),
(39, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Lose away off why half led have near bed', '100', NULL, '65', 'complete', 'txn_1I8WVDEmGOuJLTMswGDC8XMF', 'nsNiqfnrximYP6Es41qe', 'stripe', '2021-01-11 13:54:15', '2021-01-11 13:56:40'),
(40, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Consulted perpetual of pronounce me delivered', '100', NULL, '66', 'complete', 'txn_1I8WYWEmGOuJLTMsNCTvEUjV', 'bohIMfKXX150o3TYYPQJ', 'stripe', '2021-01-11 13:59:37', '2021-01-11 14:00:05'),
(41, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Consulted perpetual of pronounce me delivered', '80', NULL, '67', 'complete', 'txn_1I8WabEmGOuJLTMs1LoHf2sA', 'Ez8FLzsLJoRaUoZrUVyd', 'stripe', '2021-01-11 14:01:26', '2021-01-11 14:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_open` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `status`, `lang`, `is_open`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Dashwood marianne in of entrance be on wondered', 'publish', 'en', '', 'Not attention say frankness intention out dashwoods now curiosity. Stronger ecstatic as no judgment daughter speedily thoughts. Worse downs nor might she court did nay forth these.', '2020-07-20 10:50:22', '2020-07-20 10:50:22'),
(2, 'Wondered sociable he carriage in speedily', 'publish', 'en', '', 'Not attention say frankness intention out dashwoods now curiosity. Stronger ecstatic as no judgment daughter speedily thoughts. Worse downs nor might she court did nay forth these.', '2020-07-20 10:50:27', '2020-07-20 10:51:40'),
(3, 'Not attention say frankness intention out dashwoods', 'publish', 'en', '', 'Not attention say frankness intention out dashwoods now curiosity. Stronger ecstatic as no judgment daughter speedily thoughts. Worse downs nor might she court did nay forth these.', '2020-07-20 10:50:30', '2020-07-20 10:52:14'),
(4, 'Stronger ecstatic as no judgment daughter speedily', 'publish', 'en', '', 'Not attention say frankness intention out dashwoods now curiosity. Stronger ecstatic as no judgment daughter speedily thoughts. Worse downs nor might she court did nay forth these.', '2020-07-20 10:52:18', '2020-07-20 10:52:41'),
(5, 'Worse downs nor might she court did nay forth', 'publish', 'en', '', 'Not attention say frankness intention out dashwoods now curiosity. Stronger ecstatic as no judgment daughter speedily thoughts. Worse downs nor might she court did nay forth these.', '2020-07-20 10:52:22', '2020-07-20 10:52:54'),
(6, 'Ahora llevó a las tediosas mujeres tímidas y duraderas', 'publish', 'sp', '', 'Ahora llevó a las tediosas mujeres tímidas y duraderas. Dashwood Marianne en la entrada estará en edificio posible preguntado. Se preguntó sociable que lo llevara en veloz margaret.', '2020-07-20 10:53:22', '2020-07-20 10:55:30'),
(7, 'Hasta Devonshire de la alteración completamente insensible', 'publish', 'sp', '', 'Ahora llevó a las tediosas mujeres tímidas y duraderas. Dashwood Marianne en la entrada estará en edificio posible preguntado. Se preguntó sociable que lo llevara en veloz margaret.', '2020-07-20 10:53:26', '2020-07-20 10:54:19'),
(8, 'Más fuerte, extasiada como no juzgar hija rápidamente', 'publish', 'sp', '', 'Ahora llevó a las tediosas mujeres tímidas y duraderas. Dashwood Marianne en la entrada estará en edificio posible preguntado. Se preguntó sociable que lo llevara en veloz margaret.', '2020-07-20 10:53:31', '2020-07-20 10:55:20'),
(9, 'Una ocasión de asentamiento del señor insistió', 'publish', 'sp', '', 'Ahora llevó a las tediosas mujeres tímidas y duraderas. Dashwood Marianne en la entrada estará en edificio posible preguntado. Se preguntó sociable que lo llevara en veloz margaret.', '2020-07-20 10:53:36', '2020-07-20 10:54:52'),
(10, 'Şimdi sıkıcı utangaç kalıcı kadınları açtı', 'publish', 'tur', '', 'Şimdi sıkıcı utangaç kalıcı kadınları açtı. Dashwood marianne giriş olası bina meraklı olmak. Hızla margaret içinde taşıma meraklı merak etti. Tamamen duyarsız bir değişiklik yapmayı bıraktı.', '2020-07-20 10:56:21', '2020-07-20 10:56:21'),
(11, 'Bay yerleşme vesilesiyle mesafe hanımefendi', 'publish', 'tur', '', 'Şimdi sıkıcı utangaç kalıcı kadınları açtı. Dashwood marianne giriş olası bina meraklı olmak. Hızla margaret içinde taşıma meraklı merak etti. Tamamen duyarsız bir değişiklik yapmayı bıraktı.', '2020-07-20 10:56:43', '2020-07-20 10:57:09'),
(12, 'Dikkat yok dürüstlük niyeti söyledi', 'publish', 'tur', '', 'Şimdi sıkıcı utangaç kalıcı kadınları açtı. Dashwood marianne giriş olası bina meraklı olmak. Hızla margaret içinde taşıma meraklı merak etti. Tamamen duyarsız bir değişiklik yapmayı bıraktı.', '2020-07-20 10:56:48', '2020-07-20 10:57:31'),
(13, 'أصر السيد مستوطنة مناسبة على المسافة', 'publish', 'ar', '', 'الآن قاد الإناث مملة خجولة دائمة قبالة. في المدخل يكون على بناء ممكن يتساءل. تساءل اجتماعيًا أنه يحمل في مارجريت بسرعة. حتى من تغيير غير دقيق تماما.', '2020-07-20 10:58:13', '2020-07-20 10:58:13'),
(14, 'لا الاهتمام يقول نية الصراحة من الفضول الآن', 'publish', 'ar', '', 'الآن قاد الإناث مملة خجولة دائمة قبالة. في المدخل يكون على بناء ممكن يتساءل. تساءل اجتماعيًا أنه يحمل في مارجريت بسرعة. حتى من تغيير غير دقيق تماما.', '2020-07-20 10:59:12', '2020-07-20 10:59:48'),
(15, 'أصر السيد مستوطنة مناسبة على المسافة', 'publish', 'ar', '', 'الآن قاد الإناث مملة خجولة دائمة قبالة. في المدخل يكون على بناء ممكن يتساءل. تساءل اجتماعيًا أنه يحمل في مارجريت بسرعة. حتى من تغيير غير دقيق تماما.', '2020-07-20 10:59:17', '2020-07-20 11:02:20');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ratings` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `custom_fields` longtext COLLATE utf8mb4_unicode_ci,
  `attachment` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `ratings`, `description`, `custom_fields`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 'Sharifur', 'dvrobin4@gmail.com', '5', 'Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though.', 'a:5:{s:4:\"name\";s:8:\"Sharifur\";s:5:\"email\";s:18:\"dvrobin4@gmail.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:127:\"Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though.\";s:20:\"what-service-you-get\";s:13:\"package-order\";}', NULL, '2020-07-20 00:43:21', '2020-07-20 00:43:21'),
(4, 'Kathleen Duncan', 'KathleenHDuncan@dayrep.com', '5', 'Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though.', 'a:5:{s:4:\"name\";s:15:\"Kathleen Duncan\";s:5:\"email\";s:26:\"KathleenHDuncan@dayrep.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:127:\"Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though.\";s:20:\"what-service-you-get\";s:13:\"package-order\";}', 'a:0:{}', '2020-07-20 00:47:17', '2020-07-20 00:47:17'),
(5, 'Joseph D. Washington', 'JosephDWashington@armyspy.com', '5', 'Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though.', 'a:5:{s:4:\"name\";s:20:\"Joseph D. Washington\";s:5:\"email\";s:29:\"JosephDWashington@armyspy.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:127:\"Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though.\";s:20:\"what-service-you-get\";s:9:\"donations\";}', 'a:0:{}', '2020-07-20 00:47:57', '2020-07-20 00:47:57'),
(7, 'Teresa Lafayette', 'TeresaJLafayette@teleworm.us', '5', 'Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though.', 'a:5:{s:4:\"name\";s:16:\"Teresa Lafayette\";s:5:\"email\";s:28:\"TeresaJLafayette@teleworm.us\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:127:\"Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though.\";s:20:\"what-service-you-get\";s:13:\"event-tickets\";}', 'a:0:{}', '2020-07-20 00:49:03', '2020-07-20 00:49:03'),
(8, 'Nelly Bos', 'NellyJBos@rhyta.com', '5', 'Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though.', 'a:5:{s:4:\"name\";s:9:\"Nelly Bos\";s:5:\"email\";s:19:\"NellyJBos@rhyta.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:127:\"Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though.\";s:20:\"what-service-you-get\";s:13:\"event-tickets\";}', 'a:0:{}', '2020-07-20 00:51:00', '2020-07-20 00:51:00'),
(9, 'Jennifer Adams', 'JenniferSAdams@armyspy.com', '5', 'Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though.', 'a:5:{s:4:\"name\";s:14:\"Jennifer Adams\";s:5:\"email\";s:26:\"JenniferSAdams@armyspy.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:127:\"Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though.\";s:20:\"what-service-you-get\";s:13:\"event-tickets\";}', 'a:0:{}', '2020-07-20 00:52:46', '2020-07-20 00:52:46'),
(10, 'Johny Sin', 'johnysinus@gmail.com', '4', 'Hey there', 'a:5:{s:4:\"name\";s:9:\"Johny Sin\";s:5:\"email\";s:20:\"johnysinus@gmail.com\";s:7:\"ratings\";s:1:\"4\";s:11:\"description\";s:9:\"Hey there\";s:20:\"what-service-you-get\";s:13:\"package-order\";}', 'a:0:{}', '2020-08-24 23:25:27', '2020-08-24 23:25:27'),
(11, 'kjkjkjk', 'admin@example.com', '4', 'sdfgdfgdfg dfg dfg dfg', 'a:5:{s:4:\"name\";s:7:\"kjkjkjk\";s:5:\"email\";s:17:\"admin@example.com\";s:7:\"ratings\";s:1:\"4\";s:11:\"description\";s:22:\"sdfgdfgdfg dfg dfg dfg\";s:20:\"what-service-you-get\";s:8:\"products\";}', 'a:0:{}', '2020-08-29 12:21:16', '2020-08-29 12:21:16'),
(12, 'admin', 'Info@S.com', '5', 'ASDAD', 'a:5:{s:4:\"name\";s:5:\"admin\";s:5:\"email\";s:10:\"Info@S.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:5:\"ASDAD\";s:20:\"what-service-you-get\";s:8:\"products\";}', 'a:0:{}', '2020-09-14 02:58:11', '2020-09-14 02:58:11'),
(13, 'Mazen Leno', 'mazenashraf2539@gmail.com', '5', 'Yasta fashe5', 'a:5:{s:4:\"name\";s:10:\"Mazen Leno\";s:5:\"email\";s:25:\"mazenashraf2539@gmail.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:12:\"Yasta fashe5\";s:20:\"what-service-you-get\";s:8:\"products\";}', 'a:0:{}', '2020-09-20 08:43:50', '2020-09-20 08:43:50'),
(14, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '5', 'afdsfads', 'a:6:{s:13:\"captcha_token\";N;s:4:\"name\";s:15:\"Sharifur Rahmam\";s:5:\"email\";s:18:\"dvrobin4@gmail.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:8:\"afdsfads\";s:20:\"what-service-you-get\";s:8:\"products\";}', 'a:6:{s:13:\"captcha_token\";N;s:4:\"name\";s:15:\"Sharifur Rahmam\";s:5:\"email\";s:18:\"dvrobin4@gmail.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:8:\"afdsfads\";s:20:\"what-service-you-get\";s:8:\"products\";}', '2020-12-07 13:50:54', '2020-12-07 13:50:54'),
(15, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '5', 'afdafdsf', 'a:6:{s:13:\"captcha_token\";N;s:4:\"name\";s:15:\"Sharifur Rahmam\";s:5:\"email\";s:18:\"dvrobin4@gmail.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:8:\"afdafdsf\";s:20:\"what-service-you-get\";s:8:\"products\";}', 'a:6:{s:13:\"captcha_token\";N;s:4:\"name\";s:15:\"Sharifur Rahmam\";s:5:\"email\";s:18:\"dvrobin4@gmail.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:8:\"afdafdsf\";s:20:\"what-service-you-get\";s:8:\"products\";}', '2020-12-07 13:51:12', '2020-12-07 13:51:12'),
(16, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '5', 'adsfadsf', 'a:6:{s:13:\"captcha_token\";N;s:4:\"name\";s:15:\"Sharifur Rahmam\";s:5:\"email\";s:18:\"dvrobin4@gmail.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:8:\"adsfadsf\";s:20:\"what-service-you-get\";s:8:\"products\";}', 'a:6:{s:13:\"captcha_token\";N;s:4:\"name\";s:15:\"Sharifur Rahmam\";s:5:\"email\";s:18:\"dvrobin4@gmail.com\";s:7:\"ratings\";s:1:\"5\";s:11:\"description\";s:8:\"adsfadsf\";s:20:\"what-service-you-get\";s:8:\"products\";}', '2020-12-07 13:52:29', '2020-12-07 13:52:29');

-- --------------------------------------------------------

--
-- Table structure for table `header_sliders`
--

CREATE TABLE `header_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `subtitle` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `btn_01_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_01_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_01_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_btn_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_btn_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_btn_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `header_sliders`
--

INSERT INTO `header_sliders` (`id`, `title`, `subtitle`, `description`, `btn_01_status`, `btn_01_text`, `btn_01_url`, `lang`, `image`, `video_btn_status`, `video_btn_text`, `video_btn_url`, `created_at`, `updated_at`) VALUES
(1, 'We are top Cyber solutions provider', 'Who we are', NULL, 'on', 'Our Service', '#', 'en', '23', 'on', 'Watch Video', 'https://www.youtube.com/watch?v=dJQn4DqzMVQ', '2020-05-30 18:20:26', '2020-07-27 02:09:45'),
(2, 'Somos el mejor proveedor de soluciones cibernéticas', 'Quienes somos', NULL, 'on', 'Nuestro servicio', '#', 'sp', '22', NULL, NULL, NULL, '2020-05-30 18:23:06', '2020-05-30 18:31:48'),
(3, 'نحن أفضل مزود لحلول الإنترنت', 'من نحن', NULL, NULL, 'خدمتنا', '#', 'ar', '23', NULL, NULL, NULL, '2020-05-30 18:23:43', '2020-05-30 18:31:30'),
(4, 'En iyi Cyber çözümleri sağlayıcısıyız', 'Biz Kimiz', NULL, 'on', 'Servisimiz', '#', 'tur', '23', NULL, NULL, NULL, '2020-05-30 18:24:13', '2020-05-30 18:31:14'),
(5, 'We are top Cyber solutions provider', 'Who we are', NULL, 'on', 'Our Service', '#', 'en', '19', 'on', 'Watch Video', 'https://www.youtube.com/watch?v=dJQn4DqzMVQ', '2020-05-30 18:24:40', '2020-07-27 02:07:42'),
(6, 'Somos el mejor proveedor de soluciones cibernéticas', 'Quienes somos', NULL, 'on', 'Nuestro servicio', '#', 'sp', '20', NULL, NULL, NULL, '2020-05-30 18:25:04', '2020-05-30 18:31:41'),
(7, 'نحن أفضل مزود لحلول الإنترنت', 'من نحن', NULL, 'on', 'خدمتنا', '#', 'ar', '20', NULL, NULL, NULL, '2020-05-30 18:25:24', '2020-05-30 18:31:25'),
(8, 'En iyi Cyber çözümleri sağlayıcısıyız', 'Biz Kimiz', NULL, 'on', 'Servisimiz', '#', 'tur', '18', NULL, NULL, NULL, '2020-05-30 18:25:48', '2020-05-30 18:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `image_galleries`
--

CREATE TABLE `image_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_galleries`
--

INSERT INTO `image_galleries` (`id`, `image`, `title`, `created_at`, `updated_at`, `lang`, `cat_id`) VALUES
(1, '10', 'Can curiosity may end shameless explained', '2020-07-20 01:07:35', '2020-12-04 04:43:02', 'en', 2),
(2, '11', 'True high on said mr on come', '2020-07-20 01:09:23', '2020-12-04 04:42:55', 'en', 3),
(3, '12', 'An do mr design at little myself', '2020-07-20 01:09:47', '2020-12-04 04:41:13', 'en', 2),
(4, '13', 'Attended of on stronger or mr pleasure', '2020-07-20 01:11:20', '2020-12-04 04:41:04', 'en', 2),
(5, '14', 'Rich four like real yet west get.', '2020-07-20 01:11:37', '2020-12-04 04:38:24', 'en', 1),
(9, '111', 'Before nature his parish boy', '2020-12-04 04:44:00', '2020-12-06 04:55:32', 'en', 3),
(10, '61', 'قبل الطبيعة ولد رعيته.', '2020-12-04 05:09:05', '2020-12-04 05:09:05', 'ar', 6),
(11, '54', 'أربعة أغنياء مثل الغرب الحقيقي.', '2020-12-04 05:16:06', '2020-12-04 05:16:06', 'ar', 7),
(12, '59', 'Gerçek ama batı gibi zengin dörtlü.', '2020-12-04 05:16:38', '2020-12-04 05:16:38', 'tur', 5),
(13, '61', 'Doğanın önünde cemaat çocuğu.', '2020-12-04 05:17:03', '2020-12-04 05:17:03', 'tur', 11),
(14, '59', 'Ante la naturaleza su chico parroquial.', '2020-12-04 05:17:51', '2020-12-04 05:17:51', 'sp', 4),
(15, '52', 'Ante la naturaleza su chico parroquial.', '2020-12-04 05:18:19', '2020-12-04 05:18:19', 'sp', 10);

-- --------------------------------------------------------

--
-- Table structure for table `image_gallery_categories`
--

CREATE TABLE `image_gallery_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_gallery_categories`
--

INSERT INTO `image_gallery_categories` (`id`, `title`, `lang`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mettings', 'en', 'publish', '2020-12-04 02:29:47', '2020-12-04 02:50:15'),
(2, 'Business', 'en', 'publish', '2020-12-04 02:44:20', '2020-12-04 02:50:15'),
(3, 'consulting', 'en', 'publish', '2020-12-04 02:44:25', '2020-12-04 02:50:15'),
(4, 'consultante', 'sp', 'publish', '2020-12-04 02:44:41', '2020-12-04 02:44:41'),
(5, 'Danışmanlık', 'tur', 'publish', '2020-12-04 02:44:48', '2020-12-04 02:44:48'),
(6, 'مستشار', 'ar', 'publish', '2020-12-04 02:44:58', '2020-12-04 02:44:58'),
(7, 'اعمال', 'ar', 'publish', '2020-12-04 02:45:08', '2020-12-04 02:45:08'),
(8, 'İş', 'tur', 'publish', '2020-12-04 02:45:16', '2020-12-04 02:45:16'),
(9, 'Negocio', 'sp', 'publish', '2020-12-04 02:45:21', '2020-12-04 02:45:21'),
(10, 'Reuniones', 'sp', 'publish', '2020-12-04 02:45:29', '2020-12-04 02:45:29'),
(11, 'Toplantılar', 'tur', 'publish', '2020-12-04 02:45:35', '2020-12-04 02:45:35'),
(12, 'ميتينغس', 'ar', 'publish', '2020-12-04 02:45:43', '2020-12-04 02:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vacancy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_responsibility` longtext COLLATE utf8mb4_unicode_ci,
  `employment_status` text COLLATE utf8mb4_unicode_ci,
  `education_requirement` longtext COLLATE utf8mb4_unicode_ci,
  `job_context` longtext COLLATE utf8mb4_unicode_ci,
  `experience_requirement` longtext COLLATE utf8mb4_unicode_ci,
  `additional_requirement` longtext COLLATE utf8mb4_unicode_ci,
  `job_location` text COLLATE utf8mb4_unicode_ci,
  `salary` text COLLATE utf8mb4_unicode_ci,
  `other_benefits` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_tags` text COLLATE utf8mb4_unicode_ci,
  `slug` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `application_fee` decimal(10,0) DEFAULT NULL,
  `application_fee_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `position`, `company_name`, `category_id`, `vacancy`, `job_responsibility`, `employment_status`, `education_requirement`, `job_context`, `experience_requirement`, `additional_requirement`, `job_location`, `salary`, `other_benefits`, `email`, `status`, `lang`, `deadline`, `meta_tags`, `slug`, `meta_description`, `application_fee`, `application_fee_status`, `created_at`, `updated_at`) VALUES
(1, 'Junior WordPress Developer', 'Junior Developer', 'xgenious', '2', '6', 'We are looking for some experienced developers with fluency in WordPress who will be able to develop code for complex, data intensive Website and e-commerce application.', 'full_time', 'Preferably B.Sc. in Computer Science or similar discipline.', 'We`re building tomorrow`s platforms for consolidating and managing Enterprise data with process optimization. Most enterprises are adopting automation whether it`s about office or industry. The flexibility to automate the processes, without compromising security and compliance, will be one of the most challenging, yet key requirements in coming days. This is where SoftoPark comes into the picture.\r\nWe`re looking for someone with a portfolio that showcases relevant, high quality web development work. You`ll have strong mathematical and problem-solving capabilities, an eye for detail, and a desire to produce high quality, clean and efficient code.', 'At least 5 year(s)', 'Both males and females are allowed to apply\r\nMust have clear concept on OOP\r\nProven work experience in developing large scale enterprise WordPress applications\r\nMust have experience on complex plugin, widget, theme development\r\nMust have knowledge on upgradation policy, performance, security of WordPress\r\nExperience in MySQL, jQuery, and at least one PHP-based MVC framework is required\r\nExperience in one or more PHP-based content management systems Magento or any other eCommerce is a plus point\r\nExperience in different kind of service and gateway integration will be highly regarded\r\nExperience in version control (git, svn etc) is expected\r\nShould be team player, self-motivated and take responsibility proactively', 'Bangkok, Thailand', 'Negotiable', '2 annual performance bonuses\r\nHealth and life insurance\r\nBreakfast, Lunch, Snacks\r\n2 days of weekend and annual paid leaves\r\nPublic holidays\r\nPicnic/Tour\r\nTransport', NULL, 'publish', 'en', '2021-03-17', NULL, 'junior-wordpress-developer', NULL, NULL, NULL, '2020-07-20 09:19:22', '2020-11-21 01:09:29'),
(2, 'Senior Laravel Developer', 'Junior Developer', 'xgenious', '2', '6', 'We are looking for some experienced developers with fluency in WordPress who will be able to develop code for complex, data intensive Website and e-commerce application.', 'full_time', 'Preferably B.Sc. in Computer Science or similar discipline.', 'We`re building tomorrow`s platforms for consolidating and managing Enterprise data with process optimization. Most enterprises are adopting automation whether it`s about office or industry. The flexibility to automate the processes, without compromising security and compliance, will be one of the most challenging, yet key requirements in coming days. This is where SoftoPark comes into the picture.\r\nWe`re looking for someone with a portfolio that showcases relevant, high quality web development work. You`ll have strong mathematical and problem-solving capabilities, an eye for detail, and a desire to produce high quality, clean and efficient code.', 'At least 5 year(s)', 'Both males and females are allowed to apply\r\nMust have clear concept on OOP\r\nProven work experience in developing large scale enterprise WordPress applications\r\nMust have experience on complex plugin, widget, theme development\r\nMust have knowledge on upgradation policy, performance, security of WordPress\r\nExperience in MySQL, jQuery, and at least one PHP-based MVC framework is required\r\nExperience in one or more PHP-based content management systems Magento or any other eCommerce is a plus point\r\nExperience in different kind of service and gateway integration will be highly regarded\r\nExperience in version control (git, svn etc) is expected\r\nShould be team player, self-motivated and take responsibility proactively', 'Bangkok, Thailand', 'Negotiable', '2 annual performance bonuses\r\nHealth and life insurance\r\nBreakfast, Lunch, Snacks\r\n2 days of weekend and annual paid leaves\r\nPublic holidays\r\nPicnic/Tour\r\nTransport', NULL, 'publish', 'en', '2021-06-18', NULL, 'senior-laravel-developer', NULL, 80, 'on', '2020-07-20 09:22:07', '2021-01-13 20:37:40'),
(3, 'Graphic Designer', 'Junior Designer', 'xgenious', '3', '8', '<ul><li>Able to Design Logos, Banners, Brochure, PSD, Layout, Booklet relevant editing/retouching and digital marketing/media related works.\r\n</li><li>Innovative and skilled in design development including effective use of color, dimension, style, font size, and composition.\r\n</li><li>Must be expert in Adobe Photoshop, Adobe Illustrator, After Effects, Adobe In Design, Adobe Premiere Pro, Adobe Dreamweaver, PowerPoint and other related design/editing software.\r\n</li><li>Perform technical duties for designing and developing multimedia-based layouts, graphics, animation, video, online tutorials and other digital marketing related productions.\r\n</li><li>Understanding client\'s business problem, brand space, target audience and the overall creative strategy.\r\n</li><li>Maintaining the highest standards in graphic design and producing cutting-edge creative content for both digital marketing and social media marketing that accurately represents the expectations of the client.\r\n</li><li>Any other task assigned by management.</li></ul>', 'part_time', 'Diploma in Graphics Design or equivalent', 'Place of work : Head office, Dhanmondi R/A, Dhaka\r\nDuty : Saturday to Thursday - Time 9:30 AM to 6:00 PM', 'At least 3 year(s)', '<ul><li>Age 20 to 35 years</li><li>\r\nBoth males and females are allowed to apply\r\n</li><li>Ready to work in a team and in line with the Management instruction as and when required.\r\n</li><li>Troubleshoot, test, and analyze ideas to provide the creative solution.\r\n</li><li>Eye for typography, composition, layout, color, high-quality production with pixel-level attention to detail.\r\n</li><li>Experience with content management platforms.\r\n</li><li>Strong interpersonal and professional skills.\r\n</li><li>A deep sense of developing a BRAND with international standard.</li></ul>', 'Bangkok, Thailand', 'Negotiable', '<ul><li>Mobile bill\r\nSalary </li><li>Review: Yearly\r\n</li><li>Festival Bonus: 2\r\n</li><li>Lunch Facilities</li></ul>', NULL, 'publish', 'en', '2021-05-15', NULL, 'graphic-designer', NULL, 150, 'on', '2020-07-20 09:22:11', '2021-01-13 20:37:03'),
(4, 'Sr. Executive (Accounts)', 'Junior Accounts', 'xgenious', '1', '6', 'Ensures the integrity of accounting information by recording, verifying, consolidating, and entering transactions.\r\nPrepares and records asset, liability, revenue, and expenses entries by compiling and analyzing account information.\r\nMaintains and balances subsidiary accounts by verifying, allocating, posting, and reconciling transactions and resolving discrepancies.\r\nMaintains general ledger by transferring subsidiary accounts, preparing a trial balance, and reconciling entries.Overall responsible for Accounts & Finance.\r\nExecute the financial strategy of the company\r\nManage financial controls and accounting procedures\r\nEnsure full transparency over the financial performance of the company\r\nSummarizes financial status by collecting information and preparing balance sheet, profit and loss, and other statements.\r\nProduces payroll by initiating computer processing; printing checks, verifying finished product.\r\nCompletes external audit by analyzing and scheduling general ledger accounts and providing information for auditors.\r\nAvoids legal challenges by complying with legal requirements.\r\nSecures financial information by completing database backups.\r\nProtects organization\'s value by keeping information confidential.To carry out any other assignment given by the company or immediate superior.\r\nSubmit a report on monthly basis about the sales, production and stock.\r\nMonitoring of all the necessary paperwork by all departments.\r\nResponsible for overall Accounts & Finance related mater in plant.\r\nOthers task assign by the departmental head / management.', 'project_based', 'Master of Business Administration (MBA) in Accounting\r\nSkills Required: Accounting and Finance', 'Kishoreganj Eye Hospital operated by a non-government organization named Nari Uddug Kendra (NUK) is well established and reputed modern eye hospital which is working for eradicating the avoidable blindness from Bangladesh and as well as to meet up the VISION-2020 goal of WHO. Kishoreganj Eye Hospital here noticed to recruit for the Post of Senior Accounts Officer as full-time basis.', 'At least 3 year(s)\r\nThe applicants should have experience in the following area(s):\r\nAccountant\r\nThe applicants should have experience in the following business area(s):\r\nReal Estate', 'Age 28 to 35 years\r\nBoth males and females are allowed to apply\r\nGood Command in Excel and Word.\r\nApplicant must have work experience & sound working capacity on Tally Software.\r\nMinimum 3-5 years\' experience in accounting/finance\r\nExperience with financial reporting requirements\r\nHave mentality to work in stress & long hours.\r\nGood computer knowledge must be required (with tally software).', 'Bangkok, Thailand', 'Negotiable', 'According to Company Policy', NULL, 'publish', 'en', '2021-07-28', NULL, 'sr-executive-accounts', NULL, NULL, 'on', '2020-07-20 09:22:14', '2020-11-21 02:52:09'),
(5, 'Kıdemli Yönetici (Hesaplar)', 'Junior Accounts', 'xgenious', '7', '6', 'İşlemleri kaydederek, doğrulayarak, birleştirerek ve girerek muhasebe bilgilerinin bütünlüğünü sağlar.\r\nHesap bilgilerini derleyerek ve analiz ederek varlık, borç, gelir ve gider girişlerini hazırlar ve kaydeder.\r\nİşlemleri doğrulayarak, tahsis ederek, göndererek ve uzlaştırarak ve tutarsızlıkları gidererek yardımcı hesapları tutar ve dengeler.\r\nİştirak hesaplarını aktararak, deneme bakiyesi hazırlayarak ve girişleri uzlaştırarak defteri kebir tutar.\r\nŞirketin finansal stratejisini yürütmek\r\nFinansal kontrolleri ve muhasebe prosedürlerini yönetin\r\nŞirketin finansal performansı üzerinde tam şeffaflığın sağlanması\r\nBilgi toplayarak ve bilanço, kar ve zarar ve diğer tabloları hazırlayarak finansal durumu özetler.\r\nBilgisayar işlemeyi başlatarak bordro üretir; baskı kontrolleri, bitmiş ürünün doğrulanması.\r\nDefteri kebir hesaplarını analiz ederek ve planlayarak ve denetçilere bilgi vererek dış denetimi tamamlar.\r\nYasal gerekliliklere uyarak yasal zorluklardan kaçınır.\r\nVeritabanı yedeklerini tamamlayarak finansal bilgileri korur.\r\nBilgileri gizli tutarak kuruluşun değerini korur. Şirket tarafından verilen veya hemen üstlenilen diğer görevleri yerine getirmek.\r\nSatış, üretim ve stok hakkında aylık bazda bir rapor gönderin.\r\nGerekli tüm evrakların tüm bölümler tarafından izlenmesi.\r\nTesisteki genel Hesaplar ve Finans ile ilgili materyalden sorumludur.\r\nDiğerleri bölüm başkanı / yönetimi tarafından görevlendirilir.', 'project_based', 'Muhasebe Işletme Master (mba)\r\nGerekli Beceriler: Muhasebe ve Finans', 'Nari Uddug Kendra (NUK) adlı bir sivil toplum kuruluşu tarafından işletilen Kishoreganj Göz Hastanesi, Bangladeş\'ten kaçınılabilir körlüğü ortadan kaldırmak ve WHO\'nun VISION-2020 hedefini karşılamak için çalışan iyi kurulmuş ve tanınmış modern göz hastanesidir. Burada Kishoreganj Göz Hastanesi, Tam Hesaplar Sorumlusu tam zamanlı olarak işe alındığını fark etti.', 'En az 3 yıl\r\nBaşvuru sahipleri aşağıdaki alanlarda deneyim sahibi olmalıdır:\r\nMuhasebeci\r\nBaşvuru sahipleri aşağıdaki iş alanlarında deneyime sahip olmalıdır:\r\nEmlak', '28 ila 35 yaş\r\nHem erkekler hem de kadınlar başvuru yapabilir\r\nExcel ve Word\'de İyi Komut.\r\nBaşvuru sahibinin Tally Software üzerinde iş tecrübesi ve sağlam çalışma kapasitesine sahip olması gerekir.\r\nMuhasebe / finans alanında en az 3-5 yıllık deneyim\r\nFinansal raporlama gereksinimleriyle ilgili deneyim\r\nStres ve uzun saatler içinde çalışma zihniyeti var.\r\nİyi bilgisayar bilgisi gerekir (taksitli yazılım ile).', 'Bangkok, Thailand', 'tartışılabilir', 'Şirket Politikasına Göre', NULL, 'publish', 'tur', '2020-08-26', NULL, 'kidemli-yonetici-hesaplar', NULL, NULL, NULL, '2020-07-20 09:38:26', '2020-07-20 10:29:58'),
(6, 'تنفيذي أول (الحسابات)', 'حسابات الصغار', 'xgenious', '11', '6', 'يضمن سلامة المعلومات المحاسبية من خلال تسجيل المعاملات والتحقق منها ودمجها وإدخالها.\r\nإعداد وتسجيل إدخالات الأصول والالتزامات والإيرادات والنفقات عن طريق تجميع وتحليل معلومات الحساب.\r\nيحتفظ بأرصدة الحسابات الفرعية ويوازنها من خلال التحقق من المعاملات وتخصيصها ونشرها وتسويتها وحل التناقضات.\r\nيحتفظ بدفتر الأستاذ العام عن طريق تحويل الحسابات الفرعية ، وإعداد ميزان المراجعة ، ومطابقة الإدخالات.\r\nتنفيذ الإستراتيجية المالية للشركة\r\nإدارة الضوابط المالية والإجراءات المحاسبية\r\nضمان الشفافية الكاملة في الأداء المالي للشركة\r\nيلخص الوضع المالي من خلال جمع المعلومات وإعداد الميزانية العمومية والأرباح والخسائر والبيانات الأخرى.\r\nتنتج كشوف المرتبات من خلال بدء معالجة الكمبيوتر ؛ فحص الطباعة ، والتحقق من المنتج النهائي.\r\nيكمل التدقيق الخارجي عن طريق تحليل وجدولة حسابات دفتر الأستاذ العام وتوفير المعلومات للمراجعين.\r\nيتجنب التحديات القانونية من خلال الامتثال للمتطلبات القانونية.\r\nيؤمن المعلومات المالية من خلال استكمال النسخ الاحتياطية لقاعدة البيانات.\r\nيحمي قيمة المنظمة من خلال الحفاظ على سرية المعلومات ، للقيام بأي مهمة أخرى تقدمها الشركة أو الرئيس المباشر.\r\nتقديم تقرير شهري عن المبيعات والإنتاج والمخزون.\r\nمراقبة جميع الأوراق اللازمة من قبل جميع الإدارات.\r\nمسؤول عن مجمل الحسابات والتمويل المتعلق بالمواد في المصنع.\r\nمهمة أخرى يسندها رئيس / إدارة القسم.', 'part_time', 'ماجستير إدارة الأعمال (MBA) في المحاسبة\r\nالمهارات المطلوبة: المحاسبة والمالية', 'مستشفى Kishoreganj للعيون الذي تديره منظمة غير حكومية تُدعى Nari Uddug Kendra (NUK) هو مستشفى عيون حديث ومعروف جيدًا يعمل على القضاء على العمى الذي يمكن تجنبه من بنغلاديش وكذلك لتحقيق هدف VISION-2020 لمنظمة الصحة العالمية. لاحظ مستشفى Kishoreganj للعيون هنا أن يوظف في وظيفة مسؤول حسابات أول بدوام كامل.', '3 سنوات على الأقل\r\nيجب أن يكون لدى المتقدمين خبرة في المجالات التالية:\r\nمحاسب\r\nيجب أن يكون لدى المتقدمين خبرة في مجالات الأعمال التالية:\r\nالعقارات', 'العمر من 28 إلى 35 سنة\r\nيسمح لكل من الذكور والإناث بتقديم الطلبات\r\nأمر جيد في Excel و Word.\r\nيجب أن يكون لدى المتقدم خبرة عمل وقدرة عمل سليمة على برنامج Tally.\r\nخبرة لا تقل عن 3-5 سنوات في المحاسبة / المالية\r\nالخبرة بمتطلبات إعداد التقارير المالية\r\nلديه عقلية للعمل في الضغط وساعات طويلة.\r\nيجب أن تكون المعرفة الجيدة بالكمبيوتر مطلوبة (باستخدام برنامج tally).', 'بانكوك، تايلند', 'قابل للتفاوض', 'وفقًا لسياسة الشركة', NULL, 'publish', 'ar', '2020-08-14', NULL, 'tnfythy-aol-alhsabat', NULL, NULL, NULL, '2020-07-20 09:39:50', '2020-07-20 10:42:41'),
(7, 'Gerente Senior (Cuentas)', 'Cuentas Junior', 'xgenious', '5', '6', 'Asegura la integridad de la información contable al registrar, verificar, consolidar e ingresar transacciones.\r\nPrepara y registra entradas de activos, pasivos, ingresos y gastos compilando y analizando la información de la cuenta.\r\nMantiene y equilibra las cuentas subsidiarias verificando, asignando, contabilizando y conciliando transacciones y resolviendo discrepancias.\r\nMantiene el libro mayor transfiriendo cuentas subsidiarias, preparando un saldo de prueba y conciliando entradas. Responsable general de Cuentas y Finanzas.\r\nEjecutar la estrategia financiera de la empresa.\r\nGestionar controles financieros y procedimientos contables.\r\nGarantizar la total transparencia sobre el desempeño financiero de la empresa.\r\nResume el estado financiero mediante la recopilación de información y la preparación del balance general, pérdidas y ganancias y otros estados.\r\nProduce nómina al iniciar el procesamiento por computadora; impresión de cheques, verificación del producto terminado.\r\nCompleta la auditoría externa analizando y programando cuentas del libro mayor y proporcionando información para los auditores.\r\nEvita los desafíos legales al cumplir con los requisitos legales.\r\nAsegura la información financiera al completar las copias de seguridad de la base de datos.\r\nProtege el valor de la organización al mantener la confidencialidad de la información. Para llevar a cabo cualquier otra tarea dada por la empresa o superior inmediato.\r\nPresente un informe mensual sobre las ventas, la producción y el stock.\r\nSeguimiento de todos los trámites necesarios por parte de todos los departamentos.\r\nResponsable de la contabilidad general y el material relacionado con las finanzas en la planta.\r\nOtras tareas asignadas por el jefe / gestión departamental.', 'project_based', 'Master of Business Administration (MBA) en Contabilidad\r\nHabilidades requeridas: Contabilidad y finanzas', 'El Kishoreganj Eye Hospital operado por una organización no gubernamental llamada Nari Uddug Kendra (NUK) es un hospital oftalmológico moderno bien establecido y reputado que está trabajando para erradicar la ceguera evitable de Bangladesh y para cumplir con el objetivo VISION-2020 de la OMS. El Hospital de Ojos Kishoreganj aquí se dio cuenta de reclutar para el puesto de Oficial Principal de Cuentas a tiempo completo.', 'Al menos 3 año (s)\r\nLos solicitantes deben tener experiencia en las siguientes áreas:\r\nContador\r\nLos solicitantes deben tener experiencia en las siguientes áreas comerciales:\r\nBienes raíces', '28 a 35 años de edad\r\nTanto hombres como mujeres pueden aplicar\r\nBuen comando en Excel y Word.\r\nEl solicitante debe tener experiencia laboral y capacidad de trabajo sólida en Tally Software.\r\nExperiencia mínima de 3-5 años en contabilidad / finanzas\r\nExperiencia con los requisitos de información financiera.\r\nTener mentalidad para trabajar en estrés y largas horas.\r\nSe requiere un buen conocimiento de la computadora (con software de conteo)', 'Bangkok, Thailand', 'Negociable', 'De acuerdo con la política de la empresa', NULL, 'publish', 'sp', '2020-08-28', NULL, 'gerente-senior-cuentas', NULL, NULL, NULL, '2020-07-20 09:40:08', '2020-07-20 10:36:02'),
(8, 'Grafik Tasarımcı', 'Küçük Tasarımcı', 'xgenious', '9', '8', 'Logo, Afiş, Broşür, PSD, Yerleşim, Kitapçık ile ilgili düzenleme / rötuş ve dijital pazarlama / medya ile ilgili eserler tasarlayabilme.\r\nRenk, boyut, stil, yazı tipi boyutu ve kompozisyonun etkili kullanımı dahil olmak üzere yenilikçi ve yetenekli tasarım geliştirme.\r\nAdobe Photoshop, Adobe Illustrator, After Effects, Adobe In Design, Adobe Premiere Pro, Adobe Dreamweaver, PowerPoint ve diğer ilgili tasarım / düzenleme yazılımlarında uzman olmalıdır.\r\nMultimedya tabanlı mizanpajlar, grafikler, animasyon, video, çevrimiçi öğreticiler ve dijital pazarlama ile ilgili diğer prodüksiyonların tasarımı ve geliştirilmesi için teknik görevleri yerine getirmek.\r\nMüşterinin iş sorununu, marka alanını, hedef kitleyi ve genel yaratıcı stratejiyi anlama.\r\nGrafik tasarımda en yüksek standartları korumak ve hem dijital pazarlama hem de sosyal medya pazarlaması için müşterinin beklentilerini doğru bir şekilde temsil eden en son yaratıcı içeriği üretmek.\r\nYönetim tarafından atanan diğer tüm görevler.', 'part_time', 'Grafik Tasarım veya dengi diploma', 'İş yeri: Genel Merkez, Dhanmondi R / A, Dhaka\r\nGörev: Cumartesi - Perşembe - Saat 9:30 - 18:00', 'En az 3 yıl', '20 ila 35 yaş\r\nHem erkekler hem de kadınlar başvuru yapabilir\r\nBir ekipte ve gerektiğinde Yönetim talimatına uygun olarak çalışmaya hazır.\r\nYaratıcı çözüm sunmak için fikirleri sorun, test edin ve analiz edin.\r\nDetaylara piksel düzeyinde dikkat ile tipografi, kompozisyon, düzen, renk, yüksek kaliteli üretim için göz.\r\nİçerik yönetimi platformlarıyla deneyim.\r\nGüçlü kişilerarası ve mesleki beceriler.\r\nUluslararası standartlarda bir MARKA geliştirme konusunda derin bir his.', 'Bangkok, Thailand', 'tartışılabilir', 'Mobil fatura\r\nMaaş İncelemesi: Yıllık\r\nFestival Bonusu: 2\r\nÖğle Yemeği Olanakları', NULL, 'publish', 'tur', '2020-08-27', NULL, 'grafik-tasarimci', NULL, NULL, NULL, '2020-07-20 09:53:03', '2020-07-20 10:33:01'),
(11, 'Graphic Designer', 'Diseñadora junior', 'xgenious', '5', '8', 'Capaz de diseñar logotipos, pancartas, folletos, PSD, maquetación, edición / retoque de folletos relevantes y trabajos relacionados con marketing digital / medios.\r\nDesarrollo innovador y experto en diseño que incluye el uso efectivo de color, dimensión, estilo, tamaño de fuente y composición.\r\nDebe ser experto en Adobe Photoshop, Adobe Illustrator, After Effects, Adobe In Design, Adobe Premiere Pro, Adobe Dreamweaver, PowerPoint y otro software de diseño / edición relacionado.\r\nRealice tareas técnicas para diseñar y desarrollar diseños multimedia, gráficos, animaciones, videos, tutoriales en línea y otras producciones relacionadas con el marketing digital.\r\nComprender el problema comercial del cliente, el espacio de la marca, el público objetivo y la estrategia creativa general.\r\nMantener los más altos estándares en diseño gráfico y producir contenido creativo de vanguardia para marketing digital y marketing en redes sociales que represente con precisión las expectativas del cliente.\r\nCualquier otra tarea asignada por la gerencia.', 'part_time', 'Diploma en Diseño Gráfico o equivalente', 'Lugar de trabajo: oficina central, Dhanmondi R / A, Dhaka\r\nDeber: sábado a jueves - Hora de 9:30 a.m. a 6:00 p.m.', 'Al menos 3 año (s)', '20 a 35 años de edad\r\nTanto hombres como mujeres pueden aplicar\r\nListo para trabajar en equipo y en línea con las instrucciones de gestión cuando sea necesario.\r\nSolucione problemas, pruebe y analice ideas para proporcionar la solución creativa.\r\nOjo para la tipografía, composición, diseño, color, producción de alta calidad con atención al detalle a nivel de píxeles.\r\nExperiencia con plataformas de gestión de contenidos.\r\nFuertes habilidades interpersonales y profesionales.\r\nUna profunda sensación de desarrollar una MARCA con estándar internacional.', 'Bangkok, Thailand', 'Negociable', 'Factura móvil\r\nRevisión salarial: anual\r\nBonificación del festival: 2\r\nInstalaciones de almuerzo', NULL, 'publish', 'sp', '2020-08-22', NULL, 'graphic-designer', NULL, NULL, NULL, '2020-07-20 10:37:42', '2020-07-20 10:40:01'),
(13, 'كبير مطوري Laravel', 'مطور مبتدئ', 'xgenious', '11', '6', 'نحن نبحث عن بعض المطورين ذوي الخبرة بطلاقة في WordPress الذين سيكونون قادرين على تطوير رمز لموقع ويب معقد ومكثف للبيانات وتطبيق التجارة الإلكترونية.', 'full_time', 'يفضل بكالوريوس في علوم الكمبيوتر أو تخصص مماثل.', 'نحن بصدد إنشاء منصات غدًا لدمج وإدارة بيانات المؤسسة من خلال تحسين العمليات. معظم الشركات تعتمد الأتمتة سواء كان الأمر يتعلق بالمكتب أو الصناعة. ستكون المرونة لأتمتة العمليات ، دون المساس بالأمن والامتثال ، أحد المتطلبات الأكثر تحديًا ، ولكن الرئيسية في الأيام القادمة. هذا هو المكان الذي يأتي فيه SoftoPark إلى الصورة.\r\nنحن نبحث عن شخص لديه محفظة تعرض أعمال تطوير الويب ذات الصلة والجودة العالية. سيكون لديك قدرات رياضية قوية وحل المشكلات ، وعين على التفاصيل ، ورغبة في إنتاج كود عالي الجودة ونظيف وفعال.', '5 سنوات على الأقل', 'يسمح لكل من الذكور والإناث بتقديم الطلبات\r\nيجب أن يكون لديك مفهوم واضح على OOP\r\nأثبتت خبرة العمل في تطوير تطبيقات WordPress للمؤسسات على نطاق واسع\r\nيجب أن يكون لديك خبرة في البرنامج المساعد المعقدة ، القطعة ، تطوير السمة\r\nيجب أن يكون لديك معرفة بسياسة الترقية والأداء وأمن WordPress\r\nمطلوب خبرة في MySQL و jQuery وإطار عمل MVC قائم على PHP واحد على الأقل\r\nالخبرة في واحد أو أكثر من أنظمة إدارة المحتوى القائمة على PHP Magento أو أي تجارة إلكترونية أخرى هي نقطة زائد\r\nستحظى الخبرة في أنواع مختلفة من الخدمة وتكامل البوابة بتقدير كبير\r\nمن المتوقع خبرة في التحكم في الإصدار (git ، svn إلخ)\r\nيجب أن يكون لاعب الفريق ، بدافع ذاتي وتحمل المسؤولية بشكل استباقي', 'Bangkok, Thailand', 'قابل للتفاوض', '2 مكافآت أداء سنوية\r\nالتأمين الصحي والتأمين على الحياة\r\nالإفطار والغداء والوجبات الخفيفة\r\nيومان من عطلة نهاية الأسبوع والإجازات السنوية مدفوعة الأجر\r\nإجازات رسمية\r\nنزهة / جولة\r\nالمواصلات', NULL, 'publish', 'ar', '2020-08-22', NULL, 'kbyr-mtory-laravel', NULL, NULL, NULL, '2020-07-20 10:44:59', '2020-07-20 10:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `jobs_categories`
--

CREATE TABLE `jobs_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs_categories`
--

INSERT INTO `jobs_categories` (`id`, `title`, `status`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Office Management', 'publish', 'en', '2020-07-20 08:41:57', '2020-07-20 08:41:57'),
(2, 'Software Engineer', 'publish', 'en', '2020-07-20 08:42:11', '2020-07-20 08:42:11'),
(3, 'UI/ UX  Designer', 'publish', 'en', '2020-07-20 08:42:18', '2020-07-20 08:42:18'),
(4, 'Diseñadora de interfaz de usuario / UX', 'publish', 'sp', '2020-07-20 08:46:34', '2020-07-20 08:46:34'),
(5, 'Ingeniera de software', 'publish', 'sp', '2020-07-20 08:46:49', '2020-07-20 08:46:49'),
(6, 'Gerencia de oficina', 'publish', 'sp', '2020-07-20 08:47:10', '2020-07-20 08:47:10'),
(7, 'Büro Yönetimi', 'publish', 'tur', '2020-07-20 08:47:26', '2020-07-20 08:47:26'),
(8, 'Yazılım Mühendisi', 'publish', 'tur', '2020-07-20 08:47:39', '2020-07-20 08:47:39'),
(9, 'UI / UX Tasarımcısı', 'publish', 'tur', '2020-07-20 08:47:52', '2020-07-20 08:47:52'),
(10, 'مصمم واجهة المستخدم / UX', 'publish', 'ar', '2020-07-20 08:48:06', '2020-07-20 08:48:06'),
(11, 'مهندس برمجيات', 'publish', 'ar', '2020-07-20 08:48:23', '2020-07-20 08:48:23'),
(12, 'إدارة المكاتب', 'publish', 'ar', '2020-07-20 08:48:49', '2020-07-20 08:48:49');

-- --------------------------------------------------------

--
-- Table structure for table `job_applicants`
--

CREATE TABLE `job_applicants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jobs_id` int(10) UNSIGNED NOT NULL,
  `form_content` longtext COLLATE utf8mb4_unicode_ci,
  `attachment` longtext COLLATE utf8mb4_unicode_ci,
  `track` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `application_fee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_applicants`
--

INSERT INTO `job_applicants` (`id`, `jobs_id`, `form_content`, `attachment`, `track`, `transaction_id`, `name`, `email`, `application_fee`, `payment_gateway`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'a:4:{s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:17:\"aaddsafsadfdsfdaf\";}', 'a:1:{s:7:\"your-cv\";s:58:\"assets/uploads/attachment/applicant-attachment-your-cv.pdf\";}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-20 09:19:58', '2020-07-20 09:19:58'),
(2, 4, 'a:5:{s:13:\"captcha_token\";N;s:9:\"your-name\";s:7:\"testman\";s:10:\"your-email\";s:15:\"satrapa@live.nl\";s:20:\"your-expected-salary\";s:7:\"1000000\";s:20:\"your-additional-info\";s:10:\"dfbfdsbfdb\";}', 'a:1:{s:7:\"your-cv\";s:58:\"assets/uploads/attachment/applicant-attachment-your-cv.txt\";}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-09 20:59:34', '2020-08-09 20:59:34'),
(3, 4, 'a:5:{s:13:\"captcha_token\";N;s:9:\"your-name\";s:7:\"stewart\";s:10:\"your-email\";s:15:\"admin@gmail.com\";s:20:\"your-expected-salary\";s:5:\"20000\";s:20:\"your-additional-info\";s:12:\"yunhiojhj8iu\";}', 'a:1:{s:7:\"your-cv\";s:58:\"assets/uploads/attachment/applicant-attachment-your-cv.pdf\";}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-20 13:08:55', '2020-08-20 13:08:55'),
(4, 4, 'a:5:{s:13:\"captcha_token\";N;s:9:\"your-name\";s:7:\"gfcghxd\";s:10:\"your-email\";s:17:\"sarty2k@gmail.com\";s:20:\"your-expected-salary\";s:5:\"20000\";s:20:\"your-additional-info\";s:9:\"zsfdf\\azd\";}', 'a:1:{s:7:\"your-cv\";s:58:\"assets/uploads/attachment/applicant-attachment-your-cv.txt\";}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-23 05:19:02', '2020-08-23 05:19:02'),
(5, 4, 'a:5:{s:13:\"captcha_token\";N;s:9:\"your-name\";s:4:\"test\";s:10:\"your-email\";s:15:\"fdfdf@gmail.com\";s:20:\"your-expected-salary\";s:6:\"dsdsds\";s:20:\"your-additional-info\";s:6:\"sdsdsd\";}', 'a:1:{s:7:\"your-cv\";s:58:\"assets/uploads/attachment/applicant-attachment-your-cv.txt\";}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-23 17:08:33', '2020-08-23 17:08:33'),
(31, 4, 'a:0:{}', 'a:1:{s:7:\"your-cv\";s:58:\"assets/uploads/attachment/applicant-attachment-your-cv.png\";}', '9YRNUYbEg5pAckzfmx0WnmF4m0BPiZ', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', NULL, NULL, 'pending', '2020-11-29 05:26:32', '2020-11-29 05:26:32'),
(32, 4, NULL, NULL, 'dp7anXSOe5AFrOsl26Upfi8SN86PaP', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', NULL, NULL, 'pending', '2020-11-29 05:26:43', '2020-11-29 05:26:43'),
(42, 4, 'a:2:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:10:\"sdfasdfsdf\";}', 'a:1:{s:7:\"your-cv\";s:58:\"assets/uploads/attachment/applicant-attachment-your-cv.png\";}', 'uerbQrfvBOTmTo6DGPzZNUj14hh6ZH', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', NULL, NULL, 'pending', '2020-11-29 05:29:55', '2020-11-29 05:29:55'),
(43, 4, 'a:2:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:10:\"sdfasdfsdf\";}', 'a:1:{s:7:\"your-cv\";s:58:\"assets/uploads/attachment/applicant-attachment-your-cv.png\";}', '8IOvLjY0432dOjC0RvrmoWITABQKd6', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', NULL, NULL, 'pending', '2020-11-29 05:30:07', '2020-11-29 05:30:08'),
(44, 4, 'a:2:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:10:\"sdfasdfsdf\";}', 'a:1:{s:7:\"your-cv\";s:58:\"assets/uploads/attachment/applicant-attachment-your-cv.png\";}', '4sNmnhFd11HhFJYjEhOIdo7Zki2v3G', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', NULL, NULL, 'pending', '2020-11-29 05:33:37', '2020-11-29 05:33:38'),
(45, 4, 'a:2:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:10:\"sdfasdfsdf\";}', 'a:1:{s:7:\"your-cv\";s:58:\"assets/uploads/attachment/applicant-attachment-your-cv.png\";}', 'l6Cy0bcVqCRghziYlhyVjHrftZugoF', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', NULL, NULL, 'pending', '2020-11-29 05:34:02', '2020-11-29 05:34:02'),
(46, 4, 'a:2:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:10:\"sdfasdfsdf\";}', 'a:1:{s:7:\"your-cv\";s:58:\"assets/uploads/attachment/applicant-attachment-your-cv.png\";}', 'nlsB7QGbCCEINcvRnQfW08N95gornC', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', NULL, NULL, 'pending', '2020-11-29 05:34:28', '2020-11-29 05:34:28'),
(48, 3, 'a:3:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:13:\"hiugoijoipml;\";s:15:\"application_fee\";s:2:\"20\";}', 'a:0:{}', 'fNsB4GoGc4xPRdqjDLOfVCxkHMhBCO', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '20', NULL, 'pending', '2020-11-29 07:44:26', '2020-11-29 07:44:26'),
(49, 3, 'a:3:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:178:\"One advanced diverted domestic sex repeated bringing you old. Possible procured her trifling laughter thoughts property she met way. Companions shy had solicitude favourable own.\";s:15:\"application_fee\";s:2:\"20\";}', 'a:0:{}', 'Crb33lClay27tdITgAIP7DVrWvVmfZ', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '20', 'paypal', 'pending', '2020-11-29 07:46:22', '2020-11-29 07:46:22'),
(50, 3, 'a:3:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:178:\"One advanced diverted domestic sex repeated bringing you old. Possible procured her trifling laughter thoughts property she met way. Companions shy had solicitude favourable own.\";s:15:\"application_fee\";s:2:\"20\";}', 'a:0:{}', '2EDvKk5O5EfePzjHiMu5JPqGXAjZzV', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '20', 'paypal', 'pending', '2020-11-29 07:49:14', '2020-11-29 07:49:14'),
(51, 3, 'a:3:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:140:\"Which could saw guest man now heard but. Lasted my coming uneasy marked so should. Gravity letters it amongst herself dearest an windows by.\";s:15:\"application_fee\";s:3:\"200\";}', 'a:0:{}', 'a5mLyvtqcwSnPwgp9fEN373YT0vfJE', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'paypal', 'pending', '2020-11-29 07:49:40', '2020-11-29 07:49:40'),
(52, 3, 'a:3:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:140:\"Which could saw guest man now heard but. Lasted my coming uneasy marked so should. Gravity letters it amongst herself dearest an windows by.\";s:15:\"application_fee\";s:3:\"200\";}', 'a:0:{}', 'KAD1D3CHZ4L43Z644GZDAG0gDKKSAA', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'paypal', 'pending', '2020-11-29 07:51:53', '2020-11-29 07:51:53'),
(53, 3, 'a:3:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:140:\"Which could saw guest man now heard but. Lasted my coming uneasy marked so should. Gravity letters it amongst herself dearest an windows by.\";s:15:\"application_fee\";s:3:\"200\";}', 'a:0:{}', 'S2rL0rwPSB16pSCR0d1A2doTFCL3w9', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'manual_payment', 'pending', '2020-11-29 07:52:23', '2020-11-29 07:52:23'),
(54, 3, 'a:3:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:10:\"qsdasdfasf\";s:15:\"application_fee\";s:3:\"200\";}', 'a:0:{}', 'vA4GmV5c4PbVSJLhWojrsKt7SRNMu9', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'manual_payment', 'pending', '2020-11-30 05:13:34', '2020-11-30 05:13:34'),
(55, 3, 'a:3:{s:20:\"your-expected-salary\";s:9:\"341234234\";s:20:\"your-additional-info\";s:14:\"ifghjrsthrsdfg\";s:15:\"application_fee\";s:3:\"200\";}', 'a:0:{}', '6vIvTNs2d3VQfex7EGvF1XbNgcrT0S', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'mollie', 'pending', '2020-11-30 05:14:02', '2020-11-30 05:14:02'),
(56, 3, 'a:3:{s:20:\"your-expected-salary\";s:9:\"341234234\";s:20:\"your-additional-info\";s:14:\"ifghjrsthrsdfg\";s:15:\"application_fee\";s:3:\"200\";}', 'a:0:{}', 'MM8rQnO0LtfYjWw6U8zg0VhLWk1HgC', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'razorpay', 'pending', '2020-11-30 05:15:35', '2020-11-30 05:15:35'),
(57, 3, 'a:3:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:10:\"sadfdsfsdf\";s:15:\"application_fee\";s:3:\"200\";}', 'a:0:{}', 'sJKDP0cvwXZquJNWiJxOPLgiGtjyio', 'pay_G7PQ3zaBY3UY0X', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'razorpay', 'complete', '2020-11-30 08:14:18', '2020-11-30 08:14:52'),
(58, 3, 'a:3:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:20:\"dasdfdsfdsfsdafsdfds\";s:15:\"application_fee\";s:3:\"200\";}', 'a:0:{}', 'wNUxRJSqZ6LsbfRO8MkOdmoEIQ1KpI', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'manual_payment', 'pending', '2020-11-30 08:30:06', '2020-11-30 08:30:06'),
(59, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:128:\"Companions shy had solicitude favourable own. Which could saw guest man now heard but. Lasted my coming uneasy marked so should.\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";s:10:\"4998827038\";}', 'a:0:{}', 'DkgBWYWET8nbwBqQCbklBrwgTp8jiQ', '4998827038', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'manual_payment', 'pending', '2020-11-30 08:43:09', '2020-11-30 08:43:09'),
(60, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:128:\"Companions shy had solicitude favourable own. Which could saw guest man now heard but. Lasted my coming uneasy marked so should.\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', 'FJMRU3H7MRcw5eDGUloZkazEcuNojK', 'tr_tF5m8uCzfq', 'saifur', 'dvrobin4@gmail.com', '200', 'mollie', 'complete', '2020-11-30 08:52:57', '2020-11-30 08:53:20'),
(61, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:128:\"Companions shy had solicitude favourable own. Which could saw guest man now heard but. Lasted my coming uneasy marked so should.\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', 'kmmBpHmGhTJ0fqtkmyGIHtVwdciVME', NULL, 'Olivia Hamel', 'dvrobin4@gmail.com', '200', 'paytm', 'pending', '2020-11-30 08:55:15', '2020-11-30 08:55:15'),
(62, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:128:\"Companions shy had solicitude favourable own. Which could saw guest man now heard but. Lasted my coming uneasy marked so should.\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', '8Y6GUIPAA440T4xgTX7xC7KSSlUDdk', NULL, 'Olivia Hamel', 'dvrobin4@gmail.com', '200', 'paytm', 'pending', '2020-11-30 08:57:40', '2020-11-30 08:57:40'),
(63, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:128:\"Companions shy had solicitude favourable own. Which could saw guest man now heard but. Lasted my coming uneasy marked so should.\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', '2IATSqZjqY0pcLYC8NGY9cNS5YP0wS', NULL, 'Olivia Hamel', 'dvrobin4@gmail.com', '200', 'paytm', 'pending', '2020-11-30 09:00:07', '2020-11-30 09:00:07'),
(64, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:128:\"Companions shy had solicitude favourable own. Which could saw guest man now heard but. Lasted my coming uneasy marked so should.\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', 'PcdeW0U4oHs7V23O6XzKg6tl3LaL1l', NULL, 'Olivia Hamel', 'dvrobin4@gmail.com', '200', 'paytm', 'pending', '2020-11-30 09:06:40', '2020-11-30 09:06:40'),
(65, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:128:\"Companions shy had solicitude favourable own. Which could saw guest man now heard but. Lasted my coming uneasy marked so should.\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', 'hq5nBw0eSk7pZxt2hbMGVB62aIYOvs', 'txn_1HtE1pEmGOuJLTMsTL2NuMTm', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'stripe', 'complete', '2020-11-30 09:10:48', '2020-11-30 09:11:01'),
(66, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:128:\"Companions shy had solicitude favourable own. Which could saw guest man now heard but. Lasted my coming uneasy marked so should.\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', 'Crlt7N6NgBNnsUWyuHIv8MuSftYAaa', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'flutterwave', 'pending', '2020-11-30 09:14:23', '2020-11-30 09:14:23'),
(67, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:128:\"Companions shy had solicitude favourable own. Which could saw guest man now heard but. Lasted my coming uneasy marked so should.\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', 'xX8sszGJPdnW1JvfrbRw3Ifn1siGLM', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'paystack', 'pending', '2020-11-30 09:32:19', '2020-11-30 09:32:19'),
(68, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:128:\"Companions shy had solicitude favourable own. Which could saw guest man now heard but. Lasted my coming uneasy marked so should.\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', 'YyNlg17SO4uoFrE60OEUlvRFB5xOQY', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'paypal', 'pending', '2020-11-30 09:34:06', '2020-11-30 09:34:06'),
(69, 4, NULL, NULL, 'En5ZOcltHfkARp4KjclF3BwxhQcAey', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', NULL, NULL, 'pending', '2020-12-07 04:16:19', '2020-12-07 04:16:19'),
(70, 4, 'a:3:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:8:\"asdfadsf\";s:14:\"transaction_id\";N;}', 'a:1:{s:7:\"your-cv\";s:57:\"assets/uploads/attachment/applicantattachment-your-cv.pdf\";}', 'P9we5IB9xNDPTfwVl1RixQHyP3Iymr', NULL, 'sharifur', 'dvrobin4@gmail.com', NULL, NULL, 'pending', '2020-12-07 04:17:10', '2020-12-07 04:17:10'),
(71, 4, 'a:3:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:9:\"sdafdsdfs\";s:14:\"transaction_id\";N;}', 'a:1:{s:7:\"your-cv\";s:61:\"assets/uploads/attachment/applicant/attachment-71-your-cv.pdf\";}', 'JPjOu7j2pqS3kqPz6nN000gi8sOz9W', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', NULL, NULL, 'pending', '2020-12-07 04:24:04', '2020-12-07 04:24:04'),
(72, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:10:\"adfadfasdf\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', 'hiAPJX7nDZ5uUpqzj4unNTfhwsU7GA', NULL, 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'paypal', 'pending', '2021-01-11 00:29:32', '2021-01-11 00:29:32'),
(73, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:10:\"adfadfasdf\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', '8c0PNjhN5J7awltSUIDwD1YQA7jtq9', 'PAYID-L757EQY7RS443183R4862548', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'paypal', 'complete', '2021-01-11 00:37:50', '2021-01-11 00:38:33'),
(74, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:9:\"afdsfadsf\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', 'qxnQXGjgSa5P0twMaTYJ3qNafDHxbY', '20210111111212800110168998202253845', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'paytm', 'complete', '2021-01-11 08:15:22', '2021-01-11 08:15:32'),
(75, 3, 'a:4:{s:20:\"your-expected-salary\";s:7:\"1212532\";s:20:\"your-additional-info\";s:8:\"asdfadsf\";s:15:\"application_fee\";s:3:\"200\";s:14:\"transaction_id\";N;}', 'a:0:{}', 'DOz3Y7gba9LXODufhWHdXALna7Bhss', 'txn_1I8WqFEmGOuJLTMsQA0iahjC', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '200', 'stripe', 'complete', '2021-01-11 14:17:51', '2021-01-11 14:18:23');

-- --------------------------------------------------------

--
-- Table structure for table `key_features`
--

CREATE TABLE `key_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `key_features`
--

INSERT INTO `key_features` (`id`, `title`, `icon`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Provide all kind of it service', 'flaticon-network', 'en', '2020-05-31 08:20:07', '2020-05-31 08:20:07'),
(2, 'Solutions for all security', 'flaticon-safe', 'en', '2020-05-31 10:02:07', '2020-05-31 10:02:07'),
(3, 'Most expert peoples', 'flaticon-group', 'en', '2020-05-31 10:02:35', '2020-05-31 10:02:35'),
(4, 'Global support for all', 'flaticon-translate', 'en', '2020-05-31 10:12:16', '2020-05-31 10:12:16'),
(5, 'Apoyo global para todos', 'flaticon-translate', 'sp', '2020-05-31 10:13:20', '2020-05-31 10:13:20'),
(6, 'الدعم العالمي للجميع', 'flaticon-translate', 'ar', '2020-05-31 10:14:00', '2020-05-31 10:14:00'),
(7, 'Herkes için küresel destek', 'flaticon-translate', 'tur', '2020-05-31 10:14:18', '2020-05-31 10:14:18'),
(8, 'En uzman insanlar', 'flaticon-group', 'tur', '2020-05-31 10:19:02', '2020-05-31 10:19:02'),
(9, 'معظم الشعوب الخبيرة', 'flaticon-group', 'ar', '2020-05-31 10:19:32', '2020-05-31 10:19:32'),
(10, 'Pueblos más expertos', 'flaticon-group', 'sp', '2020-05-31 10:20:03', '2020-05-31 10:20:03'),
(11, 'Soluciones para toda seguridad', 'flaticon-safe', 'sp', '2020-05-31 10:23:29', '2020-05-31 10:23:29'),
(12, 'حلول لجميع الأمن', 'flaticon-safe', 'ar', '2020-05-31 10:23:45', '2020-05-31 10:23:45'),
(13, 'Tüm güvenlik için çözümler', 'flaticon-safe', 'tur', '2020-05-31 10:24:00', '2020-05-31 10:24:00'),
(14, 'Her türlü hizmeti sunun', 'flaticon-network', 'tur', '2020-05-31 10:24:28', '2020-05-31 10:24:28'),
(15, 'تقديم جميع أنواع الخدمات', 'flaticon-network', 'ar', '2020-05-31 10:24:41', '2020-05-31 10:24:41'),
(16, 'Proporcionar todo tipo de servicio', 'flaticon-network', 'sp', '2020-05-31 10:24:54', '2020-05-31 10:24:54');

-- --------------------------------------------------------

--
-- Table structure for table `knowledgebases`
--

CREATE TABLE `knowledgebases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `topic_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_tags` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `knowledgebases`
--

INSERT INTO `knowledgebases` (`id`, `title`, `content`, `topic_id`, `status`, `slug`, `views`, `lang`, `meta_description`, `meta_tags`, `created_at`, `updated_at`) VALUES
(1, 'For him precaution any advantages dissimilar comparison', '<p>Paid was hill sir high. For him precaution any advantages dissimilar comparison few terminated projecting. Prevailed discovery immediate objection of ye at. Repair summer one winter living feebly pretty his. In so sense am known these since. Shortly respect ask cousins brought add tedious nay. Expect relied do we genius is. On as around spirit of hearts genius. Is raptures daughter branched laughter peculiar in settling.&nbsp;</p><p><br></p><p>By so delight of showing neither believe he present. Deal sigh up in shew away when. Pursuit express no or prepare replied. Wholly formed old latter future but way she. Day her likewise smallest expenses judgment building man carriage gay. Considered introduced themselves mr to discretion at. Means among saw hopes for. Death mirth in oh learn he equal on.&nbsp;</p><p><br></p><p>Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced. End friendship sufficient assistance can prosperous met. As game he show it park do. Was has unknown few certain ten promise. No finished my an likewise cheerful packages we. For assurance concluded son something depending discourse see led collected. Packages oh no denoting my advanced humoured. Pressed be so thought natural.&nbsp;</p><p><br></p><p>Possession her thoroughly remarkably terminated man continuing. Removed greater to do ability. You shy shall while but wrote marry. Call why sake has sing pure. Gay six set polite nature worthy. So matter be me we wisdom should basket moment merely. Me burst ample wrong which would mr he could. Visit arise my point timed drawn no. Can friendly laughter goodness man him appetite carriage. Any widen see gay forth alone fruit bed.&nbsp;</p><p><br></p><p>Certain but she but shyness why cottage. Gay the put instrument sir entreaties affronting. Pretended exquisite see cordially the you. Weeks quiet do vexed or whose. Motionless if no to affronting imprudence no precaution. My indulged as disposal strongly attended. Parlors men express had private village man. Discovery moonlight recommend all one not. Indulged to answered prospect it bachelor is he bringing shutters. Pronounce forfeited mr direction oh he dashwoods ye unwilling.&nbsp;</p><p><br></p><p>Spot of come to ever hand as lady meet on. Delicate contempt received two yet advanced. Gentleman as belonging he commanded believing dejection in by. On no am winding chicken so behaved. Its preserved sex enjoyment new way behaviour. Him yet devonshire celebrated especially. Unfeeling one provision are smallness resembled repulsive.&nbsp;</p><div><br></div>', '1', 'publish', 'for-him-precaution-any-advantages-dissimilar-comparison', '127', 'en', NULL, NULL, '2020-07-20 03:42:32', '2020-11-16 16:08:03'),
(2, 'Onun için herhangi bir avantaj benzer karşılaştırma önlemi', '<p>Ücretli tepe yüksek oldu. Onun için herhangi bir avantaj benzer olmayan karşılaştırma birkaç projelendirme sonlandırıldı. Hakim keşif anında itiraz. Tamir yaz bir kış yaşayan feebly güzel onun. Bu anlamda o zamandan beri bunlar biliniyor. Kısaca saygı sormak kuzenler sıkıcı getirmek getirdi nay. Biz dahi güvenilen bekliyoruz. Kalplerin dehası ruhu gibi. Tecavüz kızı yerleşmeye özgü dallı kahkaha var.</p><p><br></p><p>Göstermekten büyük mutluluk duyduğuna göre ikisinin de ona inanmayın. Anlaşma ne zaman uzağa çekilir. Takip ekspres hayır veya cevap hazırlayın. Tamamen eski ikinci gelecek kurdu ama o şekilde. Aynı şekilde onun en küçük masraflar karar adam arabası eşcinsel bina. Sayılır kendilerini takdir takdir. İçin testere umutları anlamına gelir. Ölüm neşesi, ah eşit olduğunu öğren.</p><p><br></p><p>Windows konuşurken boyalı mera henüz ekspres partiler kullanır. Tabii sonrakini bildiği gibi devam etti. İnanılan veya yönlendirilen hiçbir sevinç yok. Sonunda dostluk yeterli yardım müreffeh olabilir. Oyun olarak park yaptığını gösteriyor. Oldu az belli on vaat. Hayır bitmiş benim aynı şekilde neşeli paketleri biz. Güvence için oğlu söylemine bağlı bir şey sonuçlanan led topladı. Paketler oh hayır benim gelişmiş mizah ifade. Preslenmiş doğal düşünülüyor.</p><p><br></p><p>Onun tamamen dikkatle feshedilen adam devam ediyor. Yetenek yapmak için daha büyük kaldırıldı. Utangaç olurken evlenir yazdın. Neden uğrunun saf şarkı söylediğini söyle. Eşcinsel altı kibar doğa layık ayarlayın. Öyleyse ben ol, bilgelik sadece sepet anı yapmalıyız. Beni çok yanlış bir şekilde patlattı. Ziyaret ortaya nokta benim zamanlanmış çizilmiş no. Dost kahkaha iyilik adam onu ​​iştah arabası olabilir. Herhangi bir genişleme sadece eşcinsel ileri meyve yatağı görmek.</p><p><br></p><p>Kesinlikle ama o ama utangaç neden yazlık. Eşcinsel the put instrument sir entreaties affronting. Zarif gibi davrandı sizi yürekten. Sessiz haftalar sinirlenmiş ya da kimin. Harekete geçmezse, sahtekârlığa karşı önlem alınmaz. Bertaraf olarak şımarttım şiddetle katıldı. Sağımhanelerdeki erkeklerin özel köy adamı vardı. Keşif ay ışığı herkese tavsiye etmiyor. Bekar cevap beklediğine göre, kepenk getiriyor. Telaffuz unfeited mr direction oh he dashwoods ye unwilling.</p><p><br></p><p>Bayan buluşurken hiç gelmeyen nokta. Hassas saygısızlık henüz iki ileri düzey aldı. Beyefendi ait olduğu gibi, tarafından atılmaya inanmayı emretti. Hayır tavuk öylesine davrandım sarma. Korunmuş seks keyfi yeni yol davranışı. Yine de devonshire özellikle kutladı. Bir hükmün hissedilmemesi küçüklüğe iticidir.</p>', '5', 'publish', 'onun-icin-herhangi-bir-avantaj-benzer-karsilastirma-onlemi', '5', 'tur', NULL, NULL, '2020-07-20 03:44:02', '2020-10-07 14:54:52'),
(3, 'بالنسبة له الاحتياطات أي مزايا مقارنة مماثلة', '<p>المدفوع كان مرتفع التل سيدي. بالنسبة له الاحتياطات أي مزايا مختلفة مقارنة إسقاطات قليلة منتهية. ساد الاكتشاف الاعتراض الفوري على انتم في. إصلاح فصل الصيف يعيش فصل الشتاء بشكل جميل وجميل. بهذا المعنى أنا أعرف هذه منذ ذلك الحين. سرعان ما جلب الاحترام نسأل أبناء العم إضافة ناي مملة. توقع الاعتماد هل نحن عبقرية. حول روح عبقرية القلوب. هي اختلاط ابنة الضحك المتفرعة الغريبة في الاستقرار.</p><p><br></p><p>من خلال بهجة عدم إظهار أي منهما يعتقد أنه يحضر. تنهد صفقة في بعيدا عند. السعي صريحة لا أو إعداد الرد. شكلت المستقبل الأخير القديم بالكامل ولكن الطريقة. يومها بالمثل أصغر نفقات الحكم بناء رجل يحمل مثلي الجنس. يعتبر قدموا أنفسهم السيد لتقدير في. يعني بين رأى الآمال. ولادة الموت في يا تعلم أنه يساوي.</p><p><br></p><p>نوافذ تتحدث عن المراعي المطلية بعد تستخدم أطرافها السريعة. من المؤكد أنه على نفس النحو الذي عرفه بعد ذلك. من صدق أو حولها لم يبتهج. يمكن إنهاء المساعدة الكافية الصداقة مزدهرة. كلعبة أظهرها بارك تفعل. كان مجهول قليل معروف بعشر الوعد. لا انتهيت من حزم البهجة وبالمثل نحن. للحصول على تأكيد اختتم الابن بشيء يعتمد على الخطاب ، انظر أدى جمعها. الحزم يا لا تدل على بلدي الفكاهة المتقدمة. الضغط عليه حتى يعتقد طبيعيا.</p><p><br></p><p>حيازة رجلها المنهي تمامًا بشكل مستمر. إزالة أكبر للقيام بالقدرة. يجب عليك أن تخجل بينما كتبت الزواج. استدعاء لماذا غنى الساكي نقية. ستة مثلي الجنس مجموعة مهذبة تستحق. لذا ، كن لي ، يجب أن تكون الحكمة مجرد لحظة. انفجر لي خطأ كبير الذي من شأنه أن السيد. زيارة تنشأ نقطتي موقوتة لا رسمها. يمكن للضحك الصديق أن يضحك الرجل له شهية النقل. أي توسيع يرى مثلي الجنس فراش فراش وحده.</p><p><br></p><p>أكيد لكنها خجولة ولكن لماذا الكوخ. غاي يا سيدي ادعاءات الصك التوسل. متظاهر رائعة انظر بحرارة لك. هادئا بالأسابيع التي أزعجت أو الذي. بلا حراك إذا كان لا لإهانة التحايل لا احتياطات. حضرت بلدي كما تم التخلص منها بقوة. رجال صالونات تعبير عن رجال القرية الخاصة. لا يوصي ضوء القمر بالاكتشاف. انغمس في الرد على احتمال أنه بكالوريوس في جلب مصاريع. انطق اتجاه السيد المفقود يا داشوودز أنت غير راغب.</p><p><br></p><p>بقعة تأتي من أي وقت مضى حيث تلتقي سيدة. تلقى الازدراء الدقيق اثنين حتى الآن متقدمة. الرجل بصفته ينتمي إلى الإيمان بالإله. على لا دجاج متعرجا هكذا تصرفت. التمتع بالجنس بطريقة جديدة. احتفل به بعد devonshire خاصة. عدم وجود حكم واحد هو صغر يشبه النفور.</p><p><br></p><p>قد صعوبة الانغماس يمكن وضع لحم الخنزير خاصة. جلب تذكر لتزويدها لماذا تم حصره. مبدأ Middleton هل اشترت إضافة إيمانية واسعة النطاق. تكييف الطقس الاستعداد يا يدعو. هؤلاء مخطئون من الذي يبتسم أمامي. فاكهة يا استمتع بها من مائدته. من حين لآخر مزروعة غير سارة لها غير سارة. كما هو الحال ضد بدء المراعي المغطاة. استمتعت بي استقر السيد واحترم لا ارواح مدنيا.</p>', '10', 'publish', 'بالنسب- ل- الاحتياطات-أي مزاي- مقارن- مماثلة', '5', 'ar', NULL, NULL, '2020-07-20 03:45:28', '2020-11-15 04:24:53'),
(4, 'Para él precaución cualquier ventaja comparación diferente', '<p>Pagado era colina señor alto. Para él, la precaución de cualquier ventaja de comparación disímil pocos proyectos terminados. Descubrimiento prevaleciente objeción inmediata de ustedes en. Reparar el verano un invierno viviendo débilmente suya. En ese sentido, los conozco desde entonces. Poco respeto preguntar primos traídos agregar tedioso no. Espero que nos confíe nuestro genio. En cuanto al espíritu de los corazones genio. Es el éxtasis hija ramificada risa peculiar en la solución.</p><p><br></p><p>Por tanto deleite de mostrar ni creer que él presente. Deal suspiro en shew away cuando. Persecución expresa no o preparar respondió. Totalmente formado el último futuro, pero ella también. Día ella también más pequeños gastos juicio construir hombre carro gay. Considerado se presentó a sí mismo a discreción en. Medios entre vio esperanzas para. Muerte alegría en oh aprender él igual en.</p><p><br></p><p>Windows habla de pastos pintados pero sus fiestas expresas lo usan. Seguro que durará lo mismo que sabía a continuación. De creído o desviado no se regocijó. Poner fin a la amistad suficiente asistencia puede prosperar cumplido. Como juego, lo muestra en el parque. Se ha desconocido unos pocos diez prometedores. No terminé mis paquetes también alegres. Para asegurarse de que el hijo concluyó algo que depende del discurso, véase el led recopilado. Paquetes oh no denotando mi estado de ánimo avanzado. Presionado ser tan natural pensado.</p><p><br></p><p>Posesión de su hombre completamente terminado notablemente continua. Eliminado mayor para hacer habilidad. Tímido lo harás mientras escribes casarte. Llama por qué el sake ha cantado puro. Gay seis establece la naturaleza educada digna. Así que, sé yo, la sabiduría debería bastar simplemente en el momento. Me estalló bastante mal, lo que podría hacer el señor. Visita surgen mi punto cronometrado dibujado no. ¿Puede la risa amistosa la bondad del hombre apetito transporte? Cualquier ensanchado ve gay hacia adelante solo cama de frutas.</p><p><br></p><p>Cierto pero ella pero timidez por qué cabaña. Gay el instrumento puesto señor suplica ofendiendo. Fingido exquisito ver cordialmente el tú. Semanas calladas molestas o de quién. Inmóvil si no a la imprudencia ofensiva no hay precaución. Mi consentido como disposición asistió fuertemente. Los salones que expresan los hombres tenían aldeanos privados. Discovery moonlight recomienda todos uno no. Se complació con la perspectiva respondida de que soltero está trayendo persianas. Pronunciar perdido señor dirección oh él se apresura que no está dispuesto.</p><p><br></p><p>Un lugar al que la dama se encuentra. Delicado desprecio recibió dos aún avanzados. Caballero como perteneciente, ordenó creer desánimo en. En no estoy enrollando pollo así se comportó. Su disfrute sexual preservado es una nueva forma de comportamiento. Sin embargo, Devonshire celebró especialmente. Una disposición insensible es la pequeñez parecida repulsiva.</p><p><br></p><p>Puede indulgencia dificultad que el jamón puede poner especialmente. Trayendo recuerdo para suplirle por qué estaba confinada. El principio de Middleton hizo que ella le agregara un gran creyente. El tiempo adaptado se prepara oh está llamando. Estas mal del que sonríe a mi frente. Él fruta oh disfrutar de la mesa de quién. Cultivada de vez en cuando su desagradable desagradable. Al igual que en contra del pasto, comenzó la visualización cubierta. Disfruté de mi asentamiento señor respeto sin espíritus civilmente.</p>', '9', 'publish', 'para-el-precaucion-cualquier-ventaja-comparacion-diferente', '3', 'sp', NULL, NULL, '2020-07-20 03:46:23', '2020-08-12 23:43:27'),
(5, 'Prevailed discovery immediate objection of ye at', '<p>Paid was hill sir high. For him precaution any advantages dissimilar comparison few terminated projecting. Prevailed discovery immediate objection of ye at. Repair summer one winter living feebly pretty his. In so sense am known these since. Shortly respect ask cousins brought add tedious nay. Expect relied do we genius is. On as around spirit of hearts genius. Is raptures daughter branched laughter peculiar in settling.&nbsp;</p><p><br></p><p>By so delight of showing neither believe he present. Deal sigh up in shew away when. Pursuit express no or prepare replied. Wholly formed old latter future but way she. Day her likewise smallest expenses judgment building man carriage gay. Considered introduced themselves mr to discretion at. Means among saw hopes for. Death mirth in oh learn he equal on.&nbsp;</p><p><br></p><p>Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced. End friendship sufficient assistance can prosperous met. As game he show it park do. Was has unknown few certain ten promise. No finished my an likewise cheerful packages we. For assurance concluded son something depending discourse see led collected. Packages oh no denoting my advanced humoured. Pressed be so thought natural.&nbsp;</p><p><br></p><p>Possession her thoroughly remarkably terminated man continuing. Removed greater to do ability. You shy shall while but wrote marry. Call why sake has sing pure. Gay six set polite nature worthy. So matter be me we wisdom should basket moment merely. Me burst ample wrong which would mr he could. Visit arise my point timed drawn no. Can friendly laughter goodness man him appetite carriage. Any widen see gay forth alone fruit bed.&nbsp;</p><p><br></p><p>Certain but she but shyness why cottage. Gay the put instrument sir entreaties affronting. Pretended exquisite see cordially the you. Weeks quiet do vexed or whose. Motionless if no to affronting imprudence no precaution. My indulged as disposal strongly attended. Parlors men express had private village man. Discovery moonlight recommend all one not. Indulged to answered prospect it bachelor is he bringing shutters. Pronounce forfeited mr direction oh he dashwoods ye unwilling.&nbsp;</p><p><br></p><p>Spot of come to ever hand as lady meet on. Delicate contempt received two yet advanced. Gentleman as belonging he commanded believing dejection in by. On no am winding chicken so behaved. Its preserved sex enjoyment new way behaviour. Him yet devonshire celebrated especially. Unfeeling one provision are smallness resembled repulsive.&nbsp;</p><div><br></div>', '1', 'publish', 'prevailed-discovery-immediate-objection-of-ye-at', '64', 'en', NULL, NULL, '2020-07-20 03:47:54', '2020-11-17 02:12:24'),
(6, 'Repair summer one winter living feebly pretty his', '<p>Paid was hill sir high. For him precaution any advantages dissimilar comparison few terminated projecting. Prevailed discovery immediate objection of ye at. Repair summer one winter living feebly pretty his. In so sense am known these since. Shortly respect ask cousins brought add tedious nay. Expect relied do we genius is. On as around spirit of hearts genius. Is raptures daughter branched laughter peculiar in settling.&nbsp;</p><p><br></p><p>By so delight of showing neither believe he present. Deal sigh up in shew away when. Pursuit express no or prepare replied. Wholly formed old latter future but way she. Day her likewise smallest expenses judgment building man carriage gay. Considered introduced themselves mr to discretion at. Means among saw hopes for. Death mirth in oh learn he equal on.&nbsp;</p><p><br></p><p>Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced. End friendship sufficient assistance can prosperous met. As game he show it park do. Was has unknown few certain ten promise. No finished my an likewise cheerful packages we. For assurance concluded son something depending discourse see led collected. Packages oh no denoting my advanced humoured. Pressed be so thought natural.&nbsp;</p><p><br></p><p>Possession her thoroughly remarkably terminated man continuing. Removed greater to do ability. You shy shall while but wrote marry. Call why sake has sing pure. Gay six set polite nature worthy. So matter be me we wisdom should basket moment merely. Me burst ample wrong which would mr he could. Visit arise my point timed drawn no. Can friendly laughter goodness man him appetite carriage. Any widen see gay forth alone fruit bed.&nbsp;</p><p><br></p><p>Certain but she but shyness why cottage. Gay the put instrument sir entreaties affronting. Pretended exquisite see cordially the you. Weeks quiet do vexed or whose. Motionless if no to affronting imprudence no precaution. My indulged as disposal strongly attended. Parlors men express had private village man. Discovery moonlight recommend all one not. Indulged to answered prospect it bachelor is he bringing shutters. Pronounce forfeited mr direction oh he dashwoods ye unwilling.&nbsp;</p><p><br></p><p>Spot of come to ever hand as lady meet on. Delicate contempt received two yet advanced. Gentleman as belonging he commanded believing dejection in by. On no am winding chicken so behaved. Its preserved sex enjoyment new way behaviour. Him yet devonshire celebrated especially. Unfeeling one provision are smallness resembled repulsive.&nbsp;</p><div><br></div>', '2', 'publish', 'repair-summer-one-winter-living-feebly-pretty-his', '125', 'en', NULL, NULL, '2020-07-20 03:52:43', '2020-11-16 15:36:04'),
(7, 'Was has unknown few certain ten promise', '<p>Paid was hill sir high. For him precaution any advantages dissimilar comparison few terminated projecting. Prevailed discovery immediate objection of ye at. Repair summer one winter living feebly pretty his. In so sense am known these since. Shortly respect ask cousins brought add tedious nay. Expect relied do we genius is. On as around spirit of hearts genius. Is raptures daughter branched laughter peculiar in settling.&nbsp;</p><p><br></p><p>By so delight of showing neither believe he present. Deal sigh up in shew away when. Pursuit express no or prepare replied. Wholly formed old latter future but way she. Day her likewise smallest expenses judgment building man carriage gay. Considered introduced themselves mr to discretion at. Means among saw hopes for. Death mirth in oh learn he equal on.&nbsp;</p><p><br></p><p>Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced. End friendship sufficient assistance can prosperous met. As game he show it park do. Was has unknown few certain ten promise. No finished my an likewise cheerful packages we. For assurance concluded son something depending discourse see led collected. Packages oh no denoting my advanced humoured. Pressed be so thought natural.&nbsp;</p><p><br></p><p>Possession her thoroughly remarkably terminated man continuing. Removed greater to do ability. You shy shall while but wrote marry. Call why sake has sing pure. Gay six set polite nature worthy. So matter be me we wisdom should basket moment merely. Me burst ample wrong which would mr he could. Visit arise my point timed drawn no. Can friendly laughter goodness man him appetite carriage. Any widen see gay forth alone fruit bed.&nbsp;</p><p><br></p><p>Certain but she but shyness why cottage. Gay the put instrument sir entreaties affronting. Pretended exquisite see cordially the you. Weeks quiet do vexed or whose. Motionless if no to affronting imprudence no precaution. My indulged as disposal strongly attended. Parlors men express had private village man. Discovery moonlight recommend all one not. Indulged to answered prospect it bachelor is he bringing shutters. Pronounce forfeited mr direction oh he dashwoods ye unwilling.&nbsp;</p><p><br></p><p>Spot of come to ever hand as lady meet on. Delicate contempt received two yet advanced. Gentleman as belonging he commanded believing dejection in by. On no am winding chicken so behaved. Its preserved sex enjoyment new way behaviour. Him yet devonshire celebrated especially. Unfeeling one provision are smallness resembled repulsive.&nbsp;</p><div><br></div>', '3', 'publish', 'was-has-unknown-few-certain-ten-promise', '68', 'en', NULL, NULL, '2020-07-20 03:52:46', '2020-11-17 02:11:53'),
(8, 'Shortly respect ask cousins brought add tedious nay', '<p>Paid was hill sir high. For him precaution any advantages dissimilar comparison few terminated projecting. Prevailed discovery immediate objection of ye at. Repair summer one winter living feebly pretty his. In so sense am known these since. Shortly respect ask cousins brought add tedious nay. Expect relied do we genius is. On as around spirit of hearts genius. Is raptures daughter branched laughter peculiar in settling.&nbsp;</p><p><br></p><p>By so delight of showing neither believe he present. Deal sigh up in shew away when. Pursuit express no or prepare replied. Wholly formed old latter future but way she. Day her likewise smallest expenses judgment building man carriage gay. Considered introduced themselves mr to discretion at. Means among saw hopes for. Death mirth in oh learn he equal on.&nbsp;</p><p><br></p><p>Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced. End friendship sufficient assistance can prosperous met. As game he show it park do. Was has unknown few certain ten promise. No finished my an likewise cheerful packages we. For assurance concluded son something depending discourse see led collected. Packages oh no denoting my advanced humoured. Pressed be so thought natural.&nbsp;</p><p><br></p><p>Possession her thoroughly remarkably terminated man continuing. Removed greater to do ability. You shy shall while but wrote marry. Call why sake has sing pure. Gay six set polite nature worthy. So matter be me we wisdom should basket moment merely. Me burst ample wrong which would mr he could. Visit arise my point timed drawn no. Can friendly laughter goodness man him appetite carriage. Any widen see gay forth alone fruit bed.&nbsp;</p><p><br></p><p>Certain but she but shyness why cottage. Gay the put instrument sir entreaties affronting. Pretended exquisite see cordially the you. Weeks quiet do vexed or whose. Motionless if no to affronting imprudence no precaution. My indulged as disposal strongly attended. Parlors men express had private village man. Discovery moonlight recommend all one not. Indulged to answered prospect it bachelor is he bringing shutters. Pronounce forfeited mr direction oh he dashwoods ye unwilling.&nbsp;</p><p><br></p><p>Spot of come to ever hand as lady meet on. Delicate contempt received two yet advanced. Gentleman as belonging he commanded believing dejection in by. On no am winding chicken so behaved. Its preserved sex enjoyment new way behaviour. Him yet devonshire celebrated especially. Unfeeling one provision are smallness resembled repulsive.&nbsp;</p><div><br></div>', '2', 'publish', 'shortly-respect-ask-cousins-brought-add-tedious-nay', '71', 'en', NULL, NULL, '2020-07-20 03:52:49', '2020-11-17 02:12:01'),
(9, 'On as around spirit of hearts genius', '<p>Paid was hill sir high. For him precaution any advantages dissimilar comparison few terminated projecting. Prevailed discovery immediate objection of ye at. Repair summer one winter living feebly pretty his. In so sense am known these since. Shortly respect ask cousins brought add tedious nay. Expect relied do we genius is. On as around spirit of hearts genius. Is raptures daughter branched laughter peculiar in settling.&nbsp;</p><p><br></p><p>By so delight of showing neither believe he present. Deal sigh up in shew away when. Pursuit express no or prepare replied. Wholly formed old latter future but way she. Day her likewise smallest expenses judgment building man carriage gay. Considered introduced themselves mr to discretion at. Means among saw hopes for. Death mirth in oh learn he equal on.&nbsp;</p><p><br></p><p>Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced. End friendship sufficient assistance can prosperous met. As game he show it park do. Was has unknown few certain ten promise. No finished my an likewise cheerful packages we. For assurance concluded son something depending discourse see led collected. Packages oh no denoting my advanced humoured. Pressed be so thought natural.&nbsp;</p><p><br></p><p>Possession her thoroughly remarkably terminated man continuing. Removed greater to do ability. You shy shall while but wrote marry. Call why sake has sing pure. Gay six set polite nature worthy. So matter be me we wisdom should basket moment merely. Me burst ample wrong which would mr he could. Visit arise my point timed drawn no. Can friendly laughter goodness man him appetite carriage. Any widen see gay forth alone fruit bed.&nbsp;</p><p><br></p><p>Certain but she but shyness why cottage. Gay the put instrument sir entreaties affronting. Pretended exquisite see cordially the you. Weeks quiet do vexed or whose. Motionless if no to affronting imprudence no precaution. My indulged as disposal strongly attended. Parlors men express had private village man. Discovery moonlight recommend all one not. Indulged to answered prospect it bachelor is he bringing shutters. Pronounce forfeited mr direction oh he dashwoods ye unwilling.&nbsp;</p><p><br></p><p>Spot of come to ever hand as lady meet on. Delicate contempt received two yet advanced. Gentleman as belonging he commanded believing dejection in by. On no am winding chicken so behaved. Its preserved sex enjoyment new way behaviour. Him yet devonshire celebrated especially. Unfeeling one provision are smallness resembled repulsive.&nbsp;</p><div><br></div>', '3', 'publish', 'on-as-around-spirit-of-hearts-genius', '43', 'en', NULL, NULL, '2020-07-20 03:52:52', '2020-11-17 02:11:58'),
(10, 'By so delight of showing neither believe he present', '<p><iframe frameborder=\"0\" src=\"//www.youtube.com/embed/k26DOtwPN7s\" width=\"640\" height=\"360\" class=\"note-video-clip\"></iframe></p><p><br></p><p>Paid was hill sir high. For him precaution any advantages dissimilar comparison few terminated projecting. Prevailed discovery immediate objection of ye at. Repair summer one winter living feebly pretty his. In so sense am known these since. Shortly respect ask cousins brought add tedious nay. Expect relied do we genius is. On as around spirit of hearts genius. Is raptures daughter branched laughter peculiar in settling.&nbsp;</p><p><br></p><p>By so delight of showing neither believe he present. Deal sigh up in shew away when. Pursuit express no or prepare replied. Wholly formed old latter future but way she. Day her likewise smallest expenses judgment building man carriage gay. Considered introduced themselves mr to discretion at. Means among saw hopes for. Death mirth in oh learn he equal on.&nbsp;</p><p><br></p><p>Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced. End friendship sufficient assistance can prosperous met. As game he show it park do. Was has unknown few certain ten promise. No finished my an likewise cheerful packages we. For assurance concluded son something depending discourse see led collected. Packages oh no denoting my advanced humoured. Pressed be so thought natural.&nbsp;</p><p><br></p><p>Possession her thoroughly remarkably terminated man continuing. Removed greater to do ability. You shy shall while but wrote marry. Call why sake has sing pure. Gay six set polite nature worthy. So matter be me we wisdom should basket moment merely. Me burst ample wrong which would mr he could. Visit arise my point timed drawn no. Can friendly laughter goodness man him appetite carriage. Any widen see gay forth alone fruit bed.&nbsp;</p><p><br></p><p>Certain but she but shyness why cottage. Gay the put instrument sir entreaties affronting. Pretended exquisite see cordially the you. Weeks quiet do vexed or whose. Motionless if no to affronting imprudence no precaution. My indulged as disposal strongly attended. Parlors men express had private village man. Discovery moonlight recommend all one not. Indulged to answered prospect it bachelor is he bringing shutters. Pronounce forfeited mr direction oh he dashwoods ye unwilling.&nbsp;</p><p><br></p><p>Spot of come to ever hand as lady meet on. Delicate contempt received two yet advanced. Gentleman as belonging he commanded believing dejection in by. On no am winding chicken so behaved. Its preserved sex enjoyment new way behaviour. Him yet devonshire celebrated especially. Unfeeling one provision are smallness resembled repulsive.&nbsp;</p><div><br></div>', '4', 'publish', 'by-so-delight-of-showing-neither-believe-he-present', '69', 'en', NULL, NULL, '2020-07-20 03:52:55', '2020-11-17 02:11:46'),
(11, 'Delicate contempt received two yet advanced', '<p><img src=\"http://localhost:8888/nexelit/assets/uploads/media-uploader/151590862780.jpg\" style=\"width: 1162px;\"></p><p><br></p><p>Paid was hill sir high. For him precaution any advantages dissimilar comparison few terminated projecting. Prevailed discovery immediate objection of ye at. Repair summer one winter living feebly pretty his. In so sense am known these since. Shortly respect ask cousins brought add tedious nay. Expect relied do we genius is. On as around spirit of hearts genius. Is raptures daughter branched laughter peculiar in settling.&nbsp;</p><p><br></p><p>By so delight of showing neither believe he present. Deal sigh up in shew away when. Pursuit express no or prepare replied. Wholly formed old latter future but way she. Day her likewise smallest expenses judgment building man carriage gay. Considered introduced themselves mr to discretion at. Means among saw hopes for. Death mirth in oh learn he equal on.&nbsp;</p><p><br></p><p>Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced. End friendship sufficient assistance can prosperous met. As game he show it park do. Was has unknown few certain ten promise. No finished my an likewise cheerful packages we. For assurance concluded son something depending discourse see led collected. Packages oh no denoting my advanced humoured. Pressed be so thought natural.&nbsp;</p><p><br></p><p>Possession her thoroughly remarkably terminated man continuing. Removed greater to do ability. You shy shall while but wrote marry. Call why sake has sing pure. Gay six set polite nature worthy. So matter be me we wisdom should basket moment merely. Me burst ample wrong which would mr he could. Visit arise my point timed drawn no. Can friendly laughter goodness man him appetite carriage. Any widen see gay forth alone fruit bed.&nbsp;</p><p><br></p><p>Certain but she but shyness why cottage. Gay the put instrument sir entreaties affronting. Pretended exquisite see cordially the you. Weeks quiet do vexed or whose. Motionless if no to affronting imprudence no precaution. My indulged as disposal strongly attended. Parlors men express had private village man. Discovery moonlight recommend all one not. Indulged to answered prospect it bachelor is he bringing shutters. Pronounce forfeited mr direction oh he dashwoods ye unwilling.&nbsp;</p><p><br></p><p>Spot of come to ever hand as lady meet on. Delicate contempt received two yet advanced. Gentleman as belonging he commanded believing dejection in by. On no am winding chicken so behaved. Its preserved sex enjoyment new way behaviour. Him yet devonshire celebrated especially. Unfeeling one provision are smallness resembled repulsive.&nbsp;</p><div><br></div>', '4', 'publish', 'delicate-contempt-received-two-yet-advanced', '96', 'en', NULL, NULL, '2020-07-20 03:53:02', '2020-11-17 02:11:55'),
(12, 'Windows konuşurken boyalı mera henüz', '<p>Ücretli tepe yüksek oldu. Onun için herhangi bir avantaj benzer olmayan karşılaştırma birkaç projelendirme sonlandırıldı. Hakim keşif anında itiraz. Tamir yaz bir kış yaşayan feebly güzel onun. Bu anlamda o zamandan beri bunlar biliniyor. Kısaca saygı sormak kuzenler sıkıcı getirmek getirdi nay. Biz dahi güvenilen bekliyoruz. Kalplerin dehası ruhu gibi. Tecavüz kızı yerleşmeye özgü dallı kahkaha var.</p><p><br></p><p>Göstermekten büyük mutluluk duyduğuna göre ikisinin de ona inanmayın. Anlaşma ne zaman uzağa çekilir. Takip ekspres hayır veya cevap hazırlayın. Tamamen eski ikinci gelecek kurdu ama o şekilde. Aynı şekilde onun en küçük masraflar karar adam arabası eşcinsel bina. Sayılır kendilerini takdir takdir. İçin testere umutları anlamına gelir. Ölüm neşesi, ah eşit olduğunu öğren.</p><p><br></p><p>Windows konuşurken boyalı mera henüz ekspres partiler kullanır. Tabii sonrakini bildiği gibi devam etti. İnanılan veya yönlendirilen hiçbir sevinç yok. Sonunda dostluk yeterli yardım müreffeh olabilir. Oyun olarak park yaptığını gösteriyor. Oldu az belli on vaat. Hayır bitmiş benim aynı şekilde neşeli paketleri biz. Güvence için oğlu söylemine bağlı bir şey sonuçlanan led topladı. Paketler oh hayır benim gelişmiş mizah ifade. Preslenmiş doğal düşünülüyor.</p><p><br></p><p>Onun tamamen dikkatle feshedilen adam devam ediyor. Yetenek yapmak için daha büyük kaldırıldı. Utangaç olurken evlenir yazdın. Neden uğrunun saf şarkı söylediğini söyle. Eşcinsel altı kibar doğa layık ayarlayın. Öyleyse ben ol, bilgelik sadece sepet anı yapmalıyız. Beni çok yanlış bir şekilde patlattı. Ziyaret ortaya nokta benim zamanlanmış çizilmiş no. Dost kahkaha iyilik adam onu ​​iştah arabası olabilir. Herhangi bir genişleme sadece eşcinsel ileri meyve yatağı görmek.</p><p><br></p><p>Kesinlikle ama o ama utangaç neden yazlık. Eşcinsel the put instrument sir entreaties affronting. Zarif gibi davrandı sizi yürekten. Sessiz haftalar sinirlenmiş ya da kimin. Harekete geçmezse, sahtekârlığa karşı önlem alınmaz. Bertaraf olarak şımarttım şiddetle katıldı. Sağımhanelerdeki erkeklerin özel köy adamı vardı. Keşif ay ışığı herkese tavsiye etmiyor. Bekar cevap beklediğine göre, kepenk getiriyor. Telaffuz unfeited mr direction oh he dashwoods ye unwilling.</p><p><br></p><p>Bayan buluşurken hiç gelmeyen nokta. Hassas saygısızlık henüz iki ileri düzey aldı. Beyefendi ait olduğu gibi, tarafından atılmaya inanmayı emretti. Hayır tavuk öylesine davrandım sarma. Korunmuş seks keyfi yeni yol davranışı. Yine de devonshire özellikle kutladı. Bir hükmün hissedilmemesi küçüklüğe iticidir.</p>', '5', 'publish', 'windows-konusurken-boyali-mera-henuz', '3', 'tur', NULL, NULL, '2020-07-20 04:05:53', '2020-09-15 03:46:47'),
(13, 'Tamir yaz bir kış yaşayan feebly güzel onun', '<p>Ücretli tepe yüksek oldu. Onun için herhangi bir avantaj benzer olmayan karşılaştırma birkaç projelendirme sonlandırıldı. Hakim keşif anında itiraz. Tamir yaz bir kış yaşayan feebly güzel onun. Bu anlamda o zamandan beri bunlar biliniyor. Kısaca saygı sormak kuzenler sıkıcı getirmek getirdi nay. Biz dahi güvenilen bekliyoruz. Kalplerin dehası ruhu gibi. Tecavüz kızı yerleşmeye özgü dallı kahkaha var.</p><p><br></p><p>Göstermekten büyük mutluluk duyduğuna göre ikisinin de ona inanmayın. Anlaşma ne zaman uzağa çekilir. Takip ekspres hayır veya cevap hazırlayın. Tamamen eski ikinci gelecek kurdu ama o şekilde. Aynı şekilde onun en küçük masraflar karar adam arabası eşcinsel bina. Sayılır kendilerini takdir takdir. İçin testere umutları anlamına gelir. Ölüm neşesi, ah eşit olduğunu öğren.</p><p><br></p><p>Windows konuşurken boyalı mera henüz ekspres partiler kullanır. Tabii sonrakini bildiği gibi devam etti. İnanılan veya yönlendirilen hiçbir sevinç yok. Sonunda dostluk yeterli yardım müreffeh olabilir. Oyun olarak park yaptığını gösteriyor. Oldu az belli on vaat. Hayır bitmiş benim aynı şekilde neşeli paketleri biz. Güvence için oğlu söylemine bağlı bir şey sonuçlanan led topladı. Paketler oh hayır benim gelişmiş mizah ifade. Preslenmiş doğal düşünülüyor.</p><p><br></p><p>Onun tamamen dikkatle feshedilen adam devam ediyor. Yetenek yapmak için daha büyük kaldırıldı. Utangaç olurken evlenir yazdın. Neden uğrunun saf şarkı söylediğini söyle. Eşcinsel altı kibar doğa layık ayarlayın. Öyleyse ben ol, bilgelik sadece sepet anı yapmalıyız. Beni çok yanlış bir şekilde patlattı. Ziyaret ortaya nokta benim zamanlanmış çizilmiş no. Dost kahkaha iyilik adam onu ​​iştah arabası olabilir. Herhangi bir genişleme sadece eşcinsel ileri meyve yatağı görmek.</p><p><br></p><p>Kesinlikle ama o ama utangaç neden yazlık. Eşcinsel the put instrument sir entreaties affronting. Zarif gibi davrandı sizi yürekten. Sessiz haftalar sinirlenmiş ya da kimin. Harekete geçmezse, sahtekârlığa karşı önlem alınmaz. Bertaraf olarak şımarttım şiddetle katıldı. Sağımhanelerdeki erkeklerin özel köy adamı vardı. Keşif ay ışığı herkese tavsiye etmiyor. Bekar cevap beklediğine göre, kepenk getiriyor. Telaffuz unfeited mr direction oh he dashwoods ye unwilling.</p><p><br></p><p>Bayan buluşurken hiç gelmeyen nokta. Hassas saygısızlık henüz iki ileri düzey aldı. Beyefendi ait olduğu gibi, tarafından atılmaya inanmayı emretti. Hayır tavuk öylesine davrandım sarma. Korunmuş seks keyfi yeni yol davranışı. Yine de devonshire özellikle kutladı. Bir hükmün hissedilmemesi küçüklüğe iticidir.</p>', '7', 'publish', 'tamir-yaz-bir-kis-yasayan-feebly-guzel-onun', '3', 'tur', NULL, NULL, '2020-07-20 04:05:58', '2020-10-03 12:54:30'),
(14, 'Hayır bitmiş benim aynı şekilde neşeli paketleri biz', '<p>Ücretli tepe yüksek oldu. Onun için herhangi bir avantaj benzer olmayan karşılaştırma birkaç projelendirme sonlandırıldı. Hakim keşif anında itiraz. Tamir yaz bir kış yaşayan feebly güzel onun. Bu anlamda o zamandan beri bunlar biliniyor. Kısaca saygı sormak kuzenler sıkıcı getirmek getirdi nay. Biz dahi güvenilen bekliyoruz. Kalplerin dehası ruhu gibi. Tecavüz kızı yerleşmeye özgü dallı kahkaha var.</p><p><br></p><p>Göstermekten büyük mutluluk duyduğuna göre ikisinin de ona inanmayın. Anlaşma ne zaman uzağa çekilir. Takip ekspres hayır veya cevap hazırlayın. Tamamen eski ikinci gelecek kurdu ama o şekilde. Aynı şekilde onun en küçük masraflar karar adam arabası eşcinsel bina. Sayılır kendilerini takdir takdir. İçin testere umutları anlamına gelir. Ölüm neşesi, ah eşit olduğunu öğren.</p><p><br></p><p>Windows konuşurken boyalı mera henüz ekspres partiler kullanır. Tabii sonrakini bildiği gibi devam etti. İnanılan veya yönlendirilen hiçbir sevinç yok. Sonunda dostluk yeterli yardım müreffeh olabilir. Oyun olarak park yaptığını gösteriyor. Oldu az belli on vaat. Hayır bitmiş benim aynı şekilde neşeli paketleri biz. Güvence için oğlu söylemine bağlı bir şey sonuçlanan led topladı. Paketler oh hayır benim gelişmiş mizah ifade. Preslenmiş doğal düşünülüyor.</p><p><br></p><p>Onun tamamen dikkatle feshedilen adam devam ediyor. Yetenek yapmak için daha büyük kaldırıldı. Utangaç olurken evlenir yazdın. Neden uğrunun saf şarkı söylediğini söyle. Eşcinsel altı kibar doğa layık ayarlayın. Öyleyse ben ol, bilgelik sadece sepet anı yapmalıyız. Beni çok yanlış bir şekilde patlattı. Ziyaret ortaya nokta benim zamanlanmış çizilmiş no. Dost kahkaha iyilik adam onu ​​iştah arabası olabilir. Herhangi bir genişleme sadece eşcinsel ileri meyve yatağı görmek.</p><p><br></p><p>Kesinlikle ama o ama utangaç neden yazlık. Eşcinsel the put instrument sir entreaties affronting. Zarif gibi davrandı sizi yürekten. Sessiz haftalar sinirlenmiş ya da kimin. Harekete geçmezse, sahtekârlığa karşı önlem alınmaz. Bertaraf olarak şımarttım şiddetle katıldı. Sağımhanelerdeki erkeklerin özel köy adamı vardı. Keşif ay ışığı herkese tavsiye etmiyor. Bekar cevap beklediğine göre, kepenk getiriyor. Telaffuz unfeited mr direction oh he dashwoods ye unwilling.</p><p><br></p><p>Bayan buluşurken hiç gelmeyen nokta. Hassas saygısızlık henüz iki ileri düzey aldı. Beyefendi ait olduğu gibi, tarafından atılmaya inanmayı emretti. Hayır tavuk öylesine davrandım sarma. Korunmuş seks keyfi yeni yol davranışı. Yine de devonshire özellikle kutladı. Bir hükmün hissedilmemesi küçüklüğe iticidir.</p>', '8', 'publish', 'hayir-bitmis-benim-ayni-sekilde-neseli-paketleri-biz', '4', 'tur', NULL, NULL, '2020-07-20 04:06:03', '2020-10-06 15:28:35'),
(15, 'إصلاح فصل الصيف يعيش فصل الشتاء الجميل له', '<p>المدفوع كان مرتفع التل سيدي. بالنسبة له الاحتياطات أي مزايا مختلفة مقارنة إسقاطات قليلة منتهية. ساد الاكتشاف الاعتراض الفوري على انتم في. إصلاح فصل الصيف يعيش فصل الشتاء بشكل جميل وجميل. بهذا المعنى أنا أعرف هذه منذ ذلك الحين. سرعان ما جلب الاحترام نسأل أبناء العم إضافة ناي مملة. توقع الاعتماد هل نحن عبقرية. حول روح عبقرية القلوب. هي اختلاط ابنة الضحك المتفرعة الغريبة في الاستقرار.</p><p><br></p><p>من خلال بهجة عدم إظهار أي منهما يعتقد أنه يحضر. تنهد صفقة في بعيدا عند. السعي صريحة لا أو إعداد الرد. شكلت المستقبل الأخير القديم بالكامل ولكن الطريقة. يومها بالمثل أصغر نفقات الحكم بناء رجل يحمل مثلي الجنس. يعتبر قدموا أنفسهم السيد لتقدير في. يعني بين رأى الآمال. ولادة الموت في يا تعلم أنه يساوي.</p><p><br></p><p>نوافذ تتحدث عن المراعي المطلية بعد تستخدم أطرافها السريعة. من المؤكد أنه على نفس النحو الذي عرفه بعد ذلك. من صدق أو حولها لم يبتهج. يمكن إنهاء المساعدة الكافية الصداقة مزدهرة. كلعبة أظهرها بارك تفعل. كان مجهول قليل معروف بعشر الوعد. لا انتهيت من حزم البهجة وبالمثل نحن. للحصول على تأكيد اختتم الابن بشيء يعتمد على الخطاب ، انظر أدى جمعها. الحزم يا لا تدل على بلدي الفكاهة المتقدمة. الضغط عليه حتى يعتقد طبيعيا.</p><p><br></p><p>حيازة رجلها المنهي تمامًا بشكل مستمر. إزالة أكبر للقيام بالقدرة. يجب عليك أن تخجل بينما كتبت الزواج. استدعاء لماذا غنى الساكي نقية. ستة مثلي الجنس مجموعة مهذبة تستحق. لذا ، كن لي ، يجب أن تكون الحكمة مجرد لحظة. انفجر لي خطأ كبير الذي من شأنه أن السيد. زيارة تنشأ نقطتي موقوتة لا رسمها. يمكن للضحك الصديق أن يضحك الرجل له شهية النقل. أي توسيع يرى مثلي الجنس فراش فراش وحده.</p><p><br></p><p>أكيد لكنها خجولة ولكن لماذا الكوخ. غاي يا سيدي ادعاءات الصك التوسل. متظاهر رائعة انظر بحرارة لك. هادئا بالأسابيع التي أزعجت أو الذي. بلا حراك إذا كان لا لإهانة التحايل لا احتياطات. حضرت بلدي كما تم التخلص منها بقوة. رجال صالونات تعبير عن رجال القرية الخاصة. لا يوصي ضوء القمر بالاكتشاف. انغمس في الرد على احتمال أنه بكالوريوس في جلب مصاريع. انطق اتجاه السيد المفقود يا داشوودز أنت غير راغب.</p><p><br></p><p>بقعة تأتي من أي وقت مضى حيث تلتقي سيدة. تلقى الازدراء الدقيق اثنين حتى الآن متقدمة. الرجل بصفته ينتمي إلى الإيمان بالإله. على لا دجاج متعرجا هكذا تصرفت. التمتع بالجنس بطريقة جديدة. احتفل به بعد devonshire خاصة. عدم وجود حكم واحد هو صغر يشبه النفور.</p><p><br></p><p>قد صعوبة الانغماس يمكن وضع لحم الخنزير خاصة. جلب تذكر لتزويدها لماذا تم حصره. مبدأ Middleton هل اشترت إضافة إيمانية واسعة النطاق. تكييف الطقس الاستعداد يا يدعو. هؤلاء مخطئون من الذي يبتسم أمامي. فاكهة يا استمتع بها من مائدته. من حين لآخر مزروعة غير سارة لها غير سارة. كما هو الحال ضد بدء المراعي المغطاة. استمتعت بي استقر السيد واحترم لا ارواح مدنيا.</p>', '10', 'publish', 'aslah-fsl-alsyf-yaaysh-fsl-alshtaaa-algmyl-lh', NULL, 'ar', NULL, NULL, '2020-07-20 04:09:43', '2020-07-20 04:44:55'),
(16, 'n بمعنى أنني أعرف هذه منذ ذلك الحين', '<p>المدفوع كان مرتفع التل سيدي. بالنسبة له الاحتياطات أي مزايا مختلفة مقارنة إسقاطات قليلة منتهية. ساد الاكتشاف الاعتراض الفوري على انتم في. إصلاح فصل الصيف يعيش فصل الشتاء بشكل جميل وجميل. بهذا المعنى أنا أعرف هذه منذ ذلك الحين. سرعان ما جلب الاحترام نسأل أبناء العم إضافة ناي مملة. توقع الاعتماد هل نحن عبقرية. حول روح عبقرية القلوب. هي اختلاط ابنة الضحك المتفرعة الغريبة في الاستقرار.</p><p><br></p><p>من خلال بهجة عدم إظهار أي منهما يعتقد أنه يحضر. تنهد صفقة في بعيدا عند. السعي صريحة لا أو إعداد الرد. شكلت المستقبل الأخير القديم بالكامل ولكن الطريقة. يومها بالمثل أصغر نفقات الحكم بناء رجل يحمل مثلي الجنس. يعتبر قدموا أنفسهم السيد لتقدير في. يعني بين رأى الآمال. ولادة الموت في يا تعلم أنه يساوي.</p><p><br></p><p>نوافذ تتحدث عن المراعي المطلية بعد تستخدم أطرافها السريعة. من المؤكد أنه على نفس النحو الذي عرفه بعد ذلك. من صدق أو حولها لم يبتهج. يمكن إنهاء المساعدة الكافية الصداقة مزدهرة. كلعبة أظهرها بارك تفعل. كان مجهول قليل معروف بعشر الوعد. لا انتهيت من حزم البهجة وبالمثل نحن. للحصول على تأكيد اختتم الابن بشيء يعتمد على الخطاب ، انظر أدى جمعها. الحزم يا لا تدل على بلدي الفكاهة المتقدمة. الضغط عليه حتى يعتقد طبيعيا.</p><p><br></p><p>حيازة رجلها المنهي تمامًا بشكل مستمر. إزالة أكبر للقيام بالقدرة. يجب عليك أن تخجل بينما كتبت الزواج. استدعاء لماذا غنى الساكي نقية. ستة مثلي الجنس مجموعة مهذبة تستحق. لذا ، كن لي ، يجب أن تكون الحكمة مجرد لحظة. انفجر لي خطأ كبير الذي من شأنه أن السيد. زيارة تنشأ نقطتي موقوتة لا رسمها. يمكن للضحك الصديق أن يضحك الرجل له شهية النقل. أي توسيع يرى مثلي الجنس فراش فراش وحده.</p><p><br></p><p>أكيد لكنها خجولة ولكن لماذا الكوخ. غاي يا سيدي ادعاءات الصك التوسل. متظاهر رائعة انظر بحرارة لك. هادئا بالأسابيع التي أزعجت أو الذي. بلا حراك إذا كان لا لإهانة التحايل لا احتياطات. حضرت بلدي كما تم التخلص منها بقوة. رجال صالونات تعبير عن رجال القرية الخاصة. لا يوصي ضوء القمر بالاكتشاف. انغمس في الرد على احتمال أنه بكالوريوس في جلب مصاريع. انطق اتجاه السيد المفقود يا داشوودز أنت غير راغب.</p><p><br></p><p>بقعة تأتي من أي وقت مضى حيث تلتقي سيدة. تلقى الازدراء الدقيق اثنين حتى الآن متقدمة. الرجل بصفته ينتمي إلى الإيمان بالإله. على لا دجاج متعرجا هكذا تصرفت. التمتع بالجنس بطريقة جديدة. احتفل به بعد devonshire خاصة. عدم وجود حكم واحد هو صغر يشبه النفور.</p><p><br></p><p>قد صعوبة الانغماس يمكن وضع لحم الخنزير خاصة. جلب تذكر لتزويدها لماذا تم حصره. مبدأ Middleton هل اشترت إضافة إيمانية واسعة النطاق. تكييف الطقس الاستعداد يا يدعو. هؤلاء مخطئون من الذي يبتسم أمامي. فاكهة يا استمتع بها من مائدته. من حين لآخر مزروعة غير سارة لها غير سارة. كما هو الحال ضد بدء المراعي المغطاة. استمتعت بي استقر السيد واحترم لا ارواح مدنيا.</p>', '11', 'publish', 'n-bmaan-anny-aaarf-hthh-mnth-thlk-alhyn', '1', 'ar', NULL, NULL, '2020-07-20 04:11:14', '2020-07-28 02:32:21'),
(17, 'سرعان ما جلب الاحترام نسأل أبناء العم إضافة ناي مملة', '<p>المدفوع كان مرتفع التل سيدي. بالنسبة له الاحتياطات أي مزايا مختلفة مقارنة إسقاطات قليلة منتهية. ساد الاكتشاف الاعتراض الفوري على انتم في. إصلاح فصل الصيف يعيش فصل الشتاء بشكل جميل وجميل. بهذا المعنى أنا أعرف هذه منذ ذلك الحين. سرعان ما جلب الاحترام نسأل أبناء العم إضافة ناي مملة. توقع الاعتماد هل نحن عبقرية. حول روح عبقرية القلوب. هي اختلاط ابنة الضحك المتفرعة الغريبة في الاستقرار.</p><p><br></p><p>من خلال بهجة عدم إظهار أي منهما يعتقد أنه يحضر. تنهد صفقة في بعيدا عند. السعي صريحة لا أو إعداد الرد. شكلت المستقبل الأخير القديم بالكامل ولكن الطريقة. يومها بالمثل أصغر نفقات الحكم بناء رجل يحمل مثلي الجنس. يعتبر قدموا أنفسهم السيد لتقدير في. يعني بين رأى الآمال. ولادة الموت في يا تعلم أنه يساوي.</p><p><br></p><p>نوافذ تتحدث عن المراعي المطلية بعد تستخدم أطرافها السريعة. من المؤكد أنه على نفس النحو الذي عرفه بعد ذلك. من صدق أو حولها لم يبتهج. يمكن إنهاء المساعدة الكافية الصداقة مزدهرة. كلعبة أظهرها بارك تفعل. كان مجهول قليل معروف بعشر الوعد. لا انتهيت من حزم البهجة وبالمثل نحن. للحصول على تأكيد اختتم الابن بشيء يعتمد على الخطاب ، انظر أدى جمعها. الحزم يا لا تدل على بلدي الفكاهة المتقدمة. الضغط عليه حتى يعتقد طبيعيا.</p><p><br></p><p>حيازة رجلها المنهي تمامًا بشكل مستمر. إزالة أكبر للقيام بالقدرة. يجب عليك أن تخجل بينما كتبت الزواج. استدعاء لماذا غنى الساكي نقية. ستة مثلي الجنس مجموعة مهذبة تستحق. لذا ، كن لي ، يجب أن تكون الحكمة مجرد لحظة. انفجر لي خطأ كبير الذي من شأنه أن السيد. زيارة تنشأ نقطتي موقوتة لا رسمها. يمكن للضحك الصديق أن يضحك الرجل له شهية النقل. أي توسيع يرى مثلي الجنس فراش فراش وحده.</p><p><br></p><p>أكيد لكنها خجولة ولكن لماذا الكوخ. غاي يا سيدي ادعاءات الصك التوسل. متظاهر رائعة انظر بحرارة لك. هادئا بالأسابيع التي أزعجت أو الذي. بلا حراك إذا كان لا لإهانة التحايل لا احتياطات. حضرت بلدي كما تم التخلص منها بقوة. رجال صالونات تعبير عن رجال القرية الخاصة. لا يوصي ضوء القمر بالاكتشاف. انغمس في الرد على احتمال أنه بكالوريوس في جلب مصاريع. انطق اتجاه السيد المفقود يا داشوودز أنت غير راغب.</p><p><br></p><p>بقعة تأتي من أي وقت مضى حيث تلتقي سيدة. تلقى الازدراء الدقيق اثنين حتى الآن متقدمة. الرجل بصفته ينتمي إلى الإيمان بالإله. على لا دجاج متعرجا هكذا تصرفت. التمتع بالجنس بطريقة جديدة. احتفل به بعد devonshire خاصة. عدم وجود حكم واحد هو صغر يشبه النفور.</p><p><br></p><p>قد صعوبة الانغماس يمكن وضع لحم الخنزير خاصة. جلب تذكر لتزويدها لماذا تم حصره. مبدأ Middleton هل اشترت إضافة إيمانية واسعة النطاق. تكييف الطقس الاستعداد يا يدعو. هؤلاء مخطئون من الذي يبتسم أمامي. فاكهة يا استمتع بها من مائدته. من حين لآخر مزروعة غير سارة لها غير سارة. كما هو الحال ضد بدء المراعي المغطاة. استمتعت بي استقر السيد واحترم لا ارواح مدنيا.</p>', '11', 'publish', 'sraaan-ma-glb-alahtram-nsal-abnaaa-alaam-adaf-nay-mml', '0', 'ar', NULL, NULL, '2020-07-20 04:18:01', '2020-08-09 06:40:17');
INSERT INTO `knowledgebases` (`id`, `title`, `content`, `topic_id`, `status`, `slug`, `views`, `lang`, `meta_description`, `meta_tags`, `created_at`, `updated_at`) VALUES
(18, 'Descubrimiento prevaleciente objeción inmediata de ustedes', '<p>Pagado era colina señor alto. Para él, la precaución de cualquier ventaja de comparación disímil pocos proyectos terminados. Descubrimiento prevaleciente objeción inmediata de ustedes en. Reparar el verano un invierno viviendo débilmente suya. En ese sentido, los conozco desde entonces. Poco respeto preguntar primos traídos agregar tedioso no. Espero que nos confíe nuestro genio. En cuanto al espíritu de los corazones genio. Es el éxtasis hija ramificada risa peculiar en la solución.</p><p><br></p><p>Por tanto deleite de mostrar ni creer que él presente. Deal suspiro en shew away cuando. Persecución expresa no o preparar respondió. Totalmente formado el último futuro, pero ella también. Día ella también más pequeños gastos juicio construir hombre carro gay. Considerado se presentó a sí mismo a discreción en. Medios entre vio esperanzas para. Muerte alegría en oh aprender él igual en.</p><p><br></p><p>Windows habla de pastos pintados pero sus fiestas expresas lo usan. Seguro que durará lo mismo que sabía a continuación. De creído o desviado no se regocijó. Poner fin a la amistad suficiente asistencia puede prosperar cumplido. Como juego, lo muestra en el parque. Se ha desconocido unos pocos diez prometedores. No terminé mis paquetes también alegres. Para asegurarse de que el hijo concluyó algo que depende del discurso, véase el led recopilado. Paquetes oh no denotando mi estado de ánimo avanzado. Presionado ser tan natural pensado.</p><p><br></p><p>Posesión de su hombre completamente terminado notablemente continua. Eliminado mayor para hacer habilidad. Tímido lo harás mientras escribes casarte. Llama por qué el sake ha cantado puro. Gay seis establece la naturaleza educada digna. Así que, sé yo, la sabiduría debería bastar simplemente en el momento. Me estalló bastante mal, lo que podría hacer el señor. Visita surgen mi punto cronometrado dibujado no. ¿Puede la risa amistosa la bondad del hombre apetito transporte? Cualquier ensanchado ve gay hacia adelante solo cama de frutas.</p><p><br></p><p>Cierto pero ella pero timidez por qué cabaña. Gay el instrumento puesto señor suplica ofendiendo. Fingido exquisito ver cordialmente el tú. Semanas calladas molestas o de quién. Inmóvil si no a la imprudencia ofensiva no hay precaución. Mi consentido como disposición asistió fuertemente. Los salones que expresan los hombres tenían aldeanos privados. Discovery moonlight recomienda todos uno no. Se complació con la perspectiva respondida de que soltero está trayendo persianas. Pronunciar perdido señor dirección oh él se apresura que no está dispuesto.</p><p><br></p><p>Un lugar al que la dama se encuentra. Delicado desprecio recibió dos aún avanzados. Caballero como perteneciente, ordenó creer desánimo en. En no estoy enrollando pollo así se comportó. Su disfrute sexual preservado es una nueva forma de comportamiento. Sin embargo, Devonshire celebró especialmente. Una disposición insensible es la pequeñez parecida repulsiva.</p><p><br></p><p>Puede indulgencia dificultad que el jamón puede poner especialmente. Trayendo recuerdo para suplirle por qué estaba confinada. El principio de Middleton hizo que ella le agregara un gran creyente. El tiempo adaptado se prepara oh está llamando. Estas mal del que sonríe a mi frente. Él fruta oh disfrutar de la mesa de quién. Cultivada de vez en cuando su desagradable desagradable. Al igual que en contra del pasto, comenzó la visualización cubierta. Disfruté de mi asentamiento señor respeto sin espíritus civilmente.</p>', '9', 'publish', 'descubrimiento-prevaleciente-objecion-inmediata-de-ustedes', NULL, 'sp', NULL, NULL, '2020-07-20 04:48:36', '2020-07-20 04:49:10'),
(19, 'Gay el instrumento puesto señor suplica ofendiendo', '<p>Pagado era colina señor alto. Para él, la precaución de cualquier ventaja de comparación disímil pocos proyectos terminados. Descubrimiento prevaleciente objeción inmediata de ustedes en. Reparar el verano un invierno viviendo débilmente suya. En ese sentido, los conozco desde entonces. Poco respeto preguntar primos traídos agregar tedioso no. Espero que nos confíe nuestro genio. En cuanto al espíritu de los corazones genio. Es el éxtasis hija ramificada risa peculiar en la solución.</p><p><br></p><p>Por tanto deleite de mostrar ni creer que él presente. Deal suspiro en shew away cuando. Persecución expresa no o preparar respondió. Totalmente formado el último futuro, pero ella también. Día ella también más pequeños gastos juicio construir hombre carro gay. Considerado se presentó a sí mismo a discreción en. Medios entre vio esperanzas para. Muerte alegría en oh aprender él igual en.</p><p><br></p><p>Windows habla de pastos pintados pero sus fiestas expresas lo usan. Seguro que durará lo mismo que sabía a continuación. De creído o desviado no se regocijó. Poner fin a la amistad suficiente asistencia puede prosperar cumplido. Como juego, lo muestra en el parque. Se ha desconocido unos pocos diez prometedores. No terminé mis paquetes también alegres. Para asegurarse de que el hijo concluyó algo que depende del discurso, véase el led recopilado. Paquetes oh no denotando mi estado de ánimo avanzado. Presionado ser tan natural pensado.</p><p><br></p><p>Posesión de su hombre completamente terminado notablemente continua. Eliminado mayor para hacer habilidad. Tímido lo harás mientras escribes casarte. Llama por qué el sake ha cantado puro. Gay seis establece la naturaleza educada digna. Así que, sé yo, la sabiduría debería bastar simplemente en el momento. Me estalló bastante mal, lo que podría hacer el señor. Visita surgen mi punto cronometrado dibujado no. ¿Puede la risa amistosa la bondad del hombre apetito transporte? Cualquier ensanchado ve gay hacia adelante solo cama de frutas.</p><p><br></p><p>Cierto pero ella pero timidez por qué cabaña. Gay el instrumento puesto señor suplica ofendiendo. Fingido exquisito ver cordialmente el tú. Semanas calladas molestas o de quién. Inmóvil si no a la imprudencia ofensiva no hay precaución. Mi consentido como disposición asistió fuertemente. Los salones que expresan los hombres tenían aldeanos privados. Discovery moonlight recomienda todos uno no. Se complació con la perspectiva respondida de que soltero está trayendo persianas. Pronunciar perdido señor dirección oh él se apresura que no está dispuesto.</p><p><br></p><p>Un lugar al que la dama se encuentra. Delicado desprecio recibió dos aún avanzados. Caballero como perteneciente, ordenó creer desánimo en. En no estoy enrollando pollo así se comportó. Su disfrute sexual preservado es una nueva forma de comportamiento. Sin embargo, Devonshire celebró especialmente. Una disposición insensible es la pequeñez parecida repulsiva.</p><p><br></p><p>Puede indulgencia dificultad que el jamón puede poner especialmente. Trayendo recuerdo para suplirle por qué estaba confinada. El principio de Middleton hizo que ella le agregara un gran creyente. El tiempo adaptado se prepara oh está llamando. Estas mal del que sonríe a mi frente. Él fruta oh disfrutar de la mesa de quién. Cultivada de vez en cuando su desagradable desagradable. Al igual que en contra del pasto, comenzó la visualización cubierta. Disfruté de mi asentamiento señor respeto sin espíritus civilmente.</p>', '6', 'publish', 'gay-el-instrumento-puesto-senor-suplica-ofendiendo', '0', 'sp', NULL, NULL, '2020-07-20 04:48:42', '2020-08-01 21:43:12'),
(20, 'En cuanto al espíritu de los corazones genio', '<p>Pagado era colina señor alto. Para él, la precaución de cualquier ventaja de comparación disímil pocos proyectos terminados. Descubrimiento prevaleciente objeción inmediata de ustedes en. Reparar el verano un invierno viviendo débilmente suya. En ese sentido, los conozco desde entonces. Poco respeto preguntar primos traídos agregar tedioso no. Espero que nos confíe nuestro genio. En cuanto al espíritu de los corazones genio. Es el éxtasis hija ramificada risa peculiar en la solución.</p><p><br></p><p>Por tanto deleite de mostrar ni creer que él presente. Deal suspiro en shew away cuando. Persecución expresa no o preparar respondió. Totalmente formado el último futuro, pero ella también. Día ella también más pequeños gastos juicio construir hombre carro gay. Considerado se presentó a sí mismo a discreción en. Medios entre vio esperanzas para. Muerte alegría en oh aprender él igual en.</p><p><br></p><p>Windows habla de pastos pintados pero sus fiestas expresas lo usan. Seguro que durará lo mismo que sabía a continuación. De creído o desviado no se regocijó. Poner fin a la amistad suficiente asistencia puede prosperar cumplido. Como juego, lo muestra en el parque. Se ha desconocido unos pocos diez prometedores. No terminé mis paquetes también alegres. Para asegurarse de que el hijo concluyó algo que depende del discurso, véase el led recopilado. Paquetes oh no denotando mi estado de ánimo avanzado. Presionado ser tan natural pensado.</p><p><br></p><p>Posesión de su hombre completamente terminado notablemente continua. Eliminado mayor para hacer habilidad. Tímido lo harás mientras escribes casarte. Llama por qué el sake ha cantado puro. Gay seis establece la naturaleza educada digna. Así que, sé yo, la sabiduría debería bastar simplemente en el momento. Me estalló bastante mal, lo que podría hacer el señor. Visita surgen mi punto cronometrado dibujado no. ¿Puede la risa amistosa la bondad del hombre apetito transporte? Cualquier ensanchado ve gay hacia adelante solo cama de frutas.</p><p><br></p><p>Cierto pero ella pero timidez por qué cabaña. Gay el instrumento puesto señor suplica ofendiendo. Fingido exquisito ver cordialmente el tú. Semanas calladas molestas o de quién. Inmóvil si no a la imprudencia ofensiva no hay precaución. Mi consentido como disposición asistió fuertemente. Los salones que expresan los hombres tenían aldeanos privados. Discovery moonlight recomienda todos uno no. Se complació con la perspectiva respondida de que soltero está trayendo persianas. Pronunciar perdido señor dirección oh él se apresura que no está dispuesto.</p><p><br></p><p>Un lugar al que la dama se encuentra. Delicado desprecio recibió dos aún avanzados. Caballero como perteneciente, ordenó creer desánimo en. En no estoy enrollando pollo así se comportó. Su disfrute sexual preservado es una nueva forma de comportamiento. Sin embargo, Devonshire celebró especialmente. Una disposición insensible es la pequeñez parecida repulsiva.</p><p><br></p><p>Puede indulgencia dificultad que el jamón puede poner especialmente. Trayendo recuerdo para suplirle por qué estaba confinada. El principio de Middleton hizo que ella le agregara un gran creyente. El tiempo adaptado se prepara oh está llamando. Estas mal del que sonríe a mi frente. Él fruta oh disfrutar de la mesa de quién. Cultivada de vez en cuando su desagradable desagradable. Al igual que en contra del pasto, comenzó la visualización cubierta. Disfruté de mi asentamiento señor respeto sin espíritus civilmente.</p>', '6', 'publish', 'en-cuanto-al-espiritu-de-los-corazones-genio', NULL, 'sp', NULL, NULL, '2020-07-20 04:48:46', '2020-07-20 04:50:34');

-- --------------------------------------------------------

--
-- Table structure for table `knowledgebase_topics`
--

CREATE TABLE `knowledgebase_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `knowledgebase_topics`
--

INSERT INTO `knowledgebase_topics` (`id`, `title`, `status`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Digital Market', 'publish', 'en', '2020-07-20 01:30:17', '2020-07-20 01:30:17'),
(2, 'Web Development', 'publish', 'en', '2020-07-20 01:30:32', '2020-07-20 01:30:32'),
(3, 'Multipurpose CMS', 'publish', 'en', '2020-07-20 01:30:51', '2020-07-20 01:30:51'),
(4, 'Laravel Scripts', 'publish', 'en', '2020-07-20 01:31:01', '2020-07-20 01:31:01'),
(5, 'Laravel Scriptleri', 'publish', 'tur', '2020-07-20 02:37:58', '2020-07-20 02:37:58'),
(6, 'CMS multipropósito', 'publish', 'sp', '2020-07-20 02:38:37', '2020-07-20 02:38:37'),
(7, 'Çok Amaçlı CMS', 'publish', 'tur', '2020-07-20 02:38:47', '2020-07-20 02:38:47'),
(8, 'Web Geliştirme', 'publish', 'tur', '2020-07-20 02:39:05', '2020-07-20 02:39:05'),
(9, 'Desarrollo web', 'publish', 'sp', '2020-07-20 02:39:15', '2020-07-20 02:39:15'),
(10, 'تطوير الشبكة', 'publish', 'ar', '2020-07-20 02:39:43', '2020-07-20 02:39:43'),
(11, 'السوق الرقمي', 'publish', 'ar', '2020-07-20 02:39:57', '2020-07-20 02:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `slug`, `direction`, `status`, `default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'ltr', 'publish', 1, '2020-05-11 00:00:00', '2020-12-07 20:17:06'),
(3, 'Turkish', 'tur', 'ltr', 'publish', 0, '2020-05-15 18:03:47', '2020-08-24 17:38:52'),
(4, 'Arabic', 'ar', 'rtl', 'publish', 0, '2020-05-15 18:04:58', '2020-07-27 04:04:05'),
(5, 'Spanish', 'sp', 'ltr', 'publish', 0, '2020-05-15 18:05:51', '2020-05-15 18:05:51');

-- --------------------------------------------------------

--
-- Table structure for table `media_uploads`
--

CREATE TABLE `media_uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` text COLLATE utf8mb4_unicode_ci,
  `size` text COLLATE utf8mb4_unicode_ci,
  `dimensions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_uploads`
--

INSERT INTO `media_uploads` (`id`, `title`, `path`, `alt`, `size`, `dimensions`, `created_at`, `updated_at`) VALUES
(1, '3411109.jpg', '34111091589555564.jpg', NULL, '217.2 KB', '2000 x 2000 pixels', '2020-05-15 15:12:45', '2020-05-15 15:12:45'),
(2, 'favicon.ico', 'favicon1589562810.ico', NULL, '95.58 KB', '1102 x 1011 pixels', '2020-05-15 17:13:30', '2020-05-15 17:13:30'),
(3, '01.png', '011589562979.png', NULL, '580.21 KB', '1920 x 939 pixels', '2020-05-15 17:16:19', '2020-05-15 17:16:19'),
(4, 'black_logo.png', 'black-logo1589563336.png', NULL, '2.01 KB', '113 x 27 pixels', '2020-05-15 17:22:16', '2020-05-15 17:22:16'),
(5, 'white_logo.png', 'white-logo1589563336.png', NULL, '1.86 KB', '113 x 27 pixels', '2020-05-15 17:22:16', '2020-05-15 17:22:16'),
(6, 'screenshot.png', 'screenshot1589571708.png', NULL, '53.14 KB', '1200 x 900 pixels', '2020-05-15 19:41:48', '2020-05-15 19:41:48'),
(7, '99094636_709951783091958_2020018729575776256_n.png', '99094636-709951783091958-2020018729575776256-n1590860562.png', NULL, '324.9 KB', '1671 x 1671 pixels', '2020-05-30 17:42:46', '2020-05-30 17:42:46'),
(8, '94563393_1989826951151091_6089694100179648512_o.jpg', '94563393-1989826951151091-6089694100179648512-o1590860813.jpg', NULL, '385.3 KB', '1238 x 1688 pixels', '2020-05-30 17:46:54', '2020-05-30 17:46:54'),
(9, '94563393_1989826951151091_6089694100179648512_o.jpg', '94563393-1989826951151091-6089694100179648512-o1590861357.jpg', NULL, '385.3 KB', '1238 x 1688 pixels', '2020-05-30 17:55:58', '2020-05-30 17:55:58'),
(10, '01.jpg', '011590862766.jpg', NULL, '1.36 MB', '1920 x 1280 pixels', '2020-05-30 18:19:27', '2020-05-30 18:19:27'),
(11, '02.jpg', '021590862766.jpg', NULL, '1.43 MB', '1920 x 1280 pixels', '2020-05-30 18:19:28', '2020-05-30 18:19:28'),
(12, '03.jpg', '031590862768.jpg', NULL, '1.57 MB', '1920 x 1280 pixels', '2020-05-30 18:19:29', '2020-05-30 18:19:29'),
(13, '04.jpg', '041590862768.jpg', NULL, '1.37 MB', '1920 x 1280 pixels', '2020-05-30 18:19:29', '2020-05-30 18:19:29'),
(14, '05.jpg', '051590862770.jpg', NULL, '1.5 MB', '1920 x 1280 pixels', '2020-05-30 18:19:31', '2020-05-30 18:19:31'),
(15, '06.jpg', '061590862770.jpg', NULL, '1.52 MB', '1920 x 1280 pixels', '2020-05-30 18:19:31', '2020-05-30 18:19:31'),
(16, '07.jpg', '071590862772.jpg', NULL, '1.56 MB', '1920 x 1280 pixels', '2020-05-30 18:19:33', '2020-05-30 18:19:33'),
(17, '08.jpg', '081590862772.jpg', NULL, '1.74 MB', '1920 x 1280 pixels', '2020-05-30 18:19:34', '2020-05-30 18:19:34'),
(18, '09.jpg', '091590862774.jpg', NULL, '1.56 MB', '1920 x 1280 pixels', '2020-05-30 18:19:35', '2020-05-30 18:19:35'),
(19, '10.jpg', '101590862774.jpg', NULL, '1.53 MB', '1920 x 1280 pixels', '2020-05-30 18:19:36', '2020-05-30 18:19:36'),
(20, '11.jpg', '111590862776.jpg', NULL, '993.94 KB', '1920 x 1280 pixels', '2020-05-30 18:19:37', '2020-05-30 18:19:37'),
(21, '12.jpg', '121590862776.jpg', NULL, '1.39 MB', '1920 x 1280 pixels', '2020-05-30 18:19:38', '2020-05-30 18:19:38'),
(22, '13.jpg', '131590862778.jpg', NULL, '1.46 MB', '1920 x 1280 pixels', '2020-05-30 18:19:39', '2020-05-30 18:19:39'),
(23, '14.jpg', '141590862778.jpg', NULL, '1.26 MB', '1920 x 1280 pixels', '2020-05-30 18:19:40', '2020-05-30 18:19:40'),
(24, '15.jpg', '151590862780.jpg', NULL, '1.39 MB', '1920 x 1280 pixels', '2020-05-30 18:19:41', '2020-05-30 18:19:41'),
(25, '16.jpg', '161590862780.jpg', NULL, '1.56 MB', '1920 x 1280 pixels', '2020-05-30 18:19:42', '2020-05-30 18:19:42'),
(26, '01.png', '011590924636.png', NULL, '136.11 KB', '847 x 481 pixels', '2020-05-31 11:30:36', '2020-05-31 11:30:36'),
(27, '03.png', '031591035358.png', NULL, '481.59 KB', '1920 x 939 pixels', '2020-06-01 18:16:00', '2020-06-01 18:16:00'),
(28, '01.png', '011591113317.png', NULL, '47.53 KB', '360 x 222 pixels', '2020-06-02 15:55:17', '2020-06-02 15:55:17'),
(29, '02.png', '021591113317.png', NULL, '40.13 KB', '360 x 222 pixels', '2020-06-02 15:55:17', '2020-06-02 15:55:17'),
(30, '01.png', '011591302982.png', NULL, '18.01 KB', '90 x 90 pixels', '2020-06-04 20:36:22', '2020-06-04 20:36:22'),
(31, '02.png', '021591302985.png', NULL, '59.69 KB', '348 x 348 pixels', '2020-06-04 20:36:25', '2020-06-04 20:36:25'),
(32, '01.png', '011591464166.png', NULL, '580.21 KB', '1920 x 939 pixels', '2020-06-06 17:22:47', '2020-06-06 17:22:47'),
(33, '02.png', '021591464166.png', NULL, '704.02 KB', '1920 x 978 pixels', '2020-06-06 17:22:47', '2020-06-06 17:22:47'),
(34, '02.png', '021591632968.png', NULL, '2.76 KB', '151 x 29 pixels', '2020-06-08 16:16:08', '2020-06-08 16:16:08'),
(35, '01.png', '011591632968.png', NULL, '2.61 KB', '151 x 41 pixels', '2020-06-08 16:16:08', '2020-06-08 16:16:08'),
(36, '03.png', '031591632968.png', NULL, '2.14 KB', '151 x 35 pixels', '2020-06-08 16:16:08', '2020-06-08 16:16:08'),
(37, '04.png', '041591632968.png', NULL, '2.21 KB', '151 x 17 pixels', '2020-06-08 16:16:08', '2020-06-08 16:16:08'),
(38, 'innovation.png', 'innovation1592320042.png', NULL, '1.35 KB', '24 x 24 pixels', '2020-06-16 15:07:22', '2020-06-16 15:07:22'),
(39, 'PayPal-Logo.wine.png', 'paypal-logowine1592737455.png', NULL, '32.16 KB', '3000 x 2000 pixels', '2020-06-21 11:04:16', '2020-06-21 11:04:16'),
(40, 'download.png', 'download1592737457.png', NULL, '5.47 KB', '308 x 164 pixels', '2020-06-21 11:04:17', '2020-06-21 11:04:17'),
(41, 'social.png', 'social1592737458.png', NULL, '111.9 KB', '2048 x 1024 pixels', '2020-06-21 11:04:18', '2020-06-21 11:04:18'),
(42, 'Razorpay-the-new-epayment-that-will-break-everything-in-2019.png', 'razorpay-the-new-epayment-that-will-break-everything-in-20191592737459.png', NULL, '10.06 KB', '1000 x 600 pixels', '2020-06-21 11:04:20', '2020-06-21 11:04:20'),
(43, 'wallet-money-logo-icon-design-vector-22901328.jpg', 'wallet-money-logo-icon-design-vector-229013281592737514.jpg', NULL, '50.7 KB', '1000 x 880 pixels', '2020-06-21 11:05:14', '2020-06-21 11:05:14'),
(44, 'learndash-stripe_256x256.jpg', 'learndash-stripe-256x2561592750757.jpg', NULL, '11.24 KB', '255 x 256 pixels', '2020-06-21 14:45:57', '2020-06-21 14:45:57'),
(45, 'download (1).png', 'download-11592750800.png', NULL, '3.28 KB', '318 x 159 pixels', '2020-06-21 14:46:40', '2020-06-21 14:46:40'),
(46, '01.png', '011595229209.png', NULL, '18.01 KB', '90 x 90 pixels', '2020-07-20 01:13:29', '2020-07-20 01:13:29'),
(47, '01.png', '011595229234.png', NULL, '39.29 KB', '262 x 314 pixels', '2020-07-20 01:13:55', '2020-07-20 01:13:55'),
(48, '02.png', '021595229234.png', NULL, '27.53 KB', '262 x 314 pixels', '2020-07-20 01:13:55', '2020-07-20 01:13:55'),
(49, '03.png', '031595229240.png', NULL, '34.13 KB', '262 x 314 pixels', '2020-07-20 01:14:00', '2020-07-20 01:14:00'),
(50, '04.png', '041595229240.png', NULL, '36.92 KB', '262 x 314 pixels', '2020-07-20 01:14:01', '2020-07-20 01:14:01'),
(51, 'concert-768722_1920.jpg', 'concert-768722-19201595246317.jpg', NULL, '328.56 KB', '1920 x 1280 pixels', '2020-07-20 05:58:38', '2020-07-20 05:58:38'),
(52, 'circus-828680_1920.jpg', 'circus-828680-19201595246317.jpg', NULL, '706.52 KB', '1920 x 1276 pixels', '2020-07-20 05:58:39', '2020-07-20 05:58:39'),
(53, 'live-music-2219036_1920 (1).jpg', 'live-music-2219036-1920-11595246319.jpg', NULL, '235.19 KB', '1920 x 1280 pixels', '2020-07-20 05:58:41', '2020-07-20 05:58:41'),
(54, 'event-1597531_1920.jpg', 'event-1597531-19201595246319.jpg', NULL, '855.61 KB', '1920 x 1277 pixels', '2020-07-20 05:58:41', '2020-07-20 05:58:41'),
(55, 'people-sitting-watching-in-the-theater-301987.jpg', 'people-sitting-watching-in-the-theater-3019871595246321.jpg', NULL, '400.94 KB', '1920 x 1280 pixels', '2020-07-20 05:58:43', '2020-07-20 05:58:43'),
(56, 'people-throwing-blue-powder-at-daytime-1157557.jpg', 'people-throwing-blue-powder-at-daytime-11575571595246321.jpg', NULL, '872.79 KB', '1920 x 1262 pixels', '2020-07-20 05:58:43', '2020-07-20 05:58:43'),
(57, 'photo-of-women-wearing-masks-787961.jpg', 'photo-of-women-wearing-masks-7879611595246323.jpg', NULL, '292.86 KB', '1920 x 1280 pixels', '2020-07-20 05:58:44', '2020-07-20 05:58:44'),
(58, 'beggar-1016678_1920.jpg', 'beggar-1016678-19201595265987.jpg', NULL, '694.02 KB', '1920 x 1280 pixels', '2020-07-20 11:26:29', '2020-07-20 11:26:29'),
(59, 'ask-for-alms-1742502_1920.jpg', 'ask-for-alms-1742502-19201595265987.jpg', NULL, '826.74 KB', '1920 x 1280 pixels', '2020-07-20 11:26:29', '2020-07-20 11:26:29'),
(60, 'giving-1826706_1920.jpg', 'giving-1826706-19201595265990.jpg', NULL, '261.12 KB', '1920 x 1280 pixels', '2020-07-20 11:26:31', '2020-07-20 11:26:31'),
(61, 'help-1265227_1920.jpg', 'help-1265227-19201595265990.jpg', NULL, '691.14 KB', '1920 x 1279 pixels', '2020-07-20 11:26:31', '2020-07-20 11:26:31'),
(62, 'monks-1822569_1920.jpg', 'monks-1822569-19201595265992.jpg', NULL, '295.61 KB', '1920 x 1314 pixels', '2020-07-20 11:26:33', '2020-07-20 11:26:33'),
(63, 'people-850097_1920.jpg', 'people-850097-19201595265992.jpg', NULL, '342.46 KB', '1920 x 1440 pixels', '2020-07-20 11:26:33', '2020-07-20 11:26:33'),
(64, 'poor-1775239_1920.jpg', 'poor-1775239-19201595265994.jpg', NULL, '295.18 KB', '1920 x 1280 pixels', '2020-07-20 11:26:35', '2020-07-20 11:26:35'),
(65, '02.jpg', '021595315295.jpg', NULL, '3.6 MB', '2500 x 2500 pixels', '2020-07-21 01:08:18', '2020-07-21 01:08:18'),
(66, '01.jpg', '011595315295.jpg', NULL, '1.25 MB', '2500 x 2500 pixels', '2020-07-21 01:08:18', '2020-07-21 01:08:18'),
(67, '03.jpg', '031595315298.jpg', NULL, '1.49 MB', '2500 x 2500 pixels', '2020-07-21 01:08:21', '2020-07-21 01:08:21'),
(68, '04.jpg', '041595315299.jpg', NULL, '855.76 KB', '2500 x 2500 pixels', '2020-07-21 01:08:21', '2020-07-21 01:08:21'),
(69, '05.jpg', '051595315301.jpg', NULL, '903.82 KB', '2500 x 2500 pixels', '2020-07-21 01:08:23', '2020-07-21 01:08:23'),
(70, '06.jpg', '061595315301.jpg', NULL, '1.56 MB', '2500 x 2500 pixels', '2020-07-21 01:08:24', '2020-07-21 01:08:24'),
(71, '07.jpg', '071595315304.jpg', NULL, '1.35 MB', '2500 x 2500 pixels', '2020-07-21 01:08:26', '2020-07-21 01:08:26'),
(72, '08.jpg', '081595315304.jpg', NULL, '1.51 MB', '2500 x 2500 pixels', '2020-07-21 01:08:27', '2020-07-21 01:08:27'),
(73, '09.jpg', '091595315306.jpg', NULL, '2.48 MB', '2500 x 2500 pixels', '2020-07-21 01:08:29', '2020-07-21 01:08:29'),
(74, 'laravel.jpg', 'laravel1595317026.jpg', NULL, '190.85 KB', '1920 x 1280 pixels', '2020-07-21 01:37:08', '2020-07-21 01:37:08'),
(75, 'laravel.jpg', 'laravel1595317407.jpg', NULL, '390.51 KB', '2500 x 2500 pixels', '2020-07-21 01:43:29', '2020-07-21 01:43:29'),
(76, 'react.jpg', 'react1595318715.jpg', NULL, '275.33 KB', '2500 x 2500 pixels', '2020-07-21 02:05:17', '2020-07-21 02:05:17'),
(77, 'Cash-on-Delivery-COD.jpg', 'cash-on-delivery-cod1595330280.jpg', NULL, '21.83 KB', '500 x 250 pixels', '2020-07-21 05:18:00', '2020-07-21 05:18:00'),
(78, '1_nhszIhUonirsqTPGelkoFg.jpeg', '1-nhszihuonirsqtpgelkofg1595330317.jpeg', NULL, '28.98 KB', '1009 x 280 pixels', '2020-07-21 05:18:37', '2020-07-21 05:18:37'),
(79, '106500540_1019791741770125_4737405778456650960_n.png', '106500540-1019791741770125-4737405778456650960-n1595588362.png', NULL, '343.91 KB', '480 x 574 pixels', '2020-07-24 04:59:23', '2020-07-24 04:59:23'),
(80, 'only-image-popup.jpg', 'only-image-popup1595691848.jpg', NULL, '91.36 KB', '700 x 400 pixels', '2020-07-25 09:44:09', '2020-07-25 09:44:09'),
(81, '4.png', '41595697742.png', NULL, '367.96 KB', '2139 x 2175 pixels', '2020-07-25 11:22:23', '2020-07-25 11:22:23'),
(82, '1.png', '11595697761.png', NULL, '784.58 KB', '2100 x 1919 pixels', '2020-07-25 11:22:44', '2020-07-25 11:22:44'),
(83, '400new.png', '400new1595700261.png', NULL, '75.67 KB', '263 x 346 pixels', '2020-07-25 12:04:21', '2020-07-25 12:04:21'),
(84, '03.png', '031595832995.png', NULL, '71.92 KB', '361 x 481 pixels', '2020-07-27 00:56:35', '2020-07-27 00:56:35'),
(85, '04.png', '041595832995.png', NULL, '86.88 KB', '361 x 481 pixels', '2020-07-27 00:56:35', '2020-07-27 00:56:35'),
(86, 'map.png', 'map1595833137.png', NULL, '32.71 KB', '648 x 381 pixels', '2020-07-27 00:58:57', '2020-07-27 00:58:57'),
(87, 'sign.png', 'sign1595833298.png', NULL, '810 ', '86 x 51 pixels', '2020-07-27 01:01:38', '2020-07-27 01:01:38'),
(88, '05.png', '051595833303.png', NULL, '230.29 KB', '960 x 760 pixels', '2020-07-27 01:01:44', '2020-07-27 01:01:44'),
(89, '01.png', '011595833563.png', NULL, '580.21 KB', '1920 x 939 pixels', '2020-07-27 01:06:04', '2020-07-27 01:06:04'),
(90, '02.png', '021595836812.png', NULL, '704.02 KB', '1920 x 978 pixels', '2020-07-27 02:00:13', '2020-07-27 02:00:13'),
(91, '02.png', '021595841084.png', NULL, '75.81 KB', '475 x 344 pixels', '2020-07-27 03:11:24', '2020-07-27 03:11:24'),
(92, '01.png', '011595841084.png', NULL, '59.18 KB', '475 x 344 pixels', '2020-07-27 03:11:24', '2020-07-27 03:11:24'),
(93, '04.png', '041595841294.png', NULL, '86.88 KB', '361 x 481 pixels', '2020-07-27 03:14:55', '2020-07-27 03:14:55'),
(94, '01.png', '011595841462.png', NULL, '580.21 KB', '1920 x 939 pixels', '2020-07-27 03:17:43', '2020-07-27 03:17:43'),
(95, 'sgv5j.phtml.png', 'sgv5jphtml1596237144.png', NULL, '12.87 KB', '139 x 139 pixels', '2020-08-01 03:12:24', '2020-08-01 03:12:24'),
(96, 'logo.gif', 'logo1596359631.gif', NULL, '6.34 KB', '270 x 86 pixels', '2020-08-02 13:13:51', '2020-08-02 13:13:51'),
(97, 'Flutterwave_IMTC.jpg', 'flutterwave-imtc1596482316.jpg', NULL, '40.27 KB', '600 x 300 pixels', '2020-08-03 23:18:37', '2020-08-03 23:18:37'),
(98, 'mollie-vector-logo.png', 'mollie-vector-logo1596482318.png', NULL, '4.19 KB', '900 x 500 pixels', '2020-08-03 23:18:39', '2020-08-03 23:18:39'),
(99, '343001.jpg', '3430011596785984.jpg', NULL, '321.17 KB', '2560 x 1600 pixels', '2020-08-07 11:39:44', '2020-08-07 11:39:44'),
(100, 'blue-sky.jpeg', 'blue-sky1597187913.jpeg', NULL, '184.41 KB', '2048 x 1365 pixels', '2020-08-12 03:18:34', '2020-08-12 03:18:34'),
(101, '1200px-Instagram_icon.png', '1200px-instagram-icon1597674512.png', NULL, '477.35 KB', '1200 x 1200 pixels', '2020-08-17 18:28:33', '2020-08-17 18:28:33'),
(102, '00000000.jpg', '000000001597674524.jpg', NULL, '187.5 KB', '472 x 591 pixels', '2020-08-17 18:28:44', '2020-08-17 18:28:44'),
(103, 'IMG-5127.JPG', 'img-51271598352887.JPG', NULL, '110.84 KB', '685 x 465 pixels', '2020-08-25 14:54:47', '2020-08-25 14:54:47'),
(104, 'clean.png', 'clean1598569408.png', NULL, '19.59 KB', '575 x 459 pixels', '2020-08-28 03:03:28', '2020-08-28 03:03:28'),
(105, '56f332676edf9281cbce.jpg', '56f332676edf9281cbce1599025176.jpg', NULL, '175.89 KB', '2560 x 1380 pixels', '2020-09-02 09:39:37', '2020-09-02 09:39:37'),
(106, '4iGAB10408.jpg', '4igab104081599025182.jpg', NULL, '189.71 KB', '370 x 548 pixels', '2020-09-02 09:39:42', '2020-09-02 09:39:42'),
(107, '24330-min.jpg', '24330-min1600153857.jpg', NULL, '973.58 KB', '7360 x 4912 pixels', '2020-09-15 11:11:03', '2020-09-15 11:11:03'),
(108, '444.jpg', '4441600443582.jpg', NULL, '69.89 KB', '664 x 372 pixels', '2020-09-18 19:39:42', '2020-09-18 19:39:42'),
(109, 'Screen Shot 2020-09-28 at 05.07.28.png', 'screen-shot-2020-09-28-at-0507281601258861.png', NULL, '11.71 KB', '135 x 133 pixels', '2020-09-28 06:07:41', '2020-09-28 06:07:41'),
(110, 'Stat-X Thumbnail_New.jpg', 'stat-x-thumbnail-new1601312316.jpg', NULL, '114.52 KB', '1920 x 1080 pixels', '2020-09-28 20:58:36', '2020-09-28 20:58:36'),
(111, 'glacier-869593_1920.jpg', 'glacier-869593-19201601675536.jpg', NULL, '785.41 KB', '1920 x 1280 pixels', '2020-10-03 01:52:16', '2020-10-03 01:52:16'),
(112, '6.png', '61601926315.png', NULL, '138.53 KB', '1365 x 767 pixels', '2020-10-05 23:31:55', '2020-10-05 23:31:55'),
(113, 'og-image.jpg', 'og-image1602165501.jpg', NULL, '673.4 KB', '1490 x 780 pixels', '2020-10-08 17:58:21', '2020-10-08 17:58:21'),
(114, 'icon-1.png', 'icon-11602553597.png', NULL, '25.18 KB', '700 x 692 pixels', '2020-10-13 05:46:37', '2020-10-13 05:46:37'),
(115, 'logo.png', 'logo1605693143.png', NULL, '5.19 KB', '251 x 77 pixels', '2020-11-18 03:52:23', '2020-11-18 03:52:23'),
(116, '1.png', '11606032539.png', NULL, '137.24 KB', '402 x 600 pixels', '2020-11-22 02:08:59', '2020-11-22 02:08:59'),
(117, 'cyber-monday-sale-banner.png', 'cyber-monday-sale-banner1606300927.png', NULL, '378.59 KB', '1000 x 1000 pixels', '2020-11-25 04:42:08', '2020-11-25 04:42:08'),
(118, '1-min.png', '1-min1608805801.png', NULL, '2.79 MB', '1995 x 3265 pixels', '2020-12-24 04:30:03', '2020-12-24 04:30:03'),
(119, '1 (1).png', '1-11608809482.png', NULL, '827.45 KB', '538 x 880 pixels', '2020-12-24 05:31:23', '2020-12-24 05:31:23'),
(120, '2 (1).png', '2-11608809493.png', NULL, '305.95 KB', '281 x 515 pixels', '2020-12-24 05:31:34', '2020-12-24 05:31:34'),
(121, '3 (1).png', '3-11608809494.png', NULL, '213.49 KB', '349 x 487 pixels', '2020-12-24 05:31:34', '2020-12-24 05:31:34'),
(122, 'about.png', 'about1608916429.png', NULL, '275.34 KB', '445 x 554 pixels', '2020-12-25 11:13:50', '2020-12-25 11:13:50'),
(123, 'transportation-logistics(2)-min.png', 'transportation-logistics2-min1610114539.png', NULL, '872.42 KB', '1920 x 1063 pixels', '2021-01-08 08:02:20', '2021-01-08 08:02:20'),
(124, 'transportation-logistics(1).png', 'transportation-logistics11610193967.png', NULL, '1.15 MB', '1112 x 591 pixels', '2021-01-09 06:06:07', '2021-01-09 06:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `title`, `lang`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Primary Menu [ENG]', 'en', '[{\"pname\":\"Home\",\"purl\":\"@url\",\"ptype\":\"custom\",\"id\":1},{\"pslug\":\"about_page_slug\",\"pname\":\"about_page_en_name\",\"ptype\":\"static\",\"id\":2,\"children\":[{\"pslug\":\"about_page_slug\",\"pname\":\"about_page_en_name\",\"ptype\":\"static\",\"id\":3},{\"pslug\":\"clients_feedback_page_slug\",\"pname\":\"clients_feedback_page_en_name\",\"ptype\":\"static\",\"id\":4},{\"pslug\":\"image_gallery_page_slug\",\"pname\":\"image_gallery_page_en_name\",\"ptype\":\"static\",\"id\":5},{\"pslug\":\"team_page_slug\",\"pname\":\"team_page_en_name\",\"ptype\":\"static\",\"id\":6},{\"pslug\":\"testimonial_page_slug\",\"pname\":\"testimonial_page_en_name\",\"ptype\":\"static\",\"id\":7}]},{\"icon\":\"2,3,5\",\"items_id\":\"1,2,3,4,5,6,7,8\",\"ptype\":\"service_mega_menu\",\"id\":3},{\"items_id\":\"1,2,3,4,5,6,7,8\",\"ptype\":\"work_mega_menu\",\"id\":4},{\"pname\":\"Pages\",\"purl\":\"#\",\"ptype\":\"custom\",\"id\":5,\"children\":[{\"pname\":\"Inner Pages\",\"purl\":\"#\",\"ptype\":\"custom\",\"id\":6,\"children\":[{\"pslug\":\"work_page_slug\",\"pname\":\"work_page_en_name\",\"ptype\":\"static\",\"id\":7},{\"pslug\":\"blog_page_slug\",\"pname\":\"blog_page_en_name\",\"ptype\":\"static\",\"id\":8},{\"pslug\":\"product_page_slug\",\"pname\":\"product_page_en_name\",\"ptype\":\"static\",\"id\":9},{\"pslug\":\"service_page_slug\",\"pname\":\"service_page_en_name\",\"ptype\":\"static\",\"id\":10},{\"pslug\":\"price_plan_page_slug\",\"pname\":\"price_plan_page_en_name\",\"ptype\":\"static\",\"id\":11}]},{\"pslug\":\"knowledgebase_page_slug\",\"pname\":\"knowledgebase_page_en_name\",\"ptype\":\"static\",\"id\":7},{\"pslug\":\"events_page_slug\",\"pname\":\"events_page_en_name\",\"ptype\":\"static\",\"id\":8},{\"pslug\":\"donation_page_slug\",\"pname\":\"donation_page_en_name\",\"ptype\":\"static\",\"id\":9},{\"pslug\":\"donor_page_slug\",\"pname\":\"donor_page_en_name\",\"ptype\":\"static\",\"id\":10},{\"pslug\":\"career_with_us_page_slug\",\"pname\":\"career_with_us_page_en_name\",\"ptype\":\"static\",\"id\":11},{\"pname\":\"Others Pages\",\"purl\":\"#\",\"ptype\":\"custom\",\"id\":12,\"children\":[{\"pslug\":\"feedback_page_slug\",\"pname\":\"feedback_page_en_name\",\"ptype\":\"static\",\"id\":13},{\"pslug\":\"faq_page_slug\",\"pname\":\"faq_page_en_name\",\"ptype\":\"static\",\"id\":14},{\"pslug\":\"quote_page_slug\",\"pname\":\"quote_page_en_name\",\"ptype\":\"static\",\"id\":15}]},{\"pid\":1,\"ptype\":\"dynamic\",\"id\":13}]},{\"items_id\":\"1,2,6,7,8,9,10,11\",\"ptype\":\"product_mega_menu\",\"id\":6},{\"items_id\":\"1,2,3,4,5,6\",\"ptype\":\"donation_mega_menu\",\"id\":7},{\"pslug\":\"contact_page_slug\",\"pname\":\"contact_page_en_name\",\"ptype\":\"static\",\"id\":8}]', 'default', '2020-05-27 19:53:38', '2020-12-07 11:01:53'),
(2, 'Menu with Icon', 'en', '[{\"pname\":\"Home\",\"purl\":\"@url\",\"ptype\":\"custom\",\"id\":1},{\"pslug\":\"service_page_slug\",\"pname\":\"service_page_en_name\",\"ptype\":\"static\",\"id\":2},{\"pslug\":\"work_page_slug\",\"pname\":\"work_page_en_name\",\"ptype\":\"static\",\"id\":3,\"children\":[{\"pslug\":\"team_page_slug\",\"pname\":\"team_page_en_name\",\"ptype\":\"static\",\"id\":4,\"children\":[{\"icon\":\"fas fa-question-circle\",\"pslug\":\"faq_page_slug\",\"pname\":\"faq_page_en_name\",\"ptype\":\"static\",\"id\":5}]}]}]', '', '2020-05-31 16:54:39', '2020-06-01 10:15:26'),
(3, 'Useful Links', 'en', '[{\"icon\":\"fas fa-angle-right\",\"pname\":\"Home\",\"purl\":\"@url\",\"ptype\":\"custom\",\"id\":1},{\"icon\":\"fas fa-angle-right\",\"pslug\":\"about_page_slug\",\"pname\":\"about_page_en_name\",\"ptype\":\"static\",\"id\":2},{\"icon\":\"fas fa-angle-right\",\"pslug\":\"service_page_slug\",\"pname\":\"service_page_en_name\",\"ptype\":\"static\",\"id\":3},{\"icon\":\"fas fa-angle-right\",\"pslug\":\"work_page_slug\",\"pname\":\"work_page_en_name\",\"ptype\":\"static\",\"id\":4}]', NULL, '2020-06-17 15:33:46', '2020-06-17 15:38:45'),
(4, 'Useful Links [turkish]', 'tur', NULL, NULL, '2020-06-17 16:31:34', '2020-06-17 16:31:34'),
(5, 'Useful Links[spanish]', 'sp', '[{\"pname\":\"Home\",\"purl\":\"@url\",\"ptype\":\"custom\",\"id\":1}]', NULL, '2020-06-17 16:31:46', '2020-06-17 16:32:02'),
(6, 'Useful Links[arabic]', 'ar', NULL, NULL, '2020-06-17 16:32:19', '2020-06-17 16:32:19'),
(7, 'Primary Menu [Turk]', 'tur', '[{\"pname\":\"Home\",\"purl\":\"@url\",\"ptype\":\"custom\",\"id\":1},{\"pslug\":\"about_page_slug\",\"pname\":\"about_page_tur_name\",\"ptype\":\"static\",\"id\":2,\"children\":[{\"pslug\":\"about_page_slug\",\"pname\":\"about_page_tur_name\",\"ptype\":\"static\",\"id\":3},{\"pslug\":\"clients_feedback_page_slug\",\"pname\":\"clients_feedback_page_tur_name\",\"ptype\":\"static\",\"id\":4},{\"pslug\":\"image_gallery_page_slug\",\"pname\":\"image_gallery_page_tur_name\",\"ptype\":\"static\",\"id\":5},{\"pslug\":\"team_page_slug\",\"pname\":\"team_page_tur_name\",\"ptype\":\"static\",\"id\":6},{\"pslug\":\"testimonial_page_slug\",\"pname\":\"testimonial_page_tur_name\",\"ptype\":\"static\",\"id\":7}]},{\"icon\":\"2,3,5\",\"items_id\":\"9,10,11,12,13,14,17\",\"ptype\":\"service_mega_menu\",\"id\":3},{\"items_id\":\"9,10,11,12,13,15,16,17\",\"ptype\":\"work_mega_menu\",\"id\":4},{\"pname\":\"Pages\",\"purl\":\"#\",\"ptype\":\"custom\",\"id\":5,\"children\":[{\"pname\":\"Inner Pages\",\"purl\":\"#\",\"ptype\":\"custom\",\"id\":6,\"children\":[{\"pslug\":\"work_page_slug\",\"pname\":\"work_page_tur_name\",\"ptype\":\"static\",\"id\":7},{\"pslug\":\"blog_page_slug\",\"pname\":\"blog_page_tur_name\",\"ptype\":\"static\",\"id\":8},{\"pslug\":\"product_page_slug\",\"pname\":\"product_page_tur_name\",\"ptype\":\"static\",\"id\":9},{\"pslug\":\"service_page_slug\",\"pname\":\"service_page_tur_name\",\"ptype\":\"static\",\"id\":10},{\"pslug\":\"price_plan_page_slug\",\"pname\":\"price_plan_page_tur_name\",\"ptype\":\"static\",\"id\":11}]},{\"pslug\":\"knowledgebase_page_slug\",\"pname\":\"knowledgebase_page_tur_name\",\"ptype\":\"static\",\"id\":7},{\"pslug\":\"events_page_slug\",\"pname\":\"events_page_tur_name\",\"ptype\":\"static\",\"id\":8},{\"pslug\":\"donation_page_slug\",\"pname\":\"donation_page_tur_name\",\"ptype\":\"static\",\"id\":9},{\"pslug\":\"career_with_us_page_slug\",\"pname\":\"career_with_us_page_tur_name\",\"ptype\":\"static\",\"id\":10},{\"pname\":\"Others Pages\",\"purl\":\"#\",\"ptype\":\"custom\",\"id\":11,\"children\":[{\"pslug\":\"feedback_page_slug\",\"pname\":\"feedback_page_tur_name\",\"ptype\":\"static\",\"id\":12},{\"pslug\":\"faq_page_slug\",\"pname\":\"faq_page_tur_name\",\"ptype\":\"static\",\"id\":13},{\"pslug\":\"quote_page_slug\",\"pname\":\"quote_page_tur_name\",\"ptype\":\"static\",\"id\":14}]},{\"pid\":1,\"ptype\":\"dynamic\",\"id\":12}]},{\"items_id\":12,\"ptype\":\"product_mega_menu\",\"id\":6},{\"items_id\":\"7,9,10,11\",\"ptype\":\"donation_mega_menu\",\"id\":7},{\"pslug\":\"contact_page_slug\",\"pname\":\"contact_page_tur_name\",\"ptype\":\"static\",\"id\":8}]', 'default', '2020-07-27 03:31:47', '2020-07-27 04:28:17'),
(8, 'Primary Menu [AR]', 'ar', '[{\"pname\":\"Home\",\"purl\":\"@url\",\"ptype\":\"custom\",\"id\":1},{\"pslug\":\"about_page_slug\",\"pname\":\"about_page_ar_name\",\"ptype\":\"static\",\"id\":2,\"children\":[{\"pslug\":\"about_page_slug\",\"pname\":\"about_page_ar_name\",\"ptype\":\"static\",\"id\":3},{\"pslug\":\"clients_feedback_page_slug\",\"pname\":\"clients_feedback_page_ar_name\",\"ptype\":\"static\",\"id\":4},{\"pslug\":\"image_gallery_page_slug\",\"pname\":\"image_gallery_page_ar_name\",\"ptype\":\"static\",\"id\":5},{\"pslug\":\"team_page_slug\",\"pname\":\"team_page_ar_name\",\"ptype\":\"static\",\"id\":6},{\"pslug\":\"testimonial_page_slug\",\"pname\":\"testimonial_page_ar_name\",\"ptype\":\"static\",\"id\":7}]},{\"icon\":\"2,3,5\",\"items_id\":\"24,26,27,28,29,30\",\"ptype\":\"service_mega_menu\",\"id\":3},{\"items_id\":\"18,27,28,29,30,31,32\",\"ptype\":\"work_mega_menu\",\"id\":4},{\"pname\":\"Pages\",\"purl\":\"#\",\"ptype\":\"custom\",\"id\":5,\"children\":[{\"pname\":\"Inner Pages\",\"purl\":\"#\",\"ptype\":\"custom\",\"id\":6,\"children\":[{\"pslug\":\"work_page_slug\",\"pname\":\"work_page_ar_name\",\"ptype\":\"static\",\"id\":7},{\"pslug\":\"blog_page_slug\",\"pname\":\"blog_page_ar_name\",\"ptype\":\"static\",\"id\":8},{\"pslug\":\"product_page_slug\",\"pname\":\"product_page_ar_name\",\"ptype\":\"static\",\"id\":9},{\"pslug\":\"service_page_slug\",\"pname\":\"service_page_ar_name\",\"ptype\":\"static\",\"id\":10},{\"pslug\":\"price_plan_page_slug\",\"pname\":\"price_plan_page_ar_name\",\"ptype\":\"static\",\"id\":11}]},{\"pslug\":\"knowledgebase_page_slug\",\"pname\":\"knowledgebase_page_ar_name\",\"ptype\":\"static\",\"id\":7},{\"pslug\":\"events_page_slug\",\"pname\":\"events_page_ar_name\",\"ptype\":\"static\",\"id\":8},{\"pslug\":\"donation_page_slug\",\"pname\":\"donation_page_ar_name\",\"ptype\":\"static\",\"id\":9},{\"pslug\":\"career_with_us_page_slug\",\"pname\":\"career_with_us_page_ar_name\",\"ptype\":\"static\",\"id\":10},{\"pname\":\"Others Pages\",\"purl\":\"#\",\"ptype\":\"custom\",\"id\":11,\"children\":[{\"pslug\":\"feedback_page_slug\",\"pname\":\"feedback_page_ar_name\",\"ptype\":\"static\",\"id\":12},{\"pslug\":\"faq_page_slug\",\"pname\":\"faq_page_ar_name\",\"ptype\":\"static\",\"id\":13},{\"pslug\":\"quote_page_slug\",\"pname\":\"quote_page_ar_name\",\"ptype\":\"static\",\"id\":14}]}]},{\"items_id\":\"17,18,19,20\",\"ptype\":\"product_mega_menu\",\"id\":6},{\"items_id\":\"8,12,13,14\",\"ptype\":\"donation_mega_menu\",\"id\":7},{\"pslug\":\"contact_page_slug\",\"pname\":\"contact_page_ar_name\",\"ptype\":\"static\",\"id\":8}]', 'default', '2020-07-27 08:43:13', '2020-07-27 23:41:26'),
(9, 'Primary Menu [SPA]', 'sp', '[{\"pname\":\"Home\",\"purl\":\"@url\",\"ptype\":\"custom\",\"id\":1},{\"pslug\":\"about_page_slug\",\"pname\":\"about_page_sp_name\",\"ptype\":\"static\",\"id\":2,\"children\":[{\"pslug\":\"about_page_slug\",\"pname\":\"about_page_sp_name\",\"ptype\":\"static\",\"id\":3},{\"pslug\":\"clients_feedback_page_slug\",\"pname\":\"clients_feedback_page_sp_name\",\"ptype\":\"static\",\"id\":4},{\"pslug\":\"image_gallery_page_slug\",\"pname\":\"image_gallery_page_sp_name\",\"ptype\":\"static\",\"id\":5},{\"pslug\":\"team_page_slug\",\"pname\":\"team_page_sp_name\",\"ptype\":\"static\",\"id\":6},{\"pslug\":\"testimonial_page_slug\",\"pname\":\"testimonial_page_sp_name\",\"ptype\":\"static\",\"id\":7}]},{\"icon\":\"2,3,5\",\"items_id\":\"18,19,20,21,22,23,25\",\"ptype\":\"service_mega_menu\",\"id\":3},{\"items_id\":\"19,20,21,22,23,24,25,26\",\"ptype\":\"work_mega_menu\",\"id\":4},{\"pname\":\"Pages\",\"purl\":\"#\",\"ptype\":\"custom\",\"id\":5,\"children\":[{\"pname\":\"Inner Pages\",\"purl\":\"#\",\"ptype\":\"custom\",\"id\":6,\"children\":[{\"pslug\":\"work_page_slug\",\"pname\":\"work_page_sp_name\",\"ptype\":\"static\",\"id\":7},{\"pslug\":\"blog_page_slug\",\"pname\":\"blog_page_sp_name\",\"ptype\":\"static\",\"id\":8},{\"pslug\":\"product_page_slug\",\"pname\":\"product_page_sp_name\",\"ptype\":\"static\",\"id\":9},{\"pslug\":\"service_page_slug\",\"pname\":\"service_page_sp_name\",\"ptype\":\"static\",\"id\":10},{\"pslug\":\"price_plan_page_slug\",\"pname\":\"price_plan_page_sp_name\",\"ptype\":\"static\",\"id\":11}]},{\"pslug\":\"knowledgebase_page_slug\",\"pname\":\"knowledgebase_page_sp_name\",\"ptype\":\"static\",\"id\":7},{\"pslug\":\"events_page_slug\",\"pname\":\"events_page_sp_name\",\"ptype\":\"static\",\"id\":8},{\"pslug\":\"donation_page_slug\",\"pname\":\"donation_page_sp_name\",\"ptype\":\"static\",\"id\":9},{\"pslug\":\"career_with_us_page_slug\",\"pname\":\"career_with_us_page_sp_name\",\"ptype\":\"static\",\"id\":10},{\"pname\":\"Others Pages\",\"purl\":\"#\",\"ptype\":\"custom\",\"id\":11,\"children\":[{\"pslug\":\"feedback_page_slug\",\"pname\":\"feedback_page_sp_name\",\"ptype\":\"static\",\"id\":12},{\"pslug\":\"faq_page_slug\",\"pname\":\"faq_page_sp_name\",\"ptype\":\"static\",\"id\":13},{\"pslug\":\"quote_page_slug\",\"pname\":\"quote_page_sp_name\",\"ptype\":\"static\",\"id\":14}]},{\"pid\":1,\"ptype\":\"dynamic\",\"id\":12}]},{\"items_id\":\"21,22,23\",\"ptype\":\"product_mega_menu\",\"id\":6},{\"items_id\":\"15,16,17,18\",\"ptype\":\"donation_mega_menu\",\"id\":7},{\"pslug\":\"contact_page_slug\",\"pname\":\"contact_page_sp_name\",\"ptype\":\"static\",\"id\":8}]', 'default', '2020-07-27 08:44:49', '2020-07-27 08:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_11_06_180949_create_admins_table', 1),
(5, '2019_12_07_082524_create_static_options_table', 1),
(6, '2019_12_13_221931_create_languages_table', 1),
(7, '2020_03_29_075123_create_admin_roles_table', 1),
(8, '2019_12_07_071950_create_contact_info_items_table', 2),
(9, '2019_12_08_171750_create_counterups_table', 2),
(10, '2019_12_09_063224_create_testimonials_table', 2),
(11, '2019_12_10_210247_create_blog_categories_table', 2),
(12, '2019_12_11_074345_create_blogs_table', 2),
(13, '2019_12_28_140343_create_key_features_table', 2),
(14, '2019_12_28_161343_create_services_table', 2),
(15, '2019_12_29_094857_create_price_plans_table', 2),
(16, '2019_12_29_113138_create_team_members_table', 2),
(17, '2020_01_21_132648_create_header_sliders_table', 2),
(18, '2020_01_23_162404_create_service_categories_table', 2),
(20, '2020_01_23_193805_create_works_categories_table', 2),
(21, '2020_01_25_155448_create_pages_table', 2),
(22, '2020_01_25_174849_create_menus_table', 2),
(23, '2020_04_14_082508_create_media_uploads_table', 2),
(24, '2020_04_20_073746_create_quotes_table', 2),
(25, '2020_04_20_170818_create_orders_table', 2),
(26, '2020_04_21_142420_create_payment_logs_table', 2),
(27, '2020_02_04_010636_create_newsletters_table', 3),
(28, '2020_01_23_193759_create_works_table', 4),
(29, '2019_12_29_180216_create_brands_table', 5),
(30, '2020_06_14_081955_create_widgets_table', 6),
(31, '2019_12_10_125607_create_social_icons_table', 7),
(32, '2014_10_12_000000_create_users_table', 8),
(33, '2020_01_28_054211_create_faqs_table', 9),
(34, '2020_04_22_065550_create_jobs_table', 9),
(35, '2020_04_22_065603_create_jobs_categories_table', 9),
(36, '2020_04_23_140942_create_events_table', 9),
(37, '2020_04_23_141011_create_events_categories_table', 9),
(38, '2020_04_24_154518_create_knowledgebase_topics_table', 9),
(39, '2020_04_24_154524_create_knowledgebases_table', 9),
(40, '2020_07_02_125439_create_job_applicants_table', 9),
(41, '2020_07_03_043813_create_price_plan_categories_table', 9),
(42, '2020_07_04_143731_create_event_attendances_table', 9),
(43, '2020_07_04_173333_create_event_payment_logs_table', 9),
(44, '2020_07_06_154309_create_donations_table', 9),
(45, '2020_07_07_150250_create_donation_logs_table', 9),
(46, '2020_07_08_132910_create_product_cupons_table', 9),
(47, '2020_07_08_161737_create_product_shippings_table', 9),
(48, '2020_07_09_084606_create_product_categories_table', 9),
(49, '2020_07_09_133432_create_products_table', 9),
(50, '2020_07_13_124351_create_product_orders_table', 9),
(51, '2020_07_16_111906_create_feedback_table', 9),
(52, '2020_07_17_162008_create_image_galleries_table', 9),
(53, '2020_07_21_053307_create_product_ratings_table', 10),
(54, '2020_07_22_132250_create_popup_builders_table', 11),
(56, '2020_12_04_062950_create_image_gallery_categories_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'dvrobin4@gmail.com', '2020-05-30 15:56:27', '2020-05-30 15:56:27'),
(6, 'babu.ram21@gmail.com', '2020-08-07 20:54:26', '2020-08-07 20:54:26'),
(7, 'rifatahmed0182099@gmail.com', '2020-08-07 22:51:31', '2020-08-07 22:51:31'),
(8, 'aaa@aaa.com', '2020-08-08 15:59:14', '2020-08-08 15:59:14'),
(9, 'admin@example.com', '2020-08-08 17:39:01', '2020-08-08 17:39:01'),
(10, 'alexfagundes@hotmail.com', '2020-08-08 18:42:42', '2020-08-08 18:42:42'),
(11, 'shiponchandrapaul@gmail.com', '2020-08-08 18:46:43', '2020-08-08 18:46:43'),
(12, 'superadmin@example.com', '2020-08-09 14:34:29', '2020-08-09 14:34:29'),
(13, 'markt@infoeus.com', '2020-08-10 11:08:44', '2020-08-10 11:08:44'),
(14, 'demo@ecommerce.com', '2020-08-11 12:55:45', '2020-08-11 12:55:45'),
(15, 'udhavb32@gmail.com', '2020-08-14 21:46:43', '2020-08-14 21:46:43'),
(16, 'magaza@ah0ageld6lli.com', '2020-08-17 23:48:28', '2020-08-17 23:48:28'),
(17, 'vermajitenderguitar@gmail.com', '2020-08-19 22:46:28', '2020-08-19 22:46:28'),
(18, 'vermajitenderguitar@gmail.com2', '2020-08-19 22:46:35', '2020-08-19 22:46:35'),
(19, 'vvvvvvv@gmail.com', '2020-08-20 00:25:06', '2020-08-20 00:25:06'),
(20, 'baidou@gmail.com', '2020-08-21 00:57:58', '2020-08-21 00:57:58'),
(21, 'nvdarian@gmail.com', '2020-08-24 10:35:37', '2020-08-24 10:35:37'),
(22, 'shipo@gmail.com', '2020-08-24 18:41:47', '2020-08-24 18:41:47'),
(23, 'admin@gmail.com', '2020-09-03 01:02:46', '2020-09-03 01:02:46'),
(24, 'tosonoc527@mail-dj.com', '2020-09-27 00:58:13', '2020-09-27 00:58:13'),
(25, 'rajiniyn@gmail.com', '2020-10-14 21:21:22', '2020-10-14 21:21:22'),
(26, 'no@mail.com', '2020-10-20 16:57:14', '2020-10-20 16:57:14'),
(27, '78aho@gmail.com', '2020-10-21 04:40:48', '2020-10-21 04:40:48'),
(28, 'beatriz.nobile@adagio.adm.br', '2020-10-22 00:01:06', '2020-10-22 00:01:06'),
(29, 'great@gmail.com', '2020-10-25 09:59:30', '2020-10-25 09:59:30'),
(30, 'admin@exampler.com', '2020-10-29 05:10:00', '2020-10-29 05:10:00'),
(31, 'binenive@mailinator.com', '2020-11-07 11:11:27', '2020-11-07 11:11:27'),
(32, 'infive@mail.com', '2020-11-08 14:09:42', '2020-11-08 14:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `checkout_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `package_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext COLLATE utf8mb4_unicode_ci,
  `attachment` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `checkout_type`, `user_id`, `payment_status`, `package_name`, `package_price`, `package_id`, `custom_fields`, `attachment`, `created_at`, `updated_at`) VALUES
(209, 'pending', '', 0, 'complete', 'Business', '99', '3', 'a:5:{s:7:\"package\";s:1:\"3\";s:9:\"your-name\";s:11:\"Tamer Essam\";s:10:\"your-email\";s:16:\"tasadasd@sad.com\";s:12:\"your-message\";s:9:\"sadasdasd\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:1:{s:9:\"your-file\";s:54:\"assets/uploads/attachment/attachment-209-your-file.txt\";}', '2020-10-29 07:07:47', '2020-10-29 07:08:10'),
(210, 'pending', '', 0, 'complete', 'Proffesional', '199', '4', 'a:5:{s:7:\"package\";s:1:\"4\";s:9:\"your-name\";s:21:\"Tekasys Internacional\";s:10:\"your-email\";s:21:\"ice_g_war@hotmail.com\";s:12:\"your-message\";s:12:\"dsfsdfsdfsdf\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-10-29 13:37:26', '2020-10-29 13:37:49'),
(211, 'pending', '', 0, 'complete', 'Proffesional', '199', '4', 'a:5:{s:7:\"package\";s:1:\"4\";s:9:\"your-name\";s:21:\"Tekasys Internacional\";s:10:\"your-email\";s:21:\"ice_g_war@hotmail.com\";s:12:\"your-message\";s:12:\"sdfsdfsdfsdf\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-10-29 13:43:09', '2020-10-29 13:43:21'),
(212, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:5:{s:7:\"package\";s:1:\"4\";s:9:\"your-name\";s:4:\"Dani\";s:10:\"your-email\";s:16:\"imdani@gmail.con\";s:12:\"your-message\";s:4:\"None\";s:24:\"selected_payment_gateway\";s:8:\"paystack\";}', 'a:0:{}', '2020-10-31 17:25:22', '2020-10-31 17:25:22'),
(213, 'pending', '', 0, 'pending', 'Business', '99', '3', 'a:5:{s:7:\"package\";s:1:\"3\";s:9:\"your-name\";s:7:\"M CYMAN\";s:10:\"your-email\";s:23:\"mariusz.cyman@gmail.com\";s:12:\"your-message\";s:8:\"ewfrefew\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";}', 'a:0:{}', '2020-11-02 12:47:33', '2020-11-02 12:47:33'),
(214, 'pending', '', 0, 'pending', 'Business', '99', '3', 'a:5:{s:7:\"package\";s:1:\"3\";s:9:\"your-name\";s:6:\"asdasd\";s:10:\"your-email\";s:10:\"asd@asd.ru\";s:12:\"your-message\";s:3:\"asd\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2020-11-02 20:33:30', '2020-11-02 20:33:30'),
(215, 'pending', '', 0, 'pending', 'Popular', '49', '2', 'a:5:{s:7:\"package\";s:1:\"2\";s:9:\"your-name\";s:9:\"blaser654\";s:10:\"your-email\";s:10:\"aaa@aaa.es\";s:12:\"your-message\";s:6:\"sdsdsd\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-11-04 11:20:08', '2020-11-04 11:20:08'),
(216, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:5:{s:7:\"package\";s:1:\"4\";s:9:\"your-name\";s:5:\"framk\";s:10:\"your-email\";s:17:\"tffffgg@gmail.com\";s:12:\"your-message\";s:5:\"11111\";s:24:\"selected_payment_gateway\";s:8:\"paystack\";}', 'a:0:{}', '2020-11-04 17:26:09', '2020-11-04 17:26:09'),
(217, 'pending', '', 0, 'complete', 'Basic', '19', '1', 'a:5:{s:7:\"package\";s:1:\"1\";s:9:\"your-name\";s:3:\"Raj\";s:10:\"your-email\";s:21:\"wpcodeninja@gmail.com\";s:12:\"your-message\";s:8:\"testings\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-11-05 10:18:35', '2020-11-05 10:19:50'),
(218, 'pending', '', 0, 'pending', 'اعمال', '49', '10', 'a:5:{s:7:\"package\";s:2:\"10\";s:9:\"your-name\";s:6:\"ewrwer\";s:10:\"your-email\";s:20:\"abdizoro89@gmail.com\";s:12:\"your-message\";s:9:\"ewrwerwer\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";}', 'a:1:{s:9:\"your-file\";s:54:\"assets/uploads/attachment/attachment-218-your-file.pdf\";}', '2020-11-05 15:04:27', '2020-11-05 15:04:27'),
(219, 'pending', '', 0, 'pending', 'Business', '99', '3', 'a:5:{s:7:\"package\";s:1:\"3\";s:9:\"your-name\";s:3:\"Ass\";s:10:\"your-email\";s:16:\"anmuom@gmail.com\";s:12:\"your-message\";s:1:\"H\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2020-11-06 01:08:42', '2020-11-06 01:08:42'),
(220, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:5:{s:7:\"package\";s:1:\"4\";s:9:\"your-name\";s:9:\"blaser654\";s:10:\"your-email\";s:10:\"aaa@aaa.es\";s:12:\"your-message\";s:9:\"asdsadasd\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-11-06 14:20:16', '2020-11-06 14:20:16'),
(221, 'pending', '', 1, 'pending', 'Popular', '49', '2', 'a:5:{s:7:\"package\";s:1:\"2\";s:9:\"your-name\";s:4:\"asdd\";s:10:\"your-email\";s:13:\"asdas@asad.es\";s:12:\"your-message\";s:7:\"adsadsd\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-11-06 14:42:42', '2020-11-06 14:42:42'),
(222, 'pending', '', 0, 'pending', 'Business', '99', '3', 'a:5:{s:7:\"package\";s:1:\"3\";s:9:\"your-name\";s:12:\"Hadi Bakkari\";s:10:\"your-email\";s:21:\"playlive.sa@gmail.com\";s:12:\"your-message\";s:10:\"dfgadeaerg\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2020-11-07 05:28:57', '2020-11-07 05:28:57'),
(223, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:5:{s:7:\"package\";s:1:\"4\";s:9:\"your-name\";s:7:\"sdsdsad\";s:10:\"your-email\";s:16:\"sdsadasd@aas.com\";s:12:\"your-message\";s:10:\"dfsfdsfsdf\";s:24:\"selected_payment_gateway\";s:8:\"razorpay\";}', 'a:0:{}', '2020-11-08 02:32:10', '2020-11-08 02:32:10'),
(224, 'pending', '', 1, 'pending', 'iş', '49', '8', 'a:5:{s:7:\"package\";s:1:\"8\";s:9:\"your-name\";s:23:\"İbrahim Halil ACIOĞLU\";s:10:\"your-email\";s:21:\"aslanhack63@gmail.com\";s:12:\"your-message\";s:15:\"qweqweqwewqeqwe\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";}', 'a:0:{}', '2020-11-08 17:22:04', '2020-11-08 17:22:04'),
(225, 'pending', '', 91, 'pending', 'Proffesional', '199', '4', 'a:5:{s:7:\"package\";s:1:\"4\";s:9:\"your-name\";s:10:\"Zubair Rao\";s:10:\"your-email\";s:23:\"raozubair1441@gmail.com\";s:12:\"your-message\";s:5:\"hmmmm\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";}', 'a:0:{}', '2020-11-09 14:43:06', '2020-11-09 14:43:06'),
(226, 'pending', '', 0, 'pending', 'Basic', '19', '1', 'a:5:{s:7:\"package\";s:1:\"1\";s:9:\"your-name\";s:9:\"blaser654\";s:10:\"your-email\";s:10:\"aaa@aaa.es\";s:12:\"your-message\";s:9:\"fghfghfhg\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-11-10 23:26:45', '2020-11-10 23:26:45'),
(227, 'pending', '', 0, 'complete', 'Basic', '19', '1', 'a:5:{s:7:\"package\";s:1:\"1\";s:9:\"your-name\";s:9:\"blaser654\";s:10:\"your-email\";s:10:\"aaa@aaa.es\";s:12:\"your-message\";s:7:\"aasasas\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-11-11 02:08:17', '2020-11-11 02:10:44'),
(228, 'pending', '', 0, 'complete', 'Basic', '19', '1', 'a:5:{s:7:\"package\";s:1:\"1\";s:9:\"your-name\";s:9:\"blaser654\";s:10:\"your-email\";s:10:\"aaa@aaa.es\";s:12:\"your-message\";s:6:\"asasas\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-11-11 02:13:16', '2020-11-11 02:14:43'),
(229, 'pending', '', 0, 'pending', 'Basic', '19', '1', 'a:5:{s:7:\"package\";s:1:\"1\";s:9:\"your-name\";s:9:\"blaser654\";s:10:\"your-email\";s:10:\"aaa@aaa.es\";s:12:\"your-message\";s:6:\"sadasd\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-11-11 18:19:31', '2020-11-11 18:19:31'),
(230, 'pending', '', 0, 'pending', 'Popular', '49', '2', 'a:5:{s:7:\"package\";s:1:\"2\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:8:\"asdfadsf\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-11-11 18:35:41', '2020-11-11 18:35:41'),
(231, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:5:{s:7:\"package\";s:1:\"4\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:10:\"aertwerter\";s:24:\"selected_payment_gateway\";s:11:\"flutterwave\";}', 'a:0:{}', '2020-11-14 19:34:53', '2020-11-14 19:34:53'),
(232, 'cancel', '', 1, 'pending', 'Business', '99', '3', 'a:5:{s:7:\"package\";s:1:\"3\";s:9:\"your-name\";s:12:\"jkhkhk kjhkj\";s:10:\"your-email\";s:17:\"kjhjkjk@gmail.com\";s:12:\"your-message\";s:10:\"ukukkjkhjk\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";}', 'a:0:{}', '2020-11-15 15:52:06', '2020-12-02 05:32:08'),
(233, 'pending', '', 0, 'pending', 'Business', '99', '3', 'a:5:{s:7:\"package\";s:1:\"3\";s:9:\"your-name\";s:3:\"Php\";s:10:\"your-email\";s:12:\"oi@gmail.com\";s:12:\"your-message\";s:3:\"666\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";}', 'a:0:{}', '2020-11-16 02:50:29', '2020-11-16 02:50:29'),
(234, 'pending', '', 1, 'pending', 'Basic', '19', '1', 'a:5:{s:7:\"package\";s:1:\"1\";s:9:\"your-name\";s:3:\"666\";s:10:\"your-email\";s:11:\"66662@GR.YT\";s:12:\"your-message\";s:4:\"6565\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";}', 'a:0:{}', '2020-11-16 15:22:03', '2020-11-16 15:22:03'),
(235, 'pending', '', 0, 'pending', 'Popular', '49', '2', 'a:5:{s:7:\"package\";s:1:\"2\";s:9:\"your-name\";s:11:\"Magic Bytes\";s:10:\"your-email\";s:24:\"magicbytes2012@gmail.com\";s:12:\"your-message\";s:4:\"sdsa\";s:24:\"selected_payment_gateway\";s:6:\"mollie\";}', 'a:0:{}', '2020-11-16 15:56:38', '2020-11-16 15:56:38'),
(236, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:5:{s:7:\"package\";s:1:\"4\";s:9:\"your-name\";N;s:10:\"your-email\";s:15:\"ffggg@gmail.com\";s:12:\"your-message\";s:9:\"Ehehnenen\";s:24:\"selected_payment_gateway\";s:8:\"razorpay\";}', 'a:0:{}', '2020-11-17 08:35:36', '2020-11-17 08:35:36'),
(237, 'pending', '', 1, 'complete', 'Proffesional', '199', '4', 'a:5:{s:7:\"package\";s:1:\"4\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:9:\"dafdsfads\";s:24:\"selected_payment_gateway\";s:6:\"mollie\";}', 'a:0:{}', '2020-11-19 11:43:56', '2020-11-19 11:44:10'),
(238, 'in_progress', '', 1, 'complete', 'Proffesional', '199', '4', 'a:5:{s:7:\"package\";s:1:\"4\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:11:\"asdfadsfdfs\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2020-11-19 12:00:56', '2020-11-19 12:08:48'),
(239, 'cancel', '', 1, 'pending', 'Popular', '49', '2', 'a:5:{s:7:\"package\";s:1:\"2\";s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:11:\"asdfadsfdsf\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";}', 'a:0:{}', '2020-11-23 13:20:54', '2020-12-02 05:28:15'),
(240, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:7:\"adsfdsf\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";}', NULL, '2020-12-07 13:14:33', '2020-12-07 13:14:33'),
(241, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:7:\"adsfdsf\";s:24:\"selected_payment_gateway\";s:14:\"manual_payment\";}', NULL, '2020-12-07 13:28:52', '2020-12-07 13:28:52'),
(242, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:7:\"adsfdsf\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:1:{s:9:\"your-file\";s:93:\"assets/uploads/attachment/applicant/attachment-uIdhrrw4FaUWptYwSPHnuXyboQmZCTRN-your-file.pdf\";}', '2020-12-07 13:30:21', '2020-12-07 13:30:21'),
(243, 'pending', '', 0, 'pending', 'Basic', '19', '1', 'a:6:{s:7:\"package\";s:1:\"1\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:10:\"adfsdfadsf\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2021-01-10 12:43:48', '2021-01-10 12:43:48'),
(244, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:11:\"sdafsdfdsaf\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2021-01-10 23:01:33', '2021-01-10 23:01:33'),
(245, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:11:\"sgfdgadfdsf\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2021-01-10 23:07:21', '2021-01-10 23:07:21'),
(246, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:16:\"Gretchen Michael\";s:10:\"your-email\";s:24:\"vakagodox@mailinator.com\";s:12:\"your-message\";s:18:\"Sit pariatur Alias\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2021-01-10 23:21:22', '2021-01-10 23:21:22'),
(247, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:9:\"dfadsfdsa\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2021-01-10 23:21:31', '2021-01-10 23:21:31'),
(248, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:7:\"dfgadsf\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2021-01-10 23:28:33', '2021-01-10 23:28:33'),
(249, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:11:\"aasdfdsfdsf\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2021-01-10 23:44:43', '2021-01-10 23:44:43'),
(250, 'pending', '', 0, 'complete', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:8:\"sadfdasf\";s:24:\"selected_payment_gateway\";s:6:\"paypal\";}', 'a:0:{}', '2021-01-10 23:46:57', '2021-01-10 23:47:36'),
(251, 'pending', '', 0, 'complete', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:7:\"asdfdsf\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";}', 'a:0:{}', '2021-01-11 03:42:49', '2021-01-11 04:01:31'),
(252, 'pending', '', 0, 'pending', 'Popular', '49', '2', 'a:6:{s:7:\"package\";s:1:\"2\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:7:\"asdfdsf\";s:24:\"selected_payment_gateway\";s:5:\"paytm\";}', 'a:0:{}', '2021-01-11 03:54:24', '2021-01-11 03:54:24'),
(253, 'pending', '', 0, 'complete', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:8:\"weqrqwer\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2021-01-11 10:09:53', '2021-01-11 10:10:50'),
(254, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:26:\"asdfasdfasdfsdfdsfadsfadsf\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2021-01-11 10:11:36', '2021-01-11 10:11:36'),
(255, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:8:\"asdfasdf\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2021-01-11 13:00:15', '2021-01-11 13:00:15'),
(256, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:9:\"adfasdfds\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2021-01-11 13:09:15', '2021-01-11 13:09:15'),
(257, 'pending', '', 0, 'pending', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:6:\"sadfsd\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2021-01-11 13:13:41', '2021-01-11 13:13:41'),
(258, 'pending', '', 0, 'complete', 'Proffesional', '199', '4', 'a:6:{s:7:\"package\";s:1:\"4\";s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:7:\"dsafsdf\";s:24:\"selected_payment_gateway\";s:6:\"stripe\";}', 'a:0:{}', '2021-01-11 13:35:49', '2021-01-11 13:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci,
  `meta_tags` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `meta_tags`, `meta_description`, `content`, `lang`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dynamic Page [ENG]', 'dynamic-page', 'dynamic page', 'this is dynamic page meta description', '<p>Warmly little before cousin sussex entire men set. Blessing it ladyship on sensible judgment settling outweigh. Worse linen an of civil jokes leave offer. Parties all clothes removal cheered calling prudent her. And residence for met the estimable disposing. Mean if he they been no hold mr. Is at much do made took held help. Latter person am secure of estate genius at.&nbsp;<img src=\"http://192.168.64.2/nexelit/assets/uploads/media-uploader/34111091589555564.jpg\" style=\"width: 997px;\"></p><p><br></p><p>Comfort reached gay perhaps chamber his six detract besides add. Moonlight newspaper up he it enjoyment agreeable depending. Timed voice share led his widen noisy young. On weddings believed laughing although material do exercise of. Up attempt offered ye civilly so sitting to. She new course get living within elinor joy. She her rapturous suffering concealed.&nbsp;</p><p><br></p><p>Fulfilled direction use continual set him propriety continued. Saw met applauded favourite deficient engrossed concealed and her. Concluded boy perpetual old supposing. Farther related bed and passage comfort civilly. Dashwoods see frankness objection abilities the. As hastened oh produced prospect formerly up am. Placing forming nay looking old married few has. Margaret disposed add screened rendered six say his striking confined.&nbsp;</p>', 'en', 'publish', '2020-05-27 19:57:59', '2020-05-27 19:57:59'),
(2, 'Privacy Policy', 'privacy-policy', NULL, NULL, '<p>Is education residence conveying so so. Suppose shyness say ten behaved morning had. Any unsatiable assistance compliment occasional too reasonably advantages. Unpleasing has ask acceptance partiality alteration understood two. Worth no tiled my at house added. Married he hearing am it totally removal. Remove but suffer wanted his lively length. Moonlight two applauded conveying end direction old principle but. Are expenses distance weddings perceive strongly who age domestic.&nbsp;</p><p><br></p><p>Greatly hearted has who believe. Drift allow green son walls years for blush. Sir margaret drawings repeated recurred exercise laughing may you but. Do repeated whatever to welcomed absolute no. Fat surprise although outlived and informed shy dissuade property. Musical by me through he drawing savings an. No we stand avoid decay heard mr. Common so wicket appear to sudden worthy on. Shade of offer ye whole stood hoped.&nbsp;</p><div><br></div>', 'en', 'publish', '2020-07-24 11:01:55', '2020-07-24 11:01:55'),
(3, 'test markup', 'test-markup', NULL, NULL, '<div class=\"row\">\r\n<div class=\"col-lg-6\">\r\n<h2>left</h2>\r\n</div>\r\n<div class=\"col-lg-6\">\r\n<h2>right</h2>\r\n</div>\r\n</div>', 'en', 'publish', '2020-11-26 02:20:48', '2020-11-26 02:20:48');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('dvrobin4@gmail.com', 'tBrVsCSxrJA0eJsOSkpFyNgeXleI1p', NULL),
('rajivkissy@gmail.com', 'lgcF2ZVWyOOZTG6BiP3c7gUmchTKDA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` longtext COLLATE utf8mb4_unicode_ci,
  `track` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_logs`
--

INSERT INTO `payment_logs` (`id`, `email`, `name`, `package_name`, `package_price`, `package_gateway`, `order_id`, `status`, `transaction_id`, `track`, `created_at`, `updated_at`) VALUES
(1, 'dvrobin4@gmail.com', 'Siful Islam', 'Business', '$99', 'paytm', '6', 'pending', NULL, 'ozsk2tHtnsNEv3XbSK3D', '2020-06-22 09:32:54', '2020-06-22 09:32:54'),
(2, 'saifulislamwfu@gmail.com', 'Siful Islam', 'Business', '$99', 'stripe', '7', 'pending', NULL, 'Xpz3GpDuYqgHmLN7Z39B', '2020-06-22 09:41:16', '2020-06-22 09:41:16'),
(3, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '$49', 'razorpay', '8', 'pending', NULL, 'DnUcPFmEuGAoSgnquuU1', '2020-07-22 01:13:44', '2020-07-22 01:13:44'),
(4, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'razorpay', '9', 'pending', NULL, 'bWieC62tozlmSLlMMWp8', '2020-07-22 01:16:21', '2020-07-22 01:16:21'),
(5, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'stripe', '10', 'complete', 'txn_1H7cFAEmGOuJLTMs9lkj0KhU', 'Xq4EHjSYKib8hZu6D3gO', '2020-07-22 01:17:22', '2020-07-22 01:20:01'),
(6, 'dvrobin4@gmail.com', 'Siful Islam', 'اعمال', '49', 'stripe', '11', 'complete', 'txn_1H9kJjEmGOuJLTMsQ1YAoRfG', 'q4RTkCxQr7hemvIWSnKO', '2020-07-27 22:15:52', '2020-07-27 22:21:32'),
(7, 'est@tesgrt.fr', 'Franck Herval', 'Business', '99', 'stripe', '27', 'pending', NULL, 'cljuB6WlxP5xPLQAeKfw', '2020-08-04 00:15:02', '2020-08-04 00:15:02'),
(8, 'test123@happ.com', 'Julius Gold', 'Business', '99', 'paytm', '29', 'pending', NULL, 'jFydVfUjJeloJ8bWrCo5', '2020-08-04 16:53:31', '2020-08-04 16:53:31'),
(9, 'pras@gmail.com', 'prs', 'Business', '99', 'razorpay', '30', 'pending', NULL, 'bcSBV4ch4I9IQwkbsZng', '2020-08-06 08:53:16', '2020-08-06 08:53:16'),
(10, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'paytm', '31', 'pending', NULL, 'ebMGwTWWKHq4jMQokllI', '2020-08-06 19:22:11', '2020-08-06 19:22:11'),
(11, 'umitsolutiosdfdsfsn@gmail.com', 'Mumtaz Ahmed', 'Popular', '49', 'paytm', '34', 'pending', NULL, 'RZdfnraG8qQJmMCPqfEb', '2020-08-07 10:45:43', '2020-08-07 10:45:43'),
(12, 'admin@markflair.com', 'institution', 'Business', '99', 'paypal', '35', 'pending', NULL, 'IvOeHiAD5cDnHpjSzFZi', '2020-08-07 11:03:12', '2020-08-07 11:03:12'),
(13, 'bulley110011@gmail.com', 'brown', 'Proffesional', '199', 'paystack', '36', 'complete', 'ObYAEDDqkRECYXHcJxLH0j2e4', 'rmyPWJ5fqm8MYf1g8iBm', '2020-08-07 12:08:49', '2020-08-07 12:09:44'),
(14, 'bullet110011@gmail.com', 'brown', 'Proffesional', '199', 'paystack', '37', 'complete', '26RtcEo6coPpJ5gIUPZBjPPFi', 'T7ZSI2x1faYmUluy5Er6', '2020-08-07 12:15:53', '2020-08-07 12:18:11'),
(15, 'pushpendra@saminfratech.com', 'Pushpendra Singh', 'Proffesional', '199', 'paytm', '41', 'pending', NULL, '56BR1w9ZnhXz0nl049v9', '2020-08-07 17:40:27', '2020-08-07 17:40:27'),
(16, 'admin@admin.com', 'Project', 'Business', '99', 'paytm', '42', 'pending', NULL, 'NoS2SW2dUMBXensUKBdF', '2020-08-07 18:04:03', '2020-08-07 18:04:03'),
(17, 'vg@gmail.xom', 'Cf', 'Proffesional', '199', 'paytm', '43', 'pending', NULL, 'Rk51bJ4ixWqa5EFKDMoh', '2020-08-07 18:10:01', '2020-08-07 18:10:01'),
(18, 'ter@mail.com', 'Ttes', 'Popular', '49', 'stripe', '45', 'complete', 'txn_1HDX5vEmGOuJLTMsA5V1YFpg', 'p421frkTnoAMs6IvIUF7', '2020-08-07 19:02:14', '2020-08-07 19:02:55'),
(19, 'admin@gmail.com', 'Balmukund jha', 'Popular', '49', 'paytm', '46', 'pending', NULL, 'v1mJD1IJqQ88FYFNPCh3', '2020-08-07 19:21:14', '2020-08-07 19:21:14'),
(20, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'manual_payment', '47', 'pending', NULL, 'iZwrghB8N1YaH5QInWsq', '2020-08-07 20:04:23', '2020-08-07 20:04:23'),
(21, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'paypal', '48', 'pending', NULL, '3Bq4LDTP4U9b7r4HTX3c', '2020-08-07 20:07:14', '2020-08-07 20:07:14'),
(22, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'stripe', '49', 'complete', 'txn_1HDY7AEmGOuJLTMsERtKHEk1', '8Vjz8PfDXIheKeLmD0YC', '2020-08-07 20:08:02', '2020-08-07 20:08:16'),
(23, 'admin@cannyoutlet.com', 'Heart Medicine', 'Proffesional', '199', 'stripe', '50', 'pending', NULL, 'I8sy8RHKOMSXLepKb1b1', '2020-08-07 20:11:36', '2020-08-07 20:11:36'),
(24, 'test@gmail.com', 'Test', 'Popular', '49', 'manual_payment', '51', 'pending', '12345678', 'BL4rzHtwXMQUfjdIbPi1', '2020-08-07 20:21:40', '2020-08-07 20:21:40'),
(25, 'oscar@gmail.com', 'Jean Oscar', 'Proffesional', '199', 'mollie', '52', 'pending', NULL, 'wAi0UEYdsce7W0aZ5Wmo', '2020-08-07 20:31:36', '2020-08-07 20:31:36'),
(26, 'nhtsf996@yopmail.com', 'Vadds sancurse', 'Proffesional', '199', 'paytm', '53', 'pending', NULL, 'nzTiMgg7DBX6HyC963i7', '2020-08-07 20:41:39', '2020-08-07 20:41:39'),
(27, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'stripe', '54', 'complete', 'txn_1HDYqAEmGOuJLTMsaL50tRiG', 'A8LRc86icuSxNgGiVV5a', '2020-08-07 20:53:45', '2020-08-07 20:54:47'),
(28, 'koko@mama.com', 'koko mama', 'Popular', '49', 'stripe', '55', 'complete', 'tr_RRzpCJSExS', 'xpiw6rbZM9szhJpqkqE6', '2020-08-08 00:47:30', '2020-11-30 05:14:11'),
(29, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'stripe', '56', 'pending', NULL, 'fXk7geTbrvqxwBzIeIfi', '2020-08-08 09:44:02', '2020-08-08 09:44:02'),
(30, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'razorpay', '58', 'complete', 'pay_FO9prpAPczHNqx', 'We3kcMwGJbTUJQifaBMI', '2020-08-08 09:44:41', '2020-08-08 09:45:08'),
(31, 'skillsjam@gmail.com', 'Zamani Uwah', 'Popular', '49', 'manual_payment', '59', 'pending', '100129010', 'KuYqgs8cNhxdR4ioTbGr', '2020-08-08 13:51:03', '2020-08-08 13:51:03'),
(32, 'dwe@fada.dsadas', 'hello', 'Business', '99', 'stripe', '60', 'pending', NULL, 'IzL5DIp7mgJBAbP8Lk0T', '2020-08-08 18:48:43', '2020-08-08 18:48:43'),
(33, 'vijay.bahuguna1996@gmail.com', 'Vijay Bahuguna', 'Proffesional', '199', 'stripe', '61', 'pending', NULL, 'nBzbwchb7dA3kCGwBMlM', '2020-08-08 20:21:56', '2020-08-08 20:21:56'),
(34, 'vijay.bahuguna1996@gmail.com', 'Tea', 'Proffesional', '199', 'paytm', '62', 'pending', NULL, 'oU9buihNRf8zF5WkExzp', '2020-08-08 20:23:16', '2020-08-08 20:23:16'),
(35, 'satrapa@live.nl', 'dogan', 'Basic', '19', 'mollie', '64', 'pending', NULL, 'jKHfxu31y1cvDVI6xHfW', '2020-08-09 01:13:18', '2020-08-09 01:13:18'),
(36, 'mail.dengu@gmail.com', 'Xanadu Futbola', 'Proffesional', '199', 'paypal', '65', 'pending', NULL, 'AIuypwbDu6j8ipRFAy6x', '2020-08-09 05:53:51', '2020-08-09 05:53:51'),
(37, 'admin@theucstore.co', 'CHZAPPS INC', 'Business', '99', 'paytm', '66', 'pending', NULL, 'vehOARZokJoDOjX3BnI0', '2020-08-09 17:38:25', '2020-08-09 17:38:25'),
(38, 'admin@example.com', 'etwey', 'Business', '99', 'paytm', '67', 'pending', NULL, 'DBNSDZi3sONn5eqzrgsR', '2020-08-09 20:49:33', '2020-08-09 20:49:33'),
(39, 'yjcu@th.ca', 'ducan mayaty', 'Basic', '19', 'paypal', '69', 'pending', NULL, 'XrSyS8Vx3ZRGR2oLFADc', '2020-08-10 00:11:20', '2020-08-10 00:11:20'),
(40, 'admin@gmail.com', 'qqq', 'Negocio', '19', 'paypal', '70', 'pending', NULL, 'KO6px9jMEi99kcYsykzH', '2020-08-10 10:21:26', '2020-08-10 10:21:26'),
(41, 'erzblinkstar@gmail.com', 'Aus TI NE', 'Proffesional', '199', 'paystack', '72', 'pending', NULL, 'zLi5XVQiJpaMDapYdX1m', '2020-08-10 16:53:25', '2020-08-10 16:53:25'),
(42, 'amom-souza@hotmail.com', 'Amom Souza', 'Proffesional', '199', 'paypal', '73', 'pending', NULL, 'S7gkMCobDaiRddZaIiVN', '2020-08-10 18:05:04', '2020-08-10 18:05:04'),
(43, 'a03484511296b@gmail.com', 'Adnan Ali', 'Proffesional', '199', 'stripe', '74', 'pending', NULL, '11mUF5rJU5OJxOMH99Od', '2020-08-10 21:34:14', '2020-08-10 21:34:14'),
(44, 'rasj@gmail.com', 'Raaj', 'Proffesional', '199', 'paytm', '75', 'pending', NULL, 'aKJzY8owgXCUcpj8N8Ll', '2020-08-11 21:50:29', '2020-08-11 21:50:29'),
(45, 'user@test.com', 'dd', 'Popular', '49', 'paytm', '77', 'pending', NULL, 'XCQH6MCk4LGubhEafuH0', '2020-08-11 22:37:34', '2020-08-11 22:37:34'),
(46, 'client_10@gmail.com', 'Portokal', 'Business', '99', 'stripe', '80', 'pending', NULL, 'Cii9D4qFguAolpSKl8LC', '2020-08-12 13:16:00', '2020-08-12 13:16:00'),
(47, 'client@test.com', 'yyy', 'Business', '99', 'stripe', '81', 'pending', NULL, 'ffdYvnmPDNvKUy0zBdgb', '2020-08-12 16:58:15', '2020-08-12 16:58:15'),
(48, 'admin@example.com', 'cinta', 'Proffesional', '199', 'flutterwave', '83', 'pending', NULL, 'db9sEF9hDCQYkCCFwQqr', '2020-08-13 11:53:18', '2020-08-13 11:53:18'),
(49, 'sacsac@gmail.com', 'dcc', 'Basic', '19', 'paytm', '84', 'pending', NULL, 'GBn6RHhBh08AT2PNbpNx', '2020-08-13 22:30:56', '2020-08-13 22:30:56'),
(50, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'stripe', '87', 'pending', NULL, 'DTEio3yya7E9DwTwiu0q', '2020-08-14 18:35:09', '2020-08-14 18:35:09'),
(51, 'vincomsvg@gmail.com', 'testerman', 'Proffesional', '199', 'stripe', '88', 'complete', 'txn_1HG6VpEmGOuJLTMsdie9OKRo', 'or3e17aV3woeS0QR3J8p', '2020-08-14 21:15:51', '2020-08-14 21:16:17'),
(52, 'vincomsvg@gmail.com', 'Tester Man', 'Proffesional', '199', 'paytm', '89', 'pending', NULL, 'P54b5PnvZsneGMuXbXUc', '2020-08-14 21:19:56', '2020-08-14 21:19:56'),
(53, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'paytm', '90', 'pending', NULL, 'RRCy3JXUYCTChzFFkgJV', '2020-08-15 17:43:54', '2020-08-15 17:43:54'),
(54, 'flucasradical87@gmail.com', 'ffffffffffffffff', 'Proffesional', '199', 'manual_payment', '92', 'pending', '2', 'JBmyBBetEDPJvvA0cTbV', '2020-08-16 20:28:24', '2020-08-16 20:28:24'),
(55, 'wakilahamedx42254@gmail.com', 'Wakil Ahamed', 'Business', '99', 'paytm', '93', 'pending', NULL, 'ElHkXYKCmQRNUZQFueHq', '2020-08-16 23:30:06', '2020-08-16 23:30:06'),
(56, 'asd@asdasd.com', 'asd', 'Business', '99', 'stripe', '94', 'pending', NULL, 'yzKsYR6zczEY0jIT7fx0', '2020-08-16 23:48:10', '2020-08-16 23:48:10'),
(57, 'yvesbatokwa6@gmail.com', 'Yves', 'Proffesional', '199', 'paypal', '95', 'pending', NULL, 'uxQuDgKsvtEmPtZEFq69', '2020-08-17 13:23:14', '2020-08-17 13:23:14'),
(58, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'paystack', '96', 'pending', NULL, 'acUUygLcM33hEuE9g4Vj', '2020-08-17 15:03:30', '2020-08-17 15:03:30'),
(59, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'stripe', '97', 'complete', 'txn_1HH6R1EmGOuJLTMskoeC8gz4', 't2l1hJK6enVTnWplHQXk', '2020-08-17 15:22:30', '2020-08-17 15:23:27'),
(60, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'paypal', '98', 'pending', NULL, 'hlv7NtzATXRVdiK9UJel', '2020-08-17 15:26:37', '2020-08-17 15:26:37'),
(61, 'dwdwdw@wd.com', 'wdwdw', 'iş', '49', 'stripe', '100', 'pending', NULL, '9nAFoiH7EixoPisa60MH', '2020-08-17 17:16:58', '2020-08-17 17:16:58'),
(62, 'test@test.com', 'test', 'Popular', '49', 'paypal', '101', 'pending', NULL, '5KIFx7HKPlWgHhUmKA3l', '2020-08-17 19:06:19', '2020-08-17 19:06:19'),
(63, 'esolutionspk9@gmail.com', 'Muhammad Nawaz', 'Business', '99', 'manual_payment', '102', 'pending', '545454554', 'GHhr612VgZnV5Zur85PP', '2020-08-17 20:52:03', '2020-08-17 20:52:03'),
(64, 'demo@demo.com', 'MD REFAUN ISLAM', 'Proffesional', '199', 'paypal', '103', 'pending', NULL, 'i95iyBUn7571tXSRzqZ8', '2020-08-18 22:00:29', '2020-08-18 22:00:29'),
(65, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Business', '99', 'paystack', '104', 'complete', '4Arq7oSxYdXwSJk9OLobVnLTh', '48XQq9p0yQ7zO2meegYU', '2020-08-19 11:14:39', '2020-08-19 11:16:02'),
(66, 'm.lazrak.pro@outlook.fr', 'mohamed', 'Business', '99', 'paypal', '106', 'pending', NULL, 'iIo8tjeSgE4NUnGMFI4Y', '2020-08-19 21:10:02', '2020-08-19 21:10:02'),
(67, 'sergey.linko@gmail.com', 'Ser', 'Proffesional', '199', 'stripe', '107', 'pending', NULL, 'FyC88jm7hdLwECa2WWwT', '2020-08-19 23:43:04', '2020-08-19 23:43:04'),
(68, 'sergey.linko@gmail.com', 'Ser', 'Proffesional', '199', 'paypal', '108', 'pending', NULL, 'hH4JPGIgZ2cgfwor01by', '2020-08-19 23:43:54', '2020-08-19 23:43:54'),
(69, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Business', '99', 'stripe', '109', 'pending', NULL, 'EPswLdNOqWTtTMDtRKMs', '2020-08-20 12:26:35', '2020-08-20 12:26:35'),
(70, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Business', '99', 'paypal', '110', 'pending', NULL, 'HBBq3ldhnTJPj6TKPVkr', '2020-08-20 12:27:26', '2020-08-20 12:27:26'),
(71, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Business', '99', 'paytm', '111', 'pending', NULL, 'bLBE6lodJlHAxwSG17vB', '2020-08-20 12:27:55', '2020-08-20 12:27:55'),
(72, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Business', '99', 'paypal', '112', 'pending', NULL, 'CiBRrXZy57z1tvt8bjzg', '2020-08-20 15:27:56', '2020-08-20 15:27:56'),
(73, 'asd@asd.asd', 'Paul', 'Popular', '49', 'stripe', '113', 'complete', 'txn_1HIDeSEmGOuJLTMseHf3VdpI', 'WS34wH5NEmyDrl69dsrZ', '2020-08-20 17:17:38', '2020-08-20 17:17:57'),
(74, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'paypal', '114', 'pending', NULL, 'bkJdsn6mtM9jWOunvZLQ', '2020-08-20 23:30:22', '2020-08-20 23:30:22'),
(75, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'manual_payment', '115', 'pending', 'bamco', 'RHAv3YvUDRuG9sm03khj', '2020-08-21 00:55:30', '2020-08-21 00:55:30'),
(76, 'alihasanmogal117@gmail.com', 'GOOGLE PAY', 'Business', '99', 'paytm', '116', 'pending', NULL, 'fucymNHyvohnCuENuHrx', '2020-08-21 12:14:40', '2020-08-21 12:14:40'),
(77, 'itsameen1988@gmail.com', 'Muhammad Ameen', 'Business', '99', 'manual_payment', '117', 'pending', '1133121212', 't62uWjN61uRlefPP7pJo', '2020-08-21 13:53:15', '2020-08-21 13:53:15'),
(78, 'test@gmail.com', 'test', 'Business', '99', 'stripe', '119', 'complete', 'txn_1HJLD5EmGOuJLTMsfp1Kb6iR', 'N2wsy3ASfMz1cfEVYyZQ', '2020-08-23 19:33:44', '2020-08-23 19:34:19'),
(79, 'petechus@gmail.com', 'Paco', 'Proffesional', '199', 'stripe', '120', 'pending', NULL, 'jALtzIYWx1OJl3yJlwkk', '2020-08-23 22:05:32', '2020-08-23 22:05:32'),
(80, 'test@gmail.com', 'kevin', 'Business', '99', 'paytm', '121', 'pending', NULL, 'zu5RBvTAaDdxN0B7sjnc', '2020-08-23 22:45:02', '2020-08-23 22:45:02'),
(81, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Business', '99', 'manual_payment', '122', 'pending', NULL, 'nPXriMtMGcwJSb840Neg', '2020-08-24 05:50:27', '2020-10-01 01:49:42'),
(82, 'asdasd@gmail.com', 'asdasdasd', 'Business', '99', 'manual_payment', '123', 'pending', 'manual payment gateway description', 'IKFiyu1jC7Q2Xw3dldQE', '2020-08-24 15:57:48', '2020-08-24 15:57:48'),
(83, 'ASD@DFG.SDF', 'sad', 'Business', '99', 'razorpay', '124', 'complete', 'pay_FUbj4xGAQuHnzR', '2AEKOoe1NXhbxJLqHFCQ', '2020-08-24 16:55:35', '2020-08-24 16:56:09'),
(84, 'mak@ultimateserv.com', 'Mohammad Khalaf', 'Proffesional', '199', 'paypal', '127', 'pending', NULL, '5nkNnmnvq1KkJKxLgZAy', '2020-08-25 19:32:21', '2020-08-25 19:32:21'),
(85, 'mhsowrove@gmail.com', 'Bengali', 'Proffesional', '199', 'stripe', '128', 'complete', 'txn_1HK6m0EmGOuJLTMsAjTHknfb', 'q6OwvdJ3eFtnRjPNFX98', '2020-08-25 22:20:18', '2020-08-25 22:21:32'),
(86, 'tsdsdsest@gmail.com', 'rerr', 'Business', '99', 'paytm', '129', 'pending', NULL, 'RhghfTkuivhZZjd0H8CJ', '2020-08-26 16:52:25', '2020-08-26 16:52:25'),
(87, 'lucasradical87@gmail.com', 'sandro', 'Proffesional', '199', 'manual_payment', '131', 'pending', '21', 'L7kW8Z8XzemdcUvM2HV7', '2020-08-27 19:16:11', '2020-08-27 19:16:11'),
(88, 'admin@admin.com', 'Cecilia Chapman', 'Popular', '49', 'stripe', '132', 'complete', 'txn_1HKq8AEmGOuJLTMsLfjw4n7Q', 'KRbSqlHz99qssjekqrNM', '2020-08-27 22:47:02', '2020-08-27 22:47:27'),
(89, 'user@example.com', 'Serhii', 'Proffesional', '199', 'manual_payment', '133', 'pending', NULL, '5OYKDVjnPwlHOvtUckps', '2020-08-28 15:21:37', '2020-08-28 15:21:37'),
(90, 'zxc@asda.com', 'czxc', 'Business', '99', 'stripe', '134', 'complete', 'txn_1HLCUgEmGOuJLTMsbMjaschb', 'n84lRliq5wZXFOrLUF8w', '2020-08-28 22:39:36', '2020-08-28 22:40:11'),
(91, 'zxc@asda.com', 'czxc', 'Profesional', '199', 'paypal', '135', 'pending', NULL, 'ZFfVZK3gTYvNn3JPHm6H', '2020-08-28 22:57:39', '2020-08-28 22:57:39'),
(92, 'rikey9578@gmail.com', 'Jjj', 'Basic', '19', 'paytm', '136', 'pending', NULL, '0YmU9gg8kEu5QwNlf8RJ', '2020-08-29 21:16:14', '2020-08-29 21:16:14'),
(93, 'sumankundu513@gmail.com', 'Suman Kundu', 'Business', '99', 'paypal', '140', 'pending', NULL, '10NnDDzSeh157EJo1fl9', '2020-09-03 00:33:00', '2020-09-03 00:33:00'),
(94, 'asd@mail.com', 'as', 'Negocio', '19', 'manual_payment', '141', 'pending', NULL, 'f0dOD9KyjqSeghERBRNm', '2020-09-03 20:15:57', '2020-09-03 20:15:57'),
(95, '7621954802@gmail.com', 'Kinemaster Pro', 'Proffesional', '199', 'paytm', '142', 'pending', NULL, '9DawgmZIWZ3XnQMVOw9U', '2020-09-05 11:21:34', '2020-09-05 11:21:34'),
(96, 'faizanym@gmail.com', 'Faizan Mumtaz', 'Proffesional', '199', 'manual_payment', '144', 'pending', '89809', 'xAo5dQWyrcwZsvHKCZx4', '2020-09-07 21:56:54', '2020-09-07 21:56:54'),
(97, 'test@test.com', 'test', 'Basic', '19', 'razorpay', '145', 'complete', 'pay_FaYnTHzfGLzkrb', 'yWjPbEcwVCv4h6s9aXGT', '2020-09-08 17:57:17', '2020-09-08 17:58:14'),
(98, 'superadmin@gsms.com', 'Muhammad Mohiuddin', 'Business', '99', 'paytm', '146', 'pending', NULL, 'co3T00HsB8HKe4Qsa3eH', '2020-09-08 19:46:12', '2020-09-08 19:46:12'),
(99, 'kn@it.lk', 'jbjk', 'Business', '99', 'stripe', '148', 'pending', NULL, 'f5FJ74UBhKpb2QCBVZdK', '2020-09-10 04:24:46', '2020-09-10 04:24:46'),
(100, 'dvrobin4@gmail.com', 'Siful Islam', 'Business', '99', 'paypal', '150', 'pending', NULL, 'VDL8ONSgtBgt2ExikqRw', '2020-09-11 09:40:05', '2020-09-11 09:40:05'),
(101, 'baptistebadanigraphisme@gmail.com', 'username', 'Business', '99', 'stripe', '151', 'pending', NULL, 'wWHJ2kyF19iQoAR7wgbS', '2020-09-12 02:34:30', '2020-09-12 02:34:30'),
(102, 'asfsdf@sdsdf.sdf', 'dfsdfsaf', 'Proffesional', '199', 'razorpay', '152', 'pending', NULL, '7QXFxpGPTT7Yv3wMORbk', '2020-09-12 13:49:24', '2020-09-12 13:49:24'),
(103, 'thakurrudra@fmai.com', 'ZAjkl', 'Proffesional', '199', 'razorpay', '153', 'pending', NULL, '8QTjB951NNmjmgIQBWmg', '2020-09-12 15:05:04', '2020-09-12 15:05:04'),
(104, 'malay@gmail.com', 'malay', 'Proffesional', '199', 'paytm', '154', 'pending', NULL, 'tnLV6YNp1lh8GMVSKYOM', '2020-09-14 07:14:31', '2020-09-14 07:14:31'),
(105, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'paypal', '155', 'pending', NULL, 'yD8D9H63jnCCcKGQYprR', '2020-09-14 20:28:44', '2020-09-14 20:28:44'),
(106, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'paystack', '156', 'pending', NULL, 'Kh6icBbHvHt7U7NSrxEz', '2020-09-14 20:29:57', '2020-09-14 20:29:57'),
(107, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'manual_payment', '157', 'pending', '14000', 'NxfaJhqtrXq2aaY8ULMM', '2020-09-14 20:31:19', '2020-09-27 20:19:50'),
(108, 'solucionescompucaribe@gmail.com', 'juan', 'Business', '99', 'stripe', '158', 'complete', 'txn_1HRNbLEmGOuJLTMsjhR8Qk96', '9i01RicURHFBwANblTvT', '2020-09-14 23:44:20', '2020-09-14 23:44:35'),
(109, 'lkj@lkj.com', 'lkjlj', 'Business', '99', 'paytm', '159', 'pending', NULL, 'cRQFFslBgWSevSN1YN8j', '2020-09-15 22:39:54', '2020-09-15 22:39:54'),
(110, 'wi@msn.com', 'Belle Dennis', 'Business', '99', 'stripe', '160', 'pending', NULL, 'mr2lJT4ypKUZMKDt2Zv4', '2020-09-16 01:34:02', '2020-09-16 01:34:02'),
(111, 'zak.albarouni@gmail.com', 'zakaria', 'Basic', '19', 'flutterwave', '161', 'pending', NULL, 'tTSnepN0MzclmvVEi136', '2020-09-16 20:34:24', '2020-09-16 20:34:24'),
(112, 'rahul0deshmukh@gmail.com', 'Rahul Deshmukh', 'Proffesional', '199', 'paytm', '162', 'pending', NULL, 'qkfHS7ggHGTMqHit7fQV', '2020-09-17 12:57:43', '2020-09-17 12:57:43'),
(113, 'vamlalegne@enayu.com', 'vamlalegne@enayu.com', 'Popular', '49', 'stripe', '163', 'complete', 'txn_1HSkN2EmGOuJLTMsPjdKjver', 'Jdb98zTLXxuJr1nyzH8u', '2020-09-18 18:15:05', '2020-09-18 18:15:29'),
(114, 'mishra07adi@gmail.com', 'Aditya Mishra', 'Business', '99', 'paytm', '164', 'pending', NULL, 'ncfPcRDewlnzNwbrOQKS', '2020-09-19 01:26:22', '2020-09-19 01:26:22'),
(115, 'mishra.amitkr@gmail.com', 'Amit Kumar Mishra', 'Proffesional', '199', 'paytm', '165', 'pending', NULL, 'JpkeC9EL3vJGBELEg1cN', '2020-09-19 22:23:08', '2020-09-19 22:23:08'),
(116, 'ajdnekjb@gmail.com', 'Aditya', 'Proffesional', '199', 'paytm', '166', 'pending', NULL, 'BFv5I0VfiFUubdSmQ4ga', '2020-09-19 22:23:22', '2020-09-19 22:23:22'),
(117, 'nisharoypradhan@gmail.com', 'Suraj Singha', 'Proffesional', '199', 'razorpay', '167', 'pending', NULL, 'CuDymWlOyPEQreIHxNyH', '2020-09-20 23:28:14', '2020-09-20 23:28:14'),
(118, 'rgerg@jyklu.lth', 'er\'rf', 'Popular', '49', 'stripe', '168', 'pending', NULL, 'qACbLxzVIm3yqEsw8vu4', '2020-09-21 05:22:32', '2020-09-21 05:22:32'),
(119, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'paystack', '156', 'pending', NULL, 'PxpmJts5McYO2cAXiVSt', '2020-09-22 02:19:21', '2020-09-22 02:19:21'),
(120, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'paypal', '114', 'pending', NULL, 'bp4LL0VFmka7hbRMqM78', '2020-09-22 09:18:01', '2020-09-22 09:18:01'),
(121, 'admin@example.com', 'asdas', 'Business', '99', 'paypal', '169', 'pending', NULL, 'D5ygnf28a6VWx6Ulo9ib', '2020-09-23 17:54:43', '2020-09-23 17:54:43'),
(122, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'manual_payment', '157', 'pending', '14000', 'koXDNciv0XWxsqpVKGzK', '2020-09-24 11:30:31', '2020-09-27 20:19:50'),
(123, 'hdhfd@gmg.com', 'hfhfh', 'Business', '99', 'paytm', '170', 'pending', NULL, 'QXzYEYUAGMoB8fFp2bE8', '2020-09-24 13:30:37', '2020-09-24 13:30:37'),
(124, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'manual_payment', '157', 'pending', '14000', 'uU4ncLEAs1yoSujvkj28', '2020-09-27 20:19:50', '2020-09-27 20:19:50'),
(125, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'paytm', '171', 'pending', NULL, 'rys431wUDMtsQPxhSK51', '2020-09-27 20:21:11', '2020-09-27 20:21:11'),
(126, 'ukraynabilgi@gmail.com', 'fahrettin aba', 'Business', '99', 'stripe', '172', 'pending', NULL, '9Sw7LqC1OxmEhIW8sN2J', '2020-09-27 21:04:26', '2020-09-27 21:04:26'),
(127, 'tester@testing123.com', 'Tester', 'Business', '99', 'flutterwave', '173', 'pending', NULL, '7WiVfQiLELD7uBPzqh6f', '2020-09-28 00:19:45', '2020-09-28 00:19:45'),
(128, 'carvajalg63@gmail.com', 'Gonzalo', 'Negocio', '19', 'paypal', '174', 'pending', NULL, 'Iwamu5LRQ4kLf1zu4lgP', '2020-09-28 08:38:28', '2020-09-28 08:38:28'),
(129, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'paytm', '175', 'pending', NULL, 'BR9tARKDlY2JlHhcV58x', '2020-09-28 08:56:28', '2020-09-28 08:56:28'),
(130, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'paytm', '175', 'pending', NULL, 'RF674EFy0wtB1NDXfpWo', '2020-09-28 08:58:22', '2020-09-28 08:58:22'),
(131, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'paytm', '175', 'pending', NULL, 'hO3hHP4dUsuLAJcF4Rvs', '2020-09-28 09:57:52', '2020-09-28 09:57:52'),
(132, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'paytm', '175', 'pending', NULL, 'dvYNixbnNYKM8zK0npeg', '2020-09-28 10:39:04', '2020-09-28 10:39:04'),
(133, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popüler', '19', 'paytm', '176', 'pending', NULL, 'jeTFekJVEFtRthYKOkHQ', '2020-09-28 12:01:39', '2020-09-28 12:01:39'),
(134, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popüler', '19', 'paytm', '176', 'pending', NULL, 'z6U1e1YpDZtp3O3wmSu9', '2020-09-28 12:18:17', '2020-09-28 12:18:17'),
(135, 'darhost56@gmail.com', 'ارسال تقرير', 'اعمال', '49', 'paypal', '177', 'pending', NULL, 'm26g5DkKyjOlWMX1B2KY', '2020-09-28 17:20:02', '2020-09-28 17:20:02'),
(136, 'ptakalei@gmail.com', 'peter', 'Business', '99', 'paytm', '178', 'pending', NULL, 'AY12HNTzJmRJGVWSIQ9s', '2020-09-29 01:10:50', '2020-09-29 01:10:50'),
(137, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'manual_payment', '179', 'pending', NULL, 'n82yFYUVUTS6QCOYckUo', '2020-09-29 09:45:32', '2020-10-07 09:54:11'),
(138, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'stripe', '180', 'complete', 'txn_1HWlcREmGOuJLTMsYqOz93Ny', 'IYXq1q8SDaPVvBTqul6O', '2020-09-29 20:23:25', '2020-09-29 20:23:59'),
(139, 'tester@testers.com', 'tester', 'Business', '99', 'paystack', '181', 'pending', NULL, 'yFpiByyfNczWd6ILbNzj', '2020-09-29 21:26:35', '2020-09-29 21:26:35'),
(140, 'mywasender@gmail.com', 'mywa sender', 'Proffesional', '199', 'manual_payment', '182', 'pending', NULL, '13rNrbvBnBEKK7LpGqTD', '2020-09-30 19:06:33', '2020-09-30 19:06:33'),
(141, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Business', '99', 'manual_payment', '122', 'pending', NULL, 'pBzMxQIeT25YkaD2k1we', '2020-10-01 01:49:42', '2020-10-01 01:49:42'),
(142, 'tarekmonjur@gmail.com', 'Sharifur', 'Popular', '49', 'paypal', '183', 'pending', NULL, 'VYuCYV4nop6lPRSt2UfZ', '2020-10-01 10:53:37', '2020-10-01 10:53:37'),
(143, 'tarekmonjur@gmail.com', 'Sharifur', 'Proffesional', '199', 'paypal', '184', 'complete', '1GU39022541402424', 'AdVfWbuEqWdMn1mk9DEm', '2020-10-01 10:58:47', '2020-10-01 11:00:04'),
(144, 'makapa12@gmail.com', 'Anirudh', 'Business', '99', 'manual_payment', '185', 'pending', '32108313920PPW', 'Tu2RKe5QPtZrv0gAf2EL', '2020-10-01 16:47:54', '2020-10-01 16:47:54'),
(145, 'paul.musimbago@gmail.com', 'Paul', 'Popular', '49', 'stripe', '186', 'pending', NULL, 'Gi5Ga8d1RuN9TCmvwwJX', '2020-10-01 23:50:01', '2020-10-01 23:50:01'),
(146, 'twitoorel1@Gmail.com', 'asvdads', 'Proffesional', '199', 'stripe', '187', 'pending', NULL, '2YBAgQzRjHDJQZamGkCb', '2020-10-02 01:45:14', '2020-10-02 01:45:14'),
(147, 'dvrobin4@gmail.com', 'Siful Islam', 'Popular', '49', 'mollie', '188', 'pending', NULL, 'ZfRzY41mPvfivW4L08vE', '2020-10-05 16:17:53', '2020-10-05 16:17:53'),
(148, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'paypal', '189', 'pending', NULL, 'qglizwWlKSmHXLIEhKMJ', '2020-10-05 18:15:37', '2020-10-05 18:15:37'),
(149, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'paypal', '189', 'pending', NULL, 'Ea7CSqMdCFVHHhoySjM6', '2020-10-06 23:10:25', '2020-10-06 23:10:25'),
(150, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'manual_payment', '179', 'pending', NULL, 'LrNbpwuBR7P3juQgLGBC', '2020-10-07 09:54:11', '2020-10-07 09:54:11'),
(151, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'mollie', '190', 'complete', 'tr_bPNy7cudJ9', 'kxbyV9exwUXQgFk2Ua6y', '2020-10-07 11:11:17', '2020-10-07 11:11:31'),
(152, 'rsharifur824@gmail.com', 'Sharifur Rahmam', 'Popular', '49', 'paystack', '193', 'complete', 'w0D0zbUnyJK3UO7eOF9jLq67k', 'hfqAMICocjjP0zwrt7pw', '2020-10-08 11:28:53', '2020-10-08 11:29:47'),
(153, 'srame@name.com', 'name', 'Popular', '49', 'manual_payment', '194', 'pending', NULL, 'EdNf9uEv9yFnt6EfdbBb', '2020-10-09 15:43:47', '2020-10-09 15:43:47'),
(154, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'paypal', '189', 'pending', NULL, 'ZQBGla8OyJHIGOfQFXWd', '2020-10-10 08:13:51', '2020-10-10 08:13:51'),
(155, 'info@shakacode.net', 'Gustavo Sanchez', 'Básica', '49', 'paypal', '195', 'pending', NULL, 'M4ZvcJJr3wz3WssnS89S', '2020-10-11 07:59:25', '2020-10-11 07:59:25'),
(156, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'paypal', '189', 'pending', NULL, 'xWCk66Ta8zRilv0dqqmP', '2020-10-14 11:30:08', '2020-10-14 11:30:08'),
(157, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'paypal', '189', 'pending', NULL, '11lYGJeeaOOcYRDBvDNq', '2020-10-15 10:26:53', '2020-10-15 10:26:53'),
(158, 'hoyyotf@outlook.com.tr', 'gfds', 'Popüler', '19', 'paystack', '197', 'pending', NULL, 'CPuhxy4QaBCqkJqbIYfm', '2020-10-16 01:18:24', '2020-10-16 01:18:24'),
(159, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'paypal', '189', 'pending', NULL, 'WTwuhOsN5JpgQ8I8YgB8', '2020-10-16 21:37:05', '2020-10-16 21:37:05'),
(160, 'thiagovibesp@outlook.com', 'davinci resolve', 'Business', '99', 'stripe', '199', 'pending', NULL, 'lHQFA8B3wnidiCSGyTpz', '2020-10-18 18:28:04', '2020-10-18 18:28:04'),
(161, 'BrianneBarton@aol.com', 'Brianne Barton', 'Business', '99', 'manual_payment', '200', 'pending', 'briannebarton', 'u1l0owEUUGylUvN7HwpU', '2020-10-20 05:58:39', '2020-10-20 05:58:39'),
(162, 'test@gmail.com', 'ewewe', 'Proffesional', '199', 'paypal', '201', 'pending', NULL, 'yMdjsRAPd5Wyn0d7zhu3', '2020-10-22 23:27:17', '2020-10-22 23:27:17'),
(163, 'ranjeet20@gmail.com', 'Ranjeet20', 'Basic', '19', 'manual_payment', '202', 'pending', '1111111', '0nbvBD9lYjezLdT7bh7b', '2020-10-25 00:22:33', '2020-10-25 00:22:33'),
(164, 'rr@gmail.com', 'rajesh singh', 'Popular', '49', 'manual_payment', '203', 'pending', 'wusueu', 'K9Gh0HYHS5SjKEDPmiWb', '2020-10-25 02:24:55', '2020-10-25 02:24:55'),
(165, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'manual_payment', '204', 'pending', 'dddd', 'GnZaOQT0khySpET2YmRA', '2020-10-25 02:31:33', '2020-10-25 02:31:33'),
(166, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'manual_payment', '205', 'complete', 'PAYID-L756EOQ2X711065E7498610N', 'FVRsrkfi6tOmYaD05703', '2020-10-25 02:47:02', '2021-01-10 23:30:39'),
(167, 'hfol2@gmail.com', 'Sy4 ttinez', 'Basic', '19', 'paypal', '207', 'pending', NULL, 'nmmyDGJJZoGmy2QaMtNm', '2020-10-26 16:55:33', '2020-10-26 16:55:33'),
(168, 'rocletts1@gmail.com', 'sdfdwrr', 'Business', '99', 'paypal', '208', 'pending', NULL, 'Ym13xAm7VqvlMSiX9Q9c', '2020-10-27 10:05:16', '2020-10-27 10:05:16'),
(169, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'manual_payment', '205', 'complete', 'PAYID-L756EOQ2X711065E7498610N', 'HRdsmK7WlsWPX4Q91Cs9', '2020-10-28 06:57:52', '2021-01-10 23:30:39'),
(170, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'manual_payment', '205', 'complete', 'PAYID-L756EOQ2X711065E7498610N', 'ojUcLSaj3nEj0wh1KTFM', '2020-10-28 15:11:43', '2021-01-10 23:30:39'),
(171, 'tasadasd@sad.com', 'Tamer Essam', 'Business', '99', 'stripe', '209', 'complete', 'txn_1HhRUjEmGOuJLTMsNdBljNdb', 'iorgYS4eqRKmcELtZ4W3', '2020-10-29 07:07:57', '2020-10-29 07:08:10'),
(172, 'ice_g_war@hotmail.com', 'Tekasys Internacional', 'Proffesional', '199', 'stripe', '210', 'complete', 'txn_1HhXZpEmGOuJLTMsRWIJPj44', '39p5xwqIBLQ86TWpSCUh', '2020-10-29 13:37:38', '2020-10-29 13:37:49'),
(173, 'ice_g_war@hotmail.com', 'Tekasys Internacional', 'Proffesional', '199', 'stripe', '211', 'complete', 'txn_1HhXfBEmGOuJLTMsbAcw1Y7R', 'av62rgrT3dRbPNdGkNTN', '2020-10-29 13:43:14', '2020-10-29 13:43:21'),
(174, 'imdaniel@gmail.com', 'Dan', 'Proffesional', '199', 'paystack', '212', 'pending', NULL, 'EF3xCONKnQIvDrn7LcGT', '2020-10-31 17:25:41', '2020-10-31 17:25:41'),
(175, 'info@sallivans.com', 'Rafał', 'Business', '99', 'paytm', '213', 'pending', NULL, 'uIwl84bJwlp7GEKY6MMY', '2020-11-02 12:47:44', '2020-11-02 12:47:44'),
(176, 'aaa@aaa.es', 'demo123', 'Popular', '49', 'stripe', '215', 'pending', NULL, 'eZM1NWSsVTwO9Xgtb6QW', '2020-11-04 11:20:22', '2020-11-04 11:20:22'),
(177, 'admin@admin.com', 'BOBBY\'S PUB', 'Proffesional', '199', 'paystack', '216', 'pending', NULL, 'L32QSKCJuWC0qDzotgcP', '2020-11-04 17:26:25', '2020-11-04 17:26:25'),
(178, 'wpcodeninja@gmail.com', 'Raj', 'Basic', '19', 'stripe', '217', 'complete', 'txn_1Hk0szEmGOuJLTMsKdnvAJWM', 'hSoUI5bNVEEBZ3uOsImY', '2020-11-05 10:18:54', '2020-11-05 10:19:50'),
(179, 'aaa@aaa.es', 'blaser654', 'Proffesional', '199', 'stripe', '220', 'pending', NULL, '3lTrdcDKqdjsklsyJ1UF', '2020-11-06 14:20:31', '2020-11-06 14:20:31'),
(180, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'stripe', '221', 'pending', NULL, 'vOgYZsdydwZVrzbbftVl', '2020-11-06 14:42:45', '2020-11-06 14:42:45'),
(181, 'playlive.sa@gmail.com', 'Hadi Bakkari', 'Business', '99', 'paypal', '222', 'pending', NULL, 'iLBhWAIGi3iu7XkZVCDS', '2020-11-07 05:29:04', '2020-11-07 05:29:04'),
(182, 'admin@demo.com', 'asas', 'Proffesional', '199', 'razorpay', '223', 'pending', NULL, 'r8E0qPGAOkwMy4HeaINL', '2020-11-08 02:32:28', '2020-11-08 02:32:28'),
(183, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'iş', '49', 'manual_payment', '224', 'pending', '23213213123', '2Tf83eydLA2hZO8fswEB', '2020-11-08 17:22:11', '2020-11-08 17:22:15'),
(184, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'iş', '49', 'manual_payment', '224', 'pending', '23213213123', 'it1iqYw8xJr78wbYKvVC', '2020-11-08 17:22:15', '2020-11-08 17:22:15'),
(185, 'raozubair1441@gmail.com', 'Zubair Rao', 'Proffesional', '199', 'manual_payment', '225', 'pending', '1234332221', 'fW2B1il9pg7XyoNb5WyC', '2020-11-09 14:43:16', '2020-11-09 14:43:16'),
(190, 'dvrobin4@gmail.com', 'Siful Islam', 'Popular', '49', 'stripe', '230', 'pending', NULL, 'akAxLmsNuCYwgz415tEt', '2020-11-11 18:35:48', '2020-11-11 18:35:48'),
(191, 'xgenious51@gmail.com', 'Siful Islam', 'Proffesional', '199', 'flutterwave', '231', 'pending', NULL, 'sAJCCxEFvTC2IAijzMPv', '2020-11-14 19:35:01', '2020-11-14 19:35:01'),
(192, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'manual_payment', '234', 'pending', NULL, 'itJbjyCNJ3HBWMC4DUdD', '2020-11-16 15:22:16', '2020-11-16 23:34:07'),
(193, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'manual_payment', '234', 'pending', NULL, 'q1fEsjur3uBFj2eIP1zu', '2020-11-16 15:23:35', '2020-11-16 23:34:07'),
(194, 'magicbytes2012@gmail.com', 'Magic Bytes', 'Popular', '49', 'mollie', '235', 'pending', NULL, 'dJpkK2vhaaxu5MjSxGAs', '2020-11-16 15:56:45', '2020-11-16 15:56:45'),
(195, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Basic', '19', 'manual_payment', '234', 'pending', NULL, 'Gs3xgi3FmJ1EcOVOWxnV', '2020-11-16 23:34:07', '2020-11-16 23:34:07'),
(196, 'gghbbh@hdjd.com', 'Ggvbhn', 'Proffesional', '199', 'razorpay', '236', 'pending', NULL, '2SpbryUWjZe6XKpkGXJF', '2020-11-17 08:35:57', '2020-11-17 08:35:57'),
(197, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'mollie', '237', 'complete', 'tr_vNuspbayS6', '5zuTD0Cq7bC0s1A7yw1o', '2020-11-19 11:44:00', '2020-11-19 11:44:10'),
(198, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'mollie', '237', 'complete', 'tr_vNuspbayS6', 'qOMiXL3oiZF2NCboQCTc', '2020-11-19 11:44:00', '2020-11-19 11:44:10'),
(199, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Proffesional', '199', 'stripe', '238', 'complete', 'txn_1HpHSGEmGOuJLTMsH2x4xopX', 'CkmQW039TbzFdPoiU03H', '2020-11-19 12:01:22', '2020-11-19 12:02:01'),
(200, 'dvrobin4@gmail.com', 'Sharifur Rahman', 'Popular', '49', 'manual_payment', '239', 'pending', 'sdfwett4534fsd', 'VyNrHw3vseYOZkiYiqd3', '2020-11-23 13:21:01', '2020-11-23 13:21:01'),
(201, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Basic', '19', 'paypal', '243', 'pending', NULL, 'hcnkqJTCfk9fbtv87dBp', '2021-01-10 12:43:56', '2021-01-10 12:43:56'),
(202, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'paypal', '244', 'pending', NULL, 'ReGsQdh21ICPoMB0Rc7x', '2021-01-10 23:01:43', '2021-01-10 23:01:43'),
(203, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'paypal', '245', 'pending', NULL, 'Tdh4TAnh4oQzuTDfq53Y', '2021-01-10 23:07:35', '2021-01-10 23:07:35'),
(204, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'paypal', '247', 'pending', NULL, 'cZ3y7oYIsR3C0wg3xnZm', '2021-01-10 23:21:38', '2021-01-10 23:21:38'),
(205, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'paypal', '248', 'pending', NULL, 'MAiaRCu7gbfiqXxA80lp', '2021-01-10 23:29:26', '2021-01-10 23:29:26'),
(206, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'paypal', '249', 'pending', NULL, 'oG8BV55ij2IkxLB3yxWG', '2021-01-10 23:44:48', '2021-01-10 23:44:48'),
(207, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'paypal', '250', 'complete', 'PAYID-L756MWY62U325081R219973H', 'ku3A4wHssIxTxjUOQDfo', '2021-01-10 23:47:03', '2021-01-10 23:47:36'),
(208, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'paytm', '251', 'complete', '20210111111212800110168549102244817', '0hqtlz8SEKwfUYOSqQWK', '2021-01-11 03:42:57', '2021-01-11 04:01:31'),
(209, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Popular', '49', 'paytm', '252', 'pending', NULL, 'KTCvyU6RtM0FezhMgvuw', '2021-01-11 03:54:29', '2021-01-11 03:54:29'),
(210, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'stripe', '253', 'complete', 'txn_1I8SyiEmGOuJLTMsmNsqfJ0j', 'lEvV8AN7CMQcLsynMMVW', '2021-01-11 10:10:25', '2021-01-11 10:10:50'),
(211, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'stripe', '254', 'pending', NULL, 'mXIUIiCwYvjz5rk5nMwO', '2021-01-11 10:12:10', '2021-01-11 10:12:10'),
(212, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'stripe', '255', 'pending', NULL, 'xj5aQu4exMy8RElPVuBN', '2021-01-11 13:01:39', '2021-01-11 13:01:39'),
(213, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'stripe', '256', 'pending', NULL, 'P83XwjJHmFBY7qbSZhBS', '2021-01-11 13:09:25', '2021-01-11 13:09:25'),
(214, 'rsharifur824@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'stripe', '257', 'pending', NULL, 'W07mFx2vUvGWwZtZtU9V', '2021-01-11 13:13:51', '2021-01-11 13:13:51'),
(215, 'dvrobin4@gmail.com', 'Sharifur Rahmam', 'Proffesional', '199', 'stripe', '258', 'complete', 'txn_1I8WBxEmGOuJLTMsMJh3gzcq', 'GKMBTZInWFht625OMMUi', '2021-01-11 13:35:57', '2021-01-11 13:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `popup_builders`
--

CREATE TABLE `popup_builders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `only_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_time_end` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `popup_builders`
--

INSERT INTO `popup_builders` (`id`, `name`, `type`, `title`, `only_image`, `background_image`, `offer_time_end`, `button_text`, `button_link`, `description`, `lang`, `btn_status`, `created_at`, `updated_at`) VALUES
(1, 'notice popup', 'notice', 'Notice!!', NULL, NULL, '2020-09-26', 'Buy Now', '#', 'She propriety immediate was improving. He or entrance humoured likewise moderate. Much nor game son say feel. Fat make met can must form into gate. Me we offending prevailed discovery. ', 'en', 'on', '2020-07-22 13:17:42', '2020-07-22 13:17:42'),
(3, 'image popup', 'only_image', NULL, '80', NULL, NULL, NULL, NULL, NULL, 'en', NULL, '2020-07-25 13:44:40', '2020-07-25 13:44:40'),
(4, 'promotional popup', 'promotion', 'Nexelit', '83', '81', NULL, 'Buy Now', '#', 'There worse by an of miles civil. Manner before lively wholly am mr indeed expect. Among every merry his yet has her. You mistress get dashwood children off.', 'en', 'on', '2020-07-25 15:23:00', '2020-07-25 15:23:00'),
(5, 'discount popup', 'discount', 'Discount', '83', '81', '2020-09-30', 'Buy Now', '#', 'Out believe has request not how comfort evident.', 'en', 'on', '2020-07-26 04:28:42', '2020-07-26 05:00:54'),
(6, 'indirim açılır penceresi', 'discount', 'İndirim', '83', '81', '2020-09-30', 'Şimdi satın al', '#', 'Dışarı inanmak ne kadar rahat belirgin değil istek var.', 'tur', 'on', '2020-07-26 07:15:29', '2020-07-26 07:17:15'),
(7, 'المنبثقة الترويجية', 'promotion', 'اعمال', '83', '81', NULL, 'اشتري الآن', '#', 'هناك أسوأ من ميل مدني. الطريقة قبل حية تماما أنا السيد يتوقع بالفعل. بين كل مرح له حتى الآن لها. أنت عشيقة تنزل أطفال.', 'ar', 'on', '2020-07-26 08:39:15', '2020-07-26 08:40:52'),
(8, 'ventana emergente de imagen', 'only_image', NULL, '80', NULL, NULL, NULL, NULL, NULL, 'sp', NULL, '2020-07-26 08:41:11', '2020-07-26 08:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `price_plans`
--

CREATE TABLE `price_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `highlight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `price_plans`
--

INSERT INTO `price_plans` (`id`, `title`, `price`, `highlight`, `lang`, `url_status`, `type`, `features`, `btn_text`, `status`, `btn_url`, `categories_id`, `created_at`, `updated_at`) VALUES
(1, 'Basic', '19', NULL, 'en', 'on', '/Mo', 'Unlimited Pages\r\nAll Team Members\r\nUnlimited Leads\r\nUnlimited Page Views\r\nExport in HTML/CSS', 'Order Now', 'publish', NULL, 1, '2020-06-05 19:08:40', '2020-07-22 01:01:10'),
(2, 'Popular', '49', NULL, 'en', 'on', '/Yr', 'Unlimited Pages\r\nAll Team Members\r\nUnlimited Leads\r\nUnlimited Page Views\r\nExport in HTML/CSS', 'Order Now', 'publish', NULL, 1, '2020-06-06 14:56:17', '2020-07-22 01:01:03'),
(3, 'Business', '99', 'on', 'en', 'on', '/Yr', 'Unlimited Pages\r\nAll Team Members\r\nUnlimited Leads\r\nUnlimited Page Views\r\nExport in HTML/CSS', 'Order Now', 'publish', NULL, 2, '2020-06-06 14:57:03', '2020-07-22 01:00:05'),
(4, 'Proffesional', '199', NULL, 'en', 'on', '/Mo', 'Unlimited Pages\r\nAll Team Members\r\nUnlimited Leads\r\nUnlimited Page Views\r\nExport in HTML/CSS', 'Order Now', 'publish', NULL, 1, '2020-06-06 14:57:05', '2020-07-22 00:59:25'),
(5, 'Profesyonel', '199', NULL, 'tur', 'on', '/Mo', 'Sınırsız Sayfa\r\nTüm Ekip Üyeleri\r\nSınırsız Olası Satışlar\r\nSınırsız Sayfa Görüntüleme\r\nHTML / CSS\'de dışa aktarma', 'Şimdi sipariş ver', 'publish', NULL, 3, '2020-06-06 16:17:42', '2020-07-22 00:59:14'),
(6, 'المحترفين', '199', NULL, 'ar', 'on', 'Mo/', 'صفحات غير محدودة\r\nجميع أعضاء الفريق\r\nيؤدي غير محدود\r\nمشاهدات صفحة غير محدودة\r\nتصدير بتنسيق HTML / CSS', 'اطلب الان', 'publish', NULL, 5, '2020-06-06 16:18:07', '2020-07-22 01:04:53'),
(7, 'Profesional', '199', NULL, 'sp', 'on', '/Mo', 'Páginas Ilimitadas\r\nTodos los miembros del equipo\r\nLeads ilimitados\r\nVistas de página ilimitadas\r\nExportar en HTML / CSS', 'Ordenar ahora', 'publish', NULL, 7, '2020-06-06 16:18:41', '2020-07-22 01:09:34'),
(8, 'iş', '49', NULL, 'tur', 'on', '/Mo', 'Sınırsız Sayfa\r\nTüm Ekip Üyeleri\r\nSınırsız Olası Satışlar\r\nSınırsız Sayfa Görüntüleme\r\nHTML / CSS\'de dışa aktarma', 'Şimdi sipariş ver', 'publish', NULL, 3, '2020-07-22 01:01:27', '2020-07-22 01:02:39'),
(9, 'Popüler', '19', NULL, 'tur', 'on', '/Mo', 'Sınırsız Sayfa\r\nTüm Ekip Üyeleri\r\nSınırsız Olası Satışlar\r\nSınırsız Sayfa Görüntüleme\r\nHTML / CSS\'de dışa aktarma', 'Şimdi sipariş ver', 'publish', NULL, 3, '2020-07-22 01:01:33', '2020-07-22 01:03:02'),
(10, 'اعمال', '49', NULL, 'ar', 'on', 'Mo/', 'صفحات غير محدودة\r\nجميع أعضاء الفريق\r\nيؤدي غير محدود\r\nمشاهدات صفحة غير محدودة\r\nتصدير بتنسيق HTML / CSS', 'اطلب الان', 'publish', NULL, 6, '2020-07-22 01:06:08', '2020-07-22 01:06:55'),
(11, 'الأساسي', '19', NULL, 'ar', 'on', 'Mo/', 'صفحات غير محدودة\r\nجميع أعضاء الفريق\r\nيؤدي غير محدود\r\nمشاهدات صفحة غير محدودة\r\nتصدير بتنسيق HTML / CSS', 'اطلب الان', 'publish', NULL, 6, '2020-07-22 01:07:06', '2020-07-22 01:07:40'),
(12, 'Básica', '49', NULL, 'sp', 'on', '/Mo', 'Páginas Ilimitadas\r\nTodos los miembros del equipo\r\nLeads ilimitados\r\nVistas de página ilimitadas\r\nExportar en HTML / CSS', 'Ordenar ahora', 'publish', NULL, 7, '2020-07-22 01:09:41', '2020-07-22 01:13:03'),
(13, 'Negocio', '19', NULL, 'sp', 'on', '/Mo', 'Páginas Ilimitadas\r\nTodos los miembros del equipo\r\nLeads ilimitados\r\nVistas de página ilimitadas\r\nExportar en HTML / CSS', 'Ordenar ahora', 'publish', NULL, 7, '2020-07-22 01:13:08', '2020-07-22 01:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `price_plan_categories`
--

CREATE TABLE `price_plan_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `price_plan_categories`
--

INSERT INTO `price_plan_categories` (`id`, `name`, `lang`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Development', 'en', 'publish', '2020-07-22 00:30:13', '2020-07-22 00:30:13'),
(2, 'Design', 'en', 'publish', '2020-07-22 00:30:20', '2020-07-22 00:30:42'),
(3, 'tasarlamak', 'tur', 'publish', '2020-07-22 00:30:37', '2020-07-22 00:30:37'),
(4, 'gelişme', 'tur', 'publish', '2020-07-22 00:30:55', '2020-07-22 00:30:55'),
(5, 'تطوير', 'ar', 'publish', '2020-07-22 00:32:17', '2020-07-22 00:32:17'),
(6, 'التصميم', 'ar', 'publish', '2020-07-22 00:32:30', '2020-07-22 00:32:30'),
(7, 'Diseño', 'sp', 'publish', '2020-07-22 00:32:43', '2020-07-22 00:32:43'),
(8, 'Desarrollo', 'sp', 'publish', '2020-07-22 00:32:55', '2020-07-22 00:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `slug` text COLLATE utf8mb4_unicode_ci,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regular_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` int(11) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` longtext COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `attributes_title` longtext COLLATE utf8mb4_unicode_ci,
  `total_sold` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_downloadable` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloadable_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_tags` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `attributes_description` longtext COLLATE utf8mb4_unicode_ci,
  `badge` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_percentage` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `lang`, `regular_price`, `sale_price`, `sku`, `stock_status`, `category_id`, `short_description`, `description`, `attributes_title`, `total_sold`, `image`, `gallery`, `status`, `is_downloadable`, `downloadable_file`, `meta_tags`, `meta_description`, `attributes_description`, `badge`, `tax_percentage`, `created_at`, `updated_at`) VALUES
(1, 'Give lady of they such they sure it.', 'give-lady-of-they-such-they-sure-it', 'en', '99', 49, '34543', 'in_stock', '1', 'Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff.', '<p>Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff. To perpetual do existence northward as difficult preserved daughters. Continued at up to zealously necessary breakfast. Surrounded sir motionless she end literature. Gay direction neglected but supported yet her.&nbsp;</p><p>Mr oh winding it enjoyed by between. The servants securing material goodness her. Saw principles themselves ten are possession. So endeavor to continue cheerful doubtful we to. Turned advice the set vanity why mutual. Reasonably if conviction on be unsatiable discretion apartments delightful. Are melancholy appearance stimulated occasional entreaties end. Shy ham had esteem happen active county. Winding morning am shyness evident to. Garrets because elderly new manners however one village she.&nbsp;</p>', 'a:3:{i:0;s:6:\"Weight\";i:1;s:5:\"Width\";i:2;s:6:\"Height\";}', NULL, '65', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'New', 5, '2020-07-21 01:15:15', '2020-11-18 10:47:51'),
(2, 'Multipurpose Laravel CMS', 'multipurpose-laravel-cms', 'en', '199', 150, NULL, 'in_stock', '2', 'Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an.', '<p>Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff. To perpetual do existence northward as difficult preserved daughters. Continued at up to zealously necessary breakfast. Surrounded sir motionless she end literature. Gay direction neglected but supported yet her.&nbsp;</p><p>Mr oh winding it enjoyed by between. The servants securing material goodness her. Saw principles themselves ten are possession. So endeavor to continue cheerful doubtful we to. Turned advice the set vanity why mutual. Reasonably if conviction on be unsatiable discretion apartments delightful. Are melancholy appearance stimulated occasional entreaties end. Shy ham had esteem happen active county. Winding morning am shyness evident to. Garrets because elderly new manners however one village she.&nbsp;</p><p>By so delight of showing neither believe he present. Deal sigh up in shew away when. Pursuit express no or prepare replied. Wholly formed old latter future but way she. Day her likewise smallest expenses judgment building man carriage gay. Considered introduced themselves mr to discretion at. Means among saw hopes for. Death mirth in oh learn he equal on.&nbsp;</p><div><br></div>', 'a:4:{i:0;s:11:\"PHP Version\";i:1;s:15:\"Laravel Version\";i:2;s:13:\"Mysql Version\";i:3;s:23:\"Required PHP Extensions\";}', NULL, '75', NULL, 'publish', 'on', '71595317436.zip', NULL, NULL, 'a:4:{i:0;s:4:\"7.2x\";i:1;s:2:\"7x\";i:2;s:3:\"5.7\";i:3;s:203:\"BCMath PHP Extension,\r\nCtype PHP Extension,\r\nFileinfo PHP extension,\r\nJSON PHP Extension,\r\nMbstring PHP Extension,\r\nOpenSSL PHP Extension,\r\nPDO PHP Extension,\r\nTokenizer PHP Extension,\r\nXML PHP Extension\";}', '-30%', 7, '2020-07-21 01:40:02', '2020-11-18 10:48:02'),
(6, 'React Business Consulting Script', 'react-business-script', 'en', '139', 79, NULL, 'in_stock', '2', 'Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an.', '<p>Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff. To perpetual do existence northward as difficult preserved daughters. Continued at up to zealously necessary breakfast. Surrounded sir motionless she end literature. Gay direction neglected but supported yet her.&nbsp;</p><p><br></p><p>Mr oh winding it enjoyed by between. The servants securing material goodness her. Saw principles themselves ten are possession. So endeavor to continue cheerful doubtful we to. Turned advice the set vanity why mutual. Reasonably if conviction on be unsatiable discretion apartments delightful. Are melancholy appearance stimulated occasional entreaties end. Shy ham had esteem happen active county. Winding morning am shyness evident to. Garrets because elderly new manners however one village she.&nbsp;</p><p><br></p><p>By so delight of showing neither believe he present. Deal sigh up in shew away when. Pursuit express no or prepare replied. Wholly formed old latter future but way she. Day her likewise smallest expenses judgment building man carriage gay. Considered introduced themselves mr to discretion at. Means among saw hopes for. Death mirth in oh learn he equal on.&nbsp;</p><div><br></div>', 'a:2:{i:0;s:13:\"React Version\";i:1;s:12:\"Node Version\";}', NULL, '76', NULL, 'publish', 'on', '71595318407.zip', NULL, NULL, 'a:2:{i:0;s:3:\"16x\";i:1;s:14:\"v12.13.0 (LTS)\";}', '-40%', 10, '2020-07-21 02:00:07', '2020-11-18 10:48:07'),
(7, 'Again keeps at no meant stuff', 'again-keeps-at-no-meant-stuff', 'en', '199', 49, '3452343', 'in_stock', '1', 'Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff.', '<p>Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff. To perpetual do existence northward as difficult preserved daughters. Continued at up to zealously necessary breakfast. Surrounded sir motionless she end literature. Gay direction neglected but supported yet her.&nbsp;</p><p>Mr oh winding it enjoyed by between. The servants securing material goodness her. Saw principles themselves ten are possession. So endeavor to continue cheerful doubtful we to. Turned advice the set vanity why mutual. Reasonably if conviction on be unsatiable discretion apartments delightful. Are melancholy appearance stimulated occasional entreaties end. Shy ham had esteem happen active county. Winding morning am shyness evident to. Garrets because elderly new manners however one village she.&nbsp;</p>', 'a:3:{i:0;s:6:\"Weight\";i:1;s:5:\"Width\";i:2;s:6:\"Height\";}', NULL, '73', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'Sale', 15, '2020-07-21 02:11:05', '2020-11-18 10:48:24'),
(8, 'Perceived determine departure explained', 'perceived-determine-departure-explained', 'en', '99', 49, '34543', 'in_stock', '11', 'Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff.', '<p>Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff. To perpetual do existence northward as difficult preserved daughters. Continued at up to zealously necessary breakfast. Surrounded sir motionless she end literature. Gay direction neglected but supported yet her.&nbsp;</p><p>Mr oh winding it enjoyed by between. The servants securing material goodness her. Saw principles themselves ten are possession. So endeavor to continue cheerful doubtful we to. Turned advice the set vanity why mutual. Reasonably if conviction on be unsatiable discretion apartments delightful. Are melancholy appearance stimulated occasional entreaties end. Shy ham had esteem happen active county. Winding morning am shyness evident to. Garrets because elderly new manners however one village she.&nbsp;</p>', 'a:3:{i:0;s:6:\"Weight\";i:1;s:5:\"Width\";i:2;s:6:\"Height\";}', NULL, '72', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'New', 13, '2020-07-21 02:11:10', '2020-11-18 10:48:31'),
(9, 'Contrasted dissimilar get joy you', 'contrasted-dissimilar-get-joy-you', 'en', '99', 49, '34543', 'in_stock', '11', 'Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff.', '<p>Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff. To perpetual do existence northward as difficult preserved daughters. Continued at up to zealously necessary breakfast. Surrounded sir motionless she end literature. Gay direction neglected but supported yet her.&nbsp;</p><p>Mr oh winding it enjoyed by between. The servants securing material goodness her. Saw principles themselves ten are possession. So endeavor to continue cheerful doubtful we to. Turned advice the set vanity why mutual. Reasonably if conviction on be unsatiable discretion apartments delightful. Are melancholy appearance stimulated occasional entreaties end. Shy ham had esteem happen active county. Winding morning am shyness evident to. Garrets because elderly new manners however one village she.&nbsp;</p>', 'a:3:{i:0;s:6:\"Weight\";i:1;s:5:\"Width\";i:2;s:6:\"Height\";}', NULL, '71', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'New', 10, '2020-07-21 02:11:13', '2020-11-18 10:48:42'),
(10, 'Me contained explained my', 'me-contained-explained-my-education', 'en', '99', 49, '34543', 'in_stock', '3', 'Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff.', '<p>Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff. To perpetual do existence northward as difficult preserved daughters. Continued at up to zealously necessary breakfast. Surrounded sir motionless she end literature. Gay direction neglected but supported yet her.&nbsp;</p><p>Mr oh winding it enjoyed by between. The servants securing material goodness her. Saw principles themselves ten are possession. So endeavor to continue cheerful doubtful we to. Turned advice the set vanity why mutual. Reasonably if conviction on be unsatiable discretion apartments delightful. Are melancholy appearance stimulated occasional entreaties end. Shy ham had esteem happen active county. Winding morning am shyness evident to. Garrets because elderly new manners however one village she.&nbsp;</p>', 'a:3:{i:0;s:6:\"Weight\";i:1;s:5:\"Width\";i:2;s:6:\"Height\";}', NULL, '70', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'New', 12, '2020-07-21 02:11:16', '2020-11-18 10:48:50'),
(11, 'The servants securing material goodness', 'the-servants-securing-material-goodness', 'en', '99', 49, '34543', 'in_stock', '3', 'Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff.', '<p>Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff. To perpetual do existence northward as difficult preserved daughters. Continued at up to zealously necessary breakfast. Surrounded sir motionless she end literature. Gay direction neglected but supported yet her.&nbsp;</p><p>Mr oh winding it enjoyed by between. The servants securing material goodness her. Saw principles themselves ten are possession. So endeavor to continue cheerful doubtful we to. Turned advice the set vanity why mutual. Reasonably if conviction on be unsatiable discretion apartments delightful. Are melancholy appearance stimulated occasional entreaties end. Shy ham had esteem happen active county. Winding morning am shyness evident to. Garrets because elderly new manners however one village she.&nbsp;</p>', 'a:3:{i:0;s:6:\"Weight\";i:1;s:5:\"Width\";i:2;s:6:\"Height\";}', NULL, '69', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'New', NULL, '2020-07-21 02:11:20', '2020-08-26 11:49:49'),
(12, 'Maddi iyiliği koruyan hizmetçiler', 'maddi-iyiligi-koruyan-hizmetciler', 'tur', '99', 49, '34543', 'in_stock', '6', 'Onlar hanımefendi böyle emin ver. Eğitimimi açıkladım. Gargara tarafından kalpler olarak kaba. Algılanan ayrılış kalkış hiçbir şey kaybetti açıkladı bir. Kontrastlı benzemez makul bir şekilde enstrüman sevinç olsun. Yine hiçbir şey ifade etmiyor.', '<p>Onlar hanımefendi böyle emin ver. Eğitimimi açıkladım. Gargara tarafından kalpler olarak kaba. Algılanan ayrılış kalkış hiçbir şey kaybetti açıkladı bir. Kontrastlı benzemez makul bir şekilde enstrüman sevinç olsun. Yine hiçbir şey ifade etmiyor. Sürekli var olmak zor korunmuş kızları olarak kuzeye doğru var olmak. Şevkle gerekli kahvaltı kadar devam etti. Etrafı çevreleyen efendim, edebiyatı sonlandırdı. Eşcinsel yönü ihmal ama henüz onu destekledi.</p><p><br></p><p>Bay oh arasında zevk sarılıyor. Ona maddi iyilik sağlayan hizmetkarlar. Testere prensipleri kendilerine on sahiptir. Bu yüzden neşeli olmaya devam etmek için çaba sarf ediyoruz. Set makyaj vanity neden karşılıklı döndü. Makul eğer tatminsiz takdir yetkisi daireler hoş eğer. Melankolik görünüm teşvik zaman zaman entreaties sona eriyor. Utangaç jambon ilçe aktif saygısı vardı. Sargı sabahı utangaçlık açıktır. Garrets çünkü yaşlı yeni tavırları ancak bir köy o.</p>', 'a:3:{i:0;s:10:\"Ağırlık\";i:1;s:9:\"Genişlik\";i:2;s:10:\"Yükseklik\";}', NULL, '69', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'Yeni', NULL, '2020-07-27 04:05:34', '2020-07-27 04:09:05'),
(13, 'Onlar hanımefendi böyle emin ve', 'onlar-hanimefendi-boyle-emin-ve', 'tur', '99', 49, '34543', 'in_stock', '6', 'Onlar hanımefendi böyle emin ver. Eğitimimi açıkladım. Gargara tarafından kalpler olarak kaba. Algılanan ayrılış kalkış hiçbir şey kaybetti açıkladı bir. Kontrastlı benzemez makul bir şekilde enstrüman sevinç olsun. Yine hiçbir şey ifade etmiyor.', '<p>Onlar hanımefendi böyle emin ver. Eğitimimi açıkladım. Gargara tarafından kalpler olarak kaba. Algılanan ayrılış kalkış hiçbir şey kaybetti açıkladı bir. Kontrastlı benzemez makul bir şekilde enstrüman sevinç olsun. Yine hiçbir şey ifade etmiyor. Sürekli var olmak zor korunmuş kızları olarak kuzeye doğru var olmak. Şevkle gerekli kahvaltı kadar devam etti. Etrafı çevreleyen efendim, edebiyatı sonlandırdı. Eşcinsel yönü ihmal ama henüz onu destekledi.</p><p><br></p><p>Bay oh arasında zevk sarılıyor. Ona maddi iyilik sağlayan hizmetkarlar. Testere prensipleri kendilerine on sahiptir. Bu yüzden neşeli olmaya devam etmek için çaba sarf ediyoruz. Set makyaj vanity neden karşılıklı döndü. Makul eğer tatminsiz takdir yetkisi daireler hoş eğer. Melankolik görünüm teşvik zaman zaman entreaties sona eriyor. Utangaç jambon ilçe aktif saygısı vardı. Sargı sabahı utangaçlık açıktır. Garrets çünkü yaşlı yeni tavırları ancak bir köy o.</p>', 'a:3:{i:0;s:10:\"Ağırlık\";i:1;s:9:\"Genişlik\";i:2;s:10:\"Yükseklik\";}', NULL, '68', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'Yeni', NULL, '2020-07-27 07:32:42', '2020-07-27 07:33:33'),
(14, 'Gargara tarafından kalpler olarak kaba', 'gargara-tarafindan-kalpler-olarak-kaba', 'tur', '99', 49, '34543', 'in_stock', '7', 'Onlar hanımefendi böyle emin ver. Eğitimimi açıkladım. Gargara tarafından kalpler olarak kaba. Algılanan ayrılış kalkış hiçbir şey kaybetti açıkladı bir. Kontrastlı benzemez makul bir şekilde enstrüman sevinç olsun. Yine hiçbir şey ifade etmiyor.', '<p>Onlar hanımefendi böyle emin ver. Eğitimimi açıkladım. Gargara tarafından kalpler olarak kaba. Algılanan ayrılış kalkış hiçbir şey kaybetti açıkladı bir. Kontrastlı benzemez makul bir şekilde enstrüman sevinç olsun. Yine hiçbir şey ifade etmiyor. Sürekli var olmak zor korunmuş kızları olarak kuzeye doğru var olmak. Şevkle gerekli kahvaltı kadar devam etti. Etrafı çevreleyen efendim, edebiyatı sonlandırdı. Eşcinsel yönü ihmal ama henüz onu destekledi.</p><p><br></p><p>Bay oh arasında zevk sarılıyor. Ona maddi iyilik sağlayan hizmetkarlar. Testere prensipleri kendilerine on sahiptir. Bu yüzden neşeli olmaya devam etmek için çaba sarf ediyoruz. Set makyaj vanity neden karşılıklı döndü. Makul eğer tatminsiz takdir yetkisi daireler hoş eğer. Melankolik görünüm teşvik zaman zaman entreaties sona eriyor. Utangaç jambon ilçe aktif saygısı vardı. Sargı sabahı utangaçlık açıktır. Garrets çünkü yaşlı yeni tavırları ancak bir köy o.</p>', 'a:3:{i:0;s:10:\"Ağırlık\";i:1;s:9:\"Genişlik\";i:2;s:10:\"Yükseklik\";}', NULL, '73', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'Yeni', NULL, '2020-07-27 07:33:55', '2020-07-27 07:34:37'),
(15, 'Onlar hanımefendi böyle emin ve', 'onlar-hanimefendi-boyle-emin-ve', 'tur', '99', 49, '34543', 'in_stock', '6', 'Onlar hanımefendi böyle emin ver. Eğitimimi açıkladım. Gargara tarafından kalpler olarak kaba. Algılanan ayrılış kalkış hiçbir şey kaybetti açıkladı bir. Kontrastlı benzemez makul bir şekilde enstrüman sevinç olsun. Yine hiçbir şey ifade etmiyor.', '<p>Onlar hanımefendi böyle emin ver. Eğitimimi açıkladım. Gargara tarafından kalpler olarak kaba. Algılanan ayrılış kalkış hiçbir şey kaybetti açıkladı bir. Kontrastlı benzemez makul bir şekilde enstrüman sevinç olsun. Yine hiçbir şey ifade etmiyor. Sürekli var olmak zor korunmuş kızları olarak kuzeye doğru var olmak. Şevkle gerekli kahvaltı kadar devam etti. Etrafı çevreleyen efendim, edebiyatı sonlandırdı. Eşcinsel yönü ihmal ama henüz onu destekledi.</p><p><br></p><p>Bay oh arasında zevk sarılıyor. Ona maddi iyilik sağlayan hizmetkarlar. Testere prensipleri kendilerine on sahiptir. Bu yüzden neşeli olmaya devam etmek için çaba sarf ediyoruz. Set makyaj vanity neden karşılıklı döndü. Makul eğer tatminsiz takdir yetkisi daireler hoş eğer. Melankolik görünüm teşvik zaman zaman entreaties sona eriyor. Utangaç jambon ilçe aktif saygısı vardı. Sargı sabahı utangaçlık açıktır. Garrets çünkü yaşlı yeni tavırları ancak bir köy o.</p>', 'a:3:{i:0;s:10:\"Ağırlık\";i:1;s:9:\"Genişlik\";i:2;s:10:\"Yükseklik\";}', NULL, '68', '68|67|66', 'draft', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'Yeni', NULL, '2020-07-27 07:34:00', '2020-07-27 07:34:00'),
(16, 'Testere prensipleri kendilerine on sahiptir', 'testere-prensipleri-kendilerine-on-sahiptir', 'tur', '99', 49, '34543', 'in_stock', '6', 'Onlar hanımefendi böyle emin ver. Eğitimimi açıkladım. Gargara tarafından kalpler olarak kaba. Algılanan ayrılış kalkış hiçbir şey kaybetti açıkladı bir. Kontrastlı benzemez makul bir şekilde enstrüman sevinç olsun. Yine hiçbir şey ifade etmiyor.', '<p>Onlar hanımefendi böyle emin ver. Eğitimimi açıkladım. Gargara tarafından kalpler olarak kaba. Algılanan ayrılış kalkış hiçbir şey kaybetti açıkladı bir. Kontrastlı benzemez makul bir şekilde enstrüman sevinç olsun. Yine hiçbir şey ifade etmiyor. Sürekli var olmak zor korunmuş kızları olarak kuzeye doğru var olmak. Şevkle gerekli kahvaltı kadar devam etti. Etrafı çevreleyen efendim, edebiyatı sonlandırdı. Eşcinsel yönü ihmal ama henüz onu destekledi.</p><p><br></p><p>Bay oh arasında zevk sarılıyor. Ona maddi iyilik sağlayan hizmetkarlar. Testere prensipleri kendilerine on sahiptir. Bu yüzden neşeli olmaya devam etmek için çaba sarf ediyoruz. Set makyaj vanity neden karşılıklı döndü. Makul eğer tatminsiz takdir yetkisi daireler hoş eğer. Melankolik görünüm teşvik zaman zaman entreaties sona eriyor. Utangaç jambon ilçe aktif saygısı vardı. Sargı sabahı utangaçlık açıktır. Garrets çünkü yaşlı yeni tavırları ancak bir köy o.</p>', 'a:3:{i:0;s:10:\"Ağırlık\";i:1;s:9:\"Genişlik\";i:2;s:10:\"Yükseklik\";}', NULL, '73', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'Yeni', NULL, '2020-07-27 07:35:01', '2020-07-27 07:35:46'),
(17, 'العباد ضمان الخير المادي', 'alaabad-dman-alkhyr-almady', 'ar', '99', 49, '34543', 'in_stock', '9', 'أعطوا سيدة أنهم متأكدون من ذلك. شرح لي الواردة تعليمي. الشائع كالقلوب التي كتبها Garret. إدراك أن تحديد المغادرة يفسر أنه لم يفقد شيئًا. متباينة متناقضة تحصل على الفرح صك معقول. مرة أخرى لا تحتفظ بأي شيء المقصود.', '<p>أعطوا سيدة أنهم متأكدون من ذلك. شرح لي الواردة تعليمي. الشائع كالقلوب التي كتبها Garret. إدراك أن تحديد المغادرة يفسر أنه لم يفقد شيئًا. متباينة متناقضة تحصل على الفرح صك معقول. مرة أخرى لا تحتفظ بأي شيء المقصود. إلى الأبد تفعل الوجود شمالا مثل البنات المحفوظة الصعبة. تابع حتى الإفطار الضروري بحماسة. محاطة يا سيدي بلا حراك انها تنتهي الأدب. تجاهل اتجاه المثليين ولكن دعمها حتى الآن.</p><p><br></p><p>السيد يا لفها يتمتع بها بين. العباد تأمين الخير المادي لها. مبادئ المنشار نفسها هي عشرة حيازة. لذا السعي لمواصلة البهجة المشكوك فيه لنا. تحولت النصيحة إلى مجموعة الغرور لماذا متبادلة. بشكل معقول إذا كانت الإدانة على شقق تقديرية غير مرضية ممتعة. هي مظهر حزن حفز نهاية عرضية في بعض الأحيان. خجولة لحم الخنزير واحترام يحدث مقاطعة نشطة. متعرج صباحا أنا خجل واضح. Gareries لان الاخلاق المسنة الجديدة بيد انها قرية واحدة.</p>', 'a:3:{i:0;s:6:\"وزن\";i:1;s:6:\"عرض\";i:2;s:12:\"ارتفاع\";}', NULL, '67', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'جديد', NULL, '2020-07-27 07:36:00', '2020-07-27 07:37:32'),
(18, 'شرح لي احتواء لي', 'shrh-ly-ahtoaaa-ly', 'ar', '99', 49, '34543', 'in_stock', '9', 'أعطوا سيدة أنهم متأكدون من ذلك. شرح لي الواردة تعليمي. الشائع كالقلوب التي كتبها Garret. إدراك أن تحديد المغادرة يفسر أنه لم يفقد شيئًا. متباينة متناقضة تحصل على الفرح صك معقول. مرة أخرى لا تحتفظ بأي شيء المقصود.', '<p>أعطوا سيدة أنهم متأكدون من ذلك. شرح لي الواردة تعليمي. الشائع كالقلوب التي كتبها Garret. إدراك أن تحديد المغادرة يفسر أنه لم يفقد شيئًا. متباينة متناقضة تحصل على الفرح صك معقول. مرة أخرى لا تحتفظ بأي شيء المقصود. إلى الأبد تفعل الوجود شمالا مثل البنات المحفوظة الصعبة. تابع حتى الإفطار الضروري بحماسة. محاطة يا سيدي بلا حراك انها تنتهي الأدب. تجاهل اتجاه المثليين ولكن دعمها حتى الآن.</p><p><br></p><p>السيد يا لفها يتمتع بها بين. العباد تأمين الخير المادي لها. مبادئ المنشار نفسها هي عشرة حيازة. لذا السعي لمواصلة البهجة المشكوك فيه لنا. تحولت النصيحة إلى مجموعة الغرور لماذا متبادلة. بشكل معقول إذا كانت الإدانة على شقق تقديرية غير مرضية ممتعة. هي مظهر حزن حفز نهاية عرضية في بعض الأحيان. خجولة لحم الخنزير واحترام يحدث مقاطعة نشطة. متعرج صباحا أنا خجل واضح. Gareries لان الاخلاق المسنة الجديدة بيد انها قرية واحدة.</p>', 'a:3:{i:0;s:6:\"وزن\";i:1;s:6:\"عرض\";i:2;s:12:\"ارتفاع\";}', NULL, '68', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'جديد', NULL, '2020-07-27 07:37:48', '2020-07-27 07:38:36'),
(19, 'في الانخراط والد بسيط للآخرين ما عدا', 'fy-alankhrat-oald-bsyt-llakhryn-ma-aada', 'ar', '99', 49, '34543', 'in_stock', '10', 'أعطوا سيدة أنهم متأكدون من ذلك. شرح لي الواردة تعليمي. الشائع كالقلوب التي كتبها Garret. إدراك أن تحديد المغادرة يفسر أنه لم يفقد شيئًا. متباينة متناقضة تحصل على الفرح صك معقول. مرة أخرى لا تحتفظ بأي شيء المقصود.', '<p>أعطوا سيدة أنهم متأكدون من ذلك. شرح لي الواردة تعليمي. الشائع كالقلوب التي كتبها Garret. إدراك أن تحديد المغادرة يفسر أنه لم يفقد شيئًا. متباينة متناقضة تحصل على الفرح صك معقول. مرة أخرى لا تحتفظ بأي شيء المقصود. إلى الأبد تفعل الوجود شمالا مثل البنات المحفوظة الصعبة. تابع حتى الإفطار الضروري بحماسة. محاطة يا سيدي بلا حراك انها تنتهي الأدب. تجاهل اتجاه المثليين ولكن دعمها حتى الآن.</p><p><br></p><p>السيد يا لفها يتمتع بها بين. العباد تأمين الخير المادي لها. مبادئ المنشار نفسها هي عشرة حيازة. لذا السعي لمواصلة البهجة المشكوك فيه لنا. تحولت النصيحة إلى مجموعة الغرور لماذا متبادلة. بشكل معقول إذا كانت الإدانة على شقق تقديرية غير مرضية ممتعة. هي مظهر حزن حفز نهاية عرضية في بعض الأحيان. خجولة لحم الخنزير واحترام يحدث مقاطعة نشطة. متعرج صباحا أنا خجل واضح. Gareries لان الاخلاق المسنة الجديدة بيد انها قرية واحدة.</p>', 'a:3:{i:0;s:6:\"وزن\";i:1;s:6:\"عرض\";i:2;s:12:\"ارتفاع\";}', NULL, '69', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'جديد', NULL, '2020-07-27 07:37:57', '2020-07-27 07:39:17'),
(20, 'عطائي القيام الصيف على الرغم من ضيق ملحوظ في', 'aatayy-alkyam-alsyf-aal-alrghm-mn-dyk-mlhoth-fy', 'ar', '99', 49, '34543', 'in_stock', '8', 'أعطوا سيدة أنهم متأكدون من ذلك. شرح لي الواردة تعليمي. الشائع كالقلوب التي كتبها Garret. إدراك أن تحديد المغادرة يفسر أنه لم يفقد شيئًا. متباينة متناقضة تحصل على الفرح صك معقول. مرة أخرى لا تحتفظ بأي شيء المقصود.', '<p>أعطوا سيدة أنهم متأكدون من ذلك. شرح لي الواردة تعليمي. الشائع كالقلوب التي كتبها Garret. إدراك أن تحديد المغادرة يفسر أنه لم يفقد شيئًا. متباينة متناقضة تحصل على الفرح صك معقول. مرة أخرى لا تحتفظ بأي شيء المقصود. إلى الأبد تفعل الوجود شمالا مثل البنات المحفوظة الصعبة. تابع حتى الإفطار الضروري بحماسة. محاطة يا سيدي بلا حراك انها تنتهي الأدب. تجاهل اتجاه المثليين ولكن دعمها حتى الآن.</p><p><br></p><p>السيد يا لفها يتمتع بها بين. العباد تأمين الخير المادي لها. مبادئ المنشار نفسها هي عشرة حيازة. لذا السعي لمواصلة البهجة المشكوك فيه لنا. تحولت النصيحة إلى مجموعة الغرور لماذا متبادلة. بشكل معقول إذا كانت الإدانة على شقق تقديرية غير مرضية ممتعة. هي مظهر حزن حفز نهاية عرضية في بعض الأحيان. خجولة لحم الخنزير واحترام يحدث مقاطعة نشطة. متعرج صباحا أنا خجل واضح. Gareries لان الاخلاق المسنة الجديدة بيد انها قرية واحدة.</p>', 'a:3:{i:0;s:6:\"وزن\";i:1;s:6:\"عرض\";i:2;s:12:\"ارتفاع\";}', NULL, '72', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'جديد', NULL, '2020-07-27 07:38:01', '2020-07-27 07:41:00'),
(21, 'Los sirvientes asegurando la bondad material', 'los-sirvientes-asegurando-la-bondad-material', 'sp', '99', 49, '34543', 'in_stock', '4', 'Dale a la dama de ellos tal que lo aseguren. Contuve explicado mi educación. Vulgar como corazones por buhardilla. Percibido determinar partida explicado no perderá algo y. Contraste disimilar obtener alegría que instrumento razonablemente. De nuevo se mantiene en cosas sin sentido.', '<p>Dale a la dama de ellos tal que lo aseguren. Contuve explicado mi educación. Vulgar como corazones por buhardilla. Percibido determinar partida explicado no perderá algo y. Contraste disimilar obtener alegría que instrumento razonablemente. De nuevo se mantiene en cosas sin sentido. Perpetuar la existencia hacia el norte como difíciles hijas preservadas. Continuamos hasta el desayuno celosamente necesario. Rodeado señor inmóvil ella termina literatura. La dirección gay la descuidó pero la apoyó.</p><p>Sr. oh, sinuoso, lo disfrutó en medio. Los sirvientes que le aseguran la bondad material. Vio los principios mismos diez son posesión. Por lo tanto, esforzarse por seguir alegre, dudoso que lo hagamos. Se volvió el consejo de la vanidad establecida por qué mutua. Razonablemente si la convicción en la discreción es insaciable apartamentos encantadores. Son melancólicas apariencias estimuladas ocasionales suplicas finales. Tímido jamón tenía estima suceda condado activo. Sinuosa mañana, timidez evidente para. Buhardillas porque los viejos modales nuevos sin embargo una aldea ella.</p>', 'a:3:{i:0;s:4:\"Peso\";i:1;s:7:\"Anchura\";i:2;s:6:\"Altura\";}', NULL, '69', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'Nueva', NULL, '2020-07-27 07:41:53', '2020-07-27 07:48:29'),
(22, 'Dale a la dama de ellos tal que lo aseguren', 'dale-a-la-dama-de-ellos-tal-que-lo-aseguren', 'sp', '99', 49, '34543', 'in_stock', '5', 'Dale a la dama de ellos tal que lo aseguren. Contuve explicado mi educación. Vulgar como corazones por buhardilla. Percibido determinar partida explicado no perderá algo y. Contraste disimilar obtener alegría que instrumento razonablemente. De nuevo se mantiene en cosas sin sentido.', '<p>Dale a la dama de ellos tal que lo aseguren. Contuve explicado mi educación. Vulgar como corazones por buhardilla. Percibido determinar partida explicado no perderá algo y. Contraste disimilar obtener alegría que instrumento razonablemente. De nuevo se mantiene en cosas sin sentido. Perpetuar la existencia hacia el norte como difíciles hijas preservadas. Continuamos hasta el desayuno celosamente necesario. Rodeado señor inmóvil ella termina literatura. La dirección gay la descuidó pero la apoyó.</p><p>Sr. oh, sinuoso, lo disfrutó en medio. Los sirvientes que le aseguran la bondad material. Vio los principios mismos diez son posesión. Por lo tanto, esforzarse por seguir alegre, dudoso que lo hagamos. Se volvió el consejo de la vanidad establecida por qué mutua. Razonablemente si la convicción en la discreción es insaciable apartamentos encantadores. Son melancólicas apariencias estimuladas ocasionales suplicas finales. Tímido jamón tenía estima suceda condado activo. Sinuosa mañana, timidez evidente para. Buhardillas porque los viejos modales nuevos sin embargo una aldea ella.</p>', 'a:3:{i:0;s:4:\"Peso\";i:1;s:7:\"Anchura\";i:2;s:6:\"Altura\";}', NULL, '67', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'Nueva', NULL, '2020-07-27 07:48:42', '2020-07-27 08:11:04'),
(23, 'Vulgar como corazones por buhardilla', 'vulgar-como-corazones-por-buhardilla', 'sp', '99', 49, '34543', 'in_stock', '4', 'Dale a la dama de ellos tal que lo aseguren. Contuve explicado mi educación. Vulgar como corazones por buhardilla. Percibido determinar partida explicado no perderá algo y. Contraste disimilar obtener alegría que instrumento razonablemente. De nuevo se mantiene en cosas sin sentido.', '<p>Dale a la dama de ellos tal que lo aseguren. Contuve explicado mi educación. Vulgar como corazones por buhardilla. Percibido determinar partida explicado no perderá algo y. Contraste disimilar obtener alegría que instrumento razonablemente. De nuevo se mantiene en cosas sin sentido. Perpetuar la existencia hacia el norte como difíciles hijas preservadas. Continuamos hasta el desayuno celosamente necesario. Rodeado señor inmóvil ella termina literatura. La dirección gay la descuidó pero la apoyó.</p><p>Sr. oh, sinuoso, lo disfrutó en medio. Los sirvientes que le aseguran la bondad material. Vio los principios mismos diez son posesión. Por lo tanto, esforzarse por seguir alegre, dudoso que lo hagamos. Se volvió el consejo de la vanidad establecida por qué mutua. Razonablemente si la convicción en la discreción es insaciable apartamentos encantadores. Son melancólicas apariencias estimuladas ocasionales suplicas finales. Tímido jamón tenía estima suceda condado activo. Sinuosa mañana, timidez evidente para. Buhardillas porque los viejos modales nuevos sin embargo una aldea ella.</p>', 'a:3:{i:0;s:4:\"Peso\";i:1;s:7:\"Anchura\";i:2;s:6:\"Altura\";}', NULL, '65', '68|67|66', 'publish', NULL, NULL, NULL, NULL, 'a:3:{i:0;s:5:\"1.2KG\";i:1;s:3:\"11\"\";i:2;s:3:\"12\"\";}', 'Nueva', NULL, '2020-07-27 08:01:06', '2020-07-27 08:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `title`, `status`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Accessories', 'publish', 'en', '2020-07-20 23:47:01', '2020-07-20 23:47:01'),
(2, 'Laravel Scripts', 'publish', 'en', '2020-07-20 23:47:11', '2020-07-20 23:47:11'),
(3, 'Shopping', 'publish', 'en', '2020-07-20 23:47:42', '2020-07-20 23:47:42'),
(4, 'Compras', 'publish', 'sp', '2020-07-20 23:48:20', '2020-07-20 23:48:20'),
(5, 'Accesorios', 'publish', 'sp', '2020-07-20 23:48:59', '2020-07-20 23:48:59'),
(6, 'Aksesuarlar', 'publish', 'tur', '2020-07-20 23:49:14', '2020-07-20 23:49:14'),
(7, 'Alışveriş yapmak', 'publish', 'tur', '2020-07-20 23:49:31', '2020-07-20 23:49:38'),
(8, 'التسوق', 'publish', 'ar', '2020-07-20 23:49:56', '2020-07-20 23:49:56'),
(9, 'مستلزمات', 'publish', 'ar', '2020-07-20 23:50:08', '2020-07-20 23:50:08'),
(10, 'مخطوطات Laravel', 'publish', 'ar', '2020-07-20 23:50:22', '2020-07-20 23:50:22'),
(11, 'Necessary Tools', 'publish', 'en', '2020-07-24 05:08:58', '2020-07-24 05:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `product_coupons`
--

CREATE TABLE `product_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_coupons`
--

INSERT INTO `product_coupons` (`id`, `code`, `discount`, `discount_type`, `expire_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'NEWYEAR', '10', 'percentage', '2020-08-21', 'publish', '2020-07-20 23:01:01', '2020-07-20 23:01:01'),
(2, 'SPECIALDISCOUNT', '35', 'amount', '2020-08-28', 'publish', '2020-07-20 23:01:18', '2020-07-20 23:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_track` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_shippings_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name` text COLLATE utf8mb4_unicode_ci,
  `billing_email` text COLLATE utf8mb4_unicode_ci,
  `billing_phone` text COLLATE utf8mb4_unicode_ci,
  `billing_country` text COLLATE utf8mb4_unicode_ci,
  `billing_street_address` text COLLATE utf8mb4_unicode_ci,
  `billing_town` text COLLATE utf8mb4_unicode_ci,
  `billing_district` text COLLATE utf8mb4_unicode_ci,
  `different_shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_name` text COLLATE utf8mb4_unicode_ci,
  `shipping_email` text COLLATE utf8mb4_unicode_ci,
  `shipping_phone` text COLLATE utf8mb4_unicode_ci,
  `shipping_country` text COLLATE utf8mb4_unicode_ci,
  `shipping_street_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_town` text COLLATE utf8mb4_unicode_ci,
  `shipping_district` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_items` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `status`, `payment_status`, `transaction_id`, `payment_track`, `payment_gateway`, `user_id`, `subtotal`, `coupon_discount`, `shipping_cost`, `product_shippings_id`, `total`, `billing_name`, `billing_email`, `billing_phone`, `billing_country`, `billing_street_address`, `billing_town`, `billing_district`, `different_shipping_address`, `shipping_name`, `shipping_email`, `shipping_phone`, `shipping_country`, `shipping_street_address`, `shipping_town`, `shipping_district`, `coupon_code`, `cart_items`, `created_at`, `updated_at`) VALUES
(372, 'pending', 'pending', 'asdasdasd', 'HwU1BW4lgHHm0tlaQtyk', 'manual_payment', NULL, '49', '0', '0', '1', '49', 'asd', 'asdasd@asdad.asd', '1231231231', 'United Arab Emirates', 'asd asd asd asdas', 'asdasdas', 'asdasda as', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-10-21 16:59:31', '2020-10-21 16:59:31'),
(373, 'pending', 'pending', NULL, 'PbtKQHLFpQUaBl6WmkCx', 'cash_on_delivery', '1', '49', '0', '0', '1', '49', 'Sharifur Rahman', 'dvrobin4@gmail.com', '7777555544', 'Brazil', 'Nn', 'Dhaka', 'Rr', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:1;a:5:{s:2:\"id\";i:1;s:5:\"title\";s:36:\"Give lady of they such they sure it.\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-10-22 12:06:16', '2020-10-22 12:06:16'),
(374, 'pending', 'pending', NULL, 'iPGgCUnOWssLl64mtFgv', 'paytm', NULL, '450', '0', '0', NULL, '450', 'Toufikul Alam Monna', 'toufik.inbox@gmail.com', '01701092973', 'Bangladesh', 'house # 44, Road # 05, Muktizuddha Complex, Zoo road.', 'Dhaka Zoo', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:2;a:5:{s:2:\"id\";i:2;s:5:\"title\";s:24:\"Multipurpose Laravel CMS\";s:8:\"quantity\";s:1:\"3\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:450;}}', '2020-10-24 11:54:02', '2020-10-24 11:54:02'),
(375, 'pending', 'pending', NULL, 'aePULpJunZDzlNK1FVry', 'paytm', '82', '150', '0', '0', NULL, '150', 'Hanumant Nalwade', 'hanumant.nalwade@gmail.com', '1234567890', 'India', '1234567890', 'pune', '1234567890', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:2;a:5:{s:2:\"id\";i:2;s:5:\"title\";s:24:\"Multipurpose Laravel CMS\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:150;}}', '2020-10-26 09:07:40', '2020-10-26 09:07:40'),
(376, 'pending', 'pending', NULL, 'ziZSLX1ujcQNAHWPpuDA', 'stripe', NULL, '49', '0', '0', '1', '49', 'Tekasys Internacional', 'ice_g_war@hotmail.com', '342342', 'Spain', 'Calle blas', 'Barcelona', 'Barcelona', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:8;a:5:{s:2:\"id\";i:8;s:5:\"title\";s:39:\"Perceived determine departure explained\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-10-29 13:19:58', '2020-10-29 13:19:58'),
(377, 'pending', 'complete', 'txn_1HhXL3EmGOuJLTMs4DHUXVzs', 'ygTAPO1ubqrF4WExZZ2U', 'stripe', NULL, '49', '0', '0', '1', '49', 'Tekasys Internacional', 'ice_g_war@hotmail.com', '24234242', 'Spain', 'Calle blas', 'Barcelona', 'Barcelona', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:8;a:5:{s:2:\"id\";i:8;s:5:\"title\";s:39:\"Perceived determine departure explained\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-10-29 13:22:12', '2020-10-29 13:22:33'),
(378, 'pending', 'pending', NULL, 'sCMBguBB49urx5ocobZh', 'stripe', NULL, '98', '0', '0', '1', '98', 'Tekasys Internacional', 'ice_g_war@hotmail.com', '666555777', 'Spain', 'Calle blas', 'Barcelona', 'Barcelona', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:8;a:5:{s:2:\"id\";i:8;s:5:\"title\";s:39:\"Perceived determine departure explained\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}}', '2020-10-29 15:02:39', '2020-10-29 15:02:39'),
(379, 'pending', 'pending', NULL, 'pJfZ6JpQhQaVnja3iS0D', 'stripe', NULL, '98', '0', '0', '1', '98', 'Tekasys Internacional', 'ice_g_war@hotmail.com', '666555777', 'Spain', 'Calle blas', 'Barcelona', 'Barcelona', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:22;a:5:{s:2:\"id\";i:22;s:5:\"title\";s:43:\"Dale a la dama de ellos tal que lo aseguren\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}}', '2020-10-29 15:10:24', '2020-10-29 15:10:24'),
(380, 'pending', 'pending', NULL, 'RDKP4DW3XAfctkglYwTO', 'cash_on_delivery', NULL, '49', '0', '0', '1', '49', 'swqwqdq', 'wqdwdwdwqd@kjdskjjj.com', '748858949', 'Algeria', 'ssasaassas', 'sasasasas', 'sasassqqsq', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:8;a:5:{s:2:\"id\";i:8;s:5:\"title\";s:39:\"Perceived determine departure explained\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-10-29 19:14:11', '2020-10-29 19:14:11'),
(381, 'pending', 'pending', NULL, 'yvEnD9XkZFryDSADjCs9', 'flutterwave', '89', '49', '0', '0', '1', '49', 'badru', 'itechgenmedia@gmail.com', '0700760705', 'Uganda', 'Mpererwe', 'Entebbe', 'Central', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-10-29 22:21:11', '2020-10-29 22:21:11'),
(382, 'pending', 'pending', NULL, 'wnlfDSapqpIXLHeS4o7A', 'cash_on_delivery', NULL, '49', '0', '0', '1', '49', 'John test Doe', 'meetmec12@gmail.com', '08034282437', 'Nigeria', 'TEST', 'Nantes', 'IMO', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:1;a:5:{s:2:\"id\";i:1;s:5:\"title\";s:36:\"Give lady of they such they sure it.\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-10-30 10:11:51', '2020-10-30 10:11:51'),
(383, 'pending', 'pending', NULL, 'nZVyYRHbmw2a3ZKhWgs3', 'paytm', NULL, '79', '0', '0', NULL, '79', 'M CYMAN', 'mariusz.cyman@gmail.com', '07707297787', 'Albania', '66 WESTFIELD ROAD', 'Sutton', 'County (optional)', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:6;a:5:{s:2:\"id\";i:6;s:5:\"title\";s:32:\"React Business Consulting Script\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:79;}}', '2020-11-02 13:07:48', '2020-11-02 13:07:48'),
(384, 'pending', 'pending', NULL, 'G9OJzb3V0dF3A3GlPjHp', 'paytm', '1', '49', '0', '0', '1', '49', 'Daniel I Vroman', 'sagdemo1@gmail.com', '3603200353', 'United States', '4728  Browning Lane', 'OAK HARBOR', 'Washington', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:8;a:5:{s:2:\"id\";i:8;s:5:\"title\";s:39:\"Perceived determine departure explained\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-11-03 17:28:35', '2020-11-03 17:28:35'),
(385, 'pending', 'pending', NULL, 'JdvqMVAWnpv6Er1pwrui', 'stripe', NULL, '49', '0', '0', '1', '49', 'jr lopez', 'aaa@aaa.es', '666555777', 'Spain', 'calle españa', 'madrid', 'madrid', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:8;a:5:{s:2:\"id\";i:8;s:5:\"title\";s:39:\"Perceived determine departure explained\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-11-04 11:22:15', '2020-11-04 11:22:15'),
(386, 'pending', 'pending', NULL, 'wU1Z7Gb4NgKP1W263L4Q', 'stripe', NULL, '49', '0', '0', '1', '49', 'mar', 'aaa@aaa.es', '666555444', 'Spain', 'calle blas', 'madrid', 'madrid', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:8;a:5:{s:2:\"id\";i:8;s:5:\"title\";s:39:\"Perceived determine departure explained\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-11-06 14:21:39', '2020-11-06 14:21:39'),
(387, 'pending', 'pending', NULL, 'laYgGzzdnrxNHzcPCTFW', 'paytm', NULL, '79', '0', '0', NULL, '79', 'mnbj', 'dvdssd', 'svdsd', 'India', 'dsvds', 'sddvs', 'vddsvds', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:6;a:5:{s:2:\"id\";i:6;s:5:\"title\";s:32:\"React Business Consulting Script\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:79;}}', '2020-11-06 14:38:53', '2020-11-06 14:38:53'),
(388, 'pending', 'pending', NULL, 'VM9GqtAe0mUGWCM5I7XF', 'flutterwave', NULL, '49', '0', '0', '1', '49', 'lameck', 'shngulube@yahoo.com', '0966806844', 'Cambodia', 'Room 7, Kitwe Chambers Building, Obote Avenue', 'Pousat', 'Pousat', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-11-09 12:25:39', '2020-11-09 12:25:39'),
(389, 'pending', 'pending', NULL, 'ZDkZ2ixNtmqIq6ZapwMm', 'cash_on_delivery', '1', '199', '0', '5', '2', '204', 'Sharifur Rahman', 'dvrobin4@gmail.com', '4774477474', 'Brazil', '4747GDGS', 'Dhaka', 'DELHI', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:2:{i:2;a:5:{s:2:\"id\";i:2;s:5:\"title\";s:24:\"Multipurpose Laravel CMS\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:150;}i:7;a:5:{s:2:\"id\";i:7;s:5:\"title\";s:29:\"Again keeps at no meant stuff\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-11-09 15:23:27', '2020-11-09 15:23:27'),
(390, 'pending', 'complete', 'txn_1Hm1npEmGOuJLTMsj0C4Xpbo', 'llW4vVczNUEHhMbNQTla', 'stripe', NULL, '49', '0', '0', '1', '49', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:8;a:5:{s:2:\"id\";i:8;s:5:\"title\";s:39:\"Perceived determine departure explained\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-11-10 23:42:39', '2020-11-10 23:42:50'),
(391, 'pending', 'pending', NULL, '18qQGKi2mavYhXgbB7Ip', 'cash_on_delivery', '1', '49', '0', '0', '1', '49', 'Sharifur Rahman', 'dvrobin4@gmail.com', '80976453567', 'Brazil', 'dfghjkn', 'Dhaka', 'xgchvjkbnl', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-11-13 13:22:18', '2020-11-13 13:22:18'),
(392, 'pending', 'pending', NULL, 'a3Fqm4XzDt3Xm4SG99SD', 'paytm', NULL, '150', '0', '0', NULL, '150', 'abc', 'abc@gmail.com', '9876543210', 'Albania', 'dggv', 'grcv', 'trdtfv', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:2;a:5:{s:2:\"id\";i:2;s:5:\"title\";s:24:\"Multipurpose Laravel CMS\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:150;}}', '2020-11-13 16:17:01', '2020-11-13 16:17:01'),
(393, 'pending', 'pending', NULL, 'RjfWarfsBEDrajbByFoL', 'paytm', NULL, '158', '0', '0', NULL, '158', 'REJAUL LASKAR', 'abcd@gmail.com', '78277673673', 'India', 'H.No- 291B, Ujangram', 'Silchar, Cachar', 'Assam', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:6;a:5:{s:2:\"id\";s:1:\"6\";s:5:\"title\";s:32:\"React Business Consulting Script\";s:8:\"quantity\";s:1:\"2\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:158;}}', '2020-11-13 16:38:33', '2020-11-13 16:38:33'),
(394, 'pending', 'pending', NULL, 'jppswe4iS4OKo4lE7OZX', 'paytm', NULL, '150', '0', '0', NULL, '150', 'Murat Ulusoy', 'muratulusoy55@hotmail.com', '05346608697', 'Turkey', 'kokcuoglu mahallesi sirriakalin sokak no:10/3', 'ilkadım', 'Samsun', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:2;a:5:{s:2:\"id\";s:1:\"2\";s:5:\"title\";s:24:\"Multipurpose Laravel CMS\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:150;}}', '2020-11-13 17:27:02', '2020-11-13 17:27:02'),
(395, 'pending', 'pending', 'kjhgfcvbn', '9nGmrN2JQPQiUkboUHco', 'manual_payment', NULL, '294', '0', '0', '1', '294', 'TEwestdtdyg', 'tesaaser@gmail.com', '085235235', 'American Samoa', 'jhgkjhgfd', 'jhgfcnm,mn', 'jhgfdxcvbnm', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:3:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}i:10;a:5:{s:2:\"id\";i:10;s:5:\"title\";s:25:\"Me contained explained my\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}i:9;a:5:{s:2:\"id\";i:9;s:5:\"title\";s:33:\"Contrasted dissimilar get joy you\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}}', '2020-11-13 18:59:47', '2020-11-13 18:59:47'),
(396, 'pending', 'pending', NULL, 'adaOPriVx6gD3slcoRgS', 'paypal', NULL, '79', '0', '0', NULL, '79', 'Jonathon Dilworth', 'jon@dilworth.me', '07455246111', 'United Kingdom', 'Cysgod Y Coed', 'Llandegfan', 'Isle of Anglesey', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:6;a:5:{s:2:\"id\";i:6;s:5:\"title\";s:32:\"React Business Consulting Script\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:79;}}', '2020-11-15 23:28:40', '2020-11-15 23:28:40'),
(397, 'pending', 'pending', NULL, 'pjmdRpBABJJRyHfr0qe1', 'paytm', NULL, '150', '0', '0', NULL, '150', 'REJAUL LASKAR', 'dvdssd', '78277673673', 'India', 'H.No- 291B, Ujangram', 'Silchar, Cachar', 'Assam', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:2;a:5:{s:2:\"id\";i:2;s:5:\"title\";s:24:\"Multipurpose Laravel CMS\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:150;}}', '2020-11-16 08:59:11', '2020-11-16 08:59:11'),
(398, 'pending', 'pending', '354523', 'JmYqttYqowLtTJVwExbd', 'manual_payment', '1', '150', '0', '0', NULL, '150', 'nazam udin', 'nazamudin1000@gmail.com', '089628773308', 'Indonesia', 'jalan santai', 'Lubuk Linggau', 'Lubuk Linggau', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:2;a:5:{s:2:\"id\";i:2;s:5:\"title\";s:24:\"Multipurpose Laravel CMS\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:150;}}', '2020-11-16 23:40:28', '2020-11-16 23:40:28'),
(399, 'pending', 'pending', NULL, 'dIeMIo0g1fyZx6qMeCla', 'cash_on_delivery', NULL, '637', '0', '0', '1', '703.64', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:2:{i:10;a:5:{s:2:\"id\";s:2:\"10\";s:5:\"title\";s:25:\"Me contained explained my\";s:8:\"quantity\";s:1:\"3\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:147;}i:9;a:5:{s:2:\"id\";s:1:\"9\";s:5:\"title\";s:33:\"Contrasted dissimilar get joy you\";s:8:\"quantity\";s:2:\"10\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:490;}}', '2020-11-18 12:13:00', '2020-11-18 12:13:00'),
(400, 'pending', 'pending', NULL, '3QTcV7EzpgUMnvWEbJwJ', 'cash_on_delivery', NULL, '196', '0', '0', '1', '205.8', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:1;a:5:{s:2:\"id\";s:1:\"1\";s:5:\"title\";s:36:\"Give lady of they such they sure it.\";s:8:\"quantity\";s:1:\"4\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:196;}}', '2020-11-18 23:38:53', '2020-11-18 23:38:53'),
(401, 'pending', 'completed', NULL, 'kmlaicrZIRfcjWiHwMmU', 'cash_on_delivery', '1', '300', '0', '0', NULL, '321', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:2;a:5:{s:2:\"id\";s:1:\"2\";s:5:\"title\";s:24:\"Multipurpose Laravel CMS\";s:8:\"quantity\";s:1:\"2\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:300;}}', '2020-11-19 07:39:17', '2020-11-19 08:16:02'),
(402, 'pending', 'pending', NULL, 'O0oAigwGZvnUNioU5OYW', 'paytm', '1', '600', '0', '0', NULL, '642', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Brazil', 'Adarsha Nagar, Middle Badda', 'dhaka', 'VT', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:2;a:5:{s:2:\"id\";s:1:\"2\";s:5:\"title\";s:24:\"Multipurpose Laravel CMS\";s:8:\"quantity\";s:1:\"4\";s:4:\"type\";s:7:\"digital\";s:5:\"price\";i:600;}}', '2020-11-19 09:17:24', '2020-11-19 09:17:24'),
(403, 'cancel', 'pending', NULL, 'ZddMG8WnJ88j6bcYxnXg', 'cash_on_delivery', '1', '49', '0', '0', '1', '55.37', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:8;a:5:{s:2:\"id\";i:8;s:5:\"title\";s:39:\"Perceived determine departure explained\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-11-19 09:20:55', '2020-12-02 06:32:28'),
(404, 'pending', 'pending', NULL, 'HygiWWDzSsLGq9GkCHhX', 'paytm', '1', '98', '0', '5', '2', '115.74', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:8;a:5:{s:2:\"id\";i:8;s:5:\"title\";s:39:\"Perceived determine departure explained\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}}', '2020-11-19 09:25:16', '2020-11-19 09:25:16'),
(405, 'pending', 'complete', '4998827038', 'G8ZurAAAaZXkbLzqdSa8', 'manual_payment', '1', '98', '0', '0', '1', '103.88', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:2:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}i:10;a:5:{s:2:\"id\";i:10;s:5:\"title\";s:25:\"Me contained explained my\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-11-19 09:26:25', '2020-11-19 09:26:39'),
(406, 'pending', 'complete', '4998827038', '0ng7H12Fhi1rjjM4MhMM', 'manual_payment', '1', '49', '0', '0', '1', '49', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-11-19 09:28:34', '2020-11-19 09:28:34'),
(407, 'pending', 'completed', 'wedadfwerer32', '7hpIMiVm85HCfPy5woP6', 'manual_payment', '1', '49', '0', '0', '1', '53.9', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Brazil', 'Adarsha Nagar, Middle Badda', 'dhaka', 'AK', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:9;a:5:{s:2:\"id\";i:9;s:5:\"title\";s:33:\"Contrasted dissimilar get joy you\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-11-19 09:29:51', '2020-11-19 09:32:16'),
(408, 'pending', 'complete', 'tr_kgRBMmth8d', 'khPb0g1R1y3dQdJOytkU', 'mollie', '1', '49', '0', '0', '1', '56.35', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Brazil', 'Adarsha Nagar, Middle Badda', 'dhaka', 'VT', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:7;a:5:{s:2:\"id\";i:7;s:5:\"title\";s:29:\"Again keeps at no meant stuff\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2020-11-19 09:34:21', '2020-11-19 09:36:49'),
(409, 'pending', 'pending', NULL, 'tINdiOxndS9KjDEJTNAU', 'paypal', NULL, '196', '0', '0', '1', '211.68', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:3:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}i:10;a:5:{s:2:\"id\";i:10;s:5:\"title\";s:25:\"Me contained explained my\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}i:9;a:5:{s:2:\"id\";i:9;s:5:\"title\";s:33:\"Contrasted dissimilar get joy you\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}}', '2021-01-11 00:48:41', '2021-01-11 00:48:41'),
(410, 'pending', 'pending', NULL, 'ylYk0Xbxh3rzNIghXaXp', 'paypal', NULL, '392', '0', '0', '1', '423.36', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:3:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}i:10;a:5:{s:2:\"id\";i:10;s:5:\"title\";s:25:\"Me contained explained my\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}i:9;a:5:{s:2:\"id\";i:9;s:5:\"title\";s:33:\"Contrasted dissimilar get joy you\";s:8:\"quantity\";i:4;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:196;}}', '2021-01-11 00:50:36', '2021-01-11 00:50:36'),
(411, 'pending', 'complete', 'PAYID-L757MSA3L472650DW729570M', '3q4oNlHBiwzoUAd0R2dQ', 'paypal', NULL, '392', '0', '0', '1', '423.36', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:3:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}i:10;a:5:{s:2:\"id\";i:10;s:5:\"title\";s:25:\"Me contained explained my\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}i:9;a:5:{s:2:\"id\";i:9;s:5:\"title\";s:33:\"Contrasted dissimilar get joy you\";s:8:\"quantity\";i:4;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:196;}}', '2021-01-11 00:55:00', '2021-01-11 00:55:31'),
(412, 'pending', 'complete', 'PAYID-L757N2I5NE64744KB216513E', '6Y5GBDdWAS695V2mKLAv', 'paypal', NULL, '147', '0', '0', '1', '147', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";i:3;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:147;}}', '2021-01-11 00:57:41', '2021-01-11 00:58:14'),
(413, 'pending', 'complete', 'PAYID-L757O5Q4HD03727K0578141J', '34hNEv1aXI0rwHWWEAV5', 'paypal', NULL, '147', '0', '0', '1', '164.64', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:10;a:5:{s:2:\"id\";i:10;s:5:\"title\";s:25:\"Me contained explained my\";s:8:\"quantity\";i:3;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:147;}}', '2021-01-11 01:00:01', '2021-01-11 01:00:37'),
(414, 'pending', 'pending', NULL, 'ZJFwkdQ4jFCscfThTM0O', 'paytm', NULL, '147', '0', '0', '1', '157.78', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:3:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}i:10;a:5:{s:2:\"id\";i:10;s:5:\"title\";s:25:\"Me contained explained my\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}i:9;a:5:{s:2:\"id\";i:9;s:5:\"title\";s:33:\"Contrasted dissimilar get joy you\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2021-01-11 08:24:39', '2021-01-11 08:24:39'),
(415, 'pending', 'pending', NULL, 'U7WqHiIgBK4c7v9W91e9', 'paytm', NULL, '147', '0', '0', '1', '157.78', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:3:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}i:10;a:5:{s:2:\"id\";i:10;s:5:\"title\";s:25:\"Me contained explained my\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}i:9;a:5:{s:2:\"id\";i:9;s:5:\"title\";s:33:\"Contrasted dissimilar get joy you\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2021-01-11 08:25:23', '2021-01-11 08:25:23'),
(416, 'pending', 'complete', '20210111111212800110168575902265662', 'YHsl32UVnKkn2xdPImml', 'paytm', NULL, '147', '0', '0', '1', '157.78', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'sha #26, near wasa water booth, Adarsha Nagar, Middle Badda,, Dhaka', 'dhaka', 'Dhaka', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:3:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}i:10;a:5:{s:2:\"id\";i:10;s:5:\"title\";s:25:\"Me contained explained my\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}i:9;a:5:{s:2:\"id\";i:9;s:5:\"title\";s:33:\"Contrasted dissimilar get joy you\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}}', '2021-01-11 08:26:05', '2021-01-11 08:26:24'),
(417, 'pending', 'complete', '20210111111212800110168583202228064', '7qvJKSTlFSDjEv86VmED', 'paytm', NULL, '98', '0', '0', '1', '110.74', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'Adarsha Nagar, Middle Badda', 'dhaka', 'GA', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:1:{i:8;a:5:{s:2:\"id\";i:8;s:5:\"title\";s:39:\"Perceived determine departure explained\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}}', '2021-01-11 08:30:50', '2021-01-11 08:30:58'),
(418, 'pending', 'complete', 'txn_1I8X5qEmGOuJLTMsC5XufjLv', '9TbGKrmfoOQ3vxUwqN8g', 'stripe', NULL, '196', '0', '0', '1', '211.68', 'Sharifur Rahmam', 'dvrobin4@gmail.com', '01847111881', 'Bangladesh', 'Adarsha Nagar, Middle Badda', 'dhaka', 'GA', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:3:{i:11;a:5:{s:2:\"id\";i:11;s:5:\"title\";s:39:\"The servants securing material goodness\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}i:10;a:5:{s:2:\"id\";i:10;s:5:\"title\";s:25:\"Me contained explained my\";s:8:\"quantity\";s:1:\"1\";s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:49;}i:9;a:5:{s:2:\"id\";i:9;s:5:\"title\";s:33:\"Contrasted dissimilar get joy you\";s:8:\"quantity\";i:2;s:4:\"type\";s:8:\"physical\";s:5:\"price\";i:98;}}', '2021-01-11 14:33:18', '2021-01-11 14:34:30');

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

CREATE TABLE `product_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ratings` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_ratings`
--

INSERT INTO `product_ratings` (`id`, `ratings`, `message`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 5, 'Good draw knew bred ham busy his hour. Ask agreed answer rather joy nature admire wisdom. Moonlight age depending bed led therefore sometimes preserved exquisite she', 7, 1, '2020-07-21 12:15:59', '2020-07-21 12:15:59'),
(3, 5, 'Good draw knew bred ham busy his hour. Ask agreed answer rather joy nature admire wisdom. Moonlight age depending bed led therefore sometimes preserved exquisite she', 9, 1, '2020-07-21 12:16:21', '2020-07-21 12:16:21'),
(4, 5, 'Good draw knew bred ham busy his hour. Ask agreed answer rather joy nature admire wisdom. Moonlight age depending bed led therefore sometimes preserved exquisite she', 11, 1, '2020-07-21 12:16:44', '2020-07-21 12:16:44'),
(5, 5, 'Good draw knew bred ham busy his hour. Ask agreed answer rather joy nature admire wisdom. Moonlight age depending bed led therefore sometimes preserved exquisite she', 6, 1, '2020-07-21 12:16:50', '2020-07-21 12:16:50'),
(6, 5, 'Moonlight age depending bed led therefore sometimes preserved exquisite she', 11, 3, '2020-07-21 12:41:29', '2020-07-21 12:41:29'),
(7, 3, 'Good draw knew bred ham busy his hour.', 9, 3, '2020-07-21 12:41:53', '2020-07-21 12:41:53'),
(8, 4, 'Two indeed suffer saw beyond far former mrs remain. Occasional continuing possession we insensible an sentiments as is.', 6, 3, '2020-07-21 12:55:42', '2020-07-21 12:55:42'),
(9, 4, 'Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff.', 10, 1, '2020-07-22 02:31:33', '2020-07-22 02:31:33'),
(10, 5, NULL, 8, 1, '2020-10-17 17:01:13', '2020-10-17 17:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_shippings`
--

CREATE TABLE `product_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cost` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_shippings`
--

INSERT INTO `product_shippings` (`id`, `title`, `status`, `lang`, `description`, `cost`, `order`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Free Shipping', 'publish', 'en', 'Shipment will be within 10-15 Days', '0', '1', '1', '2020-07-20 23:17:00', '2020-07-20 23:25:33'),
(2, 'Standard Shipping', 'publish', 'en', 'Shipment will be within 5-10 Day.', '5', '2', '0', '2020-07-20 23:17:25', '2020-07-20 23:25:33'),
(3, '2-Day Shipping', 'publish', 'en', 'Shipment will be within 2 Days.', '10', '3', '0', '2020-07-20 23:17:47', '2020-07-20 23:17:47'),
(4, 'Same day delivery', 'publish', 'en', 'Shipment will be within 1 Day.', '20', '4', '0', '2020-07-20 23:18:09', '2020-07-20 23:18:09'),
(5, 'التوصيل في نفس اليوم', 'publish', 'ar', 'سيتم الشحن في غضون 10-15 يوما', '0', '1', '1', '2020-07-20 23:43:05', '2020-07-20 23:43:11'),
(6, 'شحن قياسي', 'publish', 'ar', 'سيتم الشحن في غضون 5-10 يوم.', '5', '2', '0', '2020-07-20 23:44:02', '2020-07-20 23:44:02'),
(7, 'Ücretsiz kargo', 'publish', 'tur', 'Gönderi 10-15 Gün içinde olacak', '0', '1', '1', '2020-07-20 23:44:34', '2020-07-20 23:45:09'),
(8, 'Standart Nakliye', 'publish', 'tur', 'Sevkiyat 5-10 Gün içinde olacaktır.', '4', '2', '0', '2020-07-20 23:45:04', '2020-07-20 23:45:04'),
(9, 'Envío gratis', 'publish', 'sp', 'El envío será dentro de 10-15 días', '0', '1', '1', '2020-07-20 23:45:46', '2020-07-20 23:46:20'),
(10, 'Envío estándar', 'publish', 'sp', 'El envío será dentro de 5-10 días.', '5', '2', '0', '2020-07-20 23:46:15', '2020-07-20 23:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `custom_fields` longtext COLLATE utf8mb4_unicode_ci,
  `attachment` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `custom_fields`, `attachment`, `status`, `created_at`, `updated_at`) VALUES
(1, 'a:4:{s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:12:\"your-subject\";s:4:\"test\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:6:\"sdfdsf\";}', 'a:0:{}', 'pending', '2020-07-27 23:42:53', '2020-07-27 23:42:53'),
(2, 'a:4:{s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:12:\"your-subject\";s:4:\"test\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:6:\"sdfdsf\";}', 'a:0:{}', 'pending', '2020-07-27 23:45:05', '2020-07-27 23:45:05'),
(3, 'a:4:{s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:12:\"your-subject\";s:9:\"Test mail\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:8:\"sdfadsfa\";}', 'a:0:{}', 'pending', '2020-07-30 11:39:01', '2020-07-30 11:39:01'),
(4, 'a:4:{s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:12:\"your-subject\";s:8:\"sfdsfdsf\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:9:\"asdfsadff\";}', 'a:0:{}', 'pending', '2020-07-30 11:39:32', '2020-07-30 11:39:32'),
(6, 'a:4:{s:9:\"your-name\";s:8:\"alkjsdkl\";s:12:\"your-subject\";s:10:\"kaljsdklsa\";s:10:\"your-email\";s:14:\"jklasd@asd.com\";s:12:\"your-message\";s:13:\"ajsdjsadljasl\";}', 'a:0:{}', 'pending', '2020-08-08 21:11:05', '2020-08-08 21:11:05'),
(7, 'a:4:{s:9:\"your-name\";s:4:\"sdfs\";s:12:\"your-subject\";s:10:\"dfsadfasdf\";s:10:\"your-email\";s:11:\"asdf@asd.co\";s:12:\"your-message\";s:70:\"asdasdasdasdasd asd asd asd asd asd asd  asd   as dasdsadsadas asd sad\";}', 'a:0:{}', 'pending', '2020-08-17 21:15:16', '2020-08-17 21:15:16'),
(8, 'a:4:{s:9:\"your-name\";s:4:\"Adam\";s:12:\"your-subject\";s:4:\"TEST\";s:10:\"your-email\";s:10:\"you@me.com\";s:12:\"your-message\";s:4:\"TEST\";}', 'a:0:{}', 'pending', '2020-08-18 21:49:31', '2020-08-18 21:49:31'),
(9, 'a:4:{s:9:\"your-name\";s:6:\"baidou\";s:12:\"your-subject\";s:4:\"abdl\";s:10:\"your-email\";s:17:\"baidou0@gmail.com\";s:12:\"your-message\";s:11:\"aegaega aaa\";}', 'a:1:{s:9:\"your-file\";s:52:\"assets/uploads/attachment/attachment-9-your-file.pdf\";}', 'pending', '2020-08-21 00:46:25', '2020-08-21 00:46:25'),
(10, 'a:4:{s:9:\"your-name\";s:5:\"chris\";s:12:\"your-subject\";s:22:\"plese i need webscript\";s:10:\"your-email\";s:18:\"angab704@gmail.com\";s:12:\"your-message\";s:54:\"angab704@gmail.comangab704@gmail.comangab704@gmail.com\";}', 'a:1:{s:9:\"your-file\";s:53:\"assets/uploads/attachment/attachment-10-your-file.txt\";}', 'pending', '2020-08-25 18:12:55', '2020-08-25 18:12:55'),
(11, 'a:4:{s:9:\"your-name\";s:7:\"sakjnkn\";s:12:\"your-subject\";s:6:\"kjsdnk\";s:10:\"your-email\";s:16:\"skdjf@kjb.cisfvs\";s:12:\"your-message\";s:5:\"fsvsv\";}', 'a:0:{}', 'pending', '2020-08-25 22:10:03', '2020-08-25 22:10:03'),
(12, 'a:4:{s:9:\"your-name\";s:3:\"tes\";s:12:\"your-subject\";s:6:\"tesaja\";s:10:\"your-email\";s:19:\"ravandaru@gmail.com\";s:12:\"your-message\";s:3:\"tes\";}', 'a:1:{s:9:\"your-file\";s:53:\"assets/uploads/attachment/attachment-12-your-file.pdf\";}', 'pending', '2020-09-24 16:07:45', '2020-09-24 16:07:45'),
(13, 'a:4:{s:9:\"your-name\";s:8:\"Khurshid\";s:12:\"your-subject\";s:2:\"xc\";s:10:\"your-email\";s:13:\"ceo@camano.uz\";s:12:\"your-message\";s:4:\"xcxc\";}', 'a:0:{}', 'pending', '2020-09-28 10:59:27', '2020-09-28 10:59:27'),
(14, 'a:4:{s:9:\"your-name\";s:10:\"dfjugdsufh\";s:12:\"your-subject\";s:9:\"dfhuheuif\";s:10:\"your-email\";s:26:\"thevishaldhameja@gmaol.com\";s:12:\"your-message\";s:14:\"efijweiojofiew\";}', 'a:1:{s:9:\"your-file\";s:53:\"assets/uploads/attachment/attachment-14-your-file.env\";}', 'pending', '2020-09-30 11:11:05', '2020-09-30 11:11:05'),
(15, 'a:4:{s:9:\"your-name\";s:4:\"dcdc\";s:12:\"your-subject\";s:4:\"dcdc\";s:10:\"your-email\";s:22:\"mitargmne.ge@gmail.com\";s:12:\"your-message\";s:3:\"bbv\";}', 'a:0:{}', 'pending', '2020-10-10 03:30:46', '2020-10-10 03:30:46'),
(16, 'a:4:{s:9:\"your-name\";s:4:\"test\";s:12:\"your-subject\";s:6:\"tester\";s:10:\"your-email\";s:15:\"test@tester.com\";s:12:\"your-message\";s:17:\"ddddddddddddddddd\";}', 'a:0:{}', 'pending', '2020-10-26 12:41:22', '2020-10-26 12:41:22'),
(17, 'a:5:{s:13:\"captcha_token\";N;s:9:\"your-name\";s:15:\"Sharifur Rahmam\";s:12:\"your-subject\";s:9:\"Test mail\";s:10:\"your-email\";s:18:\"dvrobin4@gmail.com\";s:12:\"your-message\";s:12:\"sdewrqwerqew\";}', 'a:1:{s:9:\"your-file\";s:93:\"assets/uploads/attachment/applicant/attachment-v4HIdpSeXQbUPoSCJ5FWyTs2k26xOk1p-your-file.pdf\";}', 'pending', '2020-12-07 13:35:50', '2020-12-07 13:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categories_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_tag` text COLLATE utf8mb4_unicode_ci,
  `slug` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sr_order` int(11) DEFAULT NULL,
  `price_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `icon`, `lang`, `categories_id`, `image`, `meta_tag`, `slug`, `meta_description`, `excerpt`, `status`, `description`, `icon_type`, `img_icon`, `sr_order`, `price_plan`, `created_at`, `updated_at`) VALUES
(1, 'Cyber Security', 'flaticon-cyber-security', 'en', '2', '25', NULL, 'cyber-security', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Building mr concerns servants in he outlived am breeding. He so lain good miss when sell some at if. Told hand so an rich gave next. How doubt yet again see son smart. While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old. </p>\r\n<p>\r\nPerpetual sincerity out suspected necessary one but provision satisfied. Respect nothing use set waiting pursuit nay you looking. If on prevailed concluded ye abilities. Address say you new but minuter greater. Do denied agreed in innate. Can and middletons thoroughly themselves him. Tolerably sportsmen belonging in september no am immediate newspaper. Theirs expect dinner it pretty indeed having no of. Principle september she conveying did eat may extensive. \r\n</p>', 'icon', NULL, NULL, 'a:2:{i:0;s:1:\"3\";i:1;s:1:\"4\";}', '2020-05-31 15:53:06', '2020-12-06 07:42:20'),
(2, 'Data Management', 'flaticon-mobile', 'en', '4', '21', NULL, 'data-management', 'meta description example', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Building mr concerns servants in he outlived am breeding. He so lain good miss when sell some at if. Told hand so an rich gave next. How doubt yet again see son smart. While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old. </p>\r\n<p>\r\nPerpetual sincerity out suspected necessary one but provision satisfied. Respect nothing use set waiting pursuit nay you looking. If on prevailed concluded ye abilities. Address say you new but minuter greater. Do denied agreed in innate. Can and middletons thoroughly themselves him. Tolerably sportsmen belonging in september no am immediate newspaper. Theirs expect dinner it pretty indeed having no of. Principle september she conveying did eat may extensive. \r\n</p>', NULL, NULL, NULL, NULL, '2020-06-01 10:45:26', '2020-06-01 12:10:41'),
(3, 'Data Science', 'flaticon-optimization', 'en', '1', '24', NULL, 'data-science', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Building mr concerns servants in he outlived am breeding. He so lain good miss when sell some at if. Told hand so an rich gave next. How doubt yet again see son smart. While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old. </p>\r\n<p>\r\nPerpetual sincerity out suspected necessary one but provision satisfied. Respect nothing use set waiting pursuit nay you looking. If on prevailed concluded ye abilities. Address say you new but minuter greater. Do denied agreed in innate. Can and middletons thoroughly themselves him. Tolerably sportsmen belonging in september no am immediate newspaper. Theirs expect dinner it pretty indeed having no of. Principle september she conveying did eat may extensive. \r\n</p>', NULL, NULL, NULL, NULL, '2020-06-01 11:38:39', '2020-06-01 12:19:05'),
(4, 'Cloud Service', 'flaticon-verified', 'en', '4', '20', NULL, 'cloud-service', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Building mr concerns servants in he outlived am breeding. He so lain good miss when sell some at if. Told hand so an rich gave next. How doubt yet again see son smart. While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old. </p>\r\n<p>\r\nPerpetual sincerity out suspected necessary one but provision satisfied. Respect nothing use set waiting pursuit nay you looking. If on prevailed concluded ye abilities. Address say you new but minuter greater. Do denied agreed in innate. Can and middletons thoroughly themselves him. Tolerably sportsmen belonging in september no am immediate newspaper. Theirs expect dinner it pretty indeed having no of. Principle september she conveying did eat may extensive. \r\n</p>', NULL, NULL, NULL, NULL, '2020-06-01 11:47:27', '2020-06-01 12:19:18'),
(5, 'Cloud Security', 'flaticon-mobile', 'en', '2', '19', NULL, 'cloud-security', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Building mr concerns servants in he outlived am breeding. He so lain good miss when sell some at if. Told hand so an rich gave next. How doubt yet again see son smart. While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old. </p>\r\n<p>\r\nPerpetual sincerity out suspected necessary one but provision satisfied. Respect nothing use set waiting pursuit nay you looking. If on prevailed concluded ye abilities. Address say you new but minuter greater. Do denied agreed in innate. Can and middletons thoroughly themselves him. Tolerably sportsmen belonging in september no am immediate newspaper. Theirs expect dinner it pretty indeed having no of. Principle september she conveying did eat may extensive. \r\n</p>', 'icon', NULL, NULL, 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}', '2020-06-01 12:15:10', '2020-12-06 07:26:09'),
(6, 'Analytics', 'flaticon-cyber', 'en', '2', '18', NULL, 'analytics', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Building mr concerns servants in he outlived am breeding. He so lain good miss when sell some at if. Told hand so an rich gave next. How doubt yet again see son smart. While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old. </p>\r\n<p>\r\nPerpetual sincerity out suspected necessary one but provision satisfied. Respect nothing use set waiting pursuit nay you looking. If on prevailed concluded ye abilities. Address say you new but minuter greater. Do denied agreed in innate. Can and middletons thoroughly themselves him. Tolerably sportsmen belonging in september no am immediate newspaper. Theirs expect dinner it pretty indeed having no of. Principle september she conveying did eat may extensive. \r\n</p>', NULL, NULL, NULL, NULL, '2020-06-01 12:15:53', '2020-06-01 12:19:47'),
(7, 'Optimization', 'flaticon-electronics', 'en', '4', '17', NULL, 'optimization', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Building mr concerns servants in he outlived am breeding. He so lain good miss when sell some at if. Told hand so an rich gave next. How doubt yet again see son smart. While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old. </p>\r\n<p>\r\nPerpetual sincerity out suspected necessary one but provision satisfied. Respect nothing use set waiting pursuit nay you looking. If on prevailed concluded ye abilities. Address say you new but minuter greater. Do denied agreed in innate. Can and middletons thoroughly themselves him. Tolerably sportsmen belonging in september no am immediate newspaper. Theirs expect dinner it pretty indeed having no of. Principle september she conveying did eat may extensive. \r\n</p>', NULL, NULL, NULL, NULL, '2020-06-01 12:16:18', '2020-06-01 12:20:06'),
(8, 'Data Engeneering', 'flaticon-team', 'en', '2', '15', 'hello,how ,are ,you', 'data-engeneering', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Building mr concerns servants in he outlived am breeding. He so lain good miss when sell some at if. Told hand so an rich gave next. How doubt yet again see son smart. While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old. </p>\r\n<p>\r\nPerpetual sincerity out suspected necessary one but provision satisfied. Respect nothing use set waiting pursuit nay you looking. If on prevailed concluded ye abilities. Address say you new but minuter greater. Do denied agreed in innate. Can and middletons thoroughly themselves him. Tolerably sportsmen belonging in september no am immediate newspaper. Theirs expect dinner it pretty indeed having no of. Principle september she conveying did eat may extensive. \r\n</p>', 'icon', NULL, NULL, 'a:1:{i:0;s:1:\"4\";}', '2020-06-01 12:16:59', '2020-12-06 07:30:16'),
(9, 'Veri Mühendisliği', 'flaticon-team', 'tur', '14', '15', NULL, 'veri-muhendisligi', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Bay bina, kuluçkahanede kulları ilgilendirir. O zaman bazı satmak zaman çok özledim. Sonra elini bir zengin verdi, sonra bir zengin verdi. Ne kadar şüphe duyuyorsun yine oğlunu akıllı gör. Ön tarafta büyük ayna varken. Daha büyük ilgili uyarlanmış devam girin. Bu sayede açık söz no. Geçmiş kaç yaşında oyunu soğuk kız ekleyin.</p>\r\n<p>Daimi samimiyet şüphesi gerekli olanı ancak hükmü karşıladı. Hiçbir şey saygı seyir seyir peşinde peşinde kullanın kullanın. Eğer galip geldiğinde yetenekleriniz var. Adres yeni diyor ama daha büyük. Doğuştan mutabık kalınmıştı. Can ve middletons iyice kendilerini. Eylül ayına ait hoşgörülü sporcular hemen gazete değilim. Onların oldukça güzel olan akşam yemeği bekliyoruz. Taşıdığı ilke eylül akşamları geniş olabilir.</p>', NULL, NULL, NULL, NULL, '2020-06-01 13:02:37', '2020-06-01 13:15:15'),
(10, 'Optimizasyon', 'flaticon-electronics', 'tur', '14', '17', NULL, 'optimizasyon', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Bay bina, kuluçkahanede kulları ilgilendirir. O zaman bazı satmak zaman çok özledim. Sonra elini bir zengin verdi, sonra bir zengin verdi. Ne kadar şüphe duyuyorsun yine oğlunu akıllı gör. Ön tarafta büyük ayna varken. Daha büyük ilgili uyarlanmış devam girin. Bu sayede açık söz no. Geçmiş kaç yaşında oyunu soğuk kız ekleyin.</p><p><br></p><p>Daimi samimiyet şüphesi gerekli olanı ancak hükmü karşıladı. Hiçbir şey saygı seyir seyir peşinde peşinde kullanın kullanın. Eğer galip geldiğinde yetenekleriniz var. Adres yeni diyor ama daha büyük. Doğuştan mutabık kalınmıştı. Can ve middletons iyice kendilerini. Eylül ayına ait hoşgörülü sporcular hemen gazete değilim. Onların oldukça güzel olan akşam yemeği bekliyoruz. Taşıdığı ilke eylül akşamları geniş olabilir.</p>', NULL, NULL, NULL, NULL, '2020-06-01 13:15:21', '2020-06-01 13:16:10'),
(11, 'analitik', 'flaticon-cyber', 'tur', '6', '18', NULL, 'analitik', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Bay bina, kuluçkahanede kulları ilgilendirir. O zaman bazı satmak zaman çok özledim. Sonra elini bir zengin verdi, sonra bir zengin verdi. Ne kadar şüphe duyuyorsun yine oğlunu akıllı gör. Ön tarafta büyük ayna varken. Daha büyük ilgili uyarlanmış devam girin. Bu sayede açık söz no. Geçmiş kaç yaşında oyunu soğuk kız ekleyin.</p><p><br></p><p>Daimi samimiyet şüphesi gerekli olanı ancak hükmü karşıladı. Hiçbir şey saygı seyir seyir peşinde peşinde kullanın kullanın. Eğer galip geldiğinde yetenekleriniz var. Adres yeni diyor ama daha büyük. Doğuştan mutabık kalınmıştı. Can ve middletons iyice kendilerini. Eylül ayına ait hoşgörülü sporcular hemen gazete değilim. Onların oldukça güzel olan akşam yemeği bekliyoruz. Taşıdığı ilke eylül akşamları geniş olabilir.</p>', NULL, NULL, NULL, NULL, '2020-06-01 13:16:23', '2020-06-01 13:16:53'),
(12, 'Bulut Güvenliği', 'flaticon-mobile', 'tur', '6', '19', NULL, 'bulut-guvenligi', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Bay bina, kuluçkahanede kulları ilgilendirir. O zaman bazı satmak zaman çok özledim. Sonra elini bir zengin verdi, sonra bir zengin verdi. Ne kadar şüphe duyuyorsun yine oğlunu akıllı gör. Ön tarafta büyük ayna varken. Daha büyük ilgili uyarlanmış devam girin. Bu sayede açık söz no. Geçmiş kaç yaşında oyunu soğuk kız ekleyin.</p><p><br></p><p>Daimi samimiyet şüphesi gerekli olanı ancak hükmü karşıladı. Hiçbir şey saygı seyir seyir peşinde peşinde kullanın kullanın. Eğer galip geldiğinde yetenekleriniz var. Adres yeni diyor ama daha büyük. Doğuştan mutabık kalınmıştı. Can ve middletons iyice kendilerini. Eylül ayına ait hoşgörülü sporcular hemen gazete değilim. Onların oldukça güzel olan akşam yemeği bekliyoruz. Taşıdığı ilke eylül akşamları geniş olabilir.</p>', NULL, NULL, NULL, NULL, '2020-06-01 13:17:14', '2020-06-01 14:46:16'),
(13, 'Bulut hizmeti', 'flaticon-verified', 'tur', '13', '20', NULL, 'bulut-hizmeti', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Bay bina, kuluçkahanede kulları ilgilendirir. O zaman bazı satmak zaman çok özledim. Sonra elini bir zengin verdi, sonra bir zengin verdi. Ne kadar şüphe duyuyorsun yine oğlunu akıllı gör. Ön tarafta büyük ayna varken. Daha büyük ilgili uyarlanmış devam girin. Bu sayede açık söz no. Geçmiş kaç yaşında oyunu soğuk kız ekleyin.</p><p><br></p><p>Daimi samimiyet şüphesi gerekli olanı ancak hükmü karşıladı. Hiçbir şey saygı seyir seyir peşinde peşinde kullanın kullanın. Eğer galip geldiğinde yetenekleriniz var. Adres yeni diyor ama daha büyük. Doğuştan mutabık kalınmıştı. Can ve middletons iyice kendilerini. Eylül ayına ait hoşgörülü sporcular hemen gazete değilim. Onların oldukça güzel olan akşam yemeği bekliyoruz. Taşıdığı ilke eylül akşamları geniş olabilir.</p>', NULL, NULL, NULL, NULL, '2020-06-01 13:17:20', '2020-06-01 14:45:45'),
(14, 'Veri Bilimi', 'flaticon-optimization', 'tur', '6', '24', NULL, 'veri-bilimi', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Bay bina, kuluçkahanede kulları ilgilendirir. O zaman bazı satmak zaman çok özledim. Sonra elini bir zengin verdi, sonra bir zengin verdi. Ne kadar şüphe duyuyorsun yine oğlunu akıllı gör. Ön tarafta büyük ayna varken. Daha büyük ilgili uyarlanmış devam girin. Bu sayede açık söz no. Geçmiş kaç yaşında oyunu soğuk kız ekleyin.</p><p><br></p><p>Daimi samimiyet şüphesi gerekli olanı ancak hükmü karşıladı. Hiçbir şey saygı seyir seyir peşinde peşinde kullanın kullanın. Eğer galip geldiğinde yetenekleriniz var. Adres yeni diyor ama daha büyük. Doğuştan mutabık kalınmıştı. Can ve middletons iyice kendilerini. Eylül ayına ait hoşgörülü sporcular hemen gazete değilim. Onların oldukça güzel olan akşam yemeği bekliyoruz. Taşıdığı ilke eylül akşamları geniş olabilir.</p>', NULL, NULL, NULL, NULL, '2020-06-01 13:17:28', '2020-06-01 14:32:07'),
(17, 'Siber güvenlik', 'flaticon-cyber-security', 'tur', '9', '25', NULL, 'siber-guvenlik', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Bay bina, kuluçkahanede kulları ilgilendirir. O zaman bazı satmak zaman çok özledim. Sonra elini bir zengin verdi, sonra bir zengin verdi. Ne kadar şüphe duyuyorsun yine oğlunu akıllı gör. Ön tarafta büyük ayna varken. Daha büyük ilgili uyarlanmış devam girin. Bu sayede açık söz no. Geçmiş kaç yaşında oyunu soğuk kız ekleyin.</p>\r\n<p>Daimi samimiyet şüphesi gerekli olanı ancak hükmü karşıladı. Hiçbir şey saygı seyir seyir peşinde peşinde kullanın kullanın. Eğer galip geldiğinde yetenekleriniz var. Adres yeni diyor ama daha büyük. Doğuştan mutabık kalınmıştı. Can ve middletons iyice kendilerini. Eylül ayına ait hoşgörülü sporcular hemen gazete değilim. Onların oldukça güzel olan akşam yemeği bekliyoruz. Taşıdığı ilke eylül akşamları geniş olabilir.</p>', NULL, NULL, NULL, NULL, '2020-06-01 13:17:53', '2020-06-01 14:31:18'),
(18, 'Ingeniería de datos', 'flaticon-team', 'sp', '12', '15', NULL, 'ingenieria-de-datos', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>El señor de la construcción concierne a los sirvientes porque sobrevivió a la cría. Él fue un gran señorita cuando vendió algunos en if. Dijo la mano así que un rico dio a continuación. Qué duda una vez más ver hijo inteligente. Mientras alegría grande de frente. Ye el mayor relacionado adaptado proceder ingresó un. A través de él examine la promesa expresa no. Pasado agregar tamaño juego chica fría de cuántos años.</p><p><br></p><p>Perpetua sinceridad presuntamente necesaria pero provisión satisfecha. Respeto a nada, use el juego esperando la búsqueda, no está buscando. Si en prevalecido concluyó sus habilidades. La dirección dice que eres nueva pero cada vez más grande. Do negó acordado en innato. Can y Middletons lo son a fondo. Tolerablemente deportistas pertenecientes a septiembre no soy periódico inmediato. La suya espera que la cena sea bastante buena sin tener nada. El principio de septiembre que ella transmitió comió puede ser extenso.</p>', NULL, NULL, NULL, NULL, '2020-06-01 14:46:26', '2020-06-01 14:56:37'),
(19, 'Mejoramiento', 'flaticon-electronics', 'sp', '12', '17', NULL, 'mejoramiento', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>El señor de la construcción concierne a los sirvientes porque sobrevivió a la cría. Él fue un gran señorita cuando vendió algunos en if. Dijo la mano así que un rico dio a continuación. Qué duda una vez más ver hijo inteligente. Mientras alegría grande de frente. Ye el mayor relacionado adaptado proceder ingresó un. A través de él examine la promesa expresa no. Pasado agregar tamaño juego chica fría de cuántos años.</p><p><br></p><p>Perpetua sinceridad presuntamente necesaria pero provisión satisfecha. Respeto a nada, use el juego esperando la búsqueda, no está buscando. Si en prevalecido concluyó sus habilidades. La dirección dice que eres nueva pero cada vez más grande. Do negó acordado en innato. Can y Middletons lo son a fondo. Tolerablemente deportistas pertenecientes a septiembre no soy periódico inmediato. La suya espera que la cena sea bastante buena sin tener nada. El principio de septiembre que ella transmitió comió puede ser extenso.</p>', NULL, NULL, NULL, NULL, '2020-06-01 14:46:32', '2020-06-01 14:53:40'),
(20, 'Analítica', 'flaticon-cyber', 'sp', '12', '18', NULL, 'analitica', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>El señor de la construcción concierne a los sirvientes porque sobrevivió a la cría. Él fue un gran señorita cuando vendió algunos en if. Dijo la mano así que un rico dio a continuación. Qué duda una vez más ver hijo inteligente. Mientras alegría grande de frente. Ye el mayor relacionado adaptado proceder ingresó un. A través de él examine la promesa expresa no. Pasado agregar tamaño juego chica fría de cuántos años.</p><p><br></p><p>Perpetua sinceridad presuntamente necesaria pero provisión satisfecha. Respeto a nada, use el juego esperando la búsqueda, no está buscando. Si en prevalecido concluyó sus habilidades. La dirección dice que eres nueva pero cada vez más grande. Do negó acordado en innato. Can y Middletons lo son a fondo. Tolerablemente deportistas pertenecientes a septiembre no soy periódico inmediato. La suya espera que la cena sea bastante buena sin tener nada. El principio de septiembre que ella transmitió comió puede ser extenso.</p>', NULL, NULL, NULL, NULL, '2020-06-01 14:46:38', '2020-06-01 14:51:37'),
(21, 'Seguridad en la nube', 'flaticon-mobile', 'sp', '7', '19', NULL, 'seguridad-en-la-nube', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>Bay bina, kuluçkahanede kulları ilgilendirir. O zaman bazı satmak zaman çok özledim. Sonra elini bir zengin verdi, sonra bir zengin verdi. Ne kadar şüphe duyuyorsun yine oğlunu akıllı gör. Ön tarafta büyük ayna varken. Daha büyük ilgili uyarlanmış devam girin. Bu sayede açık söz no. Geçmiş kaç yaşında oyunu soğuk kız ekleyin.</p><p><br></p><p>Daimi samimiyet şüphesi gerekli olanı ancak hükmü karşıladı. Hiçbir şey saygı seyir seyir peşinde peşinde kullanın kullanın. Eğer galip geldiğinde yetenekleriniz var. Adres yeni diyor ama daha büyük. Doğuştan mutabık kalınmıştı. Can ve middletons iyice kendilerini. Eylül ayına ait hoşgörülü sporcular hemen gazete değilim. Onların oldukça güzel olan akşam yemeği bekliyoruz. Taşıdığı ilke eylül akşamları geniş olabilir.</p>', NULL, NULL, NULL, NULL, '2020-06-01 14:46:44', '2020-06-01 14:50:57'),
(22, 'Servicio de almacenamiento en la nube', 'flaticon-verified', 'sp', '12', '20', NULL, 'servicio-de-almacenamiento-en-la-nube', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>El señor de la construcción concierne a los sirvientes porque sobrevivió a la cría. Él fue un gran señorita cuando vendió algunos en if. Dijo la mano así que un rico dio a continuación. Qué duda una vez más ver hijo inteligente. Mientras alegría grande de frente. Ye el mayor relacionado adaptado proceder ingresó un. A través de él examine la promesa expresa no. Pasado agregar tamaño juego chica fría de cuántos años.</p><p><br></p><p>Perpetua sinceridad presuntamente necesaria pero provisión satisfecha. Respeto a nada, use el juego esperando la búsqueda, no está buscando. Si en prevalecido concluyó sus habilidades. La dirección dice que eres nueva pero cada vez más grande. Do negó acordado en innato. Can y Middletons lo son a fondo. Tolerablemente deportistas pertenecientes a septiembre no soy periódico inmediato. La suya espera que la cena sea bastante buena sin tener nada. El principio de septiembre que ella transmitió comió puede ser extenso.</p>', NULL, NULL, NULL, NULL, '2020-06-01 14:57:17', '2020-06-01 14:58:27'),
(23, 'Ciencia de los datos', 'flaticon-optimization', 'sp', '15', '24', NULL, 'ciencia-de-los-datos', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>El señor de la construcción concierne a los sirvientes porque sobrevivió a la cría. Él fue un gran señorita cuando vendió algunos en if. Dijo la mano así que un rico dio a continuación. Qué duda una vez más ver hijo inteligente. Mientras alegría grande de frente. Ye el mayor relacionado adaptado proceder ingresó un. A través de él examine la promesa expresa no. Pasado agregar tamaño juego chica fría de cuántos años.</p><p><br></p><p>Perpetua sinceridad presuntamente necesaria pero provisión satisfecha. Respeto a nada, use el juego esperando la búsqueda, no está buscando. Si en prevalecido concluyó sus habilidades. La dirección dice que eres nueva pero cada vez más grande. Do negó acordado en innato. Can y Middletons lo son a fondo. Tolerablemente deportistas pertenecientes a septiembre no soy periódico inmediato. La suya espera que la cena sea bastante buena sin tener nada. El principio de septiembre que ella transmitió comió puede ser extenso.</p>', NULL, NULL, NULL, NULL, '2020-06-01 14:57:26', '2020-06-01 15:01:48'),
(24, 'إدارة البيانات', 'flaticon-mobile', 'ar', '16', '21', NULL, 'adar-albyanat', 'meta description example', 'خسر بعيدًا عن نصف مصباح بالقرب من السرير. في إشراك الأب البسيط للآخرين', 'publish', '<p>يهتم السيد بالعاملين الذين عاشوا وأنا أعيش. انه يربح جدا عندما تبيع بعض في إذا. قال اليد حتى أعطى الأغنياء بعد ذلك. كيف الشك مرة أخرى يرى ابن ذكي. بينما حجم كبير من الأمام. أيها دخل دخل تكييفها ذات الصلة أكبر. من خلال ذلك فحص الوعد الصريح لا. الماضي إضافة حجم لعبة فتاة باردة من كم عمرها.</p><p><br></p><p>الصدق الدائم من الضروري المشتبه فيه ولكن الحكم راضي. لا شيء يحترم استخدام تعيين انتظار السعي لا تبحث. إذا انتصرت على قدراتكم سادوا. العنوان يقول لك جديد ولكن minuter أكبر. هل نفى المتفق عليه فطريا. يمكن و middletons أنفسهم بدقة له. رياضيون محتملون ينتمون إلى سبتمبر لا توجد صحيفة فورية. إنهم يتوقعون العشاء وهو بالفعل لا يوجد به. قد يكون طعام سبتمبر الرئيسي الذي تنقله قد أكل كثيرًا.</p>', NULL, NULL, NULL, NULL, '2020-06-01 14:57:46', '2020-07-27 12:25:49'),
(25, 'La seguridad cibernética', 'flaticon-cyber-security', 'sp', '12', '25', NULL, 'la-seguridad-cibernetica', 'cyber security', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 'publish', '<p>El señor de la construcción concierne a los sirvientes porque sobrevivió a la cría. Él fue un gran señorita cuando vendió algunos en if. Dijo la mano así que un rico dio a continuación. Qué duda una vez más ver hijo inteligente. Mientras alegría grande de frente. Ye el mayor relacionado adaptado proceder ingresó un. A través de él examine la promesa expresa no. Pasado agregar tamaño juego chica fría de cuántos años.</p><p><br></p><p>Perpetua sinceridad presuntamente necesaria pero provisión satisfecha. Respeto a nada, use el juego esperando la búsqueda, no está buscando. Si en prevalecido concluyó sus habilidades. La dirección dice que eres nueva pero cada vez más grande. Do negó acordado en innato. Can y Middletons lo son a fondo. Tolerablemente deportistas pertenecientes a septiembre no soy periódico inmediato. La suya espera que la cena sea bastante buena sin tener nada. El principio de septiembre que ella transmitió comió puede ser extenso.</p>', NULL, NULL, NULL, NULL, '2020-06-01 14:57:53', '2020-06-01 15:08:37'),
(26, 'هندسة البيانات', 'flaticon-team', 'ar', '10', '15', NULL, 'hnds-albyanat', 'cyber security', 'خسر بعيدًا عن نصف مصباح بالقرب من السرير. في إشراك الأب البسيط للآخرين', 'publish', '<p>يهتم السيد بالعاملين الذين عاشوا وأنا أعيش. انه يربح جدا عندما تبيع بعض في إذا. قال اليد حتى أعطى الأغنياء بعد ذلك. كيف الشك مرة أخرى يرى ابن ذكي. بينما حجم كبير من الأمام. أيها دخل دخل تكييفها ذات الصلة أكبر. من خلال ذلك فحص الوعد الصريح لا. الماضي إضافة حجم لعبة فتاة باردة من كم عمرها.</p><p><br></p><p>الصدق الدائم من الضروري المشتبه فيه ولكن الحكم راضي. لا شيء يحترم استخدام تعيين انتظار السعي لا تبحث. إذا انتصرت على قدراتكم سادوا. العنوان يقول لك جديد ولكن minuter أكبر. هل نفى المتفق عليه فطريا. يمكن و middletons أنفسهم بدقة له. رياضيون محتملون ينتمون إلى سبتمبر لا توجد صحيفة فورية. إنهم يتوقعون العشاء وهو بالفعل لا يوجد به. قد يكون طعام سبتمبر الرئيسي الذي تنقله قد أكل كثيرًا.</p>', NULL, NULL, NULL, NULL, '2020-06-01 15:10:38', '2020-07-27 12:25:37'),
(27, 'الاقوي', 'flaticon-electronics', 'ar', '11', '17', NULL, 'alakoy', 'cyber security', 'خسر بعيدًا عن نصف مصباح بالقرب من السرير. في إشراك الأب البسيط للآخرين', 'publish', '<p>يهتم السيد بالعاملين الذين عاشوا وأنا أعيش. انه يربح جدا عندما تبيع بعض في إذا. قال اليد حتى أعطى الأغنياء بعد ذلك. كيف الشك مرة أخرى يرى ابن ذكي. بينما حجم كبير من الأمام. أيها دخل دخل تكييفها ذات الصلة أكبر. من خلال ذلك فحص الوعد الصريح لا. الماضي إضافة حجم لعبة فتاة باردة من كم عمرها.</p><p><br></p><p>الصدق الدائم من الضروري المشتبه فيه ولكن الحكم راضي. لا شيء يحترم استخدام تعيين انتظار السعي لا تبحث. إذا انتصرت على قدراتكم سادوا. العنوان يقول لك جديد ولكن minuter أكبر. هل نفى المتفق عليه فطريا. يمكن و middletons أنفسهم بدقة له. رياضيون محتملون ينتمون إلى سبتمبر لا توجد صحيفة فورية. إنهم يتوقعون العشاء وهو بالفعل لا يوجد به. قد يكون طعام سبتمبر الرئيسي الذي تنقله قد أكل كثيرًا.</p>', NULL, NULL, NULL, NULL, '2020-06-01 15:10:45', '2020-07-27 12:25:19'),
(28, 'تحليلات', 'flaticon-cyber', 'ar', '11', '18', NULL, 'thlylat', 'cyber security', 'خسر بعيدًا عن نصف مصباح بالقرب من السرير. في إشراك الأب البسيط للآخرين', 'publish', '<p>يهتم السيد بالعاملين الذين عاشوا وأنا أعيش. انه يربح جدا عندما تبيع بعض في إذا. قال اليد حتى أعطى الأغنياء بعد ذلك. كيف الشك مرة أخرى يرى ابن ذكي. بينما حجم كبير من الأمام. أيها دخل دخل تكييفها ذات الصلة أكبر. من خلال ذلك فحص الوعد الصريح لا. الماضي إضافة حجم لعبة فتاة باردة من كم عمرها.</p><p><br></p><p>الصدق الدائم من الضروري المشتبه فيه ولكن الحكم راضي. لا شيء يحترم استخدام تعيين انتظار السعي لا تبحث. إذا انتصرت على قدراتكم سادوا. العنوان يقول لك جديد ولكن minuter أكبر. هل نفى المتفق عليه فطريا. يمكن و middletons أنفسهم بدقة له. رياضيون محتملون ينتمون إلى سبتمبر لا توجد صحيفة فورية. إنهم يتوقعون العشاء وهو بالفعل لا يوجد به. قد يكون طعام سبتمبر الرئيسي الذي تنقله قد أكل كثيرًا.</p>', NULL, NULL, NULL, NULL, '2020-06-01 15:10:51', '2020-07-27 12:24:51'),
(29, 'الأمن السحابي', 'flaticon-mobile', 'ar', '5', '19', NULL, 'alamn-alshaby', 'cyber security', 'خسر بعيدًا عن نصف مصباح بالقرب من السرير. في إشراك الأب البسيط للآخرين', 'publish', '<p>يهتم السيد بالعاملين الذين عاشوا وأنا أعيش. انه يربح جدا عندما تبيع بعض في إذا. قال اليد حتى أعطى الأغنياء بعد ذلك. كيف الشك مرة أخرى يرى ابن ذكي. بينما حجم كبير من الأمام. أيها دخل دخل تكييفها ذات الصلة أكبر. من خلال ذلك فحص الوعد الصريح لا. الماضي إضافة حجم لعبة فتاة باردة من كم عمرها.</p><p><br></p><p>الصدق الدائم من الضروري المشتبه فيه ولكن الحكم راضي. لا شيء يحترم استخدام تعيين انتظار السعي لا تبحث. إذا انتصرت على قدراتكم سادوا. العنوان يقول لك جديد ولكن minuter أكبر. هل نفى المتفق عليه فطريا. يمكن و middletons أنفسهم بدقة له. رياضيون محتملون ينتمون إلى سبتمبر لا توجد صحيفة فورية. إنهم يتوقعون العشاء وهو بالفعل لا يوجد به. قد يكون طعام سبتمبر الرئيسي الذي تنقله قد أكل كثيرًا.</p>', NULL, NULL, NULL, NULL, '2020-06-01 15:10:57', '2020-07-27 12:24:30'),
(30, 'علوم البيانات', 'flaticon-optimization', 'ar', '10', '24', NULL, 'aalom-albyanat', 'cyber security', 'خسر بعيدًا عن نصف مصباح بالقرب من السرير. في إشراك الأب البسيط للآخرين', 'publish', '<p>يهتم السيد بالعاملين الذين عاشوا وأنا أعيش. انه يربح جدا عندما تبيع بعض في إذا. قال اليد حتى أعطى الأغنياء بعد ذلك. كيف الشك مرة أخرى يرى ابن ذكي. بينما حجم كبير من الأمام. أيها دخل دخل تكييفها ذات الصلة أكبر. من خلال ذلك فحص الوعد الصريح لا. الماضي إضافة حجم لعبة فتاة باردة من كم عمرها.</p><p><br></p><p>الصدق الدائم من الضروري المشتبه فيه ولكن الحكم راضي. لا شيء يحترم استخدام تعيين انتظار السعي لا تبحث. إذا انتصرت على قدراتكم سادوا. العنوان يقول لك جديد ولكن minuter أكبر. هل نفى المتفق عليه فطريا. يمكن و middletons أنفسهم بدقة له. رياضيون محتملون ينتمون إلى سبتمبر لا توجد صحيفة فورية. إنهم يتوقعون العشاء وهو بالفعل لا يوجد به. قد يكون طعام سبتمبر الرئيسي الذي تنقله قد أكل كثيرًا.</p>', NULL, NULL, NULL, NULL, '2020-06-01 15:11:05', '2020-07-27 12:23:53'),
(31, 'Virtually Build Your House In {color} Few Steps  {/color}', 'fas fa-exclamation-triangle', 'sp', '17', NULL, NULL, 'virtually-build-your-house-in-color-few-steps-color', NULL, 'asdfadsfdsf', 'publish', '<p>sdfdsafdsf</p>', 'icon', NULL, NULL, NULL, '2020-12-01 08:18:07', '2020-12-01 08:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `lang`, `status`, `created_at`, `updated_at`, `icon_type`, `icon`, `img_icon`) VALUES
(1, 'Web Design', 'en', 'publish', '2020-05-31 15:46:07', '2020-12-06 10:33:40', 'icon', 'flaticon-security', NULL),
(2, 'Web Developer', 'en', 'publish', '2020-05-31 15:46:14', '2020-12-06 10:33:29', 'icon', 'flaticon-electronics', NULL),
(3, 'UX/UI Design', 'en', 'publish', '2020-05-31 15:46:38', '2020-12-06 10:33:15', 'icon', 'flaticon-group', NULL),
(4, 'Mobile Apps', 'en', 'publish', '2020-05-31 15:46:44', '2020-12-06 10:33:02', 'icon', 'flaticon-security', NULL),
(5, 'تطبيقات الموبايل', 'ar', 'publish', '2020-05-31 15:47:32', '2020-05-31 15:47:32', NULL, NULL, NULL),
(6, 'Mobil uygulamalar', 'tur', 'publish', '2020-05-31 15:47:38', '2020-05-31 15:47:38', NULL, NULL, NULL),
(7, 'Mobil uygulamalar...', 'sp', 'publish', '2020-05-31 15:47:43', '2020-05-31 15:47:43', NULL, NULL, NULL),
(8, 'Diseño UX / UI', 'sp', 'publish', '2020-05-31 15:48:09', '2020-05-31 15:48:09', NULL, NULL, NULL),
(9, 'Diseño UX / UI', 'tur', 'publish', '2020-05-31 15:48:27', '2020-05-31 15:48:27', NULL, NULL, NULL),
(10, 'تصميم UX / UI', 'ar', 'publish', '2020-05-31 15:48:33', '2020-05-31 15:48:33', NULL, NULL, NULL),
(11, 'مطور ويب', 'ar', 'publish', '2020-05-31 15:48:47', '2020-05-31 15:48:47', NULL, NULL, NULL),
(12, 'Desarrollador web', 'sp', 'publish', '2020-05-31 15:48:55', '2020-05-31 15:48:55', NULL, NULL, NULL),
(13, 'Web Geliştiricisi', 'tur', 'publish', '2020-05-31 15:49:01', '2020-05-31 15:49:01', NULL, NULL, NULL),
(14, 'Web Tasarım', 'tur', 'publish', '2020-05-31 15:49:12', '2020-05-31 15:49:12', NULL, NULL, NULL),
(15, 'Diseño web', 'sp', 'publish', '2020-05-31 15:49:32', '2020-05-31 15:49:32', NULL, NULL, NULL),
(16, 'تم تصميم الموقع', 'ar', 'publish', '2020-05-31 15:49:38', '2020-05-31 15:49:38', NULL, NULL, NULL),
(17, 'asdfadsfsad', 'sp', 'publish', '2020-12-01 08:17:24', '2020-12-01 08:17:24', 'icon', 'fas fa-exclamation-triangle', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_icons`
--

CREATE TABLE `social_icons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_icons`
--

INSERT INTO `social_icons` (`id`, `icon`, `url`, `created_at`, `updated_at`) VALUES
(1, 'fab fa-twitter', 'https://twitter.com/xgenious1', '2020-06-19 13:55:51', '2020-06-19 14:09:12'),
(2, 'flaticon-facebook', 'https://www.facebook.com/xgenious', '2020-06-19 13:56:17', '2020-06-19 13:56:17'),
(3, 'fab fa-pinterest-p', '#', '2020-06-19 14:10:18', '2020-06-19 14:10:18'),
(4, 'fab fa-instagram', '#', '2020-06-19 14:10:35', '2020-06-19 14:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `static_options`
--

CREATE TABLE `static_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `static_options`
--

INSERT INTO `static_options` (`id`, `option_name`, `option_value`, `created_at`, `updated_at`) VALUES
(1, 'site_en_title', 'Nexelit', '2020-05-15 17:08:13', '2021-01-12 08:25:56'),
(2, 'site_en_tag_line', 'Multipurpose CMS & Startup Business Management System', '2020-05-15 17:08:13', '2021-01-12 08:25:56'),
(3, 'site_en_footer_copyright', '{copy}  {year}  All right reserved by  <a href=\"https://xgenious.com\">xgenious</a>', '2020-05-15 17:08:13', '2021-01-12 08:25:56'),
(4, 'site_color', '#ff8a73', '2020-05-15 17:08:13', '2021-01-12 08:25:56'),
(5, 'site_main_color_two', '#5580ff', '2020-05-15 17:08:13', '2021-01-12 08:25:56'),
(6, 'site_heading_color', '#0a1121', '2020-05-15 17:08:13', '2021-01-12 08:25:56'),
(7, 'site_paragraph_color', '#878a95', '2020-05-15 17:08:13', '2021-01-12 08:25:56'),
(8, 'site_rtl_enabled', NULL, '2020-05-15 17:08:13', '2021-01-12 08:25:56'),
(9, 'site_admin_dark_mode', NULL, '2020-05-15 17:08:13', '2021-01-12 08:25:56'),
(10, 'site_maintenance_mode', NULL, '2020-05-15 17:08:13', '2021-01-12 08:25:56'),
(11, 'site_payment_gateway', 'on', '2020-05-15 17:08:13', '2021-01-12 08:25:56'),
(12, 'site_logo', '115', '2020-05-15 17:16:30', '2020-11-18 03:52:30'),
(13, 'site_favicon', '38', '2020-05-15 17:16:30', '2020-11-18 03:52:30'),
(14, 'site_breadcrumb_bg', '3', '2020-05-15 17:16:30', '2020-11-18 03:52:30'),
(15, 'site_white_logo', '5', '2020-05-15 17:16:30', '2020-11-18 03:52:30'),
(16, 'site_tur_title', 'Nexelit', '2020-05-19 07:34:19', '2021-01-12 08:25:56'),
(17, 'site_tur_tag_line', 'Çok Amaçlı CMS ve Başlangıç İşletme Yönetim Sistemi', '2020-05-19 07:34:19', '2021-01-12 08:25:56'),
(18, 'site_tur_footer_copyright', '{copy} {year} Tüm hakları <a href=\"https://xgenious.com\"> </a> tarafından saklıdır.', '2020-05-19 07:34:20', '2021-01-12 08:25:56'),
(19, 'site_ar_title', 'نكسيلس', '2020-05-19 07:34:20', '2021-01-12 08:25:56'),
(20, 'site_ar_tag_line', 'CMS متعددة الأغراض ونظام بدء الأعمال التجارية', '2020-05-19 07:34:20', '2021-01-12 08:25:56'),
(21, 'site_ar_footer_copyright', '{copy} {year} جميع الحقوق محفوظة بواسطة <a href=\"https://xgenious.com\"> </a>', '2020-05-19 07:34:20', '2021-01-12 08:25:56'),
(22, 'site_sp_title', 'Nexelit', '2020-05-19 07:34:20', '2021-01-12 08:25:56'),
(23, 'site_sp_tag_line', 'CMS multipropósito y sistema de gestión empresarial de inicio', '2020-05-19 07:34:20', '2021-01-12 08:25:56'),
(24, 'site_sp_footer_copyright', '{copy} {year} Todos los derechos reservados por <a href=\"https://xgenious.com\"> </a>', '2020-05-19 07:34:20', '2021-01-12 08:25:56'),
(25, 'site_meta_tags', 'nexelit ,multipupose,cms', '2020-05-19 07:35:49', '2020-05-19 07:35:49'),
(26, 'site_meta_description', 'nexelit mulipopose cms', '2020-05-19 07:35:49', '2020-05-19 07:35:49'),
(27, 'about_page_slug', 'about', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(28, 'service_page_slug', 'service', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(29, 'works_page_slug', 'works', '2020-05-27 20:15:01', '2020-05-29 17:37:23'),
(30, 'team_page_slug', 'team', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(31, 'faq_page_slug', 'faq', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(32, 'price_plan_page_slug', 'price-plan', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(33, 'blog_page_slug', 'blog', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(34, 'contact_page_slug', 'contact', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(35, 'career_with_us_page_slug', 'career', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(36, 'events_page_slug', 'events', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(37, 'knowledgebase_page_slug', 'knowledgebase', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(38, 'about_page_en_name', 'About', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(39, 'service_page_en_name', 'Service', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(40, 'work_page_en_name', 'Case Study', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(41, 'team_page_en_name', 'Team', '2020-05-27 20:15:01', '2020-08-11 22:33:15'),
(42, 'faq_page_en_name', 'Faq', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(43, 'price_plan_page_en_name', 'Price Plan', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(44, 'blog_page_en_name', 'Blog', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(45, 'contact_page_en_name', 'Contact', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(46, 'career_with_us_page_en_name', 'Career With Us', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(47, 'events_page_en_name', 'Events', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(48, 'knowledgebase_page_en_name', 'Knowledgebase', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(49, 'about_page_tur_name', 'hakkında', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(50, 'service_page_tur_name', 'Hizmet', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(51, 'work_page_tur_name', 'Vaka Analizi', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(52, 'team_page_tur_name', 'Takım', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(53, 'faq_page_tur_name', 'SSS', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(54, 'price_plan_page_tur_name', 'Fiyat Planı', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(55, 'blog_page_tur_name', 'Blog', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(56, 'contact_page_tur_name', 'İletişim', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(57, 'career_with_us_page_tur_name', 'Bizimle Kariyer', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(58, 'events_page_tur_name', 'Etkinlikler', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(59, 'knowledgebase_page_tur_name', 'Bilgi tabanı', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(60, 'about_page_ar_name', 'حول', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(61, 'service_page_ar_name', 'الخدمات', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(62, 'work_page_ar_name', 'دراسة الحالة', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(63, 'team_page_ar_name', 'الفريق', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(64, 'faq_page_ar_name', 'التعليمات', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(65, 'price_plan_page_ar_name', 'خطة الأسعار', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(66, 'blog_page_ar_name', 'مدونة', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(67, 'contact_page_ar_name', 'اتصل', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(68, 'career_with_us_page_ar_name', 'مهنة معنا', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(69, 'events_page_ar_name', 'الأحداث', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(70, 'knowledgebase_page_ar_name', 'قاعدة المعرفة', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(71, 'about_page_sp_name', 'Acerca de', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(72, 'service_page_sp_name', 'Servicio', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(73, 'work_page_sp_name', 'Caso de estudio', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(74, 'team_page_sp_name', 'Equipo', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(75, 'faq_page_sp_name', 'Preguntas más frecuentes', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(76, 'price_plan_page_sp_name', 'Plan de precios', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(77, 'blog_page_sp_name', 'Blog', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(78, 'contact_page_sp_name', 'Contacto', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(79, 'career_with_us_page_sp_name', 'Carrera con nosotras', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(80, 'events_page_sp_name', 'Eventos', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(81, 'knowledgebase_page_sp_name', 'Base de conocimientos', '2020-05-27 20:15:01', '2020-08-11 22:33:16'),
(82, 'work_page_slug', 'case-study', '2020-05-29 17:40:27', '2020-08-11 22:33:15'),
(83, 'site_meta_en_tags', 'hello,meta ,tag,multilangual', '2020-05-30 14:55:49', '2020-05-30 14:55:49'),
(84, 'site_meta_en_description', 'this is multilingual example meta tag for english', '2020-05-30 14:55:49', '2020-05-30 14:55:49'),
(85, 'navbar_button', 'on', '2020-05-30 16:00:20', '2020-06-19 14:25:57'),
(86, 'navbar_button_custom_url', '#', '2020-05-30 16:00:20', '2020-06-19 14:25:57'),
(87, 'navbar_button_custom_url_status', NULL, '2020-05-30 16:00:20', '2020-06-19 14:25:57'),
(88, 'site_header_type', 'navbar', '2020-05-30 16:00:20', '2020-05-30 16:17:40'),
(89, 'navbar_en_button_text', 'Get A Quote', '2020-05-30 16:00:20', '2020-06-19 14:25:57'),
(90, 'navbar_tur_button_text', 'Teklif Alın', '2020-05-30 16:00:20', '2020-06-19 14:25:57'),
(91, 'navbar_ar_button_text', 'إقتبس', '2020-05-30 16:00:20', '2020-06-19 14:25:57'),
(92, 'navbar_sp_button_text', 'Consigue una cotización', '2020-05-30 16:00:21', '2020-06-19 14:25:58'),
(93, 'home_page_variant', '01', '2020-05-30 18:46:26', '2021-01-13 05:29:53'),
(94, 'body_font_family', 'Nunito', '2020-05-31 10:37:18', '2020-05-31 11:30:18'),
(95, 'heading_font_family', 'Poppins', '2020-05-31 10:37:18', '2020-05-31 11:30:18'),
(96, 'heading_font', NULL, '2020-05-31 10:37:18', '2020-05-31 11:30:18'),
(97, 'body_font_variant', 'a:4:{i:0;s:7:\"regular\";i:1;s:3:\"600\";i:2;s:3:\"700\";i:3;s:3:\"800\";}', '2020-05-31 10:37:18', '2020-05-31 11:30:18'),
(98, 'heading_font_variant', 'a:1:{i:0;s:7:\"regular\";}', '2020-05-31 10:37:18', '2020-05-31 11:30:18'),
(99, 'home_page_01_en_about_us_title', 'We have 15 Years of Experience of any kind it solution', '2020-05-31 11:31:18', '2020-07-27 03:13:51'),
(100, 'home_page_01_en_about_us_button_status', NULL, '2020-05-31 11:31:18', '2020-05-31 11:31:18'),
(101, 'home_page_01_tur_about_us_button_status', NULL, '2020-05-31 11:31:18', '2020-05-31 11:31:18'),
(102, 'home_page_01_ar_about_us_button_status', NULL, '2020-05-31 11:31:18', '2020-05-31 11:31:18'),
(103, 'home_page_01_sp_about_us_button_status', NULL, '2020-05-31 11:31:18', '2020-05-31 11:31:18'),
(104, 'home_page_01_en_about_us_video_url', 'https://www.youtube.com/watch?v=wp_QA1PRZiE', '2020-05-31 11:39:02', '2020-07-27 01:56:10'),
(105, 'home_page_01_about_us_video_background_image', '26', '2020-05-31 11:39:02', '2020-05-31 11:39:03'),
(106, 'home_page_01_tur_about_us_title', 'Her türlü IT çözümünün 15 Yıllık Deneyimine sahibiz', '2020-05-31 11:39:02', '2020-07-27 03:13:51'),
(107, 'home_page_01_tur_about_us_video_url', 'https://www.youtube.com/watch?v=wp_QA1PRZiE', '2020-05-31 11:39:02', '2020-07-27 01:56:10'),
(108, 'home_page_01_ar_about_us_title', 'لدينا 15 عاما من الخبرة من أي نوع', '2020-05-31 11:39:03', '2020-07-27 03:13:51'),
(109, 'home_page_01_ar_about_us_video_url', 'https://www.youtube.com/watch?v=wp_QA1PRZiE', '2020-05-31 11:39:03', '2020-07-27 01:56:10'),
(110, 'home_page_01_sp_about_us_title', 'Tenemos 15 años de experiencia de cualquier tipo.', '2020-05-31 11:39:03', '2020-07-27 03:13:51'),
(111, 'home_page_01_sp_about_us_video_url', 'https://www.youtube.com/watch?v=wp_QA1PRZiE', '2020-05-31 11:39:03', '2020-07-27 01:56:10'),
(112, 'home_page_01_en_service_area_title', 'What We Do', '2020-05-31 15:05:10', '2020-05-31 15:09:48'),
(113, 'home_page_01_en_service_area_description', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum.', '2020-05-31 15:05:10', '2020-05-31 15:09:48'),
(114, 'home_page_01_tur_service_area_title', 'Neler Yapıyoruz', '2020-05-31 15:05:10', '2020-05-31 15:09:49'),
(115, 'home_page_01_tur_service_area_description', 'Maecenas tempus tellus eget condimentum rhoncus, her zaman özgür olduğundan ay, ama kendisi ne de amet adipiscing sem.', '2020-05-31 15:05:10', '2020-05-31 15:09:49'),
(116, 'home_page_01_ar_service_area_title', 'الذي نفعله', '2020-05-31 15:05:10', '2020-05-31 15:09:49'),
(117, 'home_page_01_ar_service_area_description', 'أيها دخل دخل تكييفها ذات الصلة أكبر. من خلال ذلك فحص الوعد الصريح لا. الماضي إضافة حجم اللعبة البارد', '2020-05-31 15:05:10', '2020-05-31 15:09:49'),
(118, 'home_page_01_sp_service_area_title', 'Lo que hacemos', '2020-05-31 15:05:10', '2020-05-31 15:09:49'),
(119, 'home_page_01_sp_service_area_description', 'Maecenas tempus tellus eget condimentum rhoncus, mes de lo que siempre es libre, pero que él mismo, ni tampoco se sienta adipiscing sem.', '2020-05-31 15:05:10', '2020-05-31 15:09:49'),
(120, 'home_page_01_service_area_items', '6', '2020-05-31 15:05:10', '2021-01-09 05:27:25'),
(121, 'home_page_01_service_area_background_image', '26', '2020-05-31 15:05:10', '2020-05-31 15:09:49'),
(122, 'home_page_01_en_quality_area_title', 'We provide quality solutions for clients', '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(123, 'home_page_01_en_quality_area_description', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero. Curabitur ullamcorper ultricies nisi. Nameget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum.', '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(124, 'home_page_01_en_quality_area_button_status', NULL, '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(125, 'home_page_01_en_quality_area_button_title', NULL, '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(126, 'home_page_01_en_quality_area_button_url', NULL, '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(127, 'home_page_01_tur_quality_area_title', 'Müşterilerimize kaliteli çözümler sunuyoruz', '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(128, 'home_page_01_tur_quality_area_description', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero. Curabitur ullamcorper ultricies nisi. Nameget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum.', '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(129, 'home_page_01_tur_quality_area_button_status', NULL, '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(130, 'home_page_01_tur_quality_area_button_title', NULL, '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(131, 'home_page_01_tur_quality_area_button_url', NULL, '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(132, 'home_page_01_ar_quality_area_title', 'نحن نقدم حلول الجودة للعملاء', '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(133, 'home_page_01_ar_quality_area_description', 'هل نقلت نفسك تعلم أنها رجل الرد عليها. شقيقة شقي يعيشها أنت تمكن السيدة من روح حقا. الرعية تعارض الإصلاح هو لي البؤس. قد يرى سريع الاسلوب بعد السيدة المال.', '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(134, 'home_page_01_ar_quality_area_button_status', NULL, '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(135, 'home_page_01_ar_quality_area_button_title', NULL, '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(136, 'home_page_01_ar_quality_area_button_url', NULL, '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(137, 'home_page_01_sp_quality_area_title', 'Brindamos soluciones de calidad para clientes.', '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(138, 'home_page_01_sp_quality_area_description', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam sempre libero. Curabitur ullamcorper ultricies nisi. Nameget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum.', '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(139, 'home_page_01_sp_quality_area_button_status', NULL, '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(140, 'home_page_01_sp_quality_area_button_title', NULL, '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(141, 'home_page_01_sp_quality_area_button_url', NULL, '2020-06-01 18:16:10', '2020-07-27 03:16:49'),
(142, 'home_page_01_quality_area_background_image', '88', '2020-06-01 18:16:10', '2020-07-27 02:04:41'),
(143, 'home_page_01_en_case_study_title', 'Latest Case Studies', '2020-06-02 06:49:14', '2020-07-27 02:00:24'),
(144, 'home_page_01_en_case_study_description', 'Those an equal point no years do. Depend warmth fat but her but played. Shy and subjects wondered trifling pleasant.', '2020-06-02 06:49:14', '2020-07-27 02:00:24'),
(145, 'home_page_01_tur_case_study_title', 'Son Örnek Olaylar', '2020-06-02 06:49:14', '2020-07-27 02:00:24'),
(146, 'home_page_01_tur_case_study_description', 'Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu.', '2020-06-02 06:49:14', '2020-07-27 02:00:24'),
(147, 'home_page_01_ar_case_study_title', 'أحدث دراسات الحالة', '2020-06-02 06:49:14', '2020-07-27 02:00:24'),
(148, 'home_page_01_ar_case_study_description', 'تلك نقطة متساوية لا تفعله سنوات. تعتمد على دفء الدهون ولكن هي لعبت. تساءل الخجول والمواضيع تافهة ممتعة.', '2020-06-02 06:49:14', '2020-07-27 02:00:24'),
(149, 'home_page_01_sp_case_study_title', 'Últimos estudios de caso', '2020-06-02 06:49:14', '2020-07-27 02:00:24'),
(150, 'home_page_01_sp_case_study_description', 'Esos son un punto igual sin años. Dependen del calor gordo pero ella pero juega. Tímidos y súbditos se preguntaban trivialmente agradables.', '2020-06-02 06:49:14', '2020-07-27 02:00:24'),
(151, 'work_single_page_en_related_work_title', NULL, '2020-06-03 18:30:23', '2020-06-03 18:30:23'),
(152, 'work_single_page_tur_related_work_title', NULL, '2020-06-03 18:30:23', '2020-06-03 18:30:23'),
(153, 'work_single_page_ar_related_work_title', NULL, '2020-06-03 18:30:23', '2020-06-03 18:30:23'),
(154, 'work_single_page_sp_related_work_title', NULL, '2020-06-03 18:30:23', '2020-06-03 18:30:23'),
(155, 'case_study_en_read_more_text', 'Case Study', '2020-06-03 18:32:41', '2020-06-21 08:10:47'),
(156, 'case_study_tur_read_more_text', 'Vaka Analizi', '2020-06-03 18:32:41', '2020-06-21 08:10:47'),
(157, 'case_study_ar_read_more_text', 'دراسة الحالة', '2020-06-03 18:32:41', '2020-06-21 08:10:47'),
(158, 'case_study_sp_read_more_text', 'Caso de estudio', '2020-06-03 18:32:41', '2020-06-21 08:10:47'),
(159, 'error_404_page_en_title', '404', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(160, 'error_404_page_en_subtitle', 'Oops! This Page Could Not Be Found', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(161, 'error_404_page_en_paragraph', 'Sorry but the page you are looking for does not exist, have been removed. name changed or is temporarily unavailable', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(162, 'error_404_page_en_button_text', 'Go To Home Page', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(163, 'error_404_page_tur_title', '404', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(164, 'error_404_page_tur_subtitle', 'Hata! Bu Sayfa Bulunamadı', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(165, 'error_404_page_tur_paragraph', 'Maalesef, aradığınız sayfa mevcut değil, kaldırıldı. ad değiştirildi veya geçici olarak kullanılamıyor', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(166, 'error_404_page_tur_button_text', 'Ana sayfaya git', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(167, 'error_404_page_ar_title', '404', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(168, 'error_404_page_ar_subtitle', 'وجه الفتاة! تعذر العثور على هذه الصفحة', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(169, 'error_404_page_ar_paragraph', 'عذرًا ، الصفحة التي تبحث عنها غير موجودة ، تمت إزالتها. تم تغيير الاسم أو غير متاح مؤقتًا', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(170, 'error_404_page_ar_button_text', 'انتقل إلى الصفحة الرئيسية', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(171, 'error_404_page_sp_title', '404', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(172, 'error_404_page_sp_subtitle', '¡Uy! Esta página no se pudo encontrar', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(173, 'error_404_page_sp_paragraph', 'Lo sentimos, pero la página que busca no existe, se ha eliminado. nombre cambiado o no está disponible temporalmente', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(174, 'error_404_page_sp_button_text', 'Ir a la página de inicio', '2020-06-04 19:52:52', '2020-06-04 19:55:03'),
(175, 'home_page_01_en_testimonial_section_title', 'Clients Testimonial', '2020-06-04 20:19:48', '2020-07-27 03:17:48'),
(176, 'home_page_01_tur_testimonial_section_title', 'Müşteri Görüşleri', '2020-06-04 20:19:48', '2020-07-27 03:17:48'),
(177, 'home_page_01_ar_testimonial_section_title', 'شهادات العملاء', '2020-06-04 20:19:48', '2020-07-27 03:17:48'),
(178, 'home_page_01_sp_testimonial_section_title', 'Testimonio de clientes', '2020-06-04 20:19:48', '2020-07-27 03:17:48'),
(179, 'home_page_01_en_price_plan_section_title', 'Pricing Plans For Our All Services', '2020-06-06 17:22:58', '2020-08-27 09:25:01'),
(180, 'home_page_01_en_price_plan_section_description', 'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero. Curabitur ullamcorper ultricies nisi. Nameget dui.', '2020-06-06 17:22:58', '2020-08-27 09:25:01'),
(181, 'home_page_01_tur_price_plan_section_title', 'Tüm Hizmetlerimiz İçin Fiyat Planları', '2020-06-06 17:22:58', '2020-08-27 09:25:01'),
(182, 'home_page_01_tur_price_plan_section_description', 'Birkaç hata sevinç başladı acı verici kaldırıldı sona ulaştı dedi. Devlet patlaması düşünmek son vardır. Geldi onu yaşlı sevgili onu', '2020-06-06 17:22:58', '2020-08-27 09:25:01'),
(183, 'home_page_01_ar_price_plan_section_title', 'خطط التسعير لجميع خدماتنا', '2020-06-06 17:22:58', '2020-08-27 09:25:01'),
(184, 'home_page_01_ar_price_plan_section_description', 'بدأت عدة أخطاء فرحة تقول مؤلمة إزالتها وصلت إلى نهايتها. انفجار الدولة يعتقد نهاية لها. نزلت وهي مسنة تحبه', '2020-06-06 17:22:58', '2020-08-27 09:25:01'),
(185, 'home_page_01_sp_price_plan_section_title', 'Planes de precios para todos nuestros servicios', '2020-06-06 17:22:58', '2020-08-27 09:25:01'),
(186, 'home_page_01_sp_price_plan_section_description', 'Comenzaron varios errores de alegría, dicen que dolorosa, eliminada, llegó al final. Explosión de estado piensa fin son sus. Llegó ella anciana lo amaba', '2020-06-06 17:22:58', '2020-08-27 09:25:01'),
(187, 'home_page_01_price_plan_section_items', '4', '2020-06-06 17:22:59', '2020-08-27 09:25:01'),
(188, 'home_page_01_price_plan_background_image', '90', '2020-06-06 17:23:47', '2020-08-27 09:25:01'),
(189, 'home_page_01_en_latest_news_title', 'Latest Blog', '2020-06-12 06:06:44', '2020-06-12 06:07:16'),
(190, 'home_page_01_en_latest_news_description', 'Depart do be so he enough talent. Sociable formerly six but handsome. Up do view time they shot. He concluded disposing', '2020-06-12 06:06:44', '2020-06-12 06:07:16'),
(191, 'home_page_01_tur_latest_news_title', 'Son Blog', '2020-06-12 06:06:44', '2020-06-12 06:07:16'),
(192, 'home_page_01_tur_latest_news_description', 'Kalkmak o kadar yetenekli. Sociable eski altı ama yakışıklı. Yukarı atış zamanını yapmak. Bertaraf etti', '2020-06-12 06:06:44', '2020-06-12 06:07:16'),
(193, 'home_page_01_ar_latest_news_title', 'أحدث مدونة', '2020-06-12 06:06:44', '2020-06-12 06:07:16'),
(194, 'home_page_01_ar_latest_news_description', 'مغادرة يكون ذلك يكفي من المواهب. مؤنس سابقا ستة ولكن وسيم. لأعلى وقت العرض الذي أطلقوه. وخلص التصرف', '2020-06-12 06:06:44', '2020-06-12 06:07:16'),
(195, 'home_page_01_sp_latest_news_title', 'Blog más reciente', '2020-06-12 06:06:44', '2020-06-12 06:07:16'),
(196, 'home_page_01_sp_latest_news_description', 'Partir sea así que él tiene suficiente talento. Sociable anteriormente seis pero guapo. Hasta ver el tiempo que dispararon. Concluyó desechando', '2020-06-12 06:06:44', '2020-06-12 06:07:16'),
(197, 'home_page_01_en_contact_area_title', 'Get In Touch', '2020-06-12 09:29:47', '2020-06-12 09:31:11'),
(198, 'home_page_01_en_contact_area_button_text', 'Send Message', '2020-06-12 09:29:47', '2020-06-12 09:31:11'),
(199, 'home_page_01_tur_contact_area_title', 'Temasta olmak', '2020-06-12 09:29:47', '2020-06-12 09:31:11'),
(200, 'home_page_01_tur_contact_area_button_text', 'Mesaj gönder', '2020-06-12 09:29:48', '2020-06-12 09:31:11'),
(201, 'home_page_01_ar_contact_area_title', 'ابقى على تواصل', '2020-06-12 09:29:48', '2020-06-12 09:31:11'),
(202, 'home_page_01_ar_contact_area_button_text', 'أرسل رسالة', '2020-06-12 09:29:48', '2020-06-12 09:31:11'),
(203, 'home_page_01_sp_contact_area_title', 'Ponerse en contacto', '2020-06-12 09:29:48', '2020-06-12 09:31:11'),
(204, 'home_page_01_sp_contact_area_button_text', 'Enviar mensaje', '2020-06-12 09:29:48', '2020-06-12 09:31:11'),
(205, 'home_page_01_contact_area_map_location', 'New York, NY, USA', '2020-06-12 09:29:48', '2020-06-12 09:31:11'),
(206, 'call_back_page_form_fields', '{\"field_type\":[\"text\",\"text\"],\"field_name\":[\"\",\"checkbox\"],\"field_placeholder\":[null,\"Checkbox\"]}', '2020-06-12 17:44:29', '2020-06-13 06:43:12'),
(207, 'get_in_touch_form_fields', '{\"field_type\":[\"text\",\"email\",\"url\",\"tel\",\"textarea\"],\"field_name\":[\"your-name\",\"your-email\",\"\",\"your-phone\",\"your-message\"],\"field_placeholder\":[\"Your Name\",\"Your Email\",null,\"Your Phone\",\"Your Message\"],\"field_required\":{\"1\":\"on\",\"3\":\"on\",\"4\":\"on\"}}', '2020-06-13 07:02:58', '2020-08-26 14:54:26'),
(208, 'order_mail_en_success_message', 'Thanks for your order. we will contact you soon.', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(209, 'quote_mail_en_success_message', 'Thanks for your contact. we will contact you soon.', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(210, 'contact_mail_en_success_message', 'Thanks for your contact!!', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(211, 'get_in_touch_mail_en_success_message', 'Thanks for your contact!!', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(212, 'order_mail_tur_success_message', 'Siparişiniz için teşekkürler. yakında sizinle iletişime geçeceğiz.', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(213, 'quote_mail_tur_success_message', 'İletişiminiz için teşekkürler. yakında sizinle iletişime geçeceğiz.', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(214, 'contact_mail_tur_success_message', 'İletişiminiz için teşekkürler !!', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(215, 'get_in_touch_mail_tur_success_message', 'İletişiminiz için teşekkürler !!', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(216, 'order_mail_ar_success_message', 'شكرا لطلبك. سوف نتصل بك قريبا.', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(217, 'quote_mail_ar_success_message', 'شكرا لاتصالك. سوف نتصل بك قريبا.', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(218, 'contact_mail_ar_success_message', 'شكرا لاتصالك !!', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(219, 'get_in_touch_mail_ar_success_message', 'شكرا لاتصالك !!', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(220, 'order_mail_sp_success_message', 'Gracias por tu orden. Nos pondremos en contacto con usted pronto.', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(221, 'quote_mail_sp_success_message', 'Gracias por tu contacto. Nos pondremos en contacto con usted pronto.', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(222, 'contact_mail_sp_success_message', 'Gracias por tu contacto !!', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(223, 'get_in_touch_mail_sp_success_message', 'Gracias por tu contacto !!', '2020-06-13 16:16:56', '2020-07-29 19:25:46'),
(224, 'site_smtp_mail_host', 'smtp.example.com', '2020-06-13 17:29:43', '2020-10-04 12:20:35'),
(225, 'site_smtp_mail_port', '587', '2020-06-13 17:29:43', '2020-10-04 12:20:35'),
(226, 'site_smtp_mail_username', 'example@example.com', '2020-06-13 17:29:43', '2020-10-04 12:20:35'),
(227, 'site_smtp_mail_password', '123456', '2020-06-13 17:29:43', '2020-10-04 12:20:35'),
(228, 'site_smtp_mail_encryption', 'ssl', '2020-06-13 17:29:43', '2020-10-04 12:20:35'),
(229, 'language_select_option', 'on', '2020-06-18 16:22:13', '2021-01-12 08:25:56'),
(230, 'site_secondary_color', '#1d2228', '2020-06-18 16:32:38', '2021-01-12 08:25:56'),
(231, 'site_global_email', 'contact@xgenious.com', '2020-06-20 07:36:38', '2020-06-20 07:38:18'),
(232, 'site_global_email_template', '<p>Hello @username,</p><p><br></p><p>@message</p><p><br></p><p>Regards</p><p>@company</p>', '2020-06-20 07:36:38', '2020-06-20 07:38:18'),
(233, 'service_page_service_items', '6', '2020-06-20 15:47:52', '2020-06-20 15:48:13'),
(234, 'service_single_page_en_query_form_title', 'Have Query ?', '2020-06-20 16:11:26', '2020-06-20 16:11:26'),
(235, 'service_single_page_tur_query_form_title', 'Sorunuz mu Var?', '2020-06-20 16:11:26', '2020-06-20 16:11:26'),
(236, 'service_single_page_ar_query_form_title', 'هل لديك استفسار؟', '2020-06-20 16:11:26', '2020-06-20 16:11:26'),
(237, 'service_single_page_sp_query_form_title', '¿Tienes consulta?', '2020-06-20 16:11:26', '2020-06-20 16:11:26'),
(238, 'service_single_page_query_form_email', 'dvrobin4@gmail.com', '2020-06-20 16:11:26', '2020-06-20 16:11:26'),
(239, 'service_query_form_fields', '{\"field_type\":[\"text\",\"email\",\"text\",\"textarea\"],\"field_name\":[\"your-name\",\"your-email\",\"your-subject\",\"your-message\"],\"field_placeholder\":[\"Your Name\",\"Your Email\",\"Subject\",\"Message\"],\"field_required\":[\"on\",\"on\",\"on\",\"on\"]}', '2020-06-20 17:37:53', '2020-12-07 12:58:06'),
(240, 'case_study_en_query_title', 'Have Query?', '2020-06-21 06:53:14', '2020-06-21 08:10:47'),
(241, 'case_study_tur_query_title', 'Sorunuz mu Var?', '2020-06-21 06:53:14', '2020-06-21 08:10:47'),
(242, 'case_study_ar_query_title', 'هل لديك استفسار؟', '2020-06-21 06:53:14', '2020-06-21 08:10:47'),
(243, 'case_study_sp_query_title', '¿Tienes consulta?', '2020-06-21 06:53:14', '2020-06-21 08:10:47'),
(244, 'case_study_query_form_mail', 'dvrobin4@gmail.com', '2020-06-21 06:53:14', '2020-06-21 08:10:47'),
(245, 'case_study_en_gallery_title', 'Gallery', '2020-06-21 07:00:22', '2020-06-21 08:10:47'),
(246, 'case_study_tur_gallery_title', 'galeri', '2020-06-21 07:00:22', '2020-06-21 08:10:47'),
(247, 'case_study_ar_gallery_title', 'صالة عرض', '2020-06-21 07:00:22', '2020-06-21 08:10:47'),
(248, 'case_study_sp_gallery_title', 'Galería', '2020-06-21 07:00:22', '2020-06-21 08:10:47'),
(249, 'case_study_en_related_title', 'Related Case Study', '2020-06-21 07:14:44', '2020-06-21 08:10:47'),
(250, 'case_study_tur_related_title', 'İlgili Vaka Çalışması', '2020-06-21 07:14:44', '2020-06-21 08:10:47'),
(251, 'case_study_ar_related_title', 'دراسة حالة ذات صلة', '2020-06-21 07:14:44', '2020-06-21 08:10:47'),
(252, 'case_study_sp_related_title', 'Estudio de caso relacionado', '2020-06-21 07:14:44', '2020-06-21 08:10:47'),
(253, 'case_study_query_form_fields', '{\"field_type\":[\"text\",\"email\",\"text\",\"textarea\"],\"field_name\":[\"your-name\",\"your-email\",\"your-subject\",\"your-message\"],\"field_placeholder\":[\"Your Name\",\"Your Email\",\"Your Subject\",\"Message\"],\"field_required\":[\"on\",\"on\",\"on\",\"on\"]}', '2020-06-21 08:05:04', '2020-12-07 13:02:28'),
(254, 'case_study_en_query_button_text', 'Submit Request', '2020-06-21 08:10:47', '2020-06-21 08:10:47'),
(255, 'case_study_tur_query_button_text', 'İstek gönderin', '2020-06-21 08:10:47', '2020-06-21 08:10:47'),
(256, 'case_study_ar_query_button_text', 'تقديم الطلب', '2020-06-21 08:10:47', '2020-06-21 08:10:47'),
(257, 'case_study_sp_query_button_text', 'Enviar peticion', '2020-06-21 08:10:47', '2020-06-21 08:10:47'),
(258, 'order_page_form_fields', '{\"field_type\":[\"text\",\"email\",\"file\",\"textarea\"],\"field_name\":[\"your-name\",\"your-email\",\"your-file\",\"your-message\"],\"field_placeholder\":[\"Your Name\",\"Your Email\",\"Document\",\"Your Message\"],\"field_required\":{\"1\":\"on\",\"3\":\"on\"},\"mimes_type\":{\"2\":\"mimes:txt,pdf\"}}', '2020-06-21 10:13:58', '2020-06-21 10:59:34'),
(259, 'paypal_business_email', 'sb-qc3j51513705@business.example.com', '2020-06-21 11:02:03', '2021-01-11 01:02:31'),
(260, 'paytm_merchant_key', 'dv0XtmsPYpewNag&', '2020-06-21 11:02:03', '2021-01-13 20:39:35'),
(261, 'paytm_merchant_mid', 'Digita57697814558795', '2020-06-21 11:02:03', '2021-01-13 20:39:35'),
(262, 'paytm_merchant_website', 'WEBSTAGING', '2020-06-21 11:02:03', '2021-01-13 20:39:35'),
(263, 'site_global_currency', 'USD', '2020-06-21 11:02:03', '2021-01-13 20:39:35'),
(264, 'site_manual_payment_name', 'Manual Payment', '2020-06-21 11:02:03', '2021-01-13 20:39:35'),
(265, 'manual_payment_gateway', 'on', '2020-06-21 11:02:03', '2021-01-13 20:39:35'),
(266, 'paypal_gateway', 'on', '2020-06-21 11:02:03', '2021-01-13 20:39:35'),
(267, 'paytm_gateway', 'on', '2020-06-21 11:02:03', '2021-01-13 20:39:35'),
(268, 'paypal_preview_logo', '39', '2020-06-21 11:05:24', '2021-01-13 20:39:34'),
(269, 'paytm_preview_logo', '40', '2020-06-21 11:05:24', '2021-01-13 20:39:35'),
(270, 'manual_payment_preview_logo', '43', '2020-06-21 11:05:24', '2021-01-13 20:39:35'),
(271, 'site_usd_to_nri_exchange_rate', '77', '2020-06-21 11:07:27', '2020-08-03 23:18:49'),
(272, 'site_manual_payment_description', 'manual payment gateway description', '2020-06-21 11:07:52', '2021-01-13 20:39:35'),
(273, 'razorpay_gateway', 'on', '2020-06-21 14:46:58', '2021-01-13 20:39:35'),
(274, 'stripe_gateway', 'on', '2020-06-21 14:46:58', '2021-01-13 20:39:35'),
(275, 'site_euro_to_nri_exchange_rate', '90', '2020-06-21 14:47:04', '2020-08-03 23:18:49'),
(276, 'stripe_preview_logo', '41', '2020-06-21 14:50:45', '2021-01-13 20:39:34'),
(277, 'razorpay_preview_logo', '42', '2020-06-21 15:01:36', '2021-01-13 20:39:34'),
(278, 'site_global_payment_gateway', NULL, '2020-06-21 16:07:14', '2021-01-13 20:39:35'),
(279, 'order_page_en_form_title', 'Order Information', '2020-06-22 08:29:18', '2020-06-22 08:29:18'),
(280, 'order_page_tur_form_title', 'Sipariş Bilgisi', '2020-06-22 08:29:18', '2020-06-22 08:29:18'),
(281, 'order_page_ar_form_title', 'معلومات الطلب', '2020-06-22 08:29:18', '2020-06-22 08:29:18'),
(282, 'order_page_sp_form_title', 'información del pedido', '2020-06-22 08:29:18', '2020-06-22 08:29:18'),
(283, 'order_page_form_mail', 'dvrobin4@gmail.com', '2020-06-22 08:29:18', '2020-06-22 08:29:18'),
(284, 'site_order_success_page_en_title', 'Thank you', '2020-06-22 08:44:41', '2020-06-22 08:46:43'),
(285, 'site_order_success_page_en_subtitle', 'Payment Success For Order {pkname}', '2020-06-22 08:44:41', '2020-06-22 08:46:43'),
(286, 'site_order_success_page_en_description', NULL, '2020-06-22 08:44:41', '2020-06-22 08:46:43'),
(287, 'site_order_success_page_tur_title', 'teşekkür ederim', '2020-06-22 08:44:41', '2020-06-22 08:46:43'),
(288, 'site_order_success_page_tur_subtitle', 'Sipariş için Ödeme Başarısı  {pkname}', '2020-06-22 08:44:41', '2020-06-22 08:46:43'),
(289, 'site_order_success_page_tur_description', NULL, '2020-06-22 08:44:41', '2020-06-22 08:46:43'),
(290, 'site_order_success_page_ar_title', 'شكرا جزيلا', '2020-06-22 08:44:41', '2020-06-22 08:46:43'),
(291, 'site_order_success_page_ar_subtitle', 'نجاح الدفع للطلب  {pkname}', '2020-06-22 08:44:41', '2020-06-22 08:46:43'),
(292, 'site_order_success_page_ar_description', NULL, '2020-06-22 08:44:41', '2020-06-22 08:46:43'),
(293, 'site_order_success_page_sp_title', 'Gracias', '2020-06-22 08:44:41', '2020-06-22 08:46:43'),
(294, 'site_order_success_page_sp_subtitle', 'Pago exitoso por pedido  {pkname}', '2020-06-22 08:44:41', '2020-06-22 08:46:43'),
(295, 'site_order_success_page_sp_description', NULL, '2020-06-22 08:44:41', '2020-06-22 08:46:43'),
(296, 'site_order_cancel_page_en_title', 'Sorry', '2020-06-22 08:44:49', '2020-06-22 08:45:55'),
(297, 'site_order_cancel_page_en_subtitle', 'Payment Cancelled Of Order: {pkname}', '2020-06-22 08:44:49', '2020-06-22 08:45:55'),
(298, 'site_order_cancel_page_en_description', NULL, '2020-06-22 08:44:49', '2020-06-22 08:45:55'),
(299, 'site_order_cancel_page_tur_title', 'Afedersiniz', '2020-06-22 08:44:49', '2020-06-22 08:45:55'),
(300, 'site_order_cancel_page_tur_subtitle', 'Ödeme İptal Edildi: {pkname}', '2020-06-22 08:44:49', '2020-06-22 08:45:55'),
(301, 'site_order_cancel_page_tur_description', NULL, '2020-06-22 08:44:49', '2020-06-22 08:45:55'),
(302, 'site_order_cancel_page_ar_title', 'آسف', '2020-06-22 08:44:49', '2020-06-22 08:45:55'),
(303, 'site_order_cancel_page_ar_subtitle', 'تم إلغاء الدفع للطلب: {pkname}', '2020-06-22 08:44:49', '2020-06-22 08:45:55'),
(304, 'site_order_cancel_page_ar_description', NULL, '2020-06-22 08:44:49', '2020-06-22 08:45:55'),
(305, 'site_order_cancel_page_sp_title', 'Lo siento', '2020-06-22 08:44:49', '2020-06-22 08:45:55'),
(306, 'site_order_cancel_page_sp_subtitle', 'Pago cancelado de la orden: {pkname}', '2020-06-22 08:44:49', '2020-06-22 08:45:55'),
(307, 'site_order_cancel_page_sp_description', NULL, '2020-06-22 08:44:49', '2020-06-22 08:45:55'),
(308, 'home_page_call_to_action_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(309, 'home_page_about_us_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(310, 'home_page_service_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(311, 'home_page_key_feature_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(312, 'home_page_counterup_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(313, 'home_page_case_study_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(314, 'home_page_testimonial_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(315, 'home_page_latest_news_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(316, 'home_page_brand_logo_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(317, 'home_page_support_bar_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(318, 'home_page_price_plan_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(319, 'home_page_team_member_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(320, 'home_page_quality_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(321, 'home_page_contact_section_status', 'on', '2020-07-19 12:28:02', '2021-01-10 12:12:41'),
(322, 'preloader_default', '11', '2020-07-19 23:47:26', '2021-01-12 04:45:32'),
(323, 'preloader_custom', NULL, '2020-07-19 23:47:26', '2021-01-12 04:45:32'),
(324, 'preloader_custom_image', NULL, '2020-07-19 23:47:26', '2021-01-12 04:45:32'),
(325, 'quote_page_slug', 'quote', '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(326, 'donation_page_slug', 'donations', '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(327, 'product_page_slug', 'products', '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(328, 'testimonial_page_slug', 'testimonial', '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(329, 'feedback_page_slug', 'feedback', '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(330, 'clients_feedback_page_slug', 'clients-feedback', '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(331, 'image_gallery_page_slug', 'image-gallery', '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(332, 'about_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(333, 'about_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(334, 'service_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(335, 'service_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(336, 'work_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(337, 'work_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:15'),
(338, 'team_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(339, 'team_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(340, 'price_plan_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(341, 'price_plan_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(342, 'faq_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(343, 'faq_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(344, 'blog_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(345, 'blog_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(346, 'contact_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(347, 'contact_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(348, 'career_with_us_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(349, 'career_with_us_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(350, 'events_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(351, 'events_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(352, 'knowledgebase_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(353, 'knowledgebase_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(354, 'quote_page_en_name', 'Quote', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(355, 'quote_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(356, 'quote_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(357, 'donation_page_en_name', 'Donations', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(358, 'donation_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(359, 'donation_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(360, 'product_page_en_name', 'Products', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(361, 'product_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(362, 'product_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(363, 'testimonial_page_en_name', 'Testimonial', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(364, 'testimonial_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(365, 'testimonial_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(366, 'feedback_page_en_name', 'Feedback', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(367, 'feedback_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(368, 'feedback_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(369, 'clients_feedback_page_en_name', 'Clients Feedback', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(370, 'clients_feedback_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(371, 'clients_feedback_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(372, 'image_gallery_page_en_name', 'Image Gallery', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(373, 'image_gallery_page_en_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(374, 'image_gallery_page_en_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(375, 'about_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(376, 'about_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(377, 'service_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(378, 'service_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(379, 'work_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(380, 'work_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(381, 'team_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(382, 'team_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(383, 'price_plan_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(384, 'price_plan_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(385, 'faq_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(386, 'faq_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(387, 'blog_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(388, 'blog_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(389, 'contact_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(390, 'contact_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(391, 'career_with_us_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(392, 'career_with_us_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(393, 'events_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(394, 'events_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(395, 'knowledgebase_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(396, 'knowledgebase_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(397, 'quote_page_tur_name', 'Alıntı', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(398, 'quote_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(399, 'quote_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(400, 'donation_page_tur_name', 'Bağışlar', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(401, 'donation_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(402, 'donation_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(403, 'product_page_tur_name', 'Ürün:% s', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(404, 'product_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(405, 'product_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(406, 'testimonial_page_tur_name', 'bonservis', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(407, 'testimonial_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(408, 'testimonial_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(409, 'feedback_page_tur_name', 'geri bildirim', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(410, 'feedback_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(411, 'feedback_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(412, 'clients_feedback_page_tur_name', 'Müşteriler Geribildirim', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(413, 'clients_feedback_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(414, 'clients_feedback_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(415, 'image_gallery_page_tur_name', 'Resim Galerisi', '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(416, 'image_gallery_page_tur_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(417, 'image_gallery_page_tur_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(418, 'about_page_ar_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(419, 'about_page_ar_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(420, 'service_page_ar_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(421, 'service_page_ar_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(422, 'work_page_ar_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(423, 'work_page_ar_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(424, 'team_page_ar_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(425, 'team_page_ar_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(426, 'price_plan_page_ar_meta_tags', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(427, 'price_plan_page_ar_meta_description', NULL, '2020-07-20 00:20:52', '2020-08-11 22:33:16'),
(428, 'faq_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(429, 'faq_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(430, 'blog_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(431, 'blog_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(432, 'contact_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(433, 'contact_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(434, 'career_with_us_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(435, 'career_with_us_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(436, 'events_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(437, 'events_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(438, 'knowledgebase_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(439, 'knowledgebase_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(440, 'quote_page_ar_name', 'اقتبس', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(441, 'quote_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(442, 'quote_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(443, 'donation_page_ar_name', 'التبرعات', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(444, 'donation_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(445, 'donation_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(446, 'product_page_ar_name', 'منتجات', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(447, 'product_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(448, 'product_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(449, 'testimonial_page_ar_name', 'شهادة', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(450, 'testimonial_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(451, 'testimonial_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(452, 'feedback_page_ar_name', 'ردود الفعل', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(453, 'feedback_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(454, 'feedback_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(455, 'clients_feedback_page_ar_name', 'ملاحظات العملاء', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(456, 'clients_feedback_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(457, 'clients_feedback_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(458, 'image_gallery_page_ar_name', 'معرض الصور', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(459, 'image_gallery_page_ar_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(460, 'image_gallery_page_ar_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(461, 'about_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(462, 'about_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(463, 'service_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(464, 'service_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(465, 'work_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(466, 'work_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(467, 'team_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16');
INSERT INTO `static_options` (`id`, `option_name`, `option_value`, `created_at`, `updated_at`) VALUES
(468, 'team_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(469, 'price_plan_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(470, 'price_plan_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(471, 'faq_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(472, 'faq_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(473, 'blog_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(474, 'blog_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(475, 'contact_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(476, 'contact_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(477, 'career_with_us_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(478, 'career_with_us_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(479, 'events_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(480, 'events_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(481, 'knowledgebase_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(482, 'knowledgebase_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(483, 'quote_page_sp_name', 'Citar', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(484, 'quote_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(485, 'quote_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(486, 'donation_page_sp_name', 'Donaciones', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(487, 'donation_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(488, 'donation_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(489, 'product_page_sp_name', 'Productos', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(490, 'product_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(491, 'product_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(492, 'testimonial_page_sp_name', 'Testimonial', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(493, 'testimonial_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(494, 'testimonial_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(495, 'feedback_page_sp_name', 'Realimentación', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(496, 'feedback_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(497, 'feedback_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(498, 'clients_feedback_page_sp_name', 'Comentarios de las clientas', '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(499, 'clients_feedback_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(500, 'clients_feedback_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:16'),
(501, 'image_gallery_page_sp_name', 'galería de imágenes', '2020-07-20 00:20:53', '2020-08-11 22:33:17'),
(502, 'image_gallery_page_sp_meta_tags', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:17'),
(503, 'image_gallery_page_sp_meta_description', NULL, '2020-07-20 00:20:53', '2020-08-11 22:33:17'),
(504, 'feedback_page_form_fields', '{\"field_type\":[\"select\"],\"field_name\":[\"what-service-you-get\"],\"field_placeholder\":[\"What service you get ?\"],\"field_required\":{\"1\":\"on\"},\"select_options\":[\"products\\r\\npackage order\\r\\nevent tickets\\r\\ndonations\"]}', '2020-07-20 00:38:42', '2020-07-20 00:38:42'),
(505, 'feedback_notify_mail', 'dvrobin4@gmail.com', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(506, 'feedback_page_form_en_name_label', 'Name', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(507, 'feedback_page_form_en_email_label', 'Email', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(508, 'feedback_page_form_en_ratings_label', 'How Was Your Experience', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(509, 'feedback_page_form_en_description_label', 'Write Few Words', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(510, 'feedback_page_form_en_button_text', 'Submit Now', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(511, 'feedback_page_form_en_form_title', 'Leave Your Feedback', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(512, 'feedback_page_form_tur_name_label', 'ad', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(513, 'feedback_page_form_tur_email_label', 'E-posta', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(514, 'feedback_page_form_tur_ratings_label', 'Deneyiminiz Nasıldı', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(515, 'feedback_page_form_tur_description_label', 'Birkaç Kelime Yaz', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(516, 'feedback_page_form_tur_button_text', 'Şimdi gönder', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(517, 'feedback_page_form_tur_form_title', 'Görüşlerinizi Bırakın', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(518, 'feedback_page_form_ar_name_label', 'اسم', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(519, 'feedback_page_form_ar_email_label', 'البريد الإلكتروني', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(520, 'feedback_page_form_ar_ratings_label', 'كيف كانت تجربتك', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(521, 'feedback_page_form_ar_description_label', 'اكتب كلمات قليلة', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(522, 'feedback_page_form_ar_button_text', 'أرسل الآن', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(523, 'feedback_page_form_ar_form_title', 'اترك تعليقاتك', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(524, 'feedback_page_form_sp_name_label', 'Nombre', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(525, 'feedback_page_form_sp_email_label', 'Email', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(526, 'feedback_page_form_sp_ratings_label', 'Cómo fue tu experiencia', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(527, 'feedback_page_form_sp_description_label', 'Escribe pocas palabras', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(528, 'feedback_page_form_sp_button_text', 'Aplique ahora', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(529, 'feedback_page_form_sp_form_title', 'Deja tu comentario', '2020-07-20 00:39:20', '2020-07-20 00:42:21'),
(530, 'site_knowledgebase_category_en_title', 'Topics', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(531, 'site_knowledgebase_popular_widget_en_title', 'Popular Articles', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(532, 'site_knowledgebase_article_topic_en_title', 'Article Topics', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(533, 'site_knowledgebase_category_tur_title', 'Başlıklar', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(534, 'site_knowledgebase_popular_widget_tur_title', 'Popüler Makaleler', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(535, 'site_knowledgebase_article_topic_tur_title', 'Makale Konuları', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(536, 'site_knowledgebase_category_ar_title', 'جميع المواضيع', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(537, 'site_knowledgebase_popular_widget_ar_title', 'المواد شعبية', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(538, 'site_knowledgebase_article_topic_ar_title', 'مواضيع المقالة', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(539, 'site_knowledgebase_category_sp_title', 'Todos los temas', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(540, 'site_knowledgebase_popular_widget_sp_title', 'articulos populares', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(541, 'site_knowledgebase_article_topic_sp_title', 'Temas del artículo', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(542, 'site_knoeledgebase_post_items', '6', '2020-07-20 01:29:12', '2020-07-20 01:29:52'),
(543, 'site_events_category_en_title', 'Events Category', '2020-07-20 04:51:29', '2020-07-20 04:51:37'),
(544, 'site_events_category_tur_title', 'Etkinlik Kategorisi', '2020-07-20 04:51:29', '2020-07-20 04:51:37'),
(545, 'site_events_category_ar_title', 'فئة الأحداث', '2020-07-20 04:51:29', '2020-07-20 04:51:37'),
(546, 'site_events_category_sp_title', 'Categoría de eventos', '2020-07-20 04:51:29', '2020-07-20 04:51:37'),
(547, 'site_events_post_items', '6', '2020-07-20 04:51:29', '2020-07-20 04:51:38'),
(548, 'event_single_en_event_info_title', 'Event Info', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(549, 'event_single_en_date_title', 'Date', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(550, 'event_single_en_time_title', 'Time', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(551, 'event_single_en_cost_title', 'Cost', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(552, 'event_single_en_category_title', 'Category', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(553, 'event_single_en_organizer_title', 'Event Organizer', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(554, 'event_single_en_organizer_name_title', 'Name', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(555, 'event_single_en_organizer_email_title', 'Email', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(556, 'event_single_en_organizer_phone_title', 'Phone', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(557, 'event_single_en_organizer_website_title', 'Website', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(558, 'event_single_en_venue_title', 'Event Venue', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(559, 'event_single_en_venue_name_title', 'Name', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(560, 'event_single_en_venue_location_title', 'Locaiton', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(561, 'event_single_en_venue_phone_title', NULL, '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(562, 'event_single_en_available_ticket_text', 'Available Tickets', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(563, 'event_single_en_reserve_button_title', 'Reserve Your Seat', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(564, 'event_single_tur_event_info_title', 'Etkinlik Bilgisi', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(565, 'event_single_tur_date_title', 'tarih', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(566, 'event_single_tur_time_title', 'Zaman', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(567, 'event_single_tur_cost_title', 'Maliyet', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(568, 'event_single_tur_category_title', 'Kategori', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(569, 'event_single_tur_organizer_title', 'Etkinlik düzenleyici', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(570, 'event_single_tur_organizer_name_title', 'ad', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(571, 'event_single_tur_organizer_email_title', 'E-posta', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(572, 'event_single_tur_organizer_phone_title', 'Telefon', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(573, 'event_single_tur_organizer_website_title', 'İnternet sitesi', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(574, 'event_single_tur_venue_title', 'Etkinlik Mekanı', '2020-07-20 04:54:30', '2020-08-24 17:47:28'),
(575, 'event_single_tur_venue_name_title', 'ad', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(576, 'event_single_tur_venue_location_title', 'yer', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(577, 'event_single_tur_venue_phone_title', 'Telefon', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(578, 'event_single_tur_available_ticket_text', 'Mevcut Biletler', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(579, 'event_single_tur_reserve_button_title', 'Yerinizi Ayırtın', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(580, 'event_single_ar_event_info_title', 'معلومات الحدث', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(581, 'event_single_ar_date_title', 'تاريخ', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(582, 'event_single_ar_time_title', 'زمن', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(583, 'event_single_ar_cost_title', 'كلفة', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(584, 'event_single_ar_category_title', 'الفئة', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(585, 'event_single_ar_organizer_title', 'منظم الحدث', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(586, 'event_single_ar_organizer_name_title', 'اسم', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(587, 'event_single_ar_organizer_email_title', 'البريد الإلكتروني', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(588, 'event_single_ar_organizer_phone_title', 'هاتف', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(589, 'event_single_ar_organizer_website_title', NULL, '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(590, 'event_single_ar_venue_title', 'موقع الكتروني', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(591, 'event_single_ar_venue_name_title', 'اسم', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(592, 'event_single_ar_venue_location_title', 'موقعك', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(593, 'event_single_ar_venue_phone_title', 'هاتف', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(594, 'event_single_ar_available_ticket_text', 'التذاكر المتاحة', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(595, 'event_single_ar_reserve_button_title', 'احجز مقعدك', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(596, 'event_single_sp_event_info_title', 'Información del evento', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(597, 'event_single_sp_date_title', 'Fecha', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(598, 'event_single_sp_time_title', 'Hora', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(599, 'event_single_sp_cost_title', 'Costo', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(600, 'event_single_sp_category_title', 'Categoría', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(601, 'event_single_sp_organizer_title', 'Organizadora de eventos', '2020-07-20 04:54:30', '2020-08-24 17:47:29'),
(602, 'event_single_sp_organizer_name_title', 'Nombre', '2020-07-20 04:54:31', '2020-08-24 17:47:29'),
(603, 'event_single_sp_organizer_email_title', 'Email', '2020-07-20 04:54:31', '2020-08-24 17:47:29'),
(604, 'event_single_sp_organizer_phone_title', 'Teléfono', '2020-07-20 04:54:31', '2020-08-24 17:47:29'),
(605, 'event_single_sp_organizer_website_title', 'Sitio web', '2020-07-20 04:54:31', '2020-08-24 17:47:29'),
(606, 'event_single_sp_venue_title', 'Lugar del evento', '2020-07-20 04:54:31', '2020-08-24 17:47:29'),
(607, 'event_single_sp_venue_name_title', 'Nombre', '2020-07-20 04:54:31', '2020-08-24 17:47:29'),
(608, 'event_single_sp_venue_location_title', 'Ubicación', '2020-07-20 04:54:31', '2020-08-24 17:47:29'),
(609, 'event_single_sp_venue_phone_title', 'Teléfono', '2020-07-20 04:54:31', '2020-08-24 17:47:29'),
(610, 'event_single_sp_available_ticket_text', 'Entradas disponibles', '2020-07-20 04:54:31', '2020-08-24 17:47:29'),
(611, 'event_single_sp_reserve_button_title', 'Reservado tu asiento', '2020-07-20 04:54:31', '2020-08-24 17:47:29'),
(612, 'event_attendance_page_en_title', 'Confirm Your Attendance', '2020-07-20 04:54:58', '2020-07-20 04:56:23'),
(613, 'event_attendance_page_en_form_button_title', 'Confirm Attend', '2020-07-20 04:54:58', '2020-07-20 04:56:23'),
(614, 'event_attendance_page_tur_title', 'Katılımınızı Onaylayın', '2020-07-20 04:54:58', '2020-07-20 04:56:23'),
(615, 'event_attendance_page_tur_form_button_title', 'Sunmak', '2020-07-20 04:54:58', '2020-07-20 04:56:23'),
(616, 'event_attendance_page_ar_title', 'تأكيد الحضور', '2020-07-20 04:54:58', '2020-07-20 04:56:23'),
(617, 'event_attendance_page_ar_form_button_title', 'تأكيد الحضور', '2020-07-20 04:54:58', '2020-07-20 04:56:23'),
(618, 'event_attendance_page_sp_title', 'Confirme su asistencia', '2020-07-20 04:54:58', '2020-07-20 04:56:23'),
(619, 'event_attendance_page_sp_form_button_title', 'Enviar', '2020-07-20 04:54:58', '2020-07-20 04:56:23'),
(620, 'event_attendance_receiver_mail', 'dvrobin4@gmail.com', '2020-07-20 04:54:58', '2020-07-20 04:56:23'),
(621, 'event_success_page_en_title', 'Thank you', '2020-07-20 05:36:27', '2020-07-20 05:36:42'),
(622, 'event_success_page_en_subtitle', 'Payment Success For Event: {evname}', '2020-07-20 05:36:27', '2020-07-20 05:36:42'),
(623, 'event_success_page_en_description', NULL, '2020-07-20 05:36:27', '2020-07-20 05:36:42'),
(624, 'event_success_page_tur_title', 'Teşekkür ederim', '2020-07-20 05:36:27', '2020-07-20 05:36:42'),
(625, 'event_success_page_tur_subtitle', 'Etkinlik İçin Ödeme Başarısı: {evname}', '2020-07-20 05:36:27', '2020-07-20 05:36:42'),
(626, 'event_success_page_tur_description', NULL, '2020-07-20 05:36:27', '2020-07-20 05:36:42'),
(627, 'event_success_page_ar_title', NULL, '2020-07-20 05:36:27', '2020-07-20 05:36:42'),
(628, 'event_success_page_ar_subtitle', NULL, '2020-07-20 05:36:27', '2020-07-20 05:36:42'),
(629, 'event_success_page_ar_description', NULL, '2020-07-20 05:36:27', '2020-07-20 05:36:42'),
(630, 'event_success_page_sp_title', 'Gracias', '2020-07-20 05:36:27', '2020-07-20 05:36:42'),
(631, 'event_success_page_sp_subtitle', 'Pago exitoso para el evento: {evname}', '2020-07-20 05:36:27', '2020-07-20 05:36:42'),
(632, 'event_success_page_sp_description', NULL, '2020-07-20 05:36:27', '2020-07-20 05:36:42'),
(633, 'event_cancel_page_en_title', 'Sorry', '2020-07-20 05:36:32', '2020-07-20 05:38:54'),
(634, 'event_cancel_page_en_subtitle', 'Payment Cancel For Event: {evname}', '2020-07-20 05:36:32', '2020-07-20 05:38:54'),
(635, 'event_cancel_page_en_description', NULL, '2020-07-20 05:36:32', '2020-07-20 05:38:54'),
(636, 'event_cancel_page_tur_title', 'Afedersiniz', '2020-07-20 05:36:32', '2020-07-20 05:38:54'),
(637, 'event_cancel_page_tur_subtitle', 'Etkinlik İçin Ödeme İptali: {evname}', '2020-07-20 05:36:32', '2020-07-20 05:38:54'),
(638, 'event_cancel_page_tur_description', NULL, '2020-07-20 05:36:32', '2020-07-20 05:38:54'),
(639, 'event_cancel_page_ar_title', 'آسف', '2020-07-20 05:36:32', '2020-07-20 05:38:54'),
(640, 'event_cancel_page_ar_subtitle', '{evname} :إلغاء الدفع للحدث', '2020-07-20 05:36:32', '2020-07-20 05:38:54'),
(641, 'event_cancel_page_ar_description', NULL, '2020-07-20 05:36:32', '2020-07-20 05:38:54'),
(642, 'event_cancel_page_sp_title', 'Lo siento', '2020-07-20 05:36:32', '2020-07-20 05:38:54'),
(643, 'event_cancel_page_sp_subtitle', 'Payment Cancel For Event: {evname}', '2020-07-20 05:36:32', '2020-07-20 05:38:54'),
(644, 'event_cancel_page_sp_description', NULL, '2020-07-20 05:36:32', '2020-07-20 05:38:54'),
(645, 'product_success_page_en_title', 'Thanks For Your Order', '2020-07-20 05:37:13', '2020-07-20 05:38:22'),
(646, 'product_success_page_en_description', NULL, '2020-07-20 05:37:13', '2020-07-20 05:38:22'),
(647, 'product_success_page_tur_title', 'Siparişiniz için teşekkürler', '2020-07-20 05:37:13', '2020-07-20 05:38:22'),
(648, 'product_success_page_tur_description', NULL, '2020-07-20 05:37:13', '2020-07-20 05:38:22'),
(649, 'product_success_page_ar_title', 'شكرا لطلبك', '2020-07-20 05:37:13', '2020-07-20 05:38:22'),
(650, 'product_success_page_ar_description', NULL, '2020-07-20 05:37:13', '2020-07-20 05:38:22'),
(651, 'product_success_page_sp_title', 'Gracias por tu orden', '2020-07-20 05:37:13', '2020-07-20 05:38:22'),
(652, 'product_success_page_sp_description', NULL, '2020-07-20 05:37:13', '2020-07-20 05:38:22'),
(653, 'product_cancel_page_en_title', 'You Payment  Is Not Succeced', '2020-07-20 05:37:19', '2020-07-20 05:38:08'),
(654, 'product_cancel_page_en_description', NULL, '2020-07-20 05:37:19', '2020-07-20 05:38:08'),
(655, 'product_cancel_page_tur_title', 'Siparişiniz İçin Ödeme İptal Edilir', '2020-07-20 05:37:19', '2020-07-20 05:38:08'),
(656, 'product_cancel_page_tur_description', NULL, '2020-07-20 05:37:19', '2020-07-20 05:38:08'),
(657, 'product_cancel_page_ar_title', 'دفعتك لم تنجح', '2020-07-20 05:37:19', '2020-07-20 05:38:08'),
(658, 'product_cancel_page_ar_description', NULL, '2020-07-20 05:37:19', '2020-07-20 05:38:08'),
(659, 'product_cancel_page_sp_title', 'El pago de su pedido es cancelar', '2020-07-20 05:37:19', '2020-07-20 05:38:08'),
(660, 'product_cancel_page_sp_description', NULL, '2020-07-20 05:37:19', '2020-07-20 05:38:08'),
(661, 'product_add_to_cart_button_en_text', 'Add To Cart', '2020-07-20 05:37:27', '2020-07-21 11:07:47'),
(662, 'product_add_to_cart_button_tur_text', 'Sepete ekle', '2020-07-20 05:37:27', '2020-07-21 11:07:47'),
(663, 'product_add_to_cart_button_ar_text', 'أضف إلى السلة', '2020-07-20 05:37:27', '2020-07-21 11:07:47'),
(664, 'product_add_to_cart_button_sp_text', 'Añadir al carrito', '2020-07-20 05:37:27', '2020-07-21 11:07:47'),
(665, 'product_post_items', '6', '2020-07-20 05:37:27', '2020-07-21 11:07:47'),
(666, 'contact_page_contact_form_fields', '{\"field_type\":[\"text\",\"email\",\"tel\",\"textarea\"],\"field_name\":[\"your-name\",\"your-email\",\"your-phone\",\"your-message\"],\"field_placeholder\":[\"Your Name\",\"Your Email\",\"Phone\",\"Message\"],\"field_required\":{\"1\":\"on\"}}', '2020-07-20 06:39:06', '2020-07-20 06:39:06'),
(667, 'contact_page_contact_info_section_status', 'on', '2020-07-20 06:39:27', '2020-07-20 06:39:27'),
(668, 'contact_page_contact_section_status', 'on', '2020-07-20 06:39:27', '2020-07-20 06:39:27'),
(669, 'contact_page_en_form_section_title', 'Keep In Touch', '2020-07-20 06:39:50', '2020-07-20 06:40:15'),
(670, 'contact_page_en_form_submit_btn_text', 'Send Message', '2020-07-20 06:39:50', '2020-07-20 06:40:15'),
(671, 'contact_page_tur_form_section_title', 'Temasta olmak', '2020-07-20 06:39:50', '2020-07-20 06:40:15'),
(672, 'contact_page_tur_form_submit_btn_text', 'Mesaj gönder', '2020-07-20 06:39:50', '2020-07-20 06:40:15'),
(673, 'contact_page_ar_form_section_title', 'أبق على اتصال', '2020-07-20 06:39:50', '2020-07-20 06:40:15'),
(674, 'contact_page_ar_form_submit_btn_text', 'أرسل رسالة', '2020-07-20 06:39:50', '2020-07-20 06:40:15'),
(675, 'contact_page_sp_form_section_title', 'Ponerse en contacto', '2020-07-20 06:39:50', '2020-07-20 06:40:15'),
(676, 'contact_page_sp_form_submit_btn_text', 'Enviar mensaje', '2020-07-20 06:39:50', '2020-07-20 06:40:15'),
(677, 'contact_page_form_receiving_mail', 'dvrobin4@gmail.com', '2020-07-20 06:39:50', '2020-07-20 06:40:15'),
(678, 'contact_page_map_section_location', '2626 Angie Drive Santa Ana, CA 92701', '2020-07-20 06:40:44', '2020-07-20 06:40:44'),
(679, 'contact_page_map_section_zoom', '10', '2020-07-20 06:40:44', '2020-07-20 06:40:44'),
(680, 'event_attendance_form_fields', '{\"field_type\":[\"text\",\"email\",\"checkbox\",\"textarea\"],\"field_name\":[\"your-name\",\"your-email\",\"terms-condition\",\"your-messsage\"],\"field_placeholder\":[\"Your Name\",\"Your Email\",\"Agree With <a href=\'#\'>Terms Of Policy<\\/a>\",\"Message\"],\"field_required\":[\"on\",\"on\"]}', '2020-07-20 06:44:10', '2020-10-01 10:47:50'),
(681, 'apply_job_page_form_fields', '{\"field_type\":[\"text\",\"file\",\"textarea\"],\"field_name\":[\"your-expected-salary\",\"your-cv\",\"your-additional-info\"],\"field_placeholder\":[\"Your Expected Salary\",\"Your CV\",\"About Yourself\"],\"field_required\":{\"0\":\"on\",\"2\":\"on\"},\"mimes_type\":{\"1\":\"mimes:txt,pdf\"}}', '2020-07-20 06:54:09', '2020-12-07 04:16:45'),
(682, 'job_single_page_en_job_context_label', 'Job Context', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(683, 'job_single_page_en_job_responsibility_label', 'Job Responsibility', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(684, 'job_single_page_en_education_requirement_label', 'Educational Requirement', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(685, 'job_single_page_en_experience_requirement_label', 'Experience Requirement', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(686, 'job_single_page_en_additional_requirement_label', 'Additional Requirement', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(687, 'job_single_page_en_others_benefits_label', 'Others Benefits', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(688, 'job_single_page_en_apply_button_text', 'Apply To The Job', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(689, 'job_single_page_en_job_info_text', 'Jobs Information', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(690, 'job_single_page_en_company_name_text', 'Company Name', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(691, 'job_single_page_en_job_category_text', 'Job Category', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(692, 'job_single_page_en_job_position_text', 'Job Position', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(693, 'job_single_page_en_job_type_text', 'Job Type', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(694, 'job_single_page_en_salary_text', 'Salary', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(695, 'job_single_page_en_job_location_text', 'Job Location', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(696, 'job_single_page_en_job_deadline_text', 'Deadline', '2020-07-20 07:42:27', '2020-11-22 02:11:58'),
(697, 'job_single_page_tur_job_context_label', 'İş Bağlamı', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(698, 'job_single_page_tur_job_responsibility_label', 'İş sorumluluğu', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(699, 'job_single_page_tur_education_requirement_label', 'Eğitim Gereksinimi', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(700, 'job_single_page_tur_experience_requirement_label', 'Deneyim Gereksinimi', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(701, 'job_single_page_tur_additional_requirement_label', 'Ek gereksinim', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(702, 'job_single_page_tur_others_benefits_label', 'Others Benefits', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(703, 'job_single_page_tur_apply_button_text', 'İşe Başvur', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(704, 'job_single_page_tur_job_info_text', 'İş bilgisi', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(705, 'job_single_page_tur_company_name_text', 'şirket', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(706, 'job_single_page_tur_job_category_text', 'iş kategorisi', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(707, 'job_single_page_tur_job_position_text', 'İş pozisyonu', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(708, 'job_single_page_tur_job_type_text', 'Meslek türü', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(709, 'job_single_page_tur_salary_text', 'Maaş', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(710, 'job_single_page_tur_job_location_text', 'iş konumu', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(711, 'job_single_page_tur_job_deadline_text', 'Son tarih', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(712, 'job_single_page_ar_job_context_label', 'سياق العمل', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(713, 'job_single_page_ar_job_responsibility_label', 'مسؤولية العمل', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(714, 'job_single_page_ar_education_requirement_label', 'المتطلبات التربوية', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(715, 'job_single_page_ar_experience_requirement_label', 'متطلبات الخبرة', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(716, 'job_single_page_ar_additional_requirement_label', 'متطلبات إضافية', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(717, 'job_single_page_ar_others_benefits_label', 'فوائد الآخرين', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(718, 'job_single_page_ar_apply_button_text', 'قدم على الوظيفة', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(719, 'job_single_page_ar_job_info_text', 'معلومات الوظائف', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(720, 'job_single_page_ar_company_name_text', 'شركة', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(721, 'job_single_page_ar_job_category_text', 'تصنيف الوظيفة', '2020-07-20 07:42:27', '2020-11-22 02:11:59'),
(722, 'job_single_page_ar_job_position_text', 'وظيفه', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(723, 'job_single_page_ar_job_type_text', 'نوع الوظيفة', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(724, 'job_single_page_ar_salary_text', 'راتب', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(725, 'job_single_page_ar_job_location_text', 'مكان العمل', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(726, 'job_single_page_ar_job_deadline_text', 'الموعد النهائي', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(727, 'job_single_page_sp_job_context_label', 'Contexto de trabajo', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(728, 'job_single_page_sp_job_responsibility_label', 'Responsabilidad laboral', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(729, 'job_single_page_sp_education_requirement_label', 'Requisito Educativo', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(730, 'job_single_page_sp_experience_requirement_label', 'Requisito de experiencia', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(731, 'job_single_page_sp_additional_requirement_label', 'Requerimiento adicional', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(732, 'job_single_page_sp_others_benefits_label', 'Otros beneficios', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(733, 'job_single_page_sp_apply_button_text', 'Aplicar al trabajo', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(734, 'job_single_page_sp_job_info_text', 'Información de trabajos', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(735, 'job_single_page_sp_company_name_text', 'Empresa', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(736, 'job_single_page_sp_job_category_text', 'Categoría de Trabajo', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(737, 'job_single_page_sp_job_position_text', 'Puesto de trabajo', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(738, 'job_single_page_sp_job_type_text', 'Tipo de empleo', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(739, 'job_single_page_sp_salary_text', 'Salario', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(740, 'job_single_page_sp_job_location_text', 'locación de trabajo', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(741, 'job_single_page_sp_job_deadline_text', 'Fecha límite', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(742, 'job_single_page_apply_form', 'on', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(743, 'job_single_page_applicant_mail', 'dvrobin4@gmail.com', '2020-07-20 07:42:28', '2020-11-22 02:11:59'),
(744, 'site_jobs_category_en_title', 'Jobs Category', '2020-07-20 08:41:01', '2020-07-20 08:41:01'),
(745, 'site_jobs_category_tur_title', 'İş Kategorisi', '2020-07-20 08:41:01', '2020-07-20 08:41:01'),
(746, 'site_jobs_category_ar_title', 'فئة الوظائف', '2020-07-20 08:41:01', '2020-07-20 08:41:01'),
(747, 'site_jobs_category_sp_title', 'Categoría de trabajos', '2020-07-20 08:41:01', '2020-07-20 08:41:01'),
(748, 'site_job_post_items', '6', '2020-07-20 08:41:01', '2020-07-20 08:41:01'),
(749, 'donation_success_page_en_title', 'Thank You', '2020-07-20 11:04:21', '2020-07-20 11:04:21'),
(750, 'donation_success_page_en_subtitle', 'Payment Success For Donation:  {dnname}', '2020-07-20 11:04:21', '2020-07-20 11:04:21'),
(751, 'donation_success_page_en_description', NULL, '2020-07-20 11:04:21', '2020-07-20 11:04:21'),
(752, 'donation_success_page_tur_title', 'Teşekkürler', '2020-07-20 11:04:21', '2020-07-20 11:04:21'),
(753, 'donation_success_page_tur_subtitle', 'Bağış İçin Ödeme Başarısı: {dnname}', '2020-07-20 11:04:21', '2020-07-20 11:04:21'),
(754, 'donation_success_page_tur_description', NULL, '2020-07-20 11:04:21', '2020-07-20 11:04:21'),
(755, 'donation_success_page_ar_title', 'شكرا', '2020-07-20 11:04:21', '2020-07-20 11:04:21'),
(756, 'donation_success_page_ar_subtitle', 'نجاح الدفع للتبرع:', '2020-07-20 11:04:21', '2020-07-20 11:04:21'),
(757, 'donation_success_page_ar_description', NULL, '2020-07-20 11:04:21', '2020-07-20 11:04:21'),
(758, 'donation_success_page_sp_title', 'Gracias', '2020-07-20 11:04:21', '2020-07-20 11:04:21'),
(759, 'donation_success_page_sp_subtitle', 'Pago exitoso por donación: {dnname}', '2020-07-20 11:04:21', '2020-07-20 11:04:21'),
(760, 'donation_success_page_sp_description', NULL, '2020-07-20 11:04:21', '2020-07-20 11:04:21'),
(761, 'donation_cancel_page_en_title', 'Sorry!!', '2020-07-20 11:05:10', '2020-07-20 11:05:10'),
(762, 'donation_cancel_page_en_subtitle', 'Payment Cancel For Donation: {dnname}', '2020-07-20 11:05:10', '2020-07-20 11:05:10'),
(763, 'donation_cancel_page_en_description', NULL, '2020-07-20 11:05:10', '2020-07-20 11:05:10'),
(764, 'donation_cancel_page_tur_title', 'Afedersiniz!!', '2020-07-20 11:05:10', '2020-07-20 11:05:10'),
(765, 'donation_cancel_page_tur_subtitle', 'Bağış İçin İptal Edildi: {dnname}', '2020-07-20 11:05:10', '2020-07-20 11:05:10'),
(766, 'donation_cancel_page_tur_description', NULL, '2020-07-20 11:05:10', '2020-07-20 11:05:10'),
(767, 'donation_cancel_page_ar_title', 'آسف', '2020-07-20 11:05:10', '2020-07-20 11:05:10'),
(768, 'donation_cancel_page_ar_subtitle', 'إلغاء الدفع للتبرع:', '2020-07-20 11:05:10', '2020-07-20 11:05:10'),
(769, 'donation_cancel_page_ar_description', NULL, '2020-07-20 11:05:10', '2020-07-20 11:05:10'),
(770, 'donation_cancel_page_sp_title', '¡¡Lo siento!!', '2020-07-20 11:05:10', '2020-07-20 11:05:10'),
(771, 'donation_cancel_page_sp_subtitle', 'Pago cancelado por donación: {dnname}', '2020-07-20 11:05:10', '2020-07-20 11:05:10'),
(772, 'donation_cancel_page_sp_description', NULL, '2020-07-20 11:05:10', '2020-07-20 11:05:10'),
(773, 'donation_notify_mail', 'dvrobin4@gmail.com', '2020-07-20 11:07:53', '2020-11-18 02:09:40'),
(774, 'donation_single_en_form_title', 'Donate for help', '2020-07-20 11:07:53', '2020-11-18 02:09:40'),
(775, 'donation_single_en_form_button_text', 'Donate Now', '2020-07-20 11:07:53', '2020-11-18 02:09:40'),
(776, 'donation_single_tur_form_title', 'Yardım için bağış yapın', '2020-07-20 11:07:53', '2020-11-18 02:09:40'),
(777, 'donation_single_tur_form_button_text', 'Şimdi Bağış yap', '2020-07-20 11:07:53', '2020-11-18 02:09:40'),
(778, 'donation_single_ar_form_title', 'تبرع للمساعدة', '2020-07-20 11:07:53', '2020-11-18 02:09:40'),
(779, 'donation_single_ar_form_button_text', 'تبرع الآن', '2020-07-20 11:07:53', '2020-11-18 02:09:40'),
(780, 'donation_single_sp_form_title', 'Done por ayuda', '2020-07-20 11:07:53', '2020-11-18 02:09:40'),
(781, 'donation_single_sp_form_button_text', 'Done ahora', '2020-07-20 11:07:53', '2020-11-18 02:09:40'),
(782, 'donor_page_post_items', '6', '2020-07-20 11:12:21', '2020-07-20 11:12:21'),
(783, 'donation_button_en_text', 'Donate Now', '2020-07-20 11:12:22', '2020-07-20 11:12:22'),
(784, 'donation_goal_en_text', 'Goal:', '2020-07-20 11:12:22', '2020-07-20 11:12:22'),
(785, 'donation_raised_en_text', 'Raised:', '2020-07-20 11:12:22', '2020-07-20 11:12:22'),
(786, 'donation_button_tur_text', 'Şimdi Bağış yap', '2020-07-20 11:12:22', '2020-07-20 11:12:22'),
(787, 'donation_goal_tur_text', 'Hedef:', '2020-07-20 11:12:22', '2020-07-20 11:12:22'),
(788, 'donation_raised_tur_text', 'yükseltilmiş:', '2020-07-20 11:12:22', '2020-07-20 11:12:22'),
(789, 'donation_button_ar_text', 'تبرع الآن', '2020-07-20 11:12:22', '2020-07-20 11:12:22'),
(790, 'donation_goal_ar_text', 'هدف:', '2020-07-20 11:12:22', '2020-07-20 11:12:22'),
(791, 'donation_raised_ar_text', 'رفع:', '2020-07-20 11:12:22', '2020-07-20 11:12:22'),
(792, 'donation_button_sp_text', 'Done ahora', '2020-07-20 11:12:22', '2020-07-20 11:12:22'),
(793, 'donation_goal_sp_text', 'Objetivo:', '2020-07-20 11:12:22', '2020-07-20 11:12:22'),
(794, 'donation_raised_sp_text', 'Elevada:', '2020-07-20 11:12:22', '2020-07-20 11:12:22'),
(795, 'quote_page_form_fields', '{\"field_type\":[\"text\",\"text\",\"email\",\"file\",\"textarea\"],\"field_name\":[\"your-name\",\"your-subject\",\"your-email\",\"your-file\",\"your-message\"],\"field_placeholder\":[\"Your Name\",\"Your Subject\",\"Your Email\",\"Your File\",\"Your Message\"],\"field_required\":{\"1\":\"on\",\"2\":\"on\",\"4\":\"on\"},\"mimes_type\":{\"3\":\"mimes:txt,pdf\"}}', '2020-07-20 11:50:29', '2020-07-20 11:50:29'),
(796, 'quote_page_en_form_title', 'Request A Quote', '2020-07-20 11:50:50', '2020-07-27 09:42:52'),
(797, 'quote_page_en_form_button_text', 'Send Quote', '2020-07-20 11:50:50', '2020-07-27 09:42:52'),
(798, 'quote_page_tur_form_title', 'Bir teklif isteği', '2020-07-20 11:50:50', '2020-07-27 09:42:52'),
(799, 'quote_page_tur_form_button_text', 'Teklif Gönderin', '2020-07-20 11:50:50', '2020-07-27 09:42:52'),
(800, 'quote_page_ar_form_title', 'اطلب اقتباس', '2020-07-20 11:50:50', '2020-07-27 09:42:52'),
(801, 'quote_page_ar_form_button_text', 'إرسال اقتباس', '2020-07-20 11:50:50', '2020-07-27 09:42:52'),
(802, 'quote_page_sp_form_title', 'Solicitar presupuesto', '2020-07-20 11:50:50', '2020-07-27 09:42:52'),
(803, 'quote_page_sp_form_button_text', 'Enviar presupuesto', '2020-07-20 11:50:50', '2020-07-27 09:42:52'),
(804, 'quote_page_form_mail', 'dvrobin4@gmail.com', '2020-07-20 11:50:50', '2020-07-27 09:42:52'),
(805, 'product_single_en_add_to_cart_text', 'Add To Cart', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(806, 'product_single_en_category_text', 'Category:', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(807, 'product_single_en_sku_text', 'SKU:', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(808, 'product_single_en_description_text', 'Description', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(809, 'product_single_en_attributes_text', 'Additional Information', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(810, 'product_single_en_related_product_text', 'Related Products', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(811, 'product_single_tur_add_to_cart_text', 'Sepete ekle', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(812, 'product_single_tur_category_text', 'Kategori:', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(813, 'product_single_tur_sku_text', 'SKU:', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(814, 'product_single_tur_description_text', 'Açıklama', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(815, 'product_single_tur_attributes_text', 'ek bilgi', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(816, 'product_single_tur_related_product_text', 'ilgili ürünler', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(817, 'product_single_ar_add_to_cart_text', 'أضف إلى السلة', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(818, 'product_single_ar_category_text', 'الفئة:', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(819, 'product_single_ar_sku_text', 'كود التخزين التعريفي:', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(820, 'product_single_ar_description_text', 'تفسير', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(821, 'product_single_ar_attributes_text', 'معلومة اضافية', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(822, 'product_single_ar_related_product_text', 'منتجات ذات صله', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(823, 'product_single_sp_add_to_cart_text', 'Añadir al carrito', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(824, 'product_single_sp_category_text', 'Categoría:', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(825, 'product_single_sp_sku_text', 'SKU:', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(826, 'product_single_sp_description_text', 'Descripción', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(827, 'product_single_sp_attributes_text', 'Información Adicional', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(828, 'product_single_sp_related_product_text', 'Productos relacionados', '2020-07-21 01:20:43', '2020-11-19 07:22:30'),
(829, 'product_category_en_text', 'Category', '2020-07-21 04:37:42', '2020-07-21 11:07:47'),
(830, 'product_category_tur_text', 'Kategori', '2020-07-21 04:37:42', '2020-07-21 11:07:47'),
(831, 'product_category_ar_text', 'الفئة', '2020-07-21 04:37:42', '2020-07-21 11:07:47'),
(832, 'product_category_sp_text', 'Categoría', '2020-07-21 04:37:42', '2020-07-21 11:07:47'),
(833, 'cash_on_delivery_preview_logo', '77', '2020-07-21 05:18:45', '2021-01-13 20:39:34'),
(834, 'paystack_preview_logo', '78', '2020-07-21 05:18:45', '2021-01-13 20:39:34'),
(835, 'paystack_public_key', 'pk_test_081a8fcd9423dede2de7b4c3143375b5e5415290', '2020-07-21 05:18:45', '2021-01-13 20:39:34'),
(836, 'paystack_secret_key', 'sk_test_9bd5e9ecd2657e4ee9f22e60a3749a70f6364eb5', '2020-07-21 05:18:45', '2021-01-13 20:39:34'),
(837, 'paystack_merchant_email', 'dvrobin4@gmail.com', '2020-07-21 05:18:45', '2021-01-13 20:39:34'),
(838, 'razorpay_key', 'rzp_test_SXk7LZqsBPpAkj', '2020-07-21 05:18:45', '2021-01-13 20:39:35'),
(839, 'razorpay_secret', 'Nenvq0aYArtYBDOGgmMH7JNv', '2020-07-21 05:18:45', '2021-01-13 20:39:35'),
(840, 'stripe_publishable_key', 'pk_test_51GwS1SEmGOuJLTMsIeYKFtfAT3o3Fc6IOC7wyFmmxA2FIFQ3ZigJ2z1s4ZOweKQKlhaQr1blTH9y6HR2PMjtq1Rx00vqE8LO0x', '2020-07-21 05:18:45', '2021-01-13 20:39:35'),
(841, 'stripe_secret_key', 'sk_test_51GwS1SEmGOuJLTMs2vhSliTwAGkOt4fKJMBrxzTXeCJoLrRu8HFf4I0C5QuyE3l3bQHBJm3c0qFmeVjd0V9nFb6Z00VrWDJ9Uw', '2020-07-21 05:18:45', '2021-01-13 20:39:35'),
(842, 'paystack_gateway', 'on', '2020-07-21 05:18:45', '2021-01-13 20:39:35'),
(843, 'cash_on_delivery_gateway', 'on', '2020-07-21 05:18:45', '2021-01-13 20:39:35'),
(844, 'blog_page_en_read_more_btn_text', 'Read More', '2020-07-21 05:28:57', '2020-07-21 05:28:57'),
(845, 'blog_page_tur_read_more_btn_text', 'Daha fazla oku', '2020-07-21 05:28:57', '2020-07-21 05:28:57'),
(846, 'blog_page_ar_read_more_btn_text', 'قراءة المزيد', '2020-07-21 05:28:57', '2020-07-21 05:28:57'),
(847, 'blog_page_sp_read_more_btn_text', 'Lee mas', '2020-07-21 05:28:57', '2020-07-21 05:28:57'),
(848, 'blog_page_item', '6', '2020-07-21 05:28:57', '2020-07-21 05:28:57'),
(849, 'blog_page_recent_post_widget_items', '5', '2020-07-21 05:28:57', '2020-07-21 05:28:57'),
(850, 'blog_single_page_en_related_post_title', 'Related Post', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(851, 'blog_single_page_en_share_title', 'Share', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(852, 'blog_single_page_en_category_title', 'Blog Categories', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(853, 'blog_single_page_en_recent_post_title', 'Related Posts', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(854, 'blog_single_page_en_tags_title', 'Tags', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(855, 'blog_single_page_tur_related_post_title', 'İlgili Yazı', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(856, 'blog_single_page_tur_share_title', 'Paylaş', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(857, 'blog_single_page_tur_category_title', 'Blog Kategorileri', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(858, 'blog_single_page_tur_recent_post_title', 'yakın zamanda Gönderilenler', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(859, 'blog_single_page_tur_tags_title', 'Etiketler', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(860, 'blog_single_page_ar_related_post_title', 'منشور له صلة', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(861, 'blog_single_page_ar_share_title', 'شارك', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(862, 'blog_single_page_ar_category_title', 'الفئة', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(863, 'blog_single_page_ar_recent_post_title', 'المنشور الاخير...', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(864, 'blog_single_page_ar_tags_title', 'العلامات', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(865, 'blog_single_page_sp_related_post_title', 'Publicación relacionada', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(866, 'blog_single_page_sp_share_title', 'Compartir', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(867, 'blog_single_page_sp_category_title', 'Categorías de blog', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(868, 'blog_single_page_sp_recent_post_title', 'Mensajes recientes', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(869, 'blog_single_page_sp_tags_title', 'Etiquetas', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(870, 'blog_single_page_recent_post_item', '5', '2020-07-21 05:29:29', '2020-07-21 05:30:39'),
(871, 'product_price_filter_en_text', 'Price Filter', '2020-07-21 09:40:41', '2020-07-21 11:07:47'),
(872, 'product_rating_filter_en_text', 'Rating Filter', '2020-07-21 09:40:41', '2020-07-21 11:07:47'),
(873, 'product_price_filter_tur_text', 'Fiyat Filtresi', '2020-07-21 09:40:42', '2020-07-21 11:07:47'),
(874, 'product_rating_filter_tur_text', 'Derecelendirme Filtresi', '2020-07-21 09:40:42', '2020-07-21 11:07:47'),
(875, 'product_price_filter_ar_text', 'تصفية الأسعار', '2020-07-21 09:40:42', '2020-07-21 11:07:47'),
(876, 'product_rating_filter_ar_text', 'مرشح التصنيف', '2020-07-21 09:40:42', '2020-07-21 11:07:47'),
(877, 'product_price_filter_sp_text', 'Filtro de precios', '2020-07-21 09:40:42', '2020-07-21 11:07:47'),
(878, 'product_rating_filter_sp_text', 'Filtro de calificación', '2020-07-21 09:40:42', '2020-07-21 11:07:47'),
(879, 'product_single_en_ratings_text', 'Ratings', '2020-07-21 10:06:22', '2020-11-19 07:22:30'),
(880, 'product_single_tur_ratings_text', 'Puanlar', '2020-07-21 10:06:22', '2020-11-19 07:22:30'),
(881, 'product_single_ar_ratings_text', 'التقييمات', '2020-07-21 10:06:22', '2020-11-19 07:22:30'),
(882, 'product_single_sp_ratings_text', 'Calificaciones', '2020-07-21 10:06:22', '2020-11-19 07:22:30'),
(883, 'site_rss_feed_description', 'The description of the feed.', '2020-07-23 01:32:47', '2020-07-23 01:35:22'),
(884, 'site_rss_feed_title', 'My feeds', '2020-07-23 01:32:47', '2020-07-23 01:35:22'),
(885, 'site_rss_feed_url', '/feeds', '2020-07-23 01:32:47', '2020-07-23 01:35:22'),
(886, 'site_gdpr_cookie_en_title', 'Cookies & Privacy', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(887, 'site_gdpr_cookie_en_message', 'Is education residence conveying so so. Suppose shyness say ten behaved morning had. Any unsatiable assistance compliment occasional too reasonably advantages.', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(888, 'site_gdpr_cookie_en_more_info_label', 'More information', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(889, 'site_gdpr_cookie_en_more_info_link', '{url}/p/privacy-policy', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(890, 'site_gdpr_cookie_en_accept_button_label', 'Accept Cookie', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(891, 'site_gdpr_cookie_tur_title', 'Çerezler ve Gizlilik', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(892, 'site_gdpr_cookie_tur_message', 'Eğitim yurdu da öyle mi? Diyelim ki utangaç sabahın on davranmış olduğunu söylüyor. Herhangi bir tatmin edici yardım, zaman zaman çok makul avantajlar iltifat.', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(893, 'site_gdpr_cookie_tur_more_info_label', 'Daha fazla bilgi', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(894, 'site_gdpr_cookie_tur_more_info_link', '#', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(895, 'site_gdpr_cookie_tur_accept_button_label', 'Çerez Kabul Et', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(896, 'site_gdpr_cookie_ar_title', 'ملفات تعريف الارتباط والخصوصية', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(897, 'site_gdpr_cookie_ar_message', 'هل نقل التعليم هو الأمر كذلك. افترض أن الخجل يقول إن العاشرة صباح تصرفت. أي مساعدة غير مرضية تكمل مزايا عرضية للغاية.', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(898, 'site_gdpr_cookie_ar_more_info_label', 'معلومات اكثر', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(899, 'site_gdpr_cookie_ar_more_info_link', '#', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(900, 'site_gdpr_cookie_ar_accept_button_label', 'قبول ملف تعريف الارتباط', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(901, 'site_gdpr_cookie_sp_title', 'Cookies y privacidad', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(902, 'site_gdpr_cookie_sp_message', '¿La residencia educativa se transmite así? Supongamos que la timidez dice que diez se portaron bien. Cualquier asistencia insaciable complementa las ventajas ocasionales y demasiado razonables.', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(903, 'site_gdpr_cookie_sp_more_info_label', 'Más información', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(904, 'site_gdpr_cookie_sp_more_info_link', '#', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(905, 'site_gdpr_cookie_sp_accept_button_label', 'Aceptar cookie', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(906, 'site_gdpr_cookie_delay', '5000', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(907, 'site_gdpr_cookie_enabled', 'on', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(908, 'site_gdpr_cookie_expire', '30', '2020-07-24 11:02:41', '2020-07-24 11:11:03'),
(909, 'site_gdpr_cookie_en_decline_button_label', 'Decline Cookie', '2020-07-24 11:07:57', '2020-07-24 11:11:03'),
(910, 'site_gdpr_cookie_tur_decline_button_label', 'Çerezleri Reddet', '2020-07-24 11:07:57', '2020-07-24 11:11:03'),
(911, 'site_gdpr_cookie_ar_decline_button_label', 'رفض ملف تعريف الارتباط', '2020-07-24 11:07:57', '2020-07-24 11:11:03'),
(912, 'site_gdpr_cookie_sp_decline_button_label', 'Rechazar Cookie', '2020-07-24 11:07:57', '2020-07-24 11:11:03'),
(913, 'site_disqus_key', 'nexelit', '2020-07-24 11:41:07', '2020-07-28 22:56:28'),
(914, 'site_google_analytics', 'UA-173946136-1', '2020-07-24 11:41:07', '2020-07-28 22:56:28'),
(915, 'tawk_api_key', '5e0b3e167e39ea1242a27b69', '2020-07-24 11:41:07', '2020-07-28 22:56:28'),
(916, 'site_google_map_api', NULL, '2020-07-24 11:41:07', '2020-07-24 11:41:33'),
(917, 'site_google_captcha_v3_site_key', '6LdvUeQUAAAAAHKM02AWBjtKAAL0-AqUk_qkqa0O', '2020-07-24 11:41:07', '2020-07-28 22:56:28'),
(918, 'site_google_captcha_v3_secret_key', '6LdvUeQUAAAAABaCkkQbMY-z2XaqYsLSWwYgB6Ru', '2020-07-24 11:41:07', '2020-07-28 22:56:28'),
(919, 'site_install_path', 'http://localhost:8888/nexelit', '2020-07-24 23:56:42', '2021-01-12 11:34:02'),
(920, 'site_admin_path', 'http://localhost:8888/nexelit/admin-home', '2020-07-24 23:56:42', '2021-01-12 11:34:02'),
(921, 'site_frontend_path', 'http://localhost:8888/nexelit', '2020-07-24 23:56:42', '2021-01-12 11:34:02'),
(922, 'site_script_version', '2.2', '2020-07-24 23:56:42', '2021-01-12 11:34:02'),
(923, 'item_purchase_key', 'dfgdfgdfgdfgdfg', '2020-07-25 00:27:03', '2020-10-04 11:00:51'),
(924, 'item_license_status', 'not_verified', '2020-07-25 00:27:03', '2021-01-11 10:25:00'),
(925, 'item_license_msg', 'license your cms from \"General Settings > License\". &nbsp; To stay safe and get update also get best support.', '2020-07-25 00:27:03', '2021-01-11 10:25:00'),
(926, 'site_script_unique_key', 'NB2GLtODUjYOc9bFkPq2pKI8uma3G6WX', '2020-07-25 00:57:35', '2021-01-12 11:34:02'),
(927, 'site_sticky_navbar_enabled', 'on', '2020-07-25 07:32:50', '2021-01-12 08:25:56'),
(928, 'popup_enable_status', 'on', '2020-07-26 04:34:23', '2020-10-02 00:01:50'),
(929, 'popup_delay_time', '10000', '2020-07-26 04:34:23', '2020-10-02 00:01:50'),
(930, 'popup_selected_en_id', '1', '2020-07-26 04:34:23', '2020-10-02 00:01:50'),
(931, 'popup_selected_tur_id', '6', '2020-07-26 04:34:23', '2020-10-02 00:01:50'),
(932, 'popup_selected_ar_id', '7', '2020-07-26 04:34:23', '2020-10-02 00:01:50');
INSERT INTO `static_options` (`id`, `option_name`, `option_value`, `created_at`, `updated_at`) VALUES
(933, 'popup_selected_sp_id', '8', '2020-07-26 04:34:23', '2020-10-02 00:01:50'),
(934, 'about_page_en_about_section_title', 'We have 15 Years of Experience of any kind it solution', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(935, 'about_page_en_about_section_description', 'Affronting discretion as do is announcing. Now months esteem oppose nearer enable too six. She numerous unlocked you perceive speedily.', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(936, 'about_page_en_about_section_quote_text', 'Whatever your business may be whether you run a creative agency, a digital studio.', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(937, 'about_page_tur_about_section_title', 'Her türlü IT çözümünün 15 Yıllık Deneyimine sahibiz', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(938, 'about_page_tur_about_section_description', 'Takdir yetkisi olduğu gibi ilan ediliyor. Şimdi ay saygısı çok yakın altı izin karşı. Çok hızlı bir şekilde algılamanızın kilidini açtı.', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(939, 'about_page_tur_about_section_quote_text', 'İşiniz ne olursa olsun, ister yaratıcı bir ajans, ister dijital stüdyo yönetin.', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(940, 'about_page_ar_about_section_title', 'لدينا 15 عاما من الخبرة من أي نوع', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(941, 'about_page_ar_about_section_description', 'الإساءة لتقدير كما يفعل الإعلان. الآن احترام أشهر تعارض أقرب تمكين ستة أيضا. لقد فتحت لك العديد من التصورات بسرعة.', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(942, 'about_page_ar_about_section_quote_text', 'مهما كان عملك ، سواء كنت تدير وكالة إبداعية ، أو استوديو رقمي.', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(943, 'about_page_sp_about_section_title', 'Tenemos 15 años de experiencia de cualquier tipo.', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(944, 'about_page_sp_about_section_description', 'Afrontar discreción como hacer es anunciar. Ahora los meses de oposición se oponen más cerca de habilitar también seis. Ella numerosos desbloqueados que percibes rápidamente.', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(945, 'about_page_sp_about_section_quote_text', 'Cualquiera sea su negocio, ya sea que dirija una agencia creativa, un estudio digital.', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(946, 'about_page_image_two', '84', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(947, 'about_page_image_one', '85', '2020-07-26 12:54:47', '2020-07-27 00:57:01'),
(948, 'about_page_en_global_network_button_url', '#', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(949, 'about_page_en_global_network_button_title', 'Learn More', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(950, 'about_page_en_global_network_button_status', 'on', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(951, 'about_page_en_global_network_description', 'Affronting discretion as do is announcing. Now months esteem oppose nearer enable too six. She numerous unlocked you perceive speedily. Affixed offence spirits or ye of offices between. Real on shot it were four an as. Absolute bachelor rendered six nay you juvenile. Vanity entire an chatty to.', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(952, 'about_page_en_global_network_title', 'We Have Global Network Of Clients', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(953, 'about_page_tur_global_network_button_url', '#', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(954, 'about_page_tur_global_network_button_title', 'Daha fazla bilgi edin', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(955, 'about_page_tur_global_network_button_status', 'on', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(956, 'about_page_tur_global_network_description', 'Takdir yetkisi olduğu gibi ilan ediliyor. Şimdi ay saygısı çok yakın altı izin karşı. Çok hızlı bir şekilde algılamanızın kilidini açtı. Sıkıştırılmış suç ruhları veya ofisler arasında. Atışta gerçek dört yaşındaydı. Mutlak bekar altı çocuk seni kıldı. Vanity tüm konuşkan.', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(957, 'about_page_tur_global_network_title', 'Küresel Müşteri Ağımız Var', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(958, 'about_page_ar_global_network_button_url', '#', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(959, 'about_page_ar_global_network_button_title', 'أعرف أكثر', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(960, 'about_page_ar_global_network_button_status', 'on', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(961, 'about_page_ar_global_network_description', 'الإساءة لتقدير كما يفعل الإعلان. الآن احترام أشهر تعارض أقرب تمكين ستة أيضا. لقد فتحت لك العديد من التصورات بسرعة. أرواح مخالفة ملحقة أو أنتم من مكاتب بين. الحقيقي على النار كانت أربعة أس. البكالوريوس المطلق جعلك ستة أيام من الأحداث. الغرور كله شطي.', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(962, 'about_page_ar_global_network_title', 'لدينا شبكة عالمية من العملاء', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(963, 'about_page_sp_global_network_button_url', '#', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(964, 'about_page_sp_global_network_button_title', 'Aprende más', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(965, 'about_page_sp_global_network_button_status', 'on', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(966, 'about_page_sp_global_network_description', 'Afrontar discreción como hacer es anunciar. Ahora los meses de oposición se oponen más cerca de habilitar también seis. Ella numerosos desbloqueados que percibes rápidamente. Espíritus ofensivos fijos o ye de oficinas entre. Real en tiro eran cuatro y as. El soltero absoluto se convirtió en seis menos juveniles. Vanidad entera es hablador.', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(967, 'about_page_sp_global_network_title', 'Tenemos una red global de clientes', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(968, 'about_page_global_network_image', '86', '2020-07-26 12:55:06', '2020-07-27 01:00:30'),
(969, 'about_page_testimonial_section_status', 'on', '2020-07-26 12:55:25', '2020-07-26 12:55:25'),
(970, 'about_page_about_us_section_status', 'on', '2020-07-26 12:55:25', '2020-07-26 12:55:25'),
(971, 'about_page_brand_logo_section_status', 'on', '2020-07-26 12:55:25', '2020-07-26 12:55:25'),
(972, 'about_page_team_member_section_status', 'on', '2020-07-26 12:55:25', '2020-07-26 12:55:25'),
(973, 'about_page_experience_section_status', 'on', '2020-07-26 12:55:25', '2020-07-26 12:55:25'),
(974, 'about_page_key_feature_section_status', 'on', '2020-07-26 12:55:25', '2020-07-26 12:55:25'),
(975, 'about_page_global_network_section_status', 'on', '2020-07-26 12:55:25', '2020-07-26 12:55:25'),
(976, 'about_page_en_experience_title', 'We Have 15 Years Of Experience Of Tech', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(977, 'about_page_en_experience_description', 'Affronting discretion as do is announcing. Now months esteem oppose nearer enable too six. She numerous unlocked you perceive speedily. Affixed offence spirits or ye of offices between.', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(978, 'about_page_en_experience_video_url', 'https://www.youtube.com/watch?v=k26DOtwPN7s', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(979, 'about_page_en_quote_text', 'Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited.', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(980, 'about_page_tur_experience_title', '15 Yıllık Teknoloji Tecrübemiz Var', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(981, 'about_page_tur_experience_description', 'Takdir yetkisi olduğu gibi ilan ediliyor. Şimdi ay saygısı çok yakın altı izin karşı. Çok hızlı bir şekilde algılamanızın kilidini açtı. Sıkıştırılmış suç ruhları veya ofisler arasında.', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(982, 'about_page_tur_experience_video_url', 'https://www.youtube.com/watch?v=k26DOtwPN7s', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(983, 'about_page_tur_quote_text', 'Yarım ledin neden yatağın yakınında olduğunu kaybet. Başkalarının dışında dönemin basit babası meşgul. Verdiğim dar olsa işaretlenmiş yaz yapmak. Bahar resmi hiçbir ilçe beklemiyordunuz.', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(984, 'about_page_ar_experience_title', 'لدينا 15 عاما من الخبرة التقنية', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(985, 'about_page_ar_experience_description', 'الإساءة لتقدير كما يفعل الإعلان. الآن احترام أشهر تعارض أقرب تمكين ستة أيضا. لقد فتحت لك العديد من التصورات بسرعة. أرواح مخالفة ملحقة أو أنتم من مكاتب بين.', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(986, 'about_page_ar_experience_video_url', 'https://www.youtube.com/watch?v=k26DOtwPN7s', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(987, 'about_page_ar_quote_text', 'خسر بعيدًا عن نصف مصباح بالقرب من السرير. في الانخراط والد بسيط للآخرين ما عدا. عطائي القيام الصيف على الرغم من ضيق ملحوظ في. انتظر الربيع الرسمي لا مقاطعة انتم.', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(988, 'about_page_sp_experience_title', 'Tenemos 15 años de experiencia en tecnología', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(989, 'about_page_sp_experience_description', 'Afrontar discreción como hacer es anunciar. Ahora los meses de oposición se oponen más cerca de habilitar también seis. Ella numerosos desbloqueados que percibes rápidamente. Espíritus ofensivos fijos o ye de oficinas entre.', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(990, 'about_page_sp_experience_video_url', 'https://www.youtube.com/watch?v=k26DOtwPN7s', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(991, 'about_page_sp_quote_text', 'Perder de vista por qué medio conducido tiene cerca de la cama. En comprometer padre simple de período otros excepto. Mi donación de verano de aunque estrecho marcado en. Primavera formal que ningún condado esperó.', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(992, 'about_page_experience_signature_image', '87', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(993, 'about_page_experience_video_background_image', '88', '2020-07-27 01:04:13', '2020-07-27 01:04:13'),
(994, 'about_page_en_team_member_section_title', 'Our Team', '2020-07-27 01:05:21', '2020-07-27 01:05:21'),
(995, 'about_page_en_team_member_section_description', 'Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited.', '2020-07-27 01:05:21', '2020-07-27 01:05:21'),
(996, 'about_page_tur_team_member_section_title', 'Bizim takım', '2020-07-27 01:05:21', '2020-07-27 01:05:21'),
(997, 'about_page_tur_team_member_section_description', 'Yarım ledin neden yatağın yakınında olduğunu kaybet. Başkalarının dışında dönemin basit babası meşgul. Verdiğim dar olsa işaretlenmiş yaz yapmak. Bahar resmi hiçbir ilçe beklemiyordunuz.', '2020-07-27 01:05:21', '2020-07-27 01:05:21'),
(998, 'about_page_ar_team_member_section_title', 'فريقنا', '2020-07-27 01:05:21', '2020-07-27 01:05:21'),
(999, 'about_page_ar_team_member_section_description', 'خسر بعيدًا عن نصف مصباح LED بالقرب من السرير. في الانخراط والد بسيط للآخرين ما عدا. عطائي القيام الصيف على الرغم من ضيق ملحوظ في. انتظر الربيع الرسمي لا مقاطعة انتم.', '2020-07-27 01:05:21', '2020-07-27 01:05:21'),
(1000, 'about_page_sp_team_member_section_title', 'Nuestro equipo', '2020-07-27 01:05:21', '2020-07-27 01:05:21'),
(1001, 'about_page_sp_team_member_section_description', 'Perder de vista por qué medio conducido tiene cerca de la cama. En comprometer padre simple de período otros excepto. Mi donación de verano de aunque estrecho marcado en. Primavera formal que ningún condado esperó.', '2020-07-27 01:05:21', '2020-07-27 01:05:21'),
(1002, 'about_page_team_member_item', '6', '2020-07-27 01:05:21', '2020-07-27 01:05:21'),
(1003, 'about_page_en_testimonial_title', 'Clients Testimonial', '2020-07-27 01:06:37', '2020-07-27 01:06:37'),
(1004, 'about_page_tur_testimonial_title', 'Müşteri Görüşleri', '2020-07-27 01:06:37', '2020-07-27 01:06:37'),
(1005, 'about_page_ar_testimonial_title', 'شهادات العملاء', '2020-07-27 01:06:37', '2020-07-27 01:06:37'),
(1006, 'about_page_sp_testimonial_title', 'Testimonio de clientes', '2020-07-27 01:06:37', '2020-07-27 01:06:37'),
(1007, 'about_page_testimonial_background_image', '89', '2020-07-27 01:06:37', '2020-07-27 01:06:37'),
(1008, 'about_page_testimonial_item', '4', '2020-07-27 01:06:37', '2020-07-27 01:06:37'),
(1009, 'maintain_page_en_title', 'We are on Scheduled Maintenance', '2020-07-27 01:11:36', '2020-07-27 01:12:20'),
(1010, 'maintain_page_en_description', 'Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited.', '2020-07-27 01:11:36', '2020-07-27 01:12:20'),
(1011, 'maintain_page_tur_title', NULL, '2020-07-27 01:11:36', '2020-07-27 01:12:20'),
(1012, 'maintain_page_tur_description', NULL, '2020-07-27 01:11:36', '2020-07-27 01:12:20'),
(1013, 'maintain_page_ar_title', NULL, '2020-07-27 01:11:36', '2020-07-27 01:12:20'),
(1014, 'maintain_page_ar_description', NULL, '2020-07-27 01:11:36', '2020-07-27 01:12:20'),
(1015, 'maintain_page_sp_title', NULL, '2020-07-27 01:11:36', '2020-07-27 01:12:20'),
(1016, 'maintain_page_sp_description', NULL, '2020-07-27 01:11:36', '2020-07-27 01:12:20'),
(1017, 'maintain_page_logo', '5', '2020-07-27 01:11:55', '2020-07-27 01:11:55'),
(1018, 'maintain_page_background_image', '89', '2020-07-27 01:11:55', '2020-07-27 01:11:55'),
(1019, 'home_page_02_about_us_video_background_image', '88', '2020-07-27 01:54:01', '2020-07-27 01:56:10'),
(1020, 'home_page_02_about_us_signature_image', '87', '2020-07-27 01:54:01', '2020-07-27 01:56:10'),
(1021, 'home_page_01_en_about_us_description', 'Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited. My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent.', '2020-07-27 01:54:56', '2020-07-27 03:13:51'),
(1022, 'home_page_01_en_about_us_quote_text', 'Lose away off why half led have near bed. At engage simple father of period others except.', '2020-07-27 01:54:56', '2020-07-27 02:27:29'),
(1023, 'home_page_01_tur_about_us_description', 'Yarım ledin neden yatağın yakınında olduğunu kaybet. Başkalarının dışında dönemin basit babası meşgul. Verdiğim dar olsa işaretlenmiş yaz yapmak. Bahar resmi hiçbir ilçe beklemiyordunuz. Benim düzenli olarak tezahürat olsun belki de kızarıyor. Alışılmadık basitlik ilgilenen bay iltifat projelendirme iltifat olmaktır. Beyefendi o eylül mükemmel.', '2020-07-27 01:56:10', '2020-07-27 03:13:51'),
(1024, 'home_page_01_tur_about_us_quote_text', 'İki konforu davet etti. Yine de gelir etkisi edward. Tüm arzu yolu tasarımı az.', '2020-07-27 01:56:10', '2020-07-27 02:27:29'),
(1025, 'home_page_01_ar_about_us_description', 'خسر بعيدًا عن نصف مصباح LED بالقرب من السرير. في الانخراط والد بسيط للآخرين ما عدا. عطائي القيام الصيف على الرغم من ضيق ملحوظ في. انتظر الربيع الرسمي لا مقاطعة انتم. بلدي هل هلل هل بانتظام في الوعد خجل ربما. السيد المهتم بالبساطة غير المألوف هو مجاملة إسقاط مسكني. الرجل الذي كان في سبتمبر يا ممتاز.', '2020-07-27 01:56:10', '2020-07-27 03:13:51'),
(1026, 'home_page_01_ar_about_us_quote_text', 'خسر بعيدًا عن نصف مصباح LED بالقرب من السرير. في الانخراط والد بسيط للآخرين ما عدا.', '2020-07-27 01:56:10', '2020-07-27 02:27:29'),
(1027, 'home_page_01_sp_about_us_description', 'Perder de vista por qué medio conducido tiene cerca de la cama. En comprometer padre simple de período otros excepto. Mi donación de verano de aunque estrecho marcado en. Primavera formal que ningún condado esperó. Mi si aplaudió regularmente de promesa se sonroja quizás. La simplicidad poco común que le interesa al Sr. es un cumplido proyectando mi habitación. Caballero, septiembre en oh excelente.', '2020-07-27 01:56:10', '2020-07-27 03:13:51'),
(1028, 'home_page_01_sp_about_us_quote_text', 'Ella formando dos consuelo invitado. Sin embargo, ella tiene un efecto edward. Todo el deseo de diseño pocos.', '2020-07-27 01:56:10', '2020-07-27 02:27:29'),
(1029, 'home_page_01_en_quality_area_list', 'How promotion excellent curiosity yet attempted happiness. \r\nFor every delay death ask style. \r\nMe mean able my by in they. \r\nExtremity now strangers contained breakfast him discourse additions.', '2020-07-27 01:58:27', '2020-07-27 03:16:49'),
(1030, 'home_page_01_tur_quality_area_list', 'Nasıl mükemmel merak henüz mutluluk girişiminde.\r\nHer gecikme ölümü için stil isteyin.\r\nYani benim tarafından yapabildim.\r\nEkstremite şimdi yabancılara kahvaltı söylemleri eklemeler içeriyordu.', '2020-07-27 01:58:27', '2020-07-27 03:16:49'),
(1031, 'home_page_01_ar_quality_area_list', 'كيف الترويج فضول ممتاز مع محاولة السعادة.\r\nعن كل تأخير الموت نسأل أسلوب.\r\nأعني قادرة على من هم فيها.\r\nاحتوى التطرف الآن الغرباء على وجبة الإفطار له إضافات الخطاب.', '2020-07-27 01:58:27', '2020-07-27 03:16:49'),
(1032, 'home_page_01_sp_quality_area_list', 'Cómo fomentar una excelente curiosidad al tratar de ser feliz.\r\nPor cada retraso en la muerte requerimos estilo.\r\nMe refiero a capaces de quienes son.\r\nEl extremismo ahora contenía extraños para el desayuno con discurso extra.', '2020-07-27 01:58:27', '2020-07-27 03:16:49'),
(1033, 'home_page_02_quality_area_image', '86', '2020-07-27 01:58:27', '2020-07-27 02:17:13'),
(1034, 'home_page_04_quality_area_image', '93', '2020-07-27 01:58:27', '2020-07-27 03:16:49'),
(1035, 'home_page_01_case_study_items', '6', '2020-07-27 02:00:18', '2021-01-09 07:33:38'),
(1036, 'home_page_02_case_study_background_image', '90', '2020-07-27 02:00:18', '2020-07-27 02:00:24'),
(1037, 'home_page_01_en_team_member_section_title', 'Our Team', '2020-07-27 02:01:24', '2020-07-27 02:02:26'),
(1038, 'home_page_01_en_team_member_section_description', 'Those an equal point no years do. Depend warmth fat but her but played. Shy and subjects wondered trifling pleasant.', '2020-07-27 02:01:24', '2020-07-27 02:02:26'),
(1039, 'home_page_01_tur_team_member_section_title', 'Bizim takım', '2020-07-27 02:01:24', '2020-07-27 02:02:26'),
(1040, 'home_page_01_tur_team_member_section_description', 'Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu.', '2020-07-27 02:01:24', '2020-07-27 02:02:26'),
(1041, 'home_page_01_ar_team_member_section_title', 'قابل الفريق', '2020-07-27 02:01:24', '2020-07-27 02:02:26'),
(1042, 'home_page_01_ar_team_member_section_description', 'تلك نقطة متساوية لا تفعلها سنوات. تعتمد على دفء الدهون ولكن هي لعبت. تساءل الخجول والمواضيع تافهة ممتعة.', '2020-07-27 02:01:24', '2020-07-27 02:02:26'),
(1043, 'home_page_01_sp_team_member_section_title', 'Nuestro equipo', '2020-07-27 02:01:24', '2020-07-27 02:02:26'),
(1044, 'home_page_01_sp_team_member_section_description', 'Esos son un punto igual sin años. Dependen del calor gordo pero ella pero juega. Tímido y los sujetos se preguntaban trivialmente agradable.', '2020-07-27 02:01:24', '2020-07-27 02:02:26'),
(1045, 'home_page_01_team_member_items', '4', '2020-07-27 02:01:24', '2020-07-27 02:02:26'),
(1046, 'home_page_01_en_brand_logo_area_title', 'We have more then 20k satisfied client these work with us.', '2020-07-27 02:03:10', '2020-07-27 02:03:10'),
(1047, 'home_page_01_tur_brand_logo_area_title', 'Biz daha sonra 20k memnun müşteri bu çalışmaları bizimle.', '2020-07-27 02:03:10', '2020-07-27 02:03:10'),
(1048, 'home_page_01_ar_brand_logo_area_title', 'لدينا أكثر من 20 ألف عميل راضٍ عن هذه الأعمال معنا.', '2020-07-27 02:03:10', '2020-07-27 02:03:10'),
(1049, 'home_page_01_sp_brand_logo_area_title', 'Tenemos más de 20 mil clientes satisfechos que trabajan con nosotros.', '2020-07-27 02:03:10', '2020-07-27 02:03:10'),
(1050, 'home_page_03_about_us_image_one', '84', '2020-07-27 02:27:29', '2020-07-27 02:27:29'),
(1051, 'home_page_03_about_us_image_two', '85', '2020-07-27 02:27:29', '2020-07-27 02:27:30'),
(1052, 'home_page_01_en_cta_area_button_title', 'Call 01234 - 123456897', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1053, 'home_page_01_en_cta_area_title', 'Are you looking to grow your business?', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1054, 'home_page_01_en_cta_area_button_status', 'on', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1055, 'home_page_01_tur_cta_area_button_title', 'Bize Ulaşın', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1056, 'home_page_01_tur_cta_area_title', 'Başlangıç çözümü mü arıyorsunuz?', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1057, 'home_page_01_tur_cta_area_button_status', 'on', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1058, 'home_page_01_ar_cta_area_button_title', 'اتصل على', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1059, 'home_page_01_ar_cta_area_title', 'هل تتطلع لتنمية عملك؟', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1060, 'home_page_01_ar_cta_area_button_status', 'on', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1061, 'home_page_01_sp_cta_area_button_title', 'Contacta', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1062, 'home_page_01_sp_cta_area_title', '¿Buscas una solución de inicio?', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1063, 'home_page_01_sp_cta_area_button_status', 'on', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1064, 'home_page_01_cta_area_button_url', '#', '2020-07-27 02:29:05', '2020-07-28 04:12:08'),
(1065, 'home_page_01_en_about_us_our_mission_title', 'Our Mission', '2020-07-27 03:11:34', '2020-07-27 03:13:51'),
(1066, 'home_page_01_en_about_us_our_mission_description', 'My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent.', '2020-07-27 03:11:34', '2020-07-27 03:13:51'),
(1067, 'home_page_01_en_about_us_our_vision_title', 'Our Vision', '2020-07-27 03:11:34', '2020-07-27 03:13:51'),
(1068, 'home_page_01_en_about_us_our_vision_description', 'My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent.', '2020-07-27 03:11:34', '2020-07-27 03:13:51'),
(1069, 'home_page_04_about_us_our_mission_image', '91', '2020-07-27 03:11:34', '2020-07-27 03:13:51'),
(1070, 'home_page_04_about_us_our_vision_image', '92', '2020-07-27 03:11:34', '2020-07-27 03:13:51'),
(1071, 'home_page_01_tur_about_us_our_mission_title', 'Görevimiz', '2020-07-27 03:13:51', '2020-07-27 03:13:51'),
(1072, 'home_page_01_tur_about_us_our_mission_description', 'Benim düzenli olarak tezahürat olsun belki de kızarıyor. Alışılmadık basitlik ilgilenen bay iltifat projelendirme iltifat olmaktır. Beyefendi o eylül mükemmel.', '2020-07-27 03:13:51', '2020-07-27 03:13:51'),
(1073, 'home_page_01_tur_about_us_our_vision_title', 'Vizyonumuz', '2020-07-27 03:13:51', '2020-07-27 03:13:51'),
(1074, 'home_page_01_tur_about_us_our_vision_description', 'Benim düzenli olarak tezahürat olsun belki de kızarıyor. Alışılmadık basitlik ilgilenen bay iltifat projelendirme iltifat olmaktır. Beyefendi o eylül mükemmel.', '2020-07-27 03:13:51', '2020-07-27 03:13:51'),
(1075, 'home_page_01_ar_about_us_our_mission_title', 'مهمتنا', '2020-07-27 03:13:51', '2020-07-27 03:13:51'),
(1076, 'home_page_01_ar_about_us_our_mission_description', 'بلدي هل هلل هل بانتظام في الوعد خجل ربما. السيد المهتم بالبساطة غير المألوف هو مجاملة إسقاط مسكني. الرجل الذي كان في سبتمبر يا ممتاز.', '2020-07-27 03:13:51', '2020-07-27 03:13:51'),
(1077, 'home_page_01_ar_about_us_our_vision_title', 'رؤيتنا', '2020-07-27 03:13:51', '2020-07-27 03:13:51'),
(1078, 'home_page_01_ar_about_us_our_vision_description', 'بلدي هل هلل هل بانتظام في الوعد خجل ربما. السيد المهتم بالبساطة غير المألوف هو مجاملة إسقاط مسكني. الرجل الذي كان في سبتمبر يا ممتاز.', '2020-07-27 03:13:51', '2020-07-27 03:13:51'),
(1079, 'home_page_01_sp_about_us_our_mission_title', 'Nuestra misión', '2020-07-27 03:13:51', '2020-07-27 03:13:51'),
(1080, 'home_page_01_sp_about_us_our_mission_description', 'Mi si aplaudió regularmente de promesa se sonroja quizás. La simplicidad poco común que le interesa al Sr. es un cumplido proyectando mi habitación. Caballero, septiembre en oh excelente.', '2020-07-27 03:13:51', '2020-07-27 03:13:51'),
(1081, 'home_page_01_sp_about_us_our_vision_title', 'Nuestra visión', '2020-07-27 03:13:51', '2020-07-27 03:13:51'),
(1082, 'home_page_01_sp_about_us_our_vision_description', 'Mi si aplaudió regularmente de promesa se sonroja quizás. La simplicidad poco común que le interesa al Sr. es un cumplido proyectando mi habitación. Caballero, septiembre en oh excelente.', '2020-07-27 03:13:51', '2020-07-27 03:13:51'),
(1083, 'home_03_testimonial_bg', '94', '2020-07-27 03:17:48', '2020-07-27 03:17:48'),
(1084, 'site_third_party_tracking_code', NULL, '2020-07-28 22:28:37', '2020-07-28 22:56:28'),
(1085, 'service_query_en_success_message', 'Thanks for your message. we will contact you soon.', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1086, 'case_study_query_en_success_message', 'Thanks for your message. we will contact you soon.', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1087, 'apply_job_en_success_message', 'Your Application Is Submitted Successfully!!', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1088, 'event_attendance_mail_en_success_message', 'Thanks for your Booking. we will get back to you very soon.', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1089, 'feedback_form_mail_en_success_message', 'Thanks for your feedback!!', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1090, 'service_query_tur_success_message', 'Mesajın için teşekkürler. yakında sizinle iletişime geçeceğiz.', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1091, 'case_study_query_tur_success_message', 'Mesajın için teşekkürler. yakında sizinle iletişime geçeceğiz.', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1092, 'apply_job_tur_success_message', 'Başvurunuz Başarıyla Gönderildi !!', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1093, 'event_attendance_mail_tur_success_message', 'Rezervasyonunuz için teşekkürler. çok yakında size geri döneceğiz.', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1094, 'feedback_form_mail_tur_success_message', 'Geri bildiriminiz için teşekkürler!!', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1095, 'service_query_ar_success_message', 'شكرا على رسالتك. سوف نتصل بك قريبا.', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1096, 'case_study_query_ar_success_message', 'شكرا على رسالتك. سوف نتصل بك قريبا.', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1097, 'apply_job_ar_success_message', 'يتم تقديم طلبك بنجاح !!', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1098, 'event_attendance_mail_ar_success_message', 'شكرا لحجزك. ونحن سوف نعود إليكم قريبا جدا.', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1099, 'feedback_form_mail_ar_success_message', 'شكرا لملاحظاتك!!', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1100, 'service_query_sp_success_message', 'Gracias por tu mensaje. Nos pondremos en contacto con usted pronto.', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1101, 'case_study_query_sp_success_message', 'Gracias por tu mensaje. Nos pondremos en contacto con usted pronto.', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1102, 'apply_job_sp_success_message', 'Başvurunuz Başarıyla Gönderildi !!', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1103, 'event_attendance_mail_sp_success_message', 'Gracias por su reserva. Regresaremos a Ud. muy pronto.', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1104, 'feedback_form_mail_sp_success_message', 'Gracias por tus comentarios !!', '2020-07-29 19:12:35', '2020-07-29 19:25:46'),
(1105, 'site_usd_to_eur_exchange_rate', '0.85', '2020-08-03 23:18:49', '2020-10-01 10:22:21'),
(1106, 'site_usd_to_ngn_exchange_rate', '385', '2020-08-03 23:18:49', '2021-01-13 20:39:35'),
(1107, 'site_euro_to_ngn_exchange_rate', NULL, '2020-08-03 23:18:49', '2021-01-13 20:39:35'),
(1108, 'mollie_public_key', 'test_SMWtwR6W48QN2UwFQBUqRDKWhaQEvw', '2020-08-03 23:18:49', '2021-01-13 20:39:35'),
(1109, 'mollie_preview_logo', '98', '2020-08-03 23:18:49', '2021-01-13 20:39:35'),
(1110, 'flutterwave_preview_logo', '97', '2020-08-03 23:18:49', '2021-01-13 20:39:35'),
(1111, 'flutterwave_secret_key', 'FLWSECK-e33b022937c2a64446dca55dbb7ceb08-X', '2020-08-03 23:18:49', '2021-01-13 20:39:35'),
(1112, 'flutterwave_public_key', 'FLWPUBK-d981d2a182ba72915b699603c2db82e0-X', '2020-08-03 23:18:49', '2021-01-13 20:39:35'),
(1113, 'mollie_gateway', 'on', '2020-08-03 23:18:49', '2021-01-13 20:39:35'),
(1114, 'flutterwave_gateway', 'on', '2020-08-03 23:18:49', '2021-01-13 20:39:35'),
(1115, 'job_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1116, 'events_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1117, 'product_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1118, 'donations_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1119, 'knowledgebase_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1120, 'job_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1121, 'events_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1122, 'product_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1123, 'donations_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1124, 'knowledgebase_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1125, 'job_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1126, 'events_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1127, 'product_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1128, 'donations_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1129, 'knowledgebase_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1130, 'job_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1131, 'events_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1132, 'product_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1133, 'donations_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1134, 'knowledgebase_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1135, 'job_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1136, 'events_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1137, 'product_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1138, 'donations_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1139, 'knowledgebase_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1140, 'job_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1141, 'events_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1142, 'product_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1143, 'donations_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1144, 'knowledgebase_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1145, 'job_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1146, 'events_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1147, 'product_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1148, 'donations_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1149, 'knowledgebase_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1150, 'job_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1151, 'events_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1152, 'product_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1153, 'donations_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1154, 'knowledgebase_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1155, 'job_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1156, 'events_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1157, 'product_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1158, 'donations_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1159, 'knowledgebase_module_status', 'on', NULL, '2020-10-04 12:06:39'),
(1160, 'donor_page_slug', 'donor-list', '2020-08-11 22:32:03', '2020-08-11 22:33:15'),
(1161, 'donor_page_en_name', 'Donor List', '2020-08-11 22:32:03', '2020-08-11 22:33:16'),
(1162, 'donor_page_en_meta_tags', NULL, '2020-08-11 22:32:03', '2020-08-11 22:33:16'),
(1163, 'donor_page_en_meta_description', NULL, '2020-08-11 22:32:03', '2020-08-11 22:33:16'),
(1164, 'donor_page_tur_name', 'Donör Listesi', '2020-08-11 22:32:03', '2020-08-11 22:33:16'),
(1165, 'donor_page_tur_meta_tags', NULL, '2020-08-11 22:32:03', '2020-08-11 22:33:16'),
(1166, 'donor_page_tur_meta_description', NULL, '2020-08-11 22:32:03', '2020-08-11 22:33:16'),
(1167, 'donor_page_ar_name', 'قائمة المتبرعين', '2020-08-11 22:32:04', '2020-08-11 22:33:16'),
(1168, 'donor_page_ar_meta_tags', NULL, '2020-08-11 22:32:04', '2020-08-11 22:33:16'),
(1169, 'donor_page_ar_meta_description', NULL, '2020-08-11 22:32:04', '2020-08-11 22:33:16'),
(1170, 'donor_page_sp_name', 'Lista de donantes', '2020-08-11 22:32:04', '2020-08-11 22:33:17'),
(1171, 'donor_page_sp_meta_tags', NULL, '2020-08-11 22:32:04', '2020-08-11 22:33:17'),
(1172, 'donor_page_sp_meta_description', NULL, '2020-08-11 22:32:04', '2020-08-11 22:33:17'),
(1173, 'site_usd_to_inr_exchange_rate', '75.04', '2020-08-12 09:13:12', '2021-01-13 20:39:35'),
(1174, 'site_usd_to_idr_exchange_rate', '14714.20', '2020-08-12 09:13:12', '2020-10-01 10:22:21'),
(1175, 'site_usd_to_aud_exchange_rate', '1.40', '2020-08-12 09:13:12', '2020-10-01 10:22:21'),
(1176, 'site_usd_to_sgd_exchange_rate', '1.37', '2020-08-12 09:13:12', '2020-10-01 10:22:21'),
(1177, 'site_usd_to_jpy_exchange_rate', '105.92', '2020-08-12 09:13:12', '2020-10-01 10:22:21'),
(1178, 'site_usd_to_gbp_exchange_rate', '0.77', '2020-08-12 09:13:12', '2020-10-01 10:22:21'),
(1179, 'site_usd_to_myr_exchange_rate', '4.19', '2020-08-12 09:13:12', '2020-10-01 10:22:21'),
(1180, 'site_usd_to_php_exchange_rate', '49.08', '2020-08-12 09:13:12', '2020-10-01 10:22:21'),
(1181, 'site_usd_to_thb_exchange_rate', '31.23', '2020-08-12 09:13:12', '2020-10-01 10:22:21'),
(1182, 'site_usd_to_krw_exchange_rate', '1189.17', '2020-08-12 09:13:12', '2020-10-01 10:22:21'),
(1183, 'site_usd_to_ghs_exchange_rate', '5.77', '2020-08-12 09:13:12', '2020-10-01 10:22:21'),
(1184, 'preloader_status', NULL, '2020-08-13 17:32:24', '2021-01-12 04:45:32'),
(1185, 'og_meta_image_for_site', '6', '2020-08-24 17:35:17', '2021-01-12 08:25:56'),
(1186, 'disable_backend_preloader', NULL, '2020-08-24 17:35:18', '2021-01-12 08:25:56'),
(1187, 'disable_user_email_verify', NULL, '2020-08-24 17:35:18', '2021-01-12 08:25:56'),
(1188, 'event_single_en_event_expire_text', 'Event Expired', '2020-08-24 17:47:28', '2020-08-24 17:47:28'),
(1189, 'event_single_tur_event_expire_text', NULL, '2020-08-24 17:47:29', '2020-08-24 17:47:29'),
(1190, 'event_single_ar_event_expire_text', NULL, '2020-08-24 17:47:29', '2020-08-24 17:47:29'),
(1191, 'event_single_sp_event_expire_text', NULL, '2020-08-24 17:47:29', '2020-08-24 17:47:29'),
(1192, 'donation_custom_amount', '20,40,60,80,100', '2020-08-24 17:49:28', '2020-11-18 02:09:40'),
(1193, 'donation_default_amount', '15', '2020-08-24 17:49:28', '2020-11-18 02:09:40'),
(1204, 'site_usd_to_brl_exchange_rate', NULL, '2020-10-01 10:22:21', '2020-10-01 10:22:21'),
(1206, 'popup_selected_fr_id', NULL, '2020-10-02 00:01:50', '2020-10-02 00:01:50'),
(1207, 'site_currency_symbol_position', 'right', '2020-11-17 05:55:42', '2021-01-13 20:39:35'),
(1208, 'site_default_payment_gateway', 'paypal', '2020-11-17 05:55:42', '2021-01-13 20:39:35'),
(1209, 'site_usd_to_usd_exchange_rate', NULL, '2020-11-17 05:55:42', '2021-01-13 20:39:35'),
(1210, 'site_bdt_to_usd_exchange_rate', '0.012', '2020-11-17 06:03:48', '2021-01-11 14:10:46'),
(1211, 'site_bdt_to_inr_exchange_rate', '0.86', '2020-11-17 06:03:48', '2021-01-11 14:10:46'),
(1212, 'site_bdt_to_ngn_exchange_rate', '4.55', '2020-11-17 06:03:49', '2021-01-11 14:10:46'),
(1213, 'donation_single_en_recent_donation_text', 'Recent Donors', '2020-11-18 02:09:07', '2020-11-18 02:09:40'),
(1214, 'donation_single_tur_recent_donation_text', 'Son Bağışçılar', '2020-11-18 02:09:07', '2020-11-18 02:09:40'),
(1215, 'donation_single_ar_recent_donation_text', 'الجهات المانحة الأخيرة', '2020-11-18 02:09:07', '2020-11-18 02:09:40'),
(1216, 'donation_single_sp_recent_donation_text', 'Donantes recientes', '2020-11-18 02:09:07', '2020-11-18 02:09:40'),
(1217, 'product_tax', 'on', '2020-11-18 09:50:46', '2020-11-19 09:17:57'),
(1218, 'product_tax_system', 'exclusive', '2020-11-18 09:50:46', '2020-11-19 09:17:57'),
(1219, 'product_tax_type', 'individual', '2020-11-18 09:50:46', '2020-11-19 09:17:57'),
(1220, 'product_tax_percentage', '15', '2020-11-18 09:50:46', '2020-11-19 09:17:57'),
(1221, 'product_single_related_products_status', 'on', '2020-11-19 07:20:45', '2020-11-19 07:22:30'),
(1222, 'product_single_products_review_status', 'on', '2020-11-19 07:20:45', '2020-11-19 07:22:30'),
(1223, 'job_single_page_en_job_application_fee_text', 'Application Free', '2020-11-22 02:11:58', '2020-11-22 02:11:58'),
(1224, 'job_single_page_tur_job_application_fee_text', 'Uygulama Ücretsiz', '2020-11-22 02:11:59', '2020-11-22 02:11:59'),
(1225, 'job_single_page_ar_job_application_fee_text', 'تطبيق مجاني', '2020-11-22 02:11:59', '2020-11-22 02:11:59'),
(1226, 'job_single_page_sp_job_application_fee_text', 'Aplicación gratuita', '2020-11-22 02:11:59', '2020-11-22 02:11:59'),
(1227, 'job_cancel_page_en_title', 'Sorry!', '2020-11-30 06:55:31', '2020-11-30 07:12:33'),
(1228, 'job_cancel_page_en_description', NULL, '2020-11-30 06:55:31', '2020-11-30 07:12:33'),
(1229, 'job_cancel_page_tur_title', 'Afedersiniz!', '2020-11-30 06:55:31', '2020-11-30 07:12:33'),
(1230, 'job_cancel_page_tur_description', NULL, '2020-11-30 06:55:31', '2020-11-30 07:12:33'),
(1231, 'job_cancel_page_ar_title', 'آسف!', '2020-11-30 06:55:31', '2020-11-30 07:12:33'),
(1232, 'job_cancel_page_ar_description', NULL, '2020-11-30 06:55:31', '2020-11-30 07:12:33'),
(1233, 'job_cancel_page_sp_title', '¡Lo siento!', '2020-11-30 06:55:31', '2020-11-30 07:12:33'),
(1234, 'job_cancel_page_sp_description', NULL, '2020-11-30 06:55:31', '2020-11-30 07:12:33'),
(1235, 'job_success_page_en_title', 'Thank you', '2020-11-30 07:44:15', '2020-11-30 07:44:30'),
(1236, 'job_success_page_en_description', NULL, '2020-11-30 07:44:15', '2020-11-30 07:44:30'),
(1237, 'job_success_page_tur_title', 'teşekkür ederim', '2020-11-30 07:44:15', '2020-11-30 07:44:30'),
(1238, 'job_success_page_tur_description', NULL, '2020-11-30 07:44:15', '2020-11-30 07:44:30'),
(1239, 'job_success_page_ar_title', 'شكرا جزيلا', '2020-11-30 07:44:15', '2020-11-30 07:44:30'),
(1240, 'job_success_page_ar_description', NULL, '2020-11-30 07:44:15', '2020-11-30 07:44:30'),
(1241, 'job_success_page_sp_title', 'Gracias', '2020-11-30 07:44:15', '2020-11-30 07:44:30'),
(1242, 'job_success_page_sp_description', NULL, '2020-11-30 07:44:15', '2020-11-30 07:44:30'),
(1243, 'site_admin_panel_nav_sticky', NULL, '2020-12-04 00:06:16', '2021-01-12 08:25:56'),
(1244, 'site_frontend_nav_sticky', NULL, '2020-12-04 00:12:47', '2021-01-12 08:25:56'),
(1484, 'site_image_gallery_post_items', '9', '2020-12-07 09:30:15', '2020-12-07 09:48:19'),
(1485, 'site_image_gallery_order', 'ASC', '2020-12-07 09:48:19', '2020-12-07 09:48:19'),
(1486, 'site_image_gallery_order_by', 'id', '2020-12-07 09:48:19', '2020-12-07 09:48:19'),
(1487, 'portfolio_home_page_en_subtitle', 'Hello, I\'m', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1488, 'portfolio_home_page_en_title', 'James Renfrow', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1489, 'portfolio_home_page_en_profession', 'I\'m a Freelance UI/UX Designer', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1490, 'portfolio_home_page_en_description', 'Speedily say has suitable disposal add boy. On forth doubt miles of child. Exercise joy man children rejoiced. Yet uncommonly his ten who diminution astonished.', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1491, 'portfolio_home_page_en_button_text', 'Download CV', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1492, 'portfolio_home_page_tur_subtitle', 'Merhaba ben', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1493, 'portfolio_home_page_tur_title', 'James Renfrow', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1494, 'portfolio_home_page_tur_profession', 'Serbest Çalışan Kullanıcı Arayüzü / Kullanıcı Deneyimi Tasarımcısıyım', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1495, 'portfolio_home_page_tur_description', 'Hızlı bir şekilde uygun bir bertaraf var diyelim oğlum. Dördüncü şüphede çocuk milleri. Egzersiz sevinci adam çocuklar sevindi. Yine de nadiren azalan on kişiyi şaşırttı.', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1496, 'portfolio_home_page_tur_button_text', 'CV\'yi indir', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1497, 'portfolio_home_page_ar_subtitle', 'مرحبا أنا', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1498, 'portfolio_home_page_ar_title', 'جيمس رينفرو', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1499, 'portfolio_home_page_ar_profession', 'أنا مصمم UI / UX لحسابهم الخاص', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1500, 'portfolio_home_page_ar_description', 'يقول بسرعة لديه التخلص المناسب إضافة الصبي. على رابع ميلا الشك من الطفل. تمرين فرح الرجل بفرح الاطفال. ومع ذلك ، فإنه من غير المألوف أن يدهش العشرة الذين ينقصهم.', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1501, 'portfolio_home_page_ar_button_text', 'تحميل السيرة الذاتية', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1502, 'portfolio_home_page_sp_subtitle', 'Hola soy', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1503, 'portfolio_home_page_sp_title', 'James Renfrow', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1504, 'portfolio_home_page_sp_profession', 'Soy diseñadora independiente de UI / UX', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1505, 'portfolio_home_page_sp_description', 'Rápidamente diga que tiene una disposición adecuada, agregue al niño. En cuarta duda millas de niño. Ejercicio alegría hombre niños regocijados. Sin embargo, es poco común que sus diez disminuyan asombrados.', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1506, 'portfolio_home_page_sp_button_text', 'Descargar CV', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1507, 'portfolio_home_page_button_url', '#', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1508, 'portfolio_home_page_right_image', '119', '2020-12-24 03:58:44', '2020-12-24 05:31:44'),
(1509, 'home_page_05_en_about_section_icon_box_title', 'a:3:{i:0;s:19:\"contact@renfrow.com\";i:1;s:19:\"Street 11, NYC, USA\";i:2;s:8:\"iamsmith\";}', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1510, 'home_page_05_about_section_icon_box_icon', 'a:3:{i:0;s:14:\"flaticon-phone\";i:1;s:21:\"fas fa-map-marker-alt\";i:2;s:12:\"fab fa-skype\";}', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1511, 'portfolio_about_section_en_subtitle', 'My Intro', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1512, 'portfolio_about_section_en_title', 'Let\'s talk About My self', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1513, 'portfolio_about_section_en_description', '<div>Questions explained agreeable preferred strangers too him her son. Set put shyness offices his females him distant. Improve has message besides shy himself cheered however how son. Quick judge other leave ask first chief her. Indeed or remark always silent seemed narrow be. Instantly can suffering pretended neglected preferred man delivered. Perhaps fertile brandon do imagine to cordial cottage.&nbsp;</div><div><br></div>', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1514, 'portfolio_about_section_en_button_one_text', 'Hire Me', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1515, 'portfolio_about_section_en_button_two_text', 'Contact Me', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1516, 'home_page_05_tur_about_section_icon_box_title', 'a:3:{i:0;s:19:\"contact@renfrow.com\";i:1;s:19:\"Street 11, NYC, USA\";i:2;s:8:\"iamsmith\";}', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1517, 'portfolio_about_section_tur_subtitle', 'Giriş bölümüm', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1518, 'portfolio_about_section_tur_title', 'Hadi kendim hakkında konuşalım', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1519, 'portfolio_about_section_tur_description', 'Sorular, oğlunun onu da yabancıları tercih ettiğini açıkladı. Set utangaçlık ofisleri kadınları ona uzak. İyileştirme, utangaç olmanın yanı sıra kendisine tezahürat yaptı ama oğlum. Hızlı yargıç, diğer izinlere birinci şefe sor. Aslında ya da sözler her zaman sessiz görünüyordu. Acı çekiyormuş gibi ihmal edilmiş tercih edilen adam teslim edebilir. Belki de bereketli Brandon, samimi bir kulübeyi hayal ediyordur.', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1520, 'portfolio_about_section_tur_button_one_text', 'Beni işe al', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1521, 'portfolio_about_section_tur_button_two_text', 'Bana ulaşın', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1522, 'home_page_05_ar_about_section_icon_box_title', 'a:3:{i:0;s:19:\"contact@renfrow.com\";i:1;s:19:\"Street 11, NYC, USA\";i:2;s:8:\"iamsmith\";}', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1523, 'portfolio_about_section_ar_subtitle', 'مقدمتي', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1524, 'portfolio_about_section_ar_title', 'دعونا نتحدث عن نفسي', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1525, 'portfolio_about_section_ar_description', 'وأوضح أسئلة مقبولة يفضل الغرباء منه ابنها. وضع حياء مكاتب له إناثه بعيدًا عنه. تحسين لديه رسالة إلى جانب خجول نفسه هلل ولكن كيف يا بني. سريع القاضي إجازة أخرى اسأل رئيسها الأول. بالفعل أو الملاحظة الصامتة دائما تبدو ضيقة. على الفور يمكن أن يتألم الرجل المفضل المُهمَل المُتظاهَر أن يُسلم. ربما يتخيل براندون الخصب إلى كوخ ودي.', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1526, 'portfolio_about_section_ar_button_one_text', 'وظفني', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1527, 'portfolio_about_section_ar_button_two_text', 'اتصل بي', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1528, 'home_page_05_sp_about_section_icon_box_title', 'a:3:{i:0;s:19:\"contact@renfrow.com\";i:1;s:19:\"Street 11, NYC, USA\";i:2;s:8:\"iamsmith\";}', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1529, 'portfolio_about_section_sp_subtitle', 'Mi Intro', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1530, 'portfolio_about_section_sp_title', 'Hablemos de mi', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1531, 'portfolio_about_section_sp_description', 'Preguntas explicadas agradables extraños preferidos también él su hijo. Ponía timidez en los oficios a sus hembras le distantes. Mejorar tiene mensaje además de tímido él mismo vitoreó sin embargo cómo hijo. Juez rápido otro permiso pregunte al primer jefe ella. De hecho u observación siempre en silencio parecía estrecho ser. Instantáneamente puede el sufrimiento fingido descuidado hombre preferido liberado. Quizás Brandon fértil se imagina a casa de campo cordial.', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1532, 'portfolio_about_section_sp_button_one_text', 'Contratame', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1533, 'portfolio_about_section_sp_button_two_text', 'Contáctame', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1534, 'portfolio_about_section_left_image', '122', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1535, 'portfolio_about_section_button_two_url', '#', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1536, 'portfolio_about_section_button_one_url', '#', '2020-12-25 11:13:58', '2021-01-12 04:37:05'),
(1537, 'portfolio_about_section_button_one_icon', 'fas fa-arrow-alt-circle-down', '2020-12-25 11:18:57', '2021-01-12 04:37:05'),
(1538, 'portfolio_about_section_button_two_icon', 'far fa-comments', '2020-12-25 11:18:57', '2021-01-12 04:37:05'),
(1539, 'portfolio_expertice_section_en_subtitle', 'Why Choose Me', '2020-12-26 06:41:05', '2021-01-06 11:47:04'),
(1540, 'portfolio_expertice_section_en_title', 'Experties Area', '2020-12-26 06:41:05', '2021-01-06 11:47:04'),
(1541, 'portfolio_expertice_section_tur_subtitle', 'Neden beni seçmelisiniz', '2020-12-26 06:41:05', '2021-01-06 11:47:04'),
(1542, 'portfolio_expertice_section_tur_title', 'Uzmanlık Alanı', '2020-12-26 06:41:05', '2021-01-06 11:47:04'),
(1543, 'portfolio_expertice_section_ar_subtitle', 'لماذا تختارني', '2020-12-26 06:41:05', '2021-01-06 11:47:04'),
(1544, 'portfolio_expertice_section_ar_title', 'مجال الخبرة', '2020-12-26 06:41:05', '2021-01-06 11:47:04'),
(1545, 'portfolio_expertice_section_sp_subtitle', 'Por qué elegirme', '2020-12-26 06:41:05', '2021-01-06 11:47:04'),
(1546, 'portfolio_expertice_section_sp_title', 'Área de especialización', '2020-12-26 06:41:05', '2021-01-06 11:47:04'),
(1547, 'home_page_05_experties_section_skill_box_number', 'a:6:{i:0;s:2:\"95\";i:1;s:2:\"90\";i:2;s:2:\"80\";i:3;s:2:\"75\";i:4;s:2:\"95\";i:5;s:2:\"87\";}', '2020-12-26 10:04:47', '2021-01-06 11:47:04'),
(1548, 'home_page_05_en_experties_section_skill_box_title', 'a:6:{i:0;s:12:\"ux/ui design\";i:1;s:14:\"GRAPHIC DESIGN\";i:2;s:10:\"web Design\";i:3;s:15:\"web Development\";i:4;s:17:\"Digital Marketing\";i:5;s:18:\"Facebook Marketing\";}', '2020-12-26 10:17:35', '2021-01-06 11:47:04'),
(1549, 'home_page_05_en_experties_section_skill_box_subtitle', 'a:6:{i:0;s:6:\"design\";i:1;s:6:\"design\";i:2;s:6:\"design\";i:3;s:11:\"Development\";i:4;s:9:\"Marketing\";i:5;s:9:\"Marketing\";}', '2020-12-26 10:17:35', '2021-01-06 11:47:04'),
(1550, 'home_page_05_tur_experties_section_skill_box_title', 'a:6:{i:0;s:12:\"ux/ui design\";i:1;s:14:\"GRAPHIC DESIGN\";i:2;s:10:\"web Design\";i:3;s:15:\"web Development\";i:4;s:17:\"Digital Marketing\";i:5;s:18:\"Facebook Marketing\";}', '2020-12-26 10:17:35', '2021-01-06 11:47:04'),
(1551, 'home_page_05_tur_experties_section_skill_box_subtitle', 'a:6:{i:0;s:6:\"design\";i:1;s:6:\"design\";i:2;s:6:\"design\";i:3;s:11:\"Development\";i:4;s:9:\"Marketing\";i:5;s:9:\"Marketing\";}', '2020-12-26 10:17:35', '2021-01-06 11:47:04'),
(1552, 'home_page_05_ar_experties_section_skill_box_title', 'a:6:{i:0;s:12:\"ux/ui design\";i:1;s:14:\"GRAPHIC DESIGN\";i:2;s:10:\"web Design\";i:3;s:15:\"web Development\";i:4;s:17:\"Digital Marketing\";i:5;s:18:\"Facebook Marketing\";}', '2020-12-26 10:17:35', '2021-01-06 11:47:04'),
(1553, 'home_page_05_ar_experties_section_skill_box_subtitle', 'a:6:{i:0;s:6:\"design\";i:1;s:6:\"design\";i:2;s:6:\"design\";i:3;s:11:\"Development\";i:4;s:9:\"Marketing\";i:5;s:9:\"Marketing\";}', '2020-12-26 10:17:35', '2021-01-06 11:47:04');
INSERT INTO `static_options` (`id`, `option_name`, `option_value`, `created_at`, `updated_at`) VALUES
(1554, 'home_page_05_sp_experties_section_skill_box_title', 'a:6:{i:0;s:12:\"ux/ui design\";i:1;s:14:\"GRAPHIC DESIGN\";i:2;s:10:\"web Design\";i:3;s:15:\"web Development\";i:4;s:17:\"Digital Marketing\";i:5;s:18:\"Facebook Marketing\";}', '2020-12-26 10:17:35', '2021-01-06 11:47:04'),
(1555, 'home_page_05_sp_experties_section_skill_box_subtitle', 'a:6:{i:0;s:6:\"design\";i:1;s:6:\"design\";i:2;s:6:\"design\";i:3;s:11:\"Development\";i:4;s:9:\"Marketing\";i:5;s:9:\"Marketing\";}', '2020-12-26 10:17:35', '2021-01-06 11:47:04'),
(1556, 'portfolio_what_we_offer_section_en_subtitle', 'Specialized In', '2021-01-06 23:59:50', '2021-01-07 00:03:28'),
(1557, 'portfolio_what_we_offer_section_en_title', 'What I Offer', '2021-01-06 23:59:50', '2021-01-07 00:03:28'),
(1558, 'portfolio_what_we_offer_section_tur_subtitle', 'Specialized In', '2021-01-06 23:59:50', '2021-01-07 00:03:28'),
(1559, 'portfolio_what_we_offer_section_tur_title', 'Ne Teklif Ediyorum', '2021-01-06 23:59:50', '2021-01-07 00:03:28'),
(1560, 'portfolio_what_we_offer_section_ar_subtitle', 'متخصص في', '2021-01-06 23:59:50', '2021-01-07 00:03:28'),
(1561, 'portfolio_what_we_offer_section_ar_title', 'ما اقدمه', '2021-01-06 23:59:50', '2021-01-07 00:03:28'),
(1562, 'portfolio_what_we_offer_section_sp_subtitle', 'Especializado en', '2021-01-06 23:59:50', '2021-01-07 00:03:28'),
(1563, 'portfolio_what_we_offer_section_sp_title', 'Lo que ofrezco', '2021-01-06 23:59:50', '2021-01-07 00:03:28'),
(1564, 'portfolio_what_we_offer_section_items', '6', '2021-01-06 23:59:50', '2021-01-07 00:03:28'),
(1565, 'portfolio_what_we_offer_section_orderby', 'desc', '2021-01-06 23:59:50', '2021-01-07 00:03:28'),
(1566, 'portfolio_recent_work_section_en_subtitle', 'My Portfolio', '2021-01-07 08:35:07', '2021-01-07 10:20:23'),
(1567, 'portfolio_recent_work_section_en_title', 'Recent Work', '2021-01-07 08:35:07', '2021-01-07 10:20:23'),
(1568, 'portfolio_recent_work_section_tur_subtitle', 'Portföyüm', '2021-01-07 08:35:07', '2021-01-07 10:20:23'),
(1569, 'portfolio_recent_work_section_tur_title', 'Trabajo reciente', '2021-01-07 08:35:07', '2021-01-07 10:20:23'),
(1570, 'portfolio_recent_work_section_ar_subtitle', 'محفظتي', '2021-01-07 08:35:07', '2021-01-07 10:20:23'),
(1571, 'portfolio_recent_work_section_ar_title', 'آخر عمل', '2021-01-07 08:35:07', '2021-01-07 10:20:23'),
(1572, 'portfolio_recent_work_section_sp_subtitle', 'Mi portafolio', '2021-01-07 08:35:07', '2021-01-07 10:20:23'),
(1573, 'portfolio_recent_work_section_sp_title', 'Son iş', '2021-01-07 08:35:07', '2021-01-07 10:20:23'),
(1574, 'portfolio_recent_work_section_en_button_text', 'Show All', '2021-01-07 09:45:35', '2021-01-07 10:20:23'),
(1575, 'portfolio_recent_work_section_tur_button_text', 'Hepsini Göster ↓', '2021-01-07 09:45:35', '2021-01-07 10:20:23'),
(1576, 'portfolio_recent_work_section_ar_button_text', 'عرض الكل', '2021-01-07 09:45:35', '2021-01-07 10:20:23'),
(1577, 'portfolio_recent_work_section_sp_button_text', 'Mostrar todo', '2021-01-07 09:45:35', '2021-01-07 10:20:23'),
(1578, 'portfolio_cta_section_en_subtitle', NULL, '2021-01-07 12:14:28', '2021-01-07 12:14:28'),
(1579, 'portfolio_cta_section_en_title', 'Hope a Project in your Mind', '2021-01-07 12:14:28', '2021-01-07 12:28:39'),
(1580, 'portfolio_cta_section_en_button_text', 'Contact Us', '2021-01-07 12:14:28', '2021-01-07 12:28:39'),
(1581, 'portfolio_cta_section_tur_subtitle', NULL, '2021-01-07 12:14:28', '2021-01-07 12:14:28'),
(1582, 'portfolio_cta_section_tur_title', 'Aklınızda Bir Proje Umuyoruz', '2021-01-07 12:14:28', '2021-01-07 12:28:39'),
(1583, 'portfolio_cta_section_tur_button_text', 'Bize Ulaşın', '2021-01-07 12:14:28', '2021-01-07 12:28:39'),
(1584, 'portfolio_cta_section_ar_subtitle', NULL, '2021-01-07 12:14:28', '2021-01-07 12:14:28'),
(1585, 'portfolio_cta_section_ar_title', 'نأمل مشروع في عقلك', '2021-01-07 12:14:28', '2021-01-07 12:28:39'),
(1586, 'portfolio_cta_section_ar_button_text', 'اتصل بنا', '2021-01-07 12:14:28', '2021-01-07 12:28:39'),
(1587, 'portfolio_cta_section_sp_subtitle', NULL, '2021-01-07 12:14:28', '2021-01-07 12:14:28'),
(1588, 'portfolio_cta_section_sp_title', 'Espero un proyecto en tu mente', '2021-01-07 12:14:28', '2021-01-07 12:28:40'),
(1589, 'portfolio_cta_section_sp_button_text', 'Contacta con nosotras', '2021-01-07 12:14:28', '2021-01-07 12:28:40'),
(1590, 'portfolio_cta_section_button_url', '#', '2021-01-07 12:14:28', '2021-01-07 12:28:40'),
(1591, 'portfolio_cta_section_button_icon', 'far fa-comments', '2021-01-07 12:14:28', '2021-01-07 12:28:40'),
(1592, 'portfolio_cta_section_en_description', 'Questions explained agreeable preferred strangers too him her son. Set put shyness offices his females him distant. Improve has message', '2021-01-07 12:16:30', '2021-01-07 12:28:39'),
(1593, 'portfolio_cta_section_tur_description', 'Sorular, oğlunu da kabul eden yabancıları tercih ettiğini açıkladı. Set utangaçlık ofisleri onun dişileri ona uzak. Geliştirmek mesajı var', '2021-01-07 12:16:30', '2021-01-07 12:28:39'),
(1594, 'portfolio_cta_section_ar_description', 'وأوضح أسئلة مقبولة يفضل الغرباء منه ابنها. وضع حياء مكاتب له إناثه بعيدًا عنه. التحسين له رسالة', '2021-01-07 12:16:30', '2021-01-07 12:28:39'),
(1595, 'portfolio_cta_section_sp_description', 'Preguntas explicadas agradables extraños preferidos también él su hijo. Ponía timidez en los oficios a sus hembras le distantes. Mejorar tiene mensaje', '2021-01-07 12:16:30', '2021-01-07 12:28:40'),
(1596, 'portfolio_cta_section_right_image', '121', '2021-01-07 12:28:40', '2021-01-07 12:28:40'),
(1597, 'portfolio_testimonial_section_en_description', NULL, '2021-01-07 23:53:27', '2021-01-07 23:54:33'),
(1598, 'portfolio_testimonial_section_en_title', 'Clients Says', '2021-01-07 23:53:27', '2021-01-12 00:22:58'),
(1599, 'portfolio_testimonial_section_tur_description', NULL, '2021-01-07 23:53:27', '2021-01-07 23:54:33'),
(1600, 'portfolio_testimonial_section_tur_title', 'Müşteriler diyor', '2021-01-07 23:53:27', '2021-01-12 00:22:58'),
(1601, 'portfolio_testimonial_section_ar_description', NULL, '2021-01-07 23:53:27', '2021-01-07 23:54:33'),
(1602, 'portfolio_testimonial_section_ar_title', 'يقول العملاء', '2021-01-07 23:53:27', '2021-01-12 00:22:58'),
(1603, 'portfolio_testimonial_section_sp_description', NULL, '2021-01-07 23:53:27', '2021-01-07 23:54:33'),
(1604, 'portfolio_testimonial_section_sp_title', 'Clientes dice', '2021-01-07 23:53:27', '2021-01-12 00:22:58'),
(1605, 'portfolio_testimonial_section_en_subtitle', 'Testimonial', '2021-01-07 23:54:52', '2021-01-12 00:22:58'),
(1606, 'portfolio_testimonial_section_tur_subtitle', 'Bonservis', '2021-01-07 23:54:52', '2021-01-12 00:22:58'),
(1607, 'portfolio_testimonial_section_ar_subtitle', 'شهادة', '2021-01-07 23:54:52', '2021-01-12 00:22:58'),
(1608, 'portfolio_testimonial_section_sp_subtitle', 'Testimonial', '2021-01-07 23:54:52', '2021-01-12 00:22:58'),
(1609, 'portfolio_news_section_en_subtitle', 'Article', '2021-01-08 00:42:13', '2021-01-08 02:46:32'),
(1610, 'portfolio_news_section_en_title', 'Recent Blogs', '2021-01-08 00:42:13', '2021-01-08 02:46:32'),
(1611, 'portfolio_news_section_tur_subtitle', 'makale', '2021-01-08 00:42:13', '2021-01-08 02:46:32'),
(1612, 'portfolio_news_section_tur_title', 'Son Bloglar', '2021-01-08 00:42:13', '2021-01-08 02:46:32'),
(1613, 'portfolio_news_section_ar_subtitle', 'مقالة - سلعة', '2021-01-08 00:42:13', '2021-01-08 02:46:32'),
(1614, 'portfolio_news_section_ar_title', 'المدونات الحديثة', '2021-01-08 00:42:13', '2021-01-08 02:46:32'),
(1615, 'portfolio_news_section_sp_subtitle', 'Artículo', '2021-01-08 00:42:13', '2021-01-08 02:46:32'),
(1616, 'portfolio_news_section_sp_title', 'Blogs recientes', '2021-01-08 00:42:13', '2021-01-08 02:46:32'),
(1617, 'portfolio_news_section_en_button_text', 'Read More', '2021-01-08 02:46:32', '2021-01-08 02:46:32'),
(1618, 'portfolio_news_section_tur_button_text', 'Daha fazla oku', '2021-01-08 02:46:32', '2021-01-08 02:46:32'),
(1619, 'portfolio_news_section_ar_button_text', 'قراءة المزيد', '2021-01-08 02:46:32', '2021-01-08 02:46:32'),
(1620, 'portfolio_news_section_sp_button_text', 'Lee mas', '2021-01-08 02:46:32', '2021-01-08 02:46:32'),
(1621, 'home_page_06_en_header_section_title', 'a:2:{i:0;s:32:\"world best industry service here\";i:1;s:32:\"world best industry service here\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1622, 'home_page_06_en_header_section_description', 'a:2:{i:0;s:160:\"Speedily say has suitable disposal add boy. On forth doubt miles of child. Exercise joy man children rejoiced. Yet uncommonly his ten who diminution astonished.\";i:1;s:160:\"Speedily say has suitable disposal add boy. On forth doubt miles of child. Exercise joy man children rejoiced. Yet uncommonly his ten who diminution astonished.\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1623, 'home_page_06_en_header_section_button_one_text', 'a:2:{i:0;s:13:\"Request Quote\";i:1;s:13:\"Request Quote\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1624, 'home_page_06_en_header_section_button_two_text', 'a:2:{i:0;s:5:\"About\";i:1;s:5:\"About\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1625, 'home_page_06_header_section_bg_image', 'a:2:{i:0;s:3:\"123\";i:1;s:3:\"123\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1626, 'home_page_06_header_section_button_two_url', 'a:2:{i:0;s:1:\"#\";i:1;s:1:\"#\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1627, 'home_page_06_header_section_button_one_url', 'a:2:{i:0;s:1:\"#\";i:1;s:1:\"#\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1628, 'home_page_06_tur_header_section_title', 'a:2:{i:0;s:42:\"dünyanın en iyi endüstri hizmeti burada\";i:1;s:42:\"dünyanın en iyi endüstri hizmeti burada\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1629, 'home_page_06_tur_header_section_description', 'a:2:{i:0;s:195:\"Hızlı bir şekilde uygun bir bertaraf var demek oğlum. Dördüncü şüphede çocuk kilometrelerce. Egzersiz sevinci adam çocuklar sevindi. Yine de nadiren azalan on kişi şaşkına döndü.\";i:1;s:195:\"Hızlı bir şekilde uygun bir bertaraf var demek oğlum. Dördüncü şüphede çocuk kilometrelerce. Egzersiz sevinci adam çocuklar sevindi. Yine de nadiren azalan on kişi şaşkına döndü.\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1630, 'home_page_06_tur_header_section_button_one_text', 'a:2:{i:0;s:12:\"Teklif İste\";i:1;s:12:\"Teklif İste\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1631, 'home_page_06_tur_header_section_button_two_text', 'a:2:{i:0;s:9:\"hakkında\";i:1;s:9:\"hakkında\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1632, 'home_page_06_ar_header_section_title', 'a:2:{i:0;s:53:\"أفضل خدمة صناعة في العالم هنا\";i:1;s:53:\"أفضل خدمة صناعة في العالم هنا\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1633, 'home_page_06_ar_header_section_description', 'a:2:{i:0;s:288:\"يقول سريعًا أنه مناسب للتخلص من إضافة الصبي. على رابع ميلا الشك من الطفل. تمرين فرح رجل الاطفال ابتهج. ومع ذلك ، فإنه من غير المألوف أن يدهش العشرة الذين ينقصهم.\";i:1;s:288:\"يقول سريعًا أنه مناسب للتخلص من إضافة الصبي. على رابع ميلا الشك من الطفل. تمرين فرح رجل الاطفال ابتهج. ومع ذلك ، فإنه من غير المألوف أن يدهش العشرة الذين ينقصهم.\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1634, 'home_page_06_ar_header_section_button_one_text', 'a:2:{i:0;s:19:\"طلب اقتباس\";i:1;s:19:\"طلب اقتباس\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1635, 'home_page_06_ar_header_section_button_two_text', 'a:2:{i:0;s:6:\"حول\";i:1;s:6:\"حول\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1636, 'home_page_06_sp_header_section_title', 'a:2:{i:0;s:49:\"el mejor servicio de la industria del mundo aquí\";i:1;s:49:\"el mejor servicio de la industria del mundo aquí\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1637, 'home_page_06_sp_header_section_description', 'a:2:{i:0;s:213:\"Rápidamente diga que tiene una disposición adecuada agregue al niño. En cuarta duda millas de niño. Ejercicio alegría hombre niños regocijados. Sin embargo, es poco común que sus diez disminuyan asombrados.\";i:1;s:213:\"Rápidamente diga que tiene una disposición adecuada agregue al niño. En cuarta duda millas de niño. Ejercicio alegría hombre niños regocijados. Sin embargo, es poco común que sus diez disminuyan asombrados.\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1638, 'home_page_06_sp_header_section_button_one_text', 'a:2:{i:0;s:24:\"Solicitud de cotización\";i:1;s:24:\"Solicitud de cotización\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1639, 'home_page_06_sp_header_section_button_two_text', 'a:2:{i:0;s:9:\"Acerca de\";i:1;s:9:\"Acerca de\";}', '2021-01-08 08:29:08', '2021-01-08 08:50:35'),
(1640, 'logistic_what_we_offer_section_en_subtitle', 'Our Service', '2021-01-09 04:02:46', '2021-01-09 05:27:25'),
(1641, 'logistic_what_we_offer_section_en_title', 'What we offer', '2021-01-09 04:02:46', '2021-01-09 05:27:25'),
(1642, 'logistic_what_we_offer_section_tur_subtitle', 'Servisimiz', '2021-01-09 04:02:46', '2021-01-09 05:27:25'),
(1643, 'logistic_what_we_offer_section_tur_title', 'Apa yang kita tawarkan', '2021-01-09 04:02:46', '2021-01-09 05:27:25'),
(1644, 'logistic_what_we_offer_section_ar_subtitle', 'خدمتنا', '2021-01-09 04:02:46', '2021-01-09 05:27:25'),
(1645, 'logistic_what_we_offer_section_ar_title', 'ابا يانغ كيتا تاوركان', '2021-01-09 04:02:46', '2021-01-09 05:27:25'),
(1646, 'logistic_what_we_offer_section_sp_subtitle', 'Nuestro servicio', '2021-01-09 04:02:46', '2021-01-09 05:27:25'),
(1647, 'logistic_what_we_offer_section_sp_title', 'Apa yang kita tawarkan', '2021-01-09 04:02:46', '2021-01-09 05:27:25'),
(1648, 'logistic_what_we_offer_section_en_button_text', 'Read More', '2021-01-09 05:24:22', '2021-01-09 05:27:25'),
(1649, 'logistic_what_we_offer_section_tur_button_text', 'Daha fazla oku', '2021-01-09 05:24:22', '2021-01-09 05:27:25'),
(1650, 'logistic_what_we_offer_section_ar_button_text', 'قراءة المزيد', '2021-01-09 05:24:22', '2021-01-09 05:27:25'),
(1651, 'logistic_what_we_offer_section_sp_button_text', 'Lee mas', '2021-01-09 05:24:23', '2021-01-09 05:27:25'),
(1652, 'portfolio_video_section_background_image', '124', '2021-01-09 06:12:03', '2021-01-09 06:12:03'),
(1653, 'portfolio_video_section_video_url', 'https://www.youtube.com/watch?v=bf32RljFznE', '2021-01-09 06:12:03', '2021-01-09 06:12:03'),
(1654, 'portfolio_counterup_section_background_image', '123', '2021-01-09 06:59:06', '2021-01-09 06:59:06'),
(1655, 'logistic_project_section_en_subtitle', 'Our Portfolio', '2021-01-09 07:33:38', '2021-01-09 07:33:38'),
(1656, 'logistic_project_section_en_title', 'Our Top Projects', '2021-01-09 07:33:38', '2021-01-09 07:33:38'),
(1657, 'logistic_project_section_tur_subtitle', 'Portföyümüz', '2021-01-09 07:33:38', '2021-01-09 07:33:38'),
(1658, 'logistic_project_section_tur_title', 'En İyi Projelerimiz', '2021-01-09 07:33:38', '2021-01-09 07:33:38'),
(1659, 'logistic_project_section_ar_subtitle', 'لدينا محفظة', '2021-01-09 07:33:38', '2021-01-09 07:33:38'),
(1660, 'logistic_project_section_ar_title', 'أهم مشاريعنا', '2021-01-09 07:33:38', '2021-01-09 07:33:38'),
(1661, 'logistic_project_section_sp_subtitle', 'nuestro portafolio', '2021-01-09 07:33:38', '2021-01-09 07:33:38'),
(1662, 'logistic_project_section_sp_title', 'Nuestras mejores proyectos', '2021-01-09 07:33:38', '2021-01-09 07:33:38'),
(1663, 'logistic_faq_section_en_subtitle', 'Any Query', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1664, 'logistic_faq_section_en_title', 'FAQ', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1665, 'logistic_quote_section_en_title', 'Get a Quote', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1666, 'logistic_quote_section_en_subtitle', 'Need Estimate', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1667, 'logistic_quote_section_en_button_text', 'Request a Quote', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1668, 'logistic_faq_section_tur_subtitle', 'Herhangi bir sorgu', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1669, 'logistic_faq_section_tur_title', 'SSS', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1670, 'logistic_quote_section_tur_title', 'Teklif Alın', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1671, 'logistic_quote_section_tur_subtitle', 'Tahmin Gerekiyor', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1672, 'logistic_quote_section_tur_button_text', 'Bir teklif isteği', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1673, 'logistic_faq_section_ar_subtitle', 'أي استفسار', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1674, 'logistic_faq_section_ar_title', 'التعليمات', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1675, 'logistic_quote_section_ar_title', 'إقتبس', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1676, 'logistic_quote_section_ar_subtitle', 'تحتاج تقدير', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1677, 'logistic_quote_section_ar_button_text', 'اطلب اقتباس', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1678, 'logistic_faq_section_sp_subtitle', 'Cualquier duda', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1679, 'logistic_faq_section_sp_title', 'Preguntas más frecuentes', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1680, 'logistic_quote_section_sp_title', 'Consigue una cotización', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1681, 'logistic_quote_section_sp_subtitle', 'Necesita estimar', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1682, 'logistic_quote_section_sp_button_text', 'Solicitar presupuesto', '2021-01-10 01:17:16', '2021-01-10 03:52:07'),
(1683, 'home_page_06_en_faq_item_title', 'a:4:{i:0;s:32:\"What’s your very first memory?\";i:1;s:24:\"What makes you happiest?\";i:2;s:31:\"What’s the spot on your body?\";i:3;s:29:\"What’s your favorite color?\";}', '2021-01-10 02:33:59', '2021-01-10 03:52:07'),
(1684, 'home_page_06_en_faq_item_description', 'a:4:{i:0;s:176:\"Sportsman delighted improving dashwoods gay instantly happiness six. Ham now amounted absolute not mistaken way pleasant whatever. At an these still no dried folly stood thing.\";i:1;s:176:\"Sportsman delighted improving dashwoods gay instantly happiness six. Ham now amounted absolute not mistaken way pleasant whatever. At an these still no dried folly stood thing.\";i:2;s:176:\"Sportsman delighted improving dashwoods gay instantly happiness six. Ham now amounted absolute not mistaken way pleasant whatever. At an these still no dried folly stood thing.\";i:3;s:176:\"Sportsman delighted improving dashwoods gay instantly happiness six. Ham now amounted absolute not mistaken way pleasant whatever. At an these still no dried folly stood thing.\";}', '2021-01-10 02:33:59', '2021-01-10 03:52:07'),
(1685, 'home_page_06_tur_faq_item_title', 'a:4:{i:0;s:17:\"İlk anın nedir?\";i:1;s:27:\"Seni en çok ne mutlu eder?\";i:2;s:27:\"Vücudunuzdaki nokta nedir?\";i:3;s:17:\"Favori rengin ne?\";}', '2021-01-10 02:33:59', '2021-01-10 03:52:07'),
(1686, 'home_page_06_tur_faq_item_description', 'a:4:{i:0;s:193:\"Sporcu, Dashwoods gey anında mutluluk altı geliştirmekten memnun. Ham şimdi mutlak bir miktardı, her neyse, yanlış anlaşılan bir şekilde değil. Bunlarda hala kurumuş aptallık yoktu\";i:1;s:193:\"Sporcu, Dashwoods gey anında mutluluk altı geliştirmekten memnun. Ham şimdi mutlak bir miktardı, her neyse, yanlış anlaşılan bir şekilde değil. Bunlarda hala kurumuş aptallık yoktu\";i:2;s:193:\"Sporcu, Dashwoods gey anında mutluluk altı geliştirmekten memnun. Ham şimdi mutlak bir miktardı, her neyse, yanlış anlaşılan bir şekilde değil. Bunlarda hala kurumuş aptallık yoktu\";i:3;s:193:\"Sporcu, Dashwoods gey anında mutluluk altı geliştirmekten memnun. Ham şimdi mutlak bir miktardı, her neyse, yanlış anlaşılan bir şekilde değil. Bunlarda hala kurumuş aptallık yoktu\";}', '2021-01-10 02:33:59', '2021-01-10 03:52:07'),
(1687, 'home_page_06_ar_faq_item_title', 'a:4:{i:0;s:35:\"ما هي أولى ذكرياتك؟\";i:1;s:35:\"ما الذي يجعلك أسعد؟\";i:2;s:40:\"ما هي البقعة على جسمك؟\";i:3;s:33:\"ما هو لونك المفضل؟\";}', '2021-01-10 02:33:59', '2021-01-10 03:52:07'),
(1688, 'home_page_06_ar_faq_item_description', 'a:4:{i:0;s:268:\"يسعد رياضي بتحسين شواذ الخشب على الفور سعادة ستة. وصل لحم الخنزير الآن بطريقة مطلقة غير خاطئة ممتعة مهما كانت في هذه لا تزال هناك حماقة جافة تقف شيء.\";i:1;s:268:\"يسعد رياضي بتحسين شواذ الخشب على الفور سعادة ستة. وصل لحم الخنزير الآن بطريقة مطلقة غير خاطئة ممتعة مهما كانت في هذه لا تزال هناك حماقة جافة تقف شيء.\";i:2;s:268:\"يسعد رياضي بتحسين شواذ الخشب على الفور سعادة ستة. وصل لحم الخنزير الآن بطريقة مطلقة غير خاطئة ممتعة مهما كانت في هذه لا تزال هناك حماقة جافة تقف شيء.\";i:3;s:268:\"يسعد رياضي بتحسين شواذ الخشب على الفور سعادة ستة. وصل لحم الخنزير الآن بطريقة مطلقة غير خاطئة ممتعة مهما كانت في هذه لا تزال هناك حماقة جافة تقف شيء.\";}', '2021-01-10 02:33:59', '2021-01-10 03:52:07'),
(1689, 'home_page_06_sp_faq_item_title', 'a:4:{i:0;s:30:\"¿Cuál es tu primer recuerdo?\";i:1;s:26:\"¿Qué te hace más feliz?\";i:2;s:34:\"¿Cuál es la mancha en tu cuerpo?\";i:3;s:29:\"¿Cuál es tu color favorito?\";}', '2021-01-10 02:33:59', '2021-01-10 03:52:07'),
(1690, 'home_page_06_sp_faq_item_description', 'a:4:{i:0;s:217:\"Deportista encantado de mejorar Dashwoods gay instantáneamente felicidad seis. Jamón ahora ascendía absolutamente, no equivocadamente, agradable. En una de estas cosas todavía no se encontraba ninguna locura seca.\";i:1;s:217:\"Deportista encantado de mejorar Dashwoods gay instantáneamente felicidad seis. Jamón ahora ascendía absolutamente, no equivocadamente, agradable. En una de estas cosas todavía no se encontraba ninguna locura seca.\";i:2;s:217:\"Deportista encantado de mejorar Dashwoods gay instantáneamente felicidad seis. Jamón ahora ascendía absolutamente, no equivocadamente, agradable. En una de estas cosas todavía no se encontraba ninguna locura seca.\";i:3;s:217:\"Deportista encantado de mejorar Dashwoods gay instantáneamente felicidad seis. Jamón ahora ascendía absolutamente, no equivocadamente, agradable. En una de estas cosas todavía no se encontraba ninguna locura seca.\";}', '2021-01-10 02:33:59', '2021-01-10 03:52:08'),
(1691, 'logistic_testimonial_section_en_subtitle', 'Testimonials', '2021-01-10 06:08:28', '2021-01-10 06:37:33'),
(1692, 'logistic_testimonial_section_en_title', 'Our Clients Says', '2021-01-10 06:08:28', '2021-01-10 06:37:33'),
(1693, 'logistic_testimonial_section_tur_subtitle', 'Görüşler', '2021-01-10 06:08:28', '2021-01-10 06:37:33'),
(1694, 'logistic_testimonial_section_tur_title', 'Müşterilerimiz Diyor', '2021-01-10 06:08:28', '2021-01-10 06:37:33'),
(1695, 'logistic_testimonial_section_ar_subtitle', 'الشهادات - التوصيات', '2021-01-10 06:08:28', '2021-01-10 06:37:33'),
(1696, 'logistic_testimonial_section_ar_title', 'يقول عملاؤنا', '2021-01-10 06:08:28', '2021-01-10 06:37:33'),
(1697, 'logistic_testimonial_section_sp_subtitle', 'Testimonios', '2021-01-10 06:08:28', '2021-01-10 06:37:33'),
(1698, 'logistic_testimonial_section_sp_title', 'Nuestras clientas dicen', '2021-01-10 06:08:28', '2021-01-10 06:37:33'),
(1699, 'logistic_news_section_en_subtitle', 'Blogs', '2021-01-10 08:10:49', '2021-01-10 08:10:49'),
(1700, 'logistic_news_section_en_title', 'News Updates', '2021-01-10 08:10:49', '2021-01-10 08:10:49'),
(1701, 'logistic_news_section_tur_subtitle', 'Bloglar', '2021-01-10 08:10:49', '2021-01-10 08:10:49'),
(1702, 'logistic_news_section_tur_title', 'Haber Güncellemeleri', '2021-01-10 08:10:49', '2021-01-10 08:10:49'),
(1703, 'logistic_news_section_ar_subtitle', 'المدونات', '2021-01-10 08:10:49', '2021-01-10 08:10:49'),
(1704, 'logistic_news_section_ar_title', 'تحديثات الأخبار', '2021-01-10 08:10:49', '2021-01-10 08:10:49'),
(1705, 'logistic_news_section_sp_subtitle', 'Blogs', '2021-01-10 08:10:49', '2021-01-10 08:10:49'),
(1706, 'logistic_news_section_sp_title', 'Actualización de las noticias', '2021-01-10 08:10:49', '2021-01-10 08:10:49'),
(1707, 'home_page_quote_faq_section_status', 'on', '2021-01-10 11:56:35', '2021-01-10 12:12:41'),
(1708, 'home_page_video_section_status', 'on', '2021-01-10 12:07:39', '2021-01-10 12:12:41'),
(1709, 'home_page_expertice_section_status', 'on', '2021-01-10 12:12:41', '2021-01-10 12:12:41'),
(1710, 'paypal_app_client_id', 'ATx-SYQyPtXHw1bZaBDhJUZabxbutIqAqqZORgvgEoK_-9MrAkUzYkbt8pSnUyKNEdNN3aJt8tcpcY1I', '2021-01-11 01:10:37', '2021-01-13 20:39:34'),
(1711, 'paypal_app_secret', 'ELJCWPUabUnnMamfw5-ZxaUsvir3KAJrPnAcSeS11znsroi45HP0p7y7vGZcYsBsAAi7Ou6kelCpj69K', '2021-01-11 01:10:37', '2021-01-13 20:39:35'),
(1712, 'paypal_test_mode', 'on', '2021-01-11 01:12:21', '2021-01-13 20:39:35'),
(1713, 'paytm_test_mode', 'on', '2021-01-11 14:10:46', '2021-01-13 20:39:35'),
(1714, 'preloader_cacncel_button', 'on', '2021-01-12 04:45:04', '2021-01-12 04:45:32'),
(1715, 'site_force_ssl_redirection', NULL, '2021-01-12 04:47:34', '2021-01-12 08:25:56'),
(1716, 'portfolio_home_color', '#ff4756', '2021-01-12 05:10:08', '2021-01-12 08:25:56'),
(1717, 'logistics_home_color', '#ff4039', '2021-01-12 05:10:08', '2021-01-12 08:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_one` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_two` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_three` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_one_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_two_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_three_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `name`, `designation`, `lang`, `description`, `image`, `icon_one`, `icon_two`, `icon_three`, `icon_one_url`, `icon_two_url`, `icon_three_url`, `created_at`, `updated_at`) VALUES
(1, 'Siful Islam', '-Envato Cliente', 'en', NULL, '50', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:18:55', '2020-07-20 01:18:55'),
(2, 'sharifur', 'Founder', 'en', NULL, '49', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:19:23', '2020-07-20 01:19:23'),
(3, 'Olivia Hamel', '-Envato Cliente', 'en', NULL, '48', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:19:43', '2020-07-20 01:19:43'),
(4, 'Sharifur Rahman', 'CEO Ir-Tech', 'en', NULL, '47', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:20:02', '2020-07-20 01:20:02'),
(5, 'Sharifur Rahman', 'CEO Ir-Tech', 'tur', NULL, '47', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:20:39', '2020-07-20 01:20:39'),
(6, 'Olivia Hamel', 'kurucu', 'tur', NULL, '49', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:21:29', '2020-07-20 01:21:45'),
(7, 'Siful Islam', 'kurucu', 'tur', NULL, '48', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:22:05', '2020-07-20 01:22:19'),
(8, 'John Dilorenzo', 'kurucu', 'tur', NULL, '50', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:23:11', '2020-07-20 01:23:11'),
(9, 'Siful Islam', 'Fundador', 'sp', NULL, '50', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:23:38', '2020-07-20 01:23:38'),
(10, 'Sharifur Rahman', 'Fundador', 'sp', NULL, '49', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:24:18', '2020-07-20 01:24:32'),
(11, 'Olivia Hamel', 'Fundador', 'sp', NULL, '48', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:24:55', '2020-07-20 01:25:10'),
(12, 'Michael Hanavan', 'Fundador', 'sp', NULL, '47', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:25:50', '2020-07-20 01:25:50'),
(13, 'إسلام صالح', 'مؤسس', 'ar', NULL, '50', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:26:33', '2020-07-20 01:26:33'),
(14, 'شريف الرحمن', 'مؤسس', 'ar', NULL, '49', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:27:06', '2020-07-20 01:27:06'),
(15, 'أوليفيا هامل', 'مؤسس', 'ar', NULL, '48', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:27:34', '2020-07-20 01:27:34'),
(16, 'مايكل هـ.كانافان', 'مؤسس', 'ar', NULL, '47', 'fab fa-instagram', 'fab fa-twitter', 'fab fa-facebook-f', '#', '#', '#', '2020-07-20 01:28:12', '2020-07-27 22:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `image`, `lang`, `description`, `status`, `designation`, `created_at`, `updated_at`) VALUES
(1, 'Olivia Hamel', '48', 'en', 'I found myself working in a true partnership that results in an extra incredible experience of us', 'publish', 'Customer', '2020-06-04 20:36:40', '2020-07-20 01:14:23'),
(2, 'Siful Islam', '47', 'en', 'I found myself working in a true partnership that results in an extra incredible experience of us', 'publish', 'Customer', '2020-06-04 20:40:03', '2020-07-20 01:14:11'),
(3, 'Elvira Siebert', '47', 'en', 'I found myself working in a true partnership that results in an extra incredible experience of us', 'publish', 'Customer', '2020-06-04 20:43:31', '2021-01-10 07:31:24'),
(4, 'Sheree Derouen', '50', 'en', 'I found myself working in a true partnership that results in an extra incredible experience of us', 'publish', 'Customer', '2020-06-04 20:43:34', '2020-07-27 02:13:35'),
(5, 'Sheree Derouen', '31', 'tur', 'Kendimizi, inanılmaz bir deneyimle sonuçlanan gerçek bir ortaklık içinde çalışırken buldum', 'publish', 'Müşteri', '2020-06-04 20:44:55', '2020-06-05 06:43:53'),
(6, 'شيري دروان', '31', 'ar', 'وجدت نفسي أعمل في شراكة حقيقية تؤدي إلى تجربة لا تصدق منا', 'publish', 'الزبون', '2020-06-04 20:45:05', '2020-06-05 06:54:06'),
(7, 'Sheree Derouen', '31', 'sp', 'Me encontré trabajando en una verdadera asociación que resulta en una experiencia increíble para nosotros.', 'publish', 'Cliente', '2020-06-04 20:45:12', '2020-06-05 08:22:52'),
(8, 'Anne Harlan', '31', 'tur', 'Kendimizi, inanılmaz bir deneyimle sonuçlanan gerçek bir ortaklık içinde çalışırken buldum', 'publish', 'Müşteri', '2020-06-05 06:46:03', '2020-06-05 06:46:33'),
(9, 'Jacqueline  Snow', '31', 'tur', 'Kendimizi, inanılmaz bir deneyimle sonuçlanan gerçek bir ortaklık içinde çalışırken buldum', 'publish', 'Müşteri', '2020-06-05 06:46:39', '2020-06-05 06:47:07'),
(10, 'Edmund Reid', '31', 'tur', 'Kendimizi, inanılmaz bir deneyimle sonuçlanan gerçek bir ortaklık içinde çalışırken buldum', 'publish', 'Müşteri', '2020-06-05 06:47:11', '2020-06-05 06:47:40'),
(11, 'وليام مارتن', '31', 'ar', 'وجدت نفسي أعمل في شراكة حقيقية تؤدي إلى تجربة لا تصدق منا', 'publish', 'الزبون', '2020-06-05 06:54:12', '2020-06-05 07:58:30'),
(12, 'خوانيتا روش', '31', 'ar', 'وجدت نفسي أعمل في شراكة حقيقية تؤدي إلى تجربة لا تصدق منا', 'publish', 'الزبون', '2020-06-05 08:00:50', '2020-06-05 08:22:10'),
(13, 'وليام مارتن', '31', 'ar', 'وجدت نفسي أعمل في شراكة حقيقية تؤدي إلى تجربة لا تصدق منا', 'publish', 'الزبون', '2020-06-05 08:00:53', '2020-06-05 08:21:37'),
(14, 'Lois D. Kiser', '31', 'sp', 'Me encontré trabajando en una verdadera asociación que resulta en una experiencia increíble para nosotros.', 'publish', 'Cliente', '2020-06-05 08:24:23', '2020-06-05 08:25:55'),
(15, 'Stella M. Blow', '31', 'sp', 'Me encontré trabajando en una verdadera asociación que resulta en una experiencia increíble para nosotros.', 'publish', 'Cliente', '2020-06-05 08:24:26', '2020-06-05 08:26:35'),
(16, 'Lydia R. Davis', '31', 'sp', 'Me encontré trabajando en una verdadera asociación que resulta en una experiencia increíble para nosotros.', 'publish', 'Cliente', '2020-06-05 08:24:29', '2020-06-05 08:27:30'),
(17, 'Nur Fuad', '49', 'ar', 'hgdnfsgshgyhfstfshshg gsdgreagargar fdrgegerar', 'publish', 'Founder', '2020-07-29 09:05:33', '2020-07-29 09:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `email_verify_token` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified`, `email_verify_token`, `phone`, `address`, `state`, `city`, `zipcode`, `country`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sharifur Rahman', 'dvrobin4@gmail.com', 'dvrobin4', '1', 'ke24DVCoKK8hVKvHQCr0', NULL, NULL, NULL, 'Dhaka', '1200', 'Brazil', '$2y$10$cS5XpFj/r1un2AZz7Shgl.aqoEHtY7JA7w3WjNFSCFBKpj8/SlUzK', 'YZMzvtVJfngp0x1xTn3RsZsK22M16aavedxNDl3gzA4LoEnTQDFVGcWX0wXt', '2020-06-19 18:08:40', '2020-08-12 00:19:01'),
(3, 'Betty K. Jackson', 'dvrobin54@gmail.com', 'betty', '1', 'V1Y7UTAp9LoHN9JuSyj1', NULL, NULL, NULL, 'Dhaka', NULL, 'Anguilla', '$2y$10$IeWFfjTcdVTlTac5KsvLMOgSgWpdgkvN0vXOsYEe.Mx9FbOzUEcoe', NULL, '2020-07-21 12:39:51', '2020-07-21 12:39:53'),
(4, 'Nur Fuad', 'saadibnsayed21@gmail.com', 'admin', '1', 'C4SV4c5kFSulvVYz4GzM', NULL, NULL, NULL, 'Dhaka', NULL, 'Afganistan', '$2y$10$ohzyVSjO2Fw4K1.JRO5tvu9iJ5mvKQMyK.UWuiH96z8r/75GEHFBS', NULL, '2020-07-29 08:24:50', '2020-07-29 08:25:16'),
(6, 'Test User1', 'ikebn412@gmail.com', 'ike4122', '1', 'kfm6neW8GUME5eL75LcZ', NULL, NULL, NULL, 'city', NULL, 'Afganistan', '$2y$10$NfBE1rrWaniftymR5l35AedzelNxc6gTCOlMkWiImN2VVkSKVi0YO', NULL, '2020-07-31 01:49:08', '2020-07-31 01:52:32'),
(7, 'Deepak', 'deepaksinghsou@gmail.com', '2580', '1', '2s2zxSQMsd1MZxbyctt0', NULL, NULL, NULL, 'Patna', NULL, 'India', '$2y$10$zRdyVRI4uH51kd81qkCN/O1qonQsbyU7iu1Gbt1lfEvFkqrqOk3pO', NULL, '2020-07-31 20:59:17', '2020-07-31 21:01:40'),
(9, 'wakaboii', 'amoskid1996@gmail.com', 'coded', '1', 'fC7TKY2TLl0gRVrqROnl', NULL, NULL, NULL, 'panoda', NULL, 'Nigeria', '$2y$10$7awk8ER.HQsLylx9OalotuXs6Fu/l66CWiWWE3MEgTfWlw7efLLBq', NULL, '2020-08-03 17:05:26', '2020-08-03 17:10:19'),
(11, 'Edward', 'nnadollar@gmail.com', 'nnadollar', '1', 'JqIgksmAis8qtS1VarO1', NULL, NULL, NULL, 'Imo', NULL, 'Nigeria', '$2y$10$dUgTSqKPRktj//fponq5.Ou/yFo92DuAJJ4ula5PvcTfdLB6gjaAm', NULL, '2020-08-04 14:19:36', '2020-08-04 14:21:56'),
(12, 'brown', 'bullet110011@gmail.com', 'brown101', '1', 'SslLSHheTDrg3JoL36EW', NULL, NULL, NULL, 'Abuja', NULL, 'Nigeria', '$2y$10$zW3mKClh76gKOClix75ASOU4CKVH.SxrfQp6eOfE22HAowwfJTsQK', NULL, '2020-08-07 12:11:38', '2020-08-07 12:14:16'),
(16, 'Tejas Borate', 'tejasborate@gmail.com', 'tejas9', '1', 'AC7BnRkP9quHJHKpIyqA', '537384130510', 'gsmcxS4wr43rr', 'nashik', 'nashik', '546344', 'India', '$2y$10$3.FL9YnC7hLfCw55AwMtNuNgFOXeptcH3LwQY7Q4l3VajMH9Q6hcu', NULL, '2020-08-07 21:56:02', '2020-08-07 22:06:32'),
(17, 'charles umeanakor', 'Charlesumeanakor@gmail.com', 'mrfash', '1', 'HGumoqbRcc1EKX2jPIdK', NULL, NULL, NULL, 'jjan', NULL, 'Nigeria', '$2y$10$qzzoNdxZ3TIlVAvGjVXuj.oDciPdSxb.ioz6vwSlY.IrJfdULk9Pe', NULL, '2020-08-07 22:33:29', '2020-08-07 22:35:00'),
(18, 'Miguel', 'miguel@enetwork.me', 'miguel', '1', 'BI3nnA5zfuulZbPX3yPn', NULL, NULL, NULL, 'Sidney', NULL, 'Australia', '$2y$10$fL.Mk.SbysCWfuywkQJUkuvwUGPzGaAe.dTUE1cFGrWrGGzxISix2', NULL, '2020-08-08 06:25:09', '2020-08-08 06:29:30'),
(20, 'Introductory row', 'benemovers@gmail.com', 'Johnkim', '1', 'dfCJ91uua5GDNaY3WKrC', NULL, NULL, NULL, 'Nairobi', NULL, 'Kenya', '$2y$10$BC/cHY.646rESKFDqBLIlOF.8ozNncln14MzN4.GMkSPEeg/4O2y2', NULL, '2020-08-09 17:41:14', '2020-08-09 17:42:51'),
(21, 'Waleed Barakat', 'waleedahmedbarakat@gmail.com', 'waleedbarakat', '1', 'dOrF90K4RIrERmP7yFqc', NULL, NULL, NULL, 'Cairo', NULL, 'Egypt', '$2y$10$NYzenZuKhnodN5OPtgSJhuPfryoPhupdDqODko57RxfTZy7hzvx0.', 'OiK0MOPefolIiGMny2WChjPBZehzeXpq1HbuecRGfCI2EcAkvdmRYpBjh7QG', '2020-08-09 19:31:30', '2020-08-09 19:33:01'),
(22, 'Amom Souza', 'amom-souza@hotmail.com', 'amomsouza', '0', 'Ubh9CJL3s6qeNR5CDyt4', NULL, NULL, NULL, 'Ilhéus', NULL, 'Brazil', '$2y$10$sS5pKRKNJRZuMPHfL0qF8uUc/cgrCMxVRd8STJ4rT6Ececr7Gl43q', NULL, '2020-08-10 18:03:03', '2020-12-01 11:58:08'),
(23, 'Benjamin Olson', 'benjamin.fullstack@gmail.com', 'rightouscoder', '1', 'Bn3fWilCQjmlRHwFsDOd', NULL, NULL, NULL, 'Enugu', NULL, 'Nigeria', '$2y$10$5OSB2VxUIHty8sW5PBvtBuG8iRQ7HkrCfykDKLONukiLt3vbeKU8e', NULL, '2020-08-11 05:11:52', '2020-08-11 05:14:53'),
(25, 'Leri Chalaganidze', 'anick912@gmail.com', 'flame_admin', '1', '7MOn80WsHnJaQECrvMkU', NULL, NULL, NULL, 'Tbilisi, Georgia', NULL, 'Georgia', '$2y$10$sj0mLTtXe2O0Zzw5MPhfKO399Z8B8ZGX0AN1yCLP5itQz0n424vVu', NULL, '2020-08-11 23:20:36', '2020-08-11 23:21:15'),
(26, 'Maduka stephen', 'stephenduke45@yahoo.com', 'Steohenduke45', '1', 'NH2rGARhSeiN1wKVDB0l', NULL, NULL, NULL, 'Enugu', NULL, 'Nigeria', '$2y$10$rpmKWtZ7csyMgFY7RPS1RuV/MEOIf883PsR9xU1EIjX4U3MNItA86', NULL, '2020-08-12 19:46:30', '2020-08-12 19:47:03'),
(28, 'Dan', 'drissy505@gmail.com', 'Dan', '1', '4cufXxCasfJaHB8yIGyL', NULL, NULL, NULL, 'Abuj', NULL, 'Nigeria', '$2y$10$DJMcoBCPL1e6a09ceDWnHuAt2gLMW6.1qTrdy4XG7MiNxPC1rUlfO', NULL, '2020-08-13 04:57:22', '2020-08-13 04:58:06'),
(29, 'madhu', 'madhukb@gmail.com', 'madhubbb', '1', '4mOjIEDkX0ZXrgSXRzKH', NULL, NULL, NULL, 'Bangalore', NULL, 'India', '$2y$10$61eYV5zb17xPd6q0fHnE9e2Os0.ANoESADDAff31bNGoBZTuOhq5S', NULL, '2020-08-13 07:04:15', '2020-08-13 07:04:47'),
(30, 'Pradeep Kumar Gurjar', 'assdpradeep@gmail.com', '9001444311', '1', 'WWiVgHujtSEjmDUUMSQj', NULL, NULL, NULL, 'Bhilwara', NULL, 'India', '$2y$10$NPfzK0VtENFcOepslYHXveGSIrJcWKIaIdggba2cbYvIqbbX1fwBu', NULL, '2020-08-13 16:03:19', '2020-08-13 16:03:59'),
(31, 'Gollum', 'paceagiuu@gmail.com', 'Gollum', '1', 'n5SD4k7W6HPYzOckL84h', NULL, NULL, NULL, 'Bucuresti', NULL, 'Romania', '$2y$10$vh.U8heIE2IeQiIyvzpPNeYE0yl8ZOoGvTvbLoy5/UdvXkp9zAqRG', NULL, '2020-08-13 22:40:36', '2020-08-13 22:41:18'),
(32, 'mark njeru', 'maxelitenjiru@gmail.com', 'addams', '1', 'zeVijX0HXTAVXm67O7Cm', NULL, NULL, NULL, 'Nairobi', NULL, 'Kenya', '$2y$10$gTRi9N74FowMs5Rb3bfrB.bVyeoOZ9vX7KdlbmwKRwJzXzQIxZAIi', NULL, '2020-08-14 19:37:50', '2020-08-14 19:43:32'),
(33, 'Tester Man', 'vincomsvg@gmail.com', 'testerman', '1', 'yiojo0jVa6nb09kHEhda', NULL, NULL, NULL, 'fdgfd', NULL, 'Anguilla', '$2y$10$FjhQyrB4LGXK78QOL95WmuxSUIsErGBFdlr28xUQaN09aGHfUDEtu', NULL, '2020-08-14 21:17:17', '2020-08-14 21:18:06'),
(34, 'Amir Mohamed', 'amir_gohary@hotmail.com', 'amirelgohary1990', '1', 'saamnzQ9yMveNDFjTitd', NULL, NULL, NULL, 'Cairo', NULL, 'Egypt', '$2y$10$GjwAfXd5oDq.bAEhrY5GAuzok8e0VdHkajsxxEWGI.TQvli3vqMw.', NULL, '2020-08-15 15:18:42', '2020-08-15 15:19:09'),
(35, 'Damilare Philip', 'frizzyonline@gmail.com', 'Frizzzy', '1', 'reAnLrQ0SMG6wSdhGDeh', NULL, NULL, NULL, 'Lagos', NULL, 'Nigeria', '$2y$10$u.wr/X00GHQgEjxSLEZ8uOhgNpyRx6qEc9wHYZzZYPF.JTOmljaGm', NULL, '2020-08-16 01:47:25', '2020-08-16 01:48:18'),
(36, 'sandro', 'lucasradical87@gmail.com', 'gggggggg', '1', 'f1oy2dlY5O5GkxICEzLF', NULL, NULL, NULL, 'queimados', NULL, 'Brazil', '$2y$10$3x0bwv7I49eySwsmXcO2tu3jvSWZbj11izqZpNcaVDmrHKTCyDvmi', NULL, '2020-08-16 20:30:40', '2020-08-16 20:31:49'),
(37, 'zaltv', 'zaltvapp@gmail.com', 'zaltvapp', '1', 'ulFNap7l39jJ8otSS1e1', NULL, NULL, NULL, 'rio', NULL, 'Brazil', '$2y$10$icAcVUCjva4Wnyhg46O3U.Z4Piqtnt4EEhSTFpdb69Jf79RHe8RjG', NULL, '2020-08-16 23:30:22', '2020-08-16 23:31:05'),
(38, 'Caner', 'canerduzyar@gmail.com', 'razorx', '1', 'WA47sCsS0HJfSlKpcjRW', NULL, NULL, NULL, 'Sakarya', NULL, 'Turkey', '$2y$10$Yk2qjUAcpFFwuLwFLwjZwuQcVDD/E4z5f3Gpw79hM4eAlsj8eZ1AO', NULL, '2020-08-17 14:47:09', '2020-08-17 14:48:01'),
(39, 'Mehdi boudhir', 'archivetunisia@gmail.com', 'boudo2020', '1', 'oFjn5DpJMSVNBN5zHqRL', NULL, NULL, NULL, 'Doha', NULL, 'Qatar', '$2y$10$DgAL8SIyjbuWBkP9JrbRHOaTc8poD63GijKl6boxZdB2kNte/R0W2', NULL, '2020-08-17 20:28:30', '2020-08-17 20:29:22'),
(41, 'Ser', 'sergey.linko@gmail.com', 'Li', '1', 'cNL72lKSze7DWdszXJRC', NULL, NULL, NULL, 'Erevan', NULL, 'Armenia', '$2y$10$DUZSXY9F54qY2gyLwiTcg.qfKKrOM5hUQH4SfRr6kgdx7YC7Mm3QK', NULL, '2020-08-19 23:39:37', '2020-08-19 23:40:17'),
(42, 'Naijablogger', 'langdung02@gmail.com', 'Naijablogger', '1', 'VUQYtkv4Gb0RBWe8SkcL', NULL, NULL, NULL, 'Rayfield', NULL, 'Nigeria', '$2y$10$6b6M.Y1/t2mJ2ryKmnSeleymLjMVZIGHmykvYdaHyqbhcvsfY6Q4y', NULL, '2020-08-20 04:38:22', '2020-08-20 04:39:27'),
(43, 'Vicks', 'programmervicks@gmail.com', 'vicks', '1', 'r4ZdrmyXuYG3JW5q22bV', NULL, NULL, NULL, 'Aba', NULL, 'Afganistan', '$2y$10$/qioDErjKKR9T1fi.IHB5esHZkxcm65OIr8WX2bJGbtpvpPTq/Yf6', NULL, '2020-08-20 13:26:20', '2020-08-20 13:27:05'),
(45, 'Muhammad Ameen', 'itsameen1988@gmail.com', 'itsameen', '1', 'S2K9VOnAEekgZ7EDfulr', NULL, NULL, NULL, 'Islamabad', NULL, 'Pakistan', '$2y$10$GI.I6hpnYVn3V5hKAQSxkOxPUXY62B3TfO3/WmdvWmHg9L9ugIIcO', NULL, '2020-08-21 13:50:36', '2020-08-21 13:51:46'),
(48, 'wahid', 'mdwahid@softifybd.com', 'wahid', '1', 'IbMufr0CdHdRcSzWclvu', NULL, NULL, NULL, 'super_admin', NULL, 'Afganistan', '$2y$10$WeNSxglHnKYiiH2B002CP.Oq76LCniUtK13LiUKqGaX90AZ5rehU.', NULL, '2020-08-23 14:27:20', '2020-08-23 14:29:18'),
(49, 'Paco', 'petechus@gmail.com', 'Paco', '1', 'lKevb67cEgVZSxeRMEfX', NULL, NULL, NULL, 'Tula', NULL, 'Afganistan', '$2y$10$GjO8KdMYTfs3Innc0jog6OkAidRteRSvri9SmspCklII0vyCdW4p.', NULL, '2020-08-23 22:02:54', '2020-08-23 22:03:26'),
(50, 'Navid Arian', 'nvdarian@gmail.com', 'arian32', '1', 'Qmg91nbWWD5z2gJEPKOz', NULL, NULL, NULL, 'dubai', NULL, 'United Arab Erimates', '$2y$10$KCVhhUFAxX7xUx.uv6WEVuZpxM3qwXFK7K692l1yJyf1aPAlck6Yy', NULL, '2020-08-24 09:20:29', '2020-08-24 09:21:30'),
(51, 'mike ibekwe', 'dakingeorge58@gmail.com', 'coded400', '1', 'DwPzSOG1aDqR7HzDtkYq', NULL, NULL, NULL, 'florida', NULL, 'Afganistan', '$2y$10$WzeQjlz898g3VrcUOoMOPehZgK8JEDtQSxE1bu6eaueL0Hv8BMluW', NULL, '2020-08-24 23:27:02', '2020-08-24 23:28:07'),
(53, 'Prakash Singh', 'prakashks045@gmail.com', 'prakashks045', '1', 'OzQ0ySk7tUsFc9bS0G2U', NULL, NULL, NULL, 'New Delhi', NULL, 'India', '$2y$10$49wI7kxZGpjrvsNV9tLCeeZC5/YXuwMvoFlMKN9z4SPGz/U/P4WBS', NULL, '2020-08-26 21:52:16', '2020-08-26 21:52:59'),
(54, 'zuka dzamunashvili', 'z.dzamunay@gmail.com', 'zukofia', '1', 'y3lQWsRtbXesnZjvlGQ3', NULL, NULL, NULL, 'Georgia,Tbilisi', NULL, 'Georgia', '$2y$10$68sOVOe583abCT9xyFsrbODXhyeumrhO6IWYPODDKlNJckI1Z.Ycu', NULL, '2020-08-27 00:43:12', '2020-08-27 00:44:33'),
(57, 'Jjj', 'rikey9578@gmail.com', 'nx597', '1', 'J7V1p0B2XwxPA1atwncd', NULL, NULL, NULL, '88', NULL, 'Afganistan', '$2y$10$WxoUbmIEL9rKqMEj2vadFeCAUn9TUsGrPe2Ky83uo1FFUBDZ.I7MG', NULL, '2020-08-29 21:13:42', '2020-08-29 21:14:38'),
(58, 'rajiv', 'rajivkissy@gmail.com', 'rajiv', '1', 'vYi1KTZAhV1dWL4dKzAA', NULL, NULL, NULL, 'test', NULL, 'India', '$2y$10$37ZVE3c6Vqzt4Pkh8Muv/OuwVgm6vusrL9FeaLOcvfJlLY33AC12C', NULL, '2020-08-31 18:52:02', '2020-10-03 11:13:13'),
(61, 'Hasan', '0hasanablak@gmail.com', 'Ablak', '1', 'F68xAvsQI5yUIjkzYlwY', NULL, NULL, NULL, 'Sakarya', NULL, 'Turkey', '$2y$10$zFdZjwHWCoE73fmrlR9ccekRPQcjroukPQnrfituPNtou71QToZS2', NULL, '2020-09-05 17:17:01', '2020-12-01 11:58:12'),
(94, 'Sharifur Rahmam', 'xgenious51@gmail.com', 'xgenious55', '1', 'Cf9GfmRRN3L9YRy6BAVt', NULL, NULL, NULL, 'dhaka', NULL, 'Bangladesh', '$2y$10$Y81fQoih5eC3Wq22vIeEP.8HSuwGLCrnNzkRF/dkUEMhhx8c.wmGa', NULL, '2020-12-01 12:20:22', '2020-12-01 12:52:13');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_render_function` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontend_render_function` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_name` text COLLATE utf8mb4_unicode_ci,
  `widget_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `admin_render_function`, `frontend_render_function`, `widget_name`, `widget_content`, `widget_order`, `created_at`, `updated_at`) VALUES
(7, 'about_us_widget', 'render_about_us_widget', 'About Us', 'a:11:{s:2:\"id\";s:1:\"7\";s:24:\"frontend_render_function\";s:22:\"render_about_us_widget\";s:21:\"admin_render_function\";s:15:\"about_us_widget\";s:11:\"widget_type\";s:6:\"update\";s:11:\"widget_name\";s:8:\"About Us\";s:12:\"widget_order\";s:1:\"1\";s:9:\"site_logo\";s:1:\"5\";s:14:\"description_en\";s:69:\"No comfort do written conduct at prevent manners offended no concerns\";s:15:\"description_tur\";s:84:\"Herhangi bir endişe rahatsızlık önlemek için yazılı davranış hiçbir konfor\";s:14:\"description_ar\";s:106:\"لا راحة تصرف سلوك مكتوب في منع الأخلاق لا تسيء إلى أي مخاوف\";s:14:\"description_sp\";s:64:\"Sin consuelo, la conducta escrita para evitar modales no ofende.\";}', 1, '2020-06-16 18:16:23', '2021-01-12 00:23:49'),
(11, 'contact_info_widget', 'render_contact_info_widget', 'Contact Info', 'a:21:{s:24:\"frontend_render_function\";s:26:\"render_contact_info_widget\";s:21:\"admin_render_function\";s:19:\"contact_info_widget\";s:11:\"widget_type\";s:3:\"new\";s:11:\"widget_name\";s:12:\"Contact Info\";s:12:\"widget_order\";s:1:\"2\";s:15:\"widget_title_en\";s:10:\"Contact us\";s:11:\"location_en\";s:53:\"143 castle road 517 district, kiyev port south Canada\";s:8:\"phone_en\";s:12:\"+111 222 333\";s:8:\"email_en\";s:17:\"info@yourmail.com\";s:16:\"widget_title_tur\";s:13:\"Bize Ulaşın\";s:12:\"location_tur\";s:49:\"143 kale yol 517 ilçe, kiyev liman güney Kanada\";s:9:\"phone_tur\";s:12:\"+111 222 333\";s:9:\"email_tur\";s:17:\"info@yourmail.com\";s:15:\"widget_title_ar\";s:15:\"اتصل بنا\";s:11:\"location_ar\";s:81:\"143 طريق القلعة 517 منطقة ، ميناء كييف جنوب كندا\";s:8:\"phone_ar\";s:12:\"+111 222 333\";s:8:\"email_ar\";s:17:\"info@yourmail.com\";s:15:\"widget_title_sp\";s:21:\"Contacta con nosotras\";s:11:\"location_sp\";s:64:\"143 distrito de castle road 517, puerto de kiyev, sur de Canadá\";s:8:\"phone_sp\";s:12:\"+111 222 333\";s:8:\"email_sp\";s:17:\"info@yourmail.com\";}', 3, '2020-06-17 15:31:59', '2021-01-12 00:23:51'),
(15, 'recent_post_widget', 'render_recent_post_widget', 'Recent Post', 'a:11:{s:2:\"id\";s:2:\"15\";s:24:\"frontend_render_function\";s:25:\"render_recent_post_widget\";s:21:\"admin_render_function\";s:18:\"recent_post_widget\";s:11:\"widget_type\";s:6:\"update\";s:11:\"widget_name\";s:11:\"Recent Post\";s:12:\"widget_order\";s:1:\"2\";s:15:\"widget_title_en\";s:12:\"Recent Posts\";s:16:\"widget_title_tur\";s:29:\"yakın zamanda Gönderilenler\";s:15:\"widget_title_ar\";s:33:\"المشاركات الاخيرة\";s:15:\"widget_title_sp\";s:18:\"Mensajes recientes\";s:10:\"post_items\";s:1:\"2\";}', 2, '2020-06-17 18:41:04', '2021-01-12 00:23:51'),
(19, 'newsletter_widget', 'render_newsletter_widget', 'Newsletter', 'a:14:{s:2:\"id\";s:2:\"19\";s:24:\"frontend_render_function\";s:24:\"render_newsletter_widget\";s:21:\"admin_render_function\";s:17:\"newsletter_widget\";s:11:\"widget_type\";s:6:\"update\";s:11:\"widget_name\";s:10:\"Newsletter\";s:12:\"widget_order\";s:1:\"4\";s:15:\"widget_title_en\";s:19:\"Subscribe Newletter\";s:14:\"description_en\";s:39:\"subscribe our newsletter to get update.\";s:16:\"widget_title_tur\";s:17:\"Bültene Abone Ol\";s:15:\"description_tur\";s:48:\"güncelleme almak için bültenimize abone olun.\";s:15:\"widget_title_ar\";s:33:\"المشاركات الاخيرة\";s:14:\"description_ar\";s:83:\"اشترك في النشرة الإخبارية للحصول على التحديث.\";s:15:\"widget_title_sp\";s:35:\"Suscribirse al boletín informativo\";s:14:\"description_sp\";s:60:\"Suscríbase a nuestro boletín para recibir actualizaciones.\";}', 4, '2020-06-18 08:35:17', '2021-01-12 00:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

CREATE TABLE `works` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci,
  `categories_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `meta_tag` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clients` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`id`, `title`, `slug`, `categories_id`, `description`, `excerpt`, `meta_tag`, `meta_description`, `duration`, `clients`, `budget`, `gallery`, `status`, `image`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Cyber Security Solution for cura', 'cyber-security-solution-for-cura', 'a:1:{i:0;s:1:\"1\";}', '<h2 class=\"title\">Overview</h2>\r\n<p>Of recommend residence education be on difficult repulsive offending. Judge views had mirth table seems great him for her. Alone all happy asked begin fully stand own get. Excuse ye seeing result of we. See scale dried songs old may not. Promotion did disposing you household any instantly. Hills we do under times at first short an.&nbsp;</p><p>Those an equal point no years do. Depend warmth fat but her but played. Shy and subjects wondered trifling pleasant. Prudent cordial comfort do no on colonel as assured chicken. Smart mrs day which begin. Snug do sold mr it if such. Terminated uncommonly at at estimating. Man behaviour met moonlight extremity acuteness direction.&nbsp;</p><p><br></p>\r\n<h2 class=\"title\">Result</h2>\r\n<p>Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county. The use him without greatly can private. Increasing it unpleasant no of contrasted no continuing. Nothing colonel my no removed in weather. It dissimilar in up devonshire inhabiting.&nbsp;</p><p><br></p>', 'Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county.', 'hello,hi', 'meta description', '02 Month', 'Jason C. Williams', '$3000', NULL, 'publish', '22', 'en', '2020-06-02 16:32:28', '2020-06-02 16:32:28'),
(2, 'Website Design', 'website-design', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}', '<h2 class=\"title\">Overview</h2>\r\n<p>Of recommend residence education be on difficult repulsive offending. Judge views had mirth table seems great him for her. Alone all happy asked begin fully stand own get. Excuse ye seeing result of we. See scale dried songs old may not. Promotion did disposing you household any instantly. Hills we do under times at first short an.&nbsp;</p><p>Those an equal point no years do. Depend warmth fat but her but played. Shy and subjects wondered trifling pleasant. Prudent cordial comfort do no on colonel as assured chicken. Smart mrs day which begin. Snug do sold mr it if such. Terminated uncommonly at at estimating. Man behaviour met moonlight extremity acuteness direction.&nbsp;</p><p><br></p>\r\n<h2 class=\"title\">Result</h2>\r\n<p>Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county. The use him without greatly can private. Increasing it unpleasant no of contrasted no continuing. Nothing colonel my no removed in weather. It dissimilar in up devonshire inhabiting.&nbsp;</p><p><br></p>', 'Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county.', 'hello,hi', 'meta description', '15 Days', 'Jason C. Williams', '$3000', NULL, 'publish', '21', 'en', '2020-06-03 17:37:45', '2020-06-03 17:56:03'),
(3, 'Develop A Mobile App', 'develop-a-mobile-app', 'a:2:{i:0;s:1:\"3\";i:1;s:1:\"4\";}', '<h2 class=\"title\">Overview</h2>\r\n<p>Of recommend residence education be on difficult repulsive offending. Judge views had mirth table seems great him for her. Alone all happy asked begin fully stand own get. Excuse ye seeing result of we. See scale dried songs old may not. Promotion did disposing you household any instantly. Hills we do under times at first short an.&nbsp;</p><p>Those an equal point no years do. Depend warmth fat but her but played. Shy and subjects wondered trifling pleasant. Prudent cordial comfort do no on colonel as assured chicken. Smart mrs day which begin. Snug do sold mr it if such. Terminated uncommonly at at estimating. Man behaviour met moonlight extremity acuteness direction.&nbsp;</p><p><br></p>\r\n<h2 class=\"title\">Result</h2>\r\n<p>Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county. The use him without greatly can private. Increasing it unpleasant no of contrasted no continuing. Nothing colonel my no removed in weather. It dissimilar in up devonshire inhabiting.&nbsp;</p><p><br></p>', 'Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county.', 'hello,hi', 'meta description', '15 Days', 'Jason C. Williams', '$1000', NULL, 'publish', '20', 'en', '2020-06-03 17:56:14', '2020-06-03 18:06:29'),
(4, 'Develop IOS App', 'develop-ios-app', 'a:2:{i:0;s:1:\"3\";i:1;s:1:\"4\";}', '<h2 class=\"title\">Overview</h2>\r\n<p>Of recommend residence education be on difficult repulsive offending. Judge views had mirth table seems great him for her. Alone all happy asked begin fully stand own get. Excuse ye seeing result of we. See scale dried songs old may not. Promotion did disposing you household any instantly. Hills we do under times at first short an.&nbsp;</p><p>Those an equal point no years do. Depend warmth fat but her but played. Shy and subjects wondered trifling pleasant. Prudent cordial comfort do no on colonel as assured chicken. Smart mrs day which begin. Snug do sold mr it if such. Terminated uncommonly at at estimating. Man behaviour met moonlight extremity acuteness direction.&nbsp;</p><p><br></p>\r\n<h2 class=\"title\">Result</h2>\r\n<p>Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county. The use him without greatly can private. Increasing it unpleasant no of contrasted no continuing. Nothing colonel my no removed in weather. It dissimilar in up devonshire inhabiting.&nbsp;</p><p><br></p>', 'Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county.', 'hello,hi', 'meta description', '15 Days', 'Jason C. Williams', '$1000', NULL, 'publish', '19', 'en', '2020-06-03 18:06:52', '2020-06-03 18:07:16'),
(5, 'Google Chrome Extension', 'google-chrome-extension', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"4\";}', '<h2 class=\"title\">Overview</h2>\r\n<p>Of recommend residence education be on difficult repulsive offending. Judge views had mirth table seems great him for her. Alone all happy asked begin fully stand own get. Excuse ye seeing result of we. See scale dried songs old may not. Promotion did disposing you household any instantly. Hills we do under times at first short an.&nbsp;</p><p>Those an equal point no years do. Depend warmth fat but her but played. Shy and subjects wondered trifling pleasant. Prudent cordial comfort do no on colonel as assured chicken. Smart mrs day which begin. Snug do sold mr it if such. Terminated uncommonly at at estimating. Man behaviour met moonlight extremity acuteness direction.&nbsp;</p><p><br></p>\r\n<h2 class=\"title\">Result</h2>\r\n<p>Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county. The use him without greatly can private. Increasing it unpleasant no of contrasted no continuing. Nothing colonel my no removed in weather. It dissimilar in up devonshire inhabiting.&nbsp;</p><p><br></p>', 'Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county.', 'hello,hi', 'meta description', '15 Days', 'Jason C. Williams', '$1000', NULL, 'publish', '18', 'en', '2020-06-03 18:07:20', '2020-06-03 18:07:47'),
(6, 'Ecoomerce Website', 'ecoomerce-website', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"4\";}', '<h2 class=\"title\">Overview</h2>\r\n<p>Of recommend residence education be on difficult repulsive offending. Judge views had mirth table seems great him for her. Alone all happy asked begin fully stand own get. Excuse ye seeing result of we. See scale dried songs old may not. Promotion did disposing you household any instantly. Hills we do under times at first short an.&nbsp;</p><p>Those an equal point no years do. Depend warmth fat but her but played. Shy and subjects wondered trifling pleasant. Prudent cordial comfort do no on colonel as assured chicken. Smart mrs day which begin. Snug do sold mr it if such. Terminated uncommonly at at estimating. Man behaviour met moonlight extremity acuteness direction.&nbsp;</p><p><br></p>\r\n<h2 class=\"title\">Result</h2>\r\n<p>Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county. The use him without greatly can private. Increasing it unpleasant no of contrasted no continuing. Nothing colonel my no removed in weather. It dissimilar in up devonshire inhabiting.&nbsp;</p><p><br></p>', 'Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county.', 'hello,hi', 'meta description', '15 Days', 'Jason C. Williams', '$5000', NULL, 'publish', '17', 'en', '2020-06-03 18:07:53', '2020-06-03 18:08:16'),
(7, 'Multipurpose CMS', 'multipurpose-cms', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}', '<h2 class=\"title\">Overview</h2>\r\n<p>Of recommend residence education be on difficult repulsive offending. Judge views had mirth table seems great him for her. Alone all happy asked begin fully stand own get. Excuse ye seeing result of we. See scale dried songs old may not. Promotion did disposing you household any instantly. Hills we do under times at first short an.&nbsp;</p><p>Those an equal point no years do. Depend warmth fat but her but played. Shy and subjects wondered trifling pleasant. Prudent cordial comfort do no on colonel as assured chicken. Smart mrs day which begin. Snug do sold mr it if such. Terminated uncommonly at at estimating. Man behaviour met moonlight extremity acuteness direction.&nbsp;</p><p><br></p>\r\n<h2 class=\"title\">Result</h2>\r\n<p>Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county. The use him without greatly can private. Increasing it unpleasant no of contrasted no continuing. Nothing colonel my no removed in weather. It dissimilar in up devonshire inhabiting.&nbsp;</p><p><br></p>', 'Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county.', 'hello,hi', 'meta description', '15 Days', 'Jason C. Williams', '$5000', NULL, 'publish', '16', 'en', '2020-06-03 18:08:21', '2020-06-03 18:08:44'),
(8, 'Knowledgebase Website', 'knowledgebase-website', 'a:2:{i:0;s:1:\"2\";i:1;s:1:\"3\";}', '<h2 class=\"title\">Overview</h2>\r\n<p>Of recommend residence education be on difficult repulsive offending. Judge views had mirth table seems great him for her. Alone all happy asked begin fully stand own get. Excuse ye seeing result of we. See scale dried songs old may not. Promotion did disposing you household any instantly. Hills we do under times at first short an.&nbsp;</p><p>Those an equal point no years do. Depend warmth fat but her but played. Shy and subjects wondered trifling pleasant. Prudent cordial comfort do no on colonel as assured chicken. Smart mrs day which begin. Snug do sold mr it if such. Terminated uncommonly at at estimating. Man behaviour met moonlight extremity acuteness direction.&nbsp;</p><p><br></p>\r\n<h2 class=\"title\">Result</h2>\r\n<p>Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county. The use him without greatly can private. Increasing it unpleasant no of contrasted no continuing. Nothing colonel my no removed in weather. It dissimilar in up devonshire inhabiting.&nbsp;</p><p><br></p>', 'Kindness to he horrible reserved ye. Effect twenty indeed beyond for not had county.', 'hello,hi', 'meta description', '15 Days', 'Jason C. Williams', '$5000', '33|32', 'publish', '20', 'en', '2020-06-03 18:08:23', '2020-06-21 07:25:06'),
(9, 'Bilgi Bankası Web Sitesi', 'bilgi-bankasi-web-sitesi', 'a:1:{i:0;s:1:\"6\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$5000', NULL, 'publish', '15', 'tur', '2020-06-03 18:34:52', '2020-06-03 18:37:22'),
(10, 'Çok Amaçlı CMS', 'cok-amacli-cms', 'a:1:{i:0;s:1:\"7\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '14', 'tur', '2020-06-03 18:38:10', '2020-06-03 18:38:56'),
(11, 'E-ticaret Web Sitesi', 'e-ticaret-web-sitesi', 'a:2:{i:0;s:1:\"6\";i:1;s:1:\"8\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '13', 'tur', '2020-06-03 18:39:01', '2020-06-03 18:40:22'),
(12, 'Google Chrome Uzantısı', 'google-chrome-uzantisi', 'a:2:{i:0;s:1:\"5\";i:1;s:1:\"6\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '12', 'tur', '2020-06-03 18:40:28', '2020-06-03 18:41:09'),
(13, 'IOS Uygulaması Geliştirin', 'ios-uygulamasi-gelistirin', 'a:2:{i:0;s:1:\"6\";i:1;s:1:\"8\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '11', 'tur', '2020-06-03 18:41:27', '2020-06-03 18:42:11'),
(15, 'Mobil Uygulama Geliştirin', 'mobil-uygulama-gelistirin', 'a:2:{i:0;s:1:\"7\";i:1;s:1:\"8\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '10', 'tur', '2020-06-03 18:42:44', '2020-06-03 18:43:27'),
(16, 'Web sitesi tasarımı', 'web-sitesi-tasarimi', 'a:1:{i:0;s:1:\"7\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '22', 'tur', '2020-06-03 18:44:08', '2020-06-03 18:44:40'),
(17, 'Küratör için Siber Güvenlik Çözümü', 'kurator-icin-siber-guvenlik-cozumu', 'a:1:{i:0;s:1:\"7\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '25', 'tur', '2020-06-03 18:44:56', '2020-06-03 18:45:17'),
(18, 'حل الأمن الإلكتروني للمنسق', 'hl-alamn-alalktrony-llmnsk', 'a:1:{i:0;s:2:\"15\";}', '<h2 class=\"title\">نظرة عامة</h2>\r\n<p>من الصعب أن تكون نصيحة التعليم السكني على الجرائم البغيضة. كانت آراء القاضي أن طاولة المرآة تبدو رائعة بالنسبة له. كل المطلوبين السعداء وحدهم سيبدأون في الحصول على موقفهم الخاص تمامًا. عذرا ، نرى النتيجة. نرى. مقياس الأغاني الجافة قد لا تكون قديمة. ألقى بك العرض الترويجي على الفور في منزلك. التلال تصنع في وقت قصير تحت الوقت.</p>\r\n<p>هذه نقاط غير متساوية لسنوات. درجة الحرارة دهنية لكنها تعتمد عليها ولكنها تلعب. كانت الخجولة والموضوعات غريبة بشكل لطيف. راحة صادقة حكيمة ، لا في الألبوم كدجاج مضمون. تبدأ السيدة الذكية اليوم. باع Snug ، إذا كان هذا هو الحال. نادرا ما يتم إنهاؤها في التنبؤات. التقى السلوك البشري في اتجاه حدة ضوء القمر.</p><p><br></p>\r\n<h2 class=\"title\">نتيجة</h2>\r\n<p>اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها. يمكن أن تكون خاصة دون استخدامها إلى حد كبير. لا يوجد استياء متزايد ولا تباين. لم تتم إزالة العقيد في الهواء. على غرار العيش في ديفونشاير العليا.</p>', 'اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها.', 'مرحبا', 'ميتا الوصف', '15 يوم', 'جايسون سي ويليامز', '$1000', NULL, 'publish', '25', 'ar', '2020-06-03 18:45:32', '2020-07-27 12:33:09'),
(19, 'Küratör için Siber Güvenlik Çözümü', 'kurator-icin-siber-guvenlik-cozumu', 'a:1:{i:0;s:2:\"12\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '25', 'sp', '2020-06-03 18:45:54', '2020-06-04 10:38:52'),
(20, 'CMS multipropósito', 'cms-multiproposito', 'a:2:{i:0;s:2:\"12\";i:1;s:2:\"13\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '24', 'sp', '2020-06-04 10:44:10', '2020-06-04 12:07:41'),
(21, 'Sitio web de comercio electrónico', 'sitio-web-de-comercio-electronico', 'a:2:{i:0;s:1:\"9\";i:1;s:2:\"11\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '23', 'sp', '2020-06-04 12:07:46', '2020-06-04 12:19:52'),
(22, 'Extensión Google Chrome', 'extension-google-chrome', 'a:2:{i:0;s:1:\"9\";i:1;s:2:\"12\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '21', 'sp', '2020-06-04 12:24:15', '2020-06-04 12:24:58'),
(23, 'Desarrollar la aplicación IOS', 'desarrollar-la-aplicacion-ios', 'a:2:{i:0;s:2:\"12\";i:1;s:2:\"13\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '20', 'sp', '2020-06-04 12:30:20', '2020-06-04 12:50:45'),
(24, 'Desarrollar una aplicación móvil', 'desarrollar-una-aplicacion-movil', 'a:2:{i:0;s:1:\"9\";i:1;s:2:\"12\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '19', 'sp', '2020-06-04 13:05:10', '2020-06-04 13:06:24'),
(25, 'Diseño de páginas web', 'diseno-de-paginas-web', 'a:1:{i:0;s:1:\"9\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '18', 'sp', '2020-06-04 13:07:39', '2020-06-04 13:08:11'),
(26, 'Solución de seguridad cibernética para cura', 'solucion-de-seguridad-cibernetica-para-cura', 'a:2:{i:0;s:1:\"9\";i:1;s:2:\"13\";}', '<h2 class=\"title\">genel bakış</h2>\r\n<p>Konut eğitimi tavsiye zor itici suç üzerinde olması. Yargıç görüşleri ayna tablo onun için harika görünüyor vardı. Yalnız tüm mutlu istedi tamamen kendi olsun standı başlar. Özür dileriz sonucu görüyoruz. Bkz. Ölçek kuru şarkıları eski olmayabilir. Promosyon sizi anında evinize attı. Tepeler zamanın altında kısa sürede yapıyoruz.</p>\r\n<p>Bunlar yıllarca eşit olmayan bir nokta. Sıcaklık yağ ama ona bağlı ama oynadı. Utangaç ve konular hoş bir şekilde merak ediyordu. İhtiyatlı samimi konfor, garantili tavuk olarak albayda hayır. Akıllı bayan gün başlar. Snug sattı bay eğer böyle. Tahminlerde nadiren feshedilir. İnsan davranışı ay ışığı ekstremite keskinliği yönünü karşıladı.</p><p><br></p>\r\n<h2 class=\"title\">Sonuç</h2>\r\n<p>Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten. Onu büyük ölçüde kullanmadan özel olabilir. Artan hoşnutsuzluk yok kontrastlı yok. Hiçbir albay havada yok kaldırıldı. Yukarı devonshire yaşayan benzer.</p>', 'Ona nezaket, seni saklı tuttu. Etkisi yirmi ötesinde ilçe yoktu gerçekten.', 'hello,hi', 'meta description', '15 günler', 'Jason C. Williams', '$1000', NULL, 'publish', '17', 'sp', '2020-06-04 13:08:17', '2020-06-04 13:08:48'),
(27, 'CMS متعددة الأغراض', 'cms-mtaadd-alaghrad', 'a:1:{i:0;s:2:\"17\";}', '<h2 class=\"title\">نظرة عامة</h2>\r\n<p>من الصعب أن تكون نصيحة التعليم السكني على الجرائم البغيضة. كانت آراء القاضي أن طاولة المرآة تبدو رائعة بالنسبة له. كل المطلوبين السعداء وحدهم سيبدأون في الحصول على موقفهم الخاص تمامًا. عذرا ، نرى النتيجة. نرى. مقياس الأغاني الجافة قد لا تكون قديمة. ألقى بك العرض الترويجي على الفور في منزلك. التلال تصنع في وقت قصير تحت الوقت.</p>\r\n<p>هذه نقاط غير متساوية لسنوات. درجة الحرارة دهنية لكنها تعتمد عليها ولكنها تلعب. كانت الخجولة والموضوعات غريبة بشكل لطيف. راحة صادقة حكيمة ، لا في الألبوم كدجاج مضمون. تبدأ السيدة الذكية اليوم. باع Snug ، إذا كان هذا هو الحال. نادرا ما يتم إنهاؤها في التنبؤات. التقى السلوك البشري في اتجاه حدة ضوء القمر.</p><p><br></p>\r\n<h2 class=\"title\">نتيجة</h2>\r\n<p>اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها. يمكن أن تكون خاصة دون استخدامها إلى حد كبير. لا يوجد استياء متزايد ولا تباين. لم تتم إزالة العقيد في الهواء. على غرار العيش في ديفونشاير العليا.</p>', 'اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها.', 'مرحبا', 'ميتا الوصف', '15 يوم', 'جايسون سي ويليامز', '$1000', NULL, 'publish', '24', 'ar', '2020-06-04 13:53:40', '2020-07-27 12:32:59'),
(28, 'موقع التجارة الإلكترونية', 'mokaa-altgar-alalktrony', 'a:2:{i:0;s:2:\"15\";i:1;s:2:\"17\";}', '<h2 class=\"title\">نظرة عامة</h2>\r\n<p>من الصعب أن تكون نصيحة التعليم السكني على الجرائم البغيضة. كانت آراء القاضي أن طاولة المرآة تبدو رائعة بالنسبة له. كل المطلوبين السعداء وحدهم سيبدأون في الحصول على موقفهم الخاص تمامًا. عذرا ، نرى النتيجة. نرى. مقياس الأغاني الجافة قد لا تكون قديمة. ألقى بك العرض الترويجي على الفور في منزلك. التلال تصنع في وقت قصير تحت الوقت.</p>\r\n<p>هذه نقاط غير متساوية لسنوات. درجة الحرارة دهنية لكنها تعتمد عليها ولكنها تلعب. كانت الخجولة والموضوعات غريبة بشكل لطيف. راحة صادقة حكيمة ، لا في الألبوم كدجاج مضمون. تبدأ السيدة الذكية اليوم. باع Snug ، إذا كان هذا هو الحال. نادرا ما يتم إنهاؤها في التنبؤات. التقى السلوك البشري في اتجاه حدة ضوء القمر.</p><p><br></p>\r\n<h2 class=\"title\">نتيجة</h2>\r\n<p>اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها. يمكن أن تكون خاصة دون استخدامها إلى حد كبير. لا يوجد استياء متزايد ولا تباين. لم تتم إزالة العقيد في الهواء. على غرار العيش في ديفونشاير العليا.</p>', 'اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها.', 'مرحبا', 'ميتا الوصف', '15 يوم', 'جايسون سي ويليامز', '$1000', NULL, 'publish', '23', 'ar', '2020-06-04 18:22:57', '2020-07-27 12:32:49'),
(29, 'ملحق جوجل كروم', 'mlhk-gogl-krom', 'a:2:{i:0;s:2:\"16\";i:1;s:2:\"17\";}', '<h2 class=\"title\">نظرة عامة</h2>\r\n<p>من الصعب أن تكون نصيحة التعليم السكني على الجرائم البغيضة. كانت آراء القاضي أن طاولة المرآة تبدو رائعة بالنسبة له. كل المطلوبين السعداء وحدهم سيبدأون في الحصول على موقفهم الخاص تمامًا. عذرا ، نرى النتيجة. نرى. مقياس الأغاني الجافة قد لا تكون قديمة. ألقى بك العرض الترويجي على الفور في منزلك. التلال تصنع في وقت قصير تحت الوقت.</p>\r\n<p>هذه نقاط غير متساوية لسنوات. درجة الحرارة دهنية لكنها تعتمد عليها ولكنها تلعب. كانت الخجولة والموضوعات غريبة بشكل لطيف. راحة صادقة حكيمة ، لا في الألبوم كدجاج مضمون. تبدأ السيدة الذكية اليوم. باع Snug ، إذا كان هذا هو الحال. نادرا ما يتم إنهاؤها في التنبؤات. التقى السلوك البشري في اتجاه حدة ضوء القمر.</p><p><br></p>\r\n<h2 class=\"title\">نتيجة</h2>\r\n<p>اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها. يمكن أن تكون خاصة دون استخدامها إلى حد كبير. لا يوجد استياء متزايد ولا تباين. لم تتم إزالة العقيد في الهواء. على غرار العيش في ديفونشاير العليا.</p>', 'اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها.', 'مرحبا', 'ميتا الوصف', '15 يوم', 'جايسون سي ويليامز', '$1000', NULL, 'publish', '21', 'ar', '2020-06-04 18:24:04', '2020-07-27 12:32:35'),
(30, 'تطوير تطبيق IOS', 'ttoyr-ttbyk-ios', 'a:1:{i:0;s:2:\"15\";}', '<h2 class=\"title\">نظرة عامة</h2>\r\n<p>من الصعب أن تكون نصيحة التعليم السكني على الجرائم البغيضة. كانت آراء القاضي أن طاولة المرآة تبدو رائعة بالنسبة له. كل المطلوبين السعداء وحدهم سيبدأون في الحصول على موقفهم الخاص تمامًا. عذرا ، نرى النتيجة. نرى. مقياس الأغاني الجافة قد لا تكون قديمة. ألقى بك العرض الترويجي على الفور في منزلك. التلال تصنع في وقت قصير تحت الوقت.</p>\r\n<p>هذه نقاط غير متساوية لسنوات. درجة الحرارة دهنية لكنها تعتمد عليها ولكنها تلعب. كانت الخجولة والموضوعات غريبة بشكل لطيف. راحة صادقة حكيمة ، لا في الألبوم كدجاج مضمون. تبدأ السيدة الذكية اليوم. باع Snug ، إذا كان هذا هو الحال. نادرا ما يتم إنهاؤها في التنبؤات. التقى السلوك البشري في اتجاه حدة ضوء القمر.</p><p><br></p>\r\n<h2 class=\"title\">نتيجة</h2>\r\n<p>اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها. يمكن أن تكون خاصة دون استخدامها إلى حد كبير. لا يوجد استياء متزايد ولا تباين. لم تتم إزالة العقيد في الهواء. على غرار العيش في ديفونشاير العليا.</p>', 'اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها.', 'مرحبا', 'ميتا الوصف', '15 يوم', 'جايسون سي ويليامز', '$1000', NULL, 'publish', '20', 'ar', '2020-06-04 18:25:25', '2020-07-27 12:32:23'),
(31, 'تصميم الموقع', 'tsmym-almokaa', 'a:1:{i:0;s:2:\"17\";}', '<h2 class=\"title\">نظرة عامة</h2>\r\n<p>من الصعب أن تكون نصيحة التعليم السكني على الجرائم البغيضة. كانت آراء القاضي أن طاولة المرآة تبدو رائعة بالنسبة له. كل المطلوبين السعداء وحدهم سيبدأون في الحصول على موقفهم الخاص تمامًا. عذرا ، نرى النتيجة. نرى. مقياس الأغاني الجافة قد لا تكون قديمة. ألقى بك العرض الترويجي على الفور في منزلك. التلال تصنع في وقت قصير تحت الوقت.</p>\r\n<p>هذه نقاط غير متساوية لسنوات. درجة الحرارة دهنية لكنها تعتمد عليها ولكنها تلعب. كانت الخجولة والموضوعات غريبة بشكل لطيف. راحة صادقة حكيمة ، لا في الألبوم كدجاج مضمون. تبدأ السيدة الذكية اليوم. باع Snug ، إذا كان هذا هو الحال. نادرا ما يتم إنهاؤها في التنبؤات. التقى السلوك البشري في اتجاه حدة ضوء القمر.</p><p><br></p>\r\n<h2 class=\"title\">نتيجة</h2>\r\n<p>اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها. يمكن أن تكون خاصة دون استخدامها إلى حد كبير. لا يوجد استياء متزايد ولا تباين. لم تتم إزالة العقيد في الهواء. على غرار العيش في ديفونشاير العليا.</p>', 'اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها.', 'مرحبا', 'ميتا الوصف', '15 يوم', 'جايسون سي ويليامز', '$1000', NULL, 'publish', '19', 'ar', '2020-06-04 18:27:53', '2020-07-27 12:32:11'),
(32, 'حل الأمن السيبراني للوحة', 'hl-alamn-alsybrany-lloh', 'a:2:{i:0;s:2:\"14\";i:1;s:2:\"15\";}', '<h2 class=\"title\">نظرة عامة</h2>\r\n<p>من الصعب أن تكون نصيحة التعليم السكني على الجرائم البغيضة. كانت آراء القاضي أن طاولة المرآة تبدو رائعة بالنسبة له. كل المطلوبين السعداء وحدهم سيبدأون في الحصول على موقفهم الخاص تمامًا. عذرا ، نرى النتيجة. نرى. مقياس الأغاني الجافة قد لا تكون قديمة. ألقى بك العرض الترويجي على الفور في منزلك. التلال تصنع في وقت قصير تحت الوقت.</p>\r\n<p>هذه نقاط غير متساوية لسنوات. درجة الحرارة دهنية لكنها تعتمد عليها ولكنها تلعب. كانت الخجولة والموضوعات غريبة بشكل لطيف. راحة صادقة حكيمة ، لا في الألبوم كدجاج مضمون. تبدأ السيدة الذكية اليوم. باع Snug ، إذا كان هذا هو الحال. نادرا ما يتم إنهاؤها في التنبؤات. التقى السلوك البشري في اتجاه حدة ضوء القمر.</p><p><br></p>\r\n<h2 class=\"title\">نتيجة</h2>\r\n<p>اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها. يمكن أن تكون خاصة دون استخدامها إلى حد كبير. لا يوجد استياء متزايد ولا تباين. لم تتم إزالة العقيد في الهواء. على غرار العيش في ديفونشاير العليا.</p>', 'اللطف معه جعلك مختبئا. كان هناك حقا عشرين خارج نفوذها.', 'مرحبا', 'ميتا الوصف', '15 يوم', 'جايسون سي ويليامز', '$1000', '19|18|17', 'publish', '16', 'ar', '2020-06-04 18:31:20', '2020-07-27 12:31:34');

-- --------------------------------------------------------

--
-- Table structure for table `works_categories`
--

CREATE TABLE `works_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `works_categories`
--

INSERT INTO `works_categories` (`id`, `name`, `lang`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cloud Support', 'en', 'publish', '2020-06-02 13:58:19', '2020-06-02 13:58:19'),
(2, 'Data Center', 'en', 'publish', '2020-06-02 13:58:32', '2020-06-02 13:58:32'),
(3, 'Analytics', 'en', 'publish', '2020-06-02 13:58:44', '2020-06-02 13:58:44'),
(4, 'Cyber Support', 'en', 'publish', '2020-06-02 13:58:57', '2020-06-02 13:58:57'),
(5, 'Siber Destek', 'tur', 'publish', '2020-06-02 13:59:45', '2020-06-02 13:59:45'),
(6, 'analitik', 'tur', 'publish', '2020-06-02 13:59:55', '2020-06-02 13:59:55'),
(7, 'Veri merkezi', 'tur', 'publish', '2020-06-02 14:03:12', '2020-06-02 14:03:12'),
(8, 'Bulut Desteği', 'tur', 'publish', '2020-06-02 14:03:22', '2020-06-02 14:03:22'),
(9, 'Soporte en la nube', 'sp', 'publish', '2020-06-02 14:03:40', '2020-06-02 14:03:40'),
(11, 'Data Center', 'sp', 'publish', '2020-06-02 14:03:50', '2020-06-02 14:03:50'),
(12, 'Analítica', 'sp', 'publish', '2020-06-02 14:04:00', '2020-06-02 14:04:00'),
(13, 'Soporte cibernético', 'sp', 'publish', '2020-06-02 14:04:14', '2020-06-02 14:04:14'),
(14, 'دعم الإنترنت', 'ar', 'publish', '2020-06-02 14:04:49', '2020-06-02 14:04:49'),
(15, 'تحليلات', 'ar', 'publish', '2020-06-02 14:05:08', '2020-06-02 14:05:08'),
(16, 'مركز البيانات', 'ar', 'publish', '2020-06-02 14:06:57', '2020-06-02 14:06:57'),
(17, 'دعم السحابة', 'ar', 'publish', '2020-06-02 14:07:08', '2020-06-02 14:07:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_name_unique` (`name`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_info_items`
--
ALTER TABLE `contact_info_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counterups`
--
ALTER TABLE `counterups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donation_logs`
--
ALTER TABLE `donation_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events_categories`
--
ALTER TABLE `events_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_attendances`
--
ALTER TABLE `event_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_payment_logs`
--
ALTER TABLE `event_payment_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `header_sliders`
--
ALTER TABLE `header_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_galleries`
--
ALTER TABLE `image_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_gallery_categories`
--
ALTER TABLE `image_gallery_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs_categories`
--
ALTER TABLE `jobs_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_applicants`
--
ALTER TABLE `job_applicants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `key_features`
--
ALTER TABLE `key_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `knowledgebases`
--
ALTER TABLE `knowledgebases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `knowledgebase_topics`
--
ALTER TABLE `knowledgebase_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_uploads`
--
ALTER TABLE `media_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `popup_builders`
--
ALTER TABLE `popup_builders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price_plans`
--
ALTER TABLE `price_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price_plan_categories`
--
ALTER TABLE `price_plan_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_coupons`
--
ALTER TABLE `product_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_shippings`
--
ALTER TABLE `product_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_icons`
--
ALTER TABLE `social_icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `static_options`
--
ALTER TABLE `static_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `works_categories`
--
ALTER TABLE `works_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_info_items`
--
ALTER TABLE `contact_info_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `counterups`
--
ALTER TABLE `counterups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `donation_logs`
--
ALTER TABLE `donation_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `events_categories`
--
ALTER TABLE `events_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `event_attendances`
--
ALTER TABLE `event_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `event_payment_logs`
--
ALTER TABLE `event_payment_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `header_sliders`
--
ALTER TABLE `header_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `image_galleries`
--
ALTER TABLE `image_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `image_gallery_categories`
--
ALTER TABLE `image_gallery_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `jobs_categories`
--
ALTER TABLE `jobs_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `job_applicants`
--
ALTER TABLE `job_applicants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `key_features`
--
ALTER TABLE `key_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `knowledgebases`
--
ALTER TABLE `knowledgebases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `knowledgebase_topics`
--
ALTER TABLE `knowledgebase_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `media_uploads`
--
ALTER TABLE `media_uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `popup_builders`
--
ALTER TABLE `popup_builders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `price_plans`
--
ALTER TABLE `price_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `price_plan_categories`
--
ALTER TABLE `price_plan_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_coupons`
--
ALTER TABLE `product_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=419;

--
-- AUTO_INCREMENT for table `product_ratings`
--
ALTER TABLE `product_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_shippings`
--
ALTER TABLE `product_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `social_icons`
--
ALTER TABLE `social_icons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `static_options`
--
ALTER TABLE `static_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1718;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `works`
--
ALTER TABLE `works`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `works_categories`
--
ALTER TABLE `works_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
