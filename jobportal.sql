-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Nov 2025 pada 10.26
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobportal`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `applications`
--

CREATE TABLE `applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `cv` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `applications`
--

INSERT INTO `applications` (`id`, `user_id`, `job_id`, `cv`, `status`, `created_at`, `updated_at`) VALUES
(2, 3, 2, 'cvs/9JpZoiRTCqx0zXvvKXYhkBim2h1V9xJKV1X1KdXD.pdf', 'Accepted', '2025-11-18 04:24:26', '2025-11-18 04:36:12'),
(3, 3, 3, 'cvs/TnbxUxBF9TG5tFQ2jgFZNycfVJUGxolNKkIJraMS.pdf', 'Rejected', '2025-11-18 04:24:41', '2025-11-18 04:36:09'),
(9, 3, 3, 'cvs/KU7V0aoxY7wbdKnxb9kt6yJQtZ7Xvx2F897KRkXH.pdf', 'Pending', '2025-11-19 00:07:10', '2025-11-19 00:07:10'),
(10, 3, 3, 'cvs/HNFolXiqOlxKDQGMY4R8YXxEEZJi6T6y3cQILY6S.pdf', 'Pending', '2025-11-19 00:08:45', '2025-11-19 00:08:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '07120053-0f17-4392-bb9e-8625e7442f06', 'database', 'default', '{\"uuid\":\"07120053-0f17-4392-bb9e-8625e7442f06\",\"displayName\":\"App\\\\Jobs\\\\SendApplicationMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendApplicationMailJob\",\"command\":\"O:31:\\\"App\\\\Jobs\\\\SendApplicationMailJob\\\":2:{s:3:\\\"job\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:21:\\\"App\\\\Models\\\\JobVacancy\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"createdAt\":1763535753,\"delay\":null}', 'ErrorException: Undefined property: Illuminate\\Queue\\Jobs\\DatabaseJob::$title in D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\app\\Mail\\JobAppliedMail.php:27\nStack trace:\n#0 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(258): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined prope...\', \'D:\\\\Kuliah\\\\Semes...\', 27)\n#1 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\app\\Mail\\JobAppliedMail.php(27): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined prope...\', \'D:\\\\Kuliah\\\\Semes...\', 27)\n#2 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(1739): App\\Mail\\JobAppliedMail->envelope()\n#3 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(1695): Illuminate\\Mail\\Mailable->ensureEnvelopeIsHydrated()\n#4 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(201): Illuminate\\Mail\\Mailable->prepareMailableForDelivery()\n#5 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#6 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#7 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(353): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#8 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(300): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\JobAppliedMail))\n#9 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(123): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\JobAppliedMail))\n#10 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\app\\Jobs\\SendApplicationMailJob.php(34): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\JobAppliedMail))\n#11 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendApplicationMailJob->handle()\n#12 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(836): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#17 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendApplicationMailJob))\n#18 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendApplicationMailJob))\n#19 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendApplicationMailJob), false)\n#21 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendApplicationMailJob))\n#22 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendApplicationMailJob))\n#23 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendApplicationMailJob))\n#25 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(451): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(401): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(187): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#31 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#34 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#35 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(836): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#36 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#37 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\symfony\\console\\Application.php(1073): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#45 {main}', '2025-11-19 00:02:35'),
(2, '8078ef50-6c8b-4a0d-ab68-9f4af349921e', 'database', 'default', '{\"uuid\":\"8078ef50-6c8b-4a0d-ab68-9f4af349921e\",\"displayName\":\"App\\\\Jobs\\\\SendApplicationMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendApplicationMailJob\",\"command\":\"O:31:\\\"App\\\\Jobs\\\\SendApplicationMailJob\\\":2:{s:3:\\\"job\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:21:\\\"App\\\\Models\\\\JobVacancy\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"createdAt\":1763536041,\"delay\":null}', 'ErrorException: Undefined property: Illuminate\\Queue\\Jobs\\DatabaseJob::$title in D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\app\\Mail\\JobAppliedMail.php:27\nStack trace:\n#0 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(258): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined prope...\', \'D:\\\\Kuliah\\\\Semes...\', 27)\n#1 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\app\\Mail\\JobAppliedMail.php(27): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined prope...\', \'D:\\\\Kuliah\\\\Semes...\', 27)\n#2 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(1739): App\\Mail\\JobAppliedMail->envelope()\n#3 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(1695): Illuminate\\Mail\\Mailable->ensureEnvelopeIsHydrated()\n#4 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(201): Illuminate\\Mail\\Mailable->prepareMailableForDelivery()\n#5 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#6 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#7 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(353): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#8 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(300): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\JobAppliedMail))\n#9 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(123): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\JobAppliedMail))\n#10 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\app\\Jobs\\SendApplicationMailJob.php(34): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\JobAppliedMail))\n#11 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendApplicationMailJob->handle()\n#12 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(836): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#17 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendApplicationMailJob))\n#18 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendApplicationMailJob))\n#19 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendApplicationMailJob), false)\n#21 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendApplicationMailJob))\n#22 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendApplicationMailJob))\n#23 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendApplicationMailJob))\n#25 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(451): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(401): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(187): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#31 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#34 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#35 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(836): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#36 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#37 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\symfony\\console\\Application.php(1073): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\Kuliah\\Semester 3\\PPW2\\Project 2\\autherBreeze\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#45 {main}', '2025-11-19 00:07:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_vacancies`
--

CREATE TABLE `job_vacancies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `job_type` enum('Full-time','Part-time') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `job_vacancies`
--

INSERT INTO `job_vacancies` (`id`, `title`, `description`, `location`, `company`, `logo`, `salary`, `job_type`, `created_at`, `updated_at`) VALUES
(2, 'PPP', 'Dibutuhkan ahli it', 'Jakarta', 'PT internusa bangsa', NULL, 8000000, 'Full-time', '2025-11-18 03:58:41', '2025-11-18 03:58:41'),
(3, 'Fulltime Data Analist', 'Dibutuhkan data analis untuk menganalisis data tambang batu bara', 'Kalimantan', 'PT barito pasisik', 'logos/fC89Wa42t0fCob3KiKVz38enUmltFmgxeT65RHst.jpg', 10000000, 'Full-time', '2025-11-18 03:58:41', '2025-11-18 04:04:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_29_054024_add_role_to_users_table', 1),
(5, '2025_11_05_055458_create_job_vacancies_table', 1),
(6, '2025_11_05_063404_add_job_type_to_job_vacancies', 1),
(7, '2025_11_12_060859_create_applications_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6KQG3ChjCt3GBoN3XjwXyK5FgIELmGTRLEzvJtYK', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTTVVblpDY1NMMmkwQ2RLUlBzSGp3WllFaFFFUHNJY09pMGpDM1VUWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9qb2JzIjtzOjU6InJvdXRlIjtzOjEwOiJqb2JzLmluZGV4Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', 1763536135),
('L9mdKyWqAtx2QT3jkExezYPeWlpd2fbOylnYXLxw', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieGp4MDhMbklQRjlIYUVBV2ZpYzJLQW84OFpQbm5oZGM1cmxaSHdsTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHBsaWNhdGlvbnMvZXhwb3J0P2pvYj0zIjtzOjU6InJvdXRlIjtzOjE5OiJhcHBsaWNhdGlvbnMuZXhwb3J0Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1763466273);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Test User', 'test@example.com', '2025-11-17 22:25:17', '$2y$12$xlOp1GIF71J7eKAki4Q4FOYwYMAMlgjs0t.Azh3lSchSo3UVwuzBK', 'C7Wmf7V9uI', '2025-11-17 22:25:18', '2025-11-17 22:25:18', 'user'),
(2, 'Admin', 'fauzantrisuladana@gmail.com', NULL, '$2y$12$j36OIfFryABEOS./Q8BfQenAdputt4KuWhzlXiqi.8RC2jBfQz8Qm', NULL, '2025-11-17 22:27:24', '2025-11-18 23:18:47', 'admin'),
(3, 'Job Seeker', 'fauzantrisuladana4@gmail.com', NULL, '$2y$12$uoXamuZWAgGVg3gRaR23fe7NMdkfNxXg1Gz7rm/082zjHVu0AYahu', NULL, '2025-11-17 22:28:14', '2025-11-18 23:29:14', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applications_user_id_foreign` (`user_id`),
  ADD KEY `applications_job_id_foreign` (`job_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `job_vacancies`
--
ALTER TABLE `job_vacancies`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `job_vacancies`
--
ALTER TABLE `job_vacancies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_vacancies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
