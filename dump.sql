/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: Acctivities
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Acctivities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `Acctivities_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE
  SET
  NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: Activities
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: Applicants
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Applicants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNumber` int DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `passportNo` int DEFAULT NULL,
  `fileUpload` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 72 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ApplicationDetails
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ApplicationDetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `applicationLevel` varchar(255) DEFAULT NULL,
  `interestedProgramme` varchar(255) DEFAULT NULL,
  `schoolName` varchar(255) DEFAULT NULL,
  `qualificationType` varchar(255) DEFAULT NULL,
  `selectUniversity` varchar(255) DEFAULT NULL,
  `completionLetter` varchar(255) DEFAULT NULL,
  `programmeLevel` varchar(255) DEFAULT NULL,
  `healthForm` varchar(255) DEFAULT NULL,
  `paymentReceipt` varchar(255) DEFAULT NULL,
  `researchProposal` varchar(255) DEFAULT NULL,
  `refreeForm` varchar(255) DEFAULT NULL,
  `medium` varchar(255) DEFAULT NULL,
  `scholorshipForm` varchar(255) DEFAULT NULL,
  `otherDocuments` varchar(255) DEFAULT NULL,
  `attestationLetter` varchar(255) DEFAULT NULL,
  `releaseLetter` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ApplicantId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ApplicationDetails_ApplicantId_foreign_idx` (`ApplicantId`),
  CONSTRAINT `ApplicationDetails_ApplicantId_foreign_idx` FOREIGN KEY (`ApplicantId`) REFERENCES `Applicants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 62 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: Campuses
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Campuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isMain` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UniversityId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UniversityId` (`UniversityId`),
  CONSTRAINT `Campuses_ibfk_1` FOREIGN KEY (`UniversityId`) REFERENCES `Universities` (`id`) ON DELETE
  SET
  NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 40 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: Leads
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Leads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `passportNo` int DEFAULT NULL,
  `leadGroup` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phoneNo` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `refferalName` varchar(255) DEFAULT NULL,
  `refferalEmail` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 26 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: ProgrameDetails
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ProgrameDetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `schoolName` varchar(255) DEFAULT NULL,
  `qualificationType` varchar(255) DEFAULT NULL,
  `selectUniversity` varchar(255) DEFAULT NULL,
  `interestedProgramme` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cert` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `leadId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProgrameDetails_leadId_foreign_idx` (`leadId`),
  CONSTRAINT `ProgrameDetails_leadId_foreign_idx` FOREIGN KEY (`leadId`) REFERENCES `Leads` (`id`) ON DELETE
  SET
  NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 24 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: Programmes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Programmes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `selectUniversity` varchar(255) DEFAULT NULL,
  `programmeLevel` varchar(255) DEFAULT NULL,
  `programmeIntake` varchar(255) DEFAULT NULL,
  `programmeDuration` varchar(255) DEFAULT NULL,
  `programmeCategory` varchar(255) DEFAULT NULL,
  `tutionFee` int DEFAULT NULL,
  `otherFee` int DEFAULT NULL,
  `engRequirement` varchar(255) DEFAULT NULL,
  `entryRequirement` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: SequelizeMeta
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: Universities
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Universities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `type` int DEFAULT NULL,
  `counserllerName` int DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `visaAppFee` int DEFAULT NULL,
  `addmissionFee` int DEFAULT NULL,
  `qetcFee` int DEFAULT NULL,
  `commisionDuration` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 112 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: Users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: Acctivities
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: Activities
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: Applicants
# ------------------------------------------------------------

INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675115780710.png',
    7878,
    'fileupload',
    '2023-01-30 21:56:20',
    '2023-01-30 21:56:20'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675115879960.png',
    7878,
    'ok',
    '2023-01-30 21:58:00',
    '2023-01-30 21:58:00'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675134053167.png',
    7878,
    'ok',
    '2023-01-31 03:00:53',
    '2023-01-31 03:00:53'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675134054310.png',
    7878,
    'ok',
    '2023-01-31 03:00:54',
    '2023-01-31 03:00:54'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675134055165.png',
    7878,
    'ok',
    '2023-01-31 03:00:55',
    '2023-01-31 03:00:55'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675134056310.png',
    7878,
    'ok',
    '2023-01-31 03:00:56',
    '2023-01-31 03:00:56'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675134056977.png',
    7878,
    'ok',
    '2023-01-31 03:00:56',
    '2023-01-31 03:00:56'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675134057831.png',
    7878,
    'ok',
    '2023-01-31 03:00:57',
    '2023-01-31 03:00:57'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675134058704.png',
    7878,
    'ok',
    '2023-01-31 03:00:58',
    '2023-01-31 03:00:58'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675134059640.png',
    7878,
    'ok',
    '2023-01-31 03:00:59',
    '2023-01-31 03:00:59'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675134060494.png',
    7878,
    'ok',
    '2023-01-31 03:01:00',
    '2023-01-31 03:01:00'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    12,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675134061377.png',
    7878,
    'ok',
    '2023-01-31 03:01:01',
    '2023-01-31 03:01:01'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    13,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675134302042.png',
    7878,
    'ok',
    '2023-01-31 03:05:02',
    '2023-01-31 03:05:02'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    14,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675177862430.png',
    7878,
    'ok',
    '2023-01-31 15:11:02',
    '2023-01-31 15:11:02'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    15,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675180308599.png',
    7878,
    'ok',
    '2023-01-31 15:51:48',
    '2023-01-31 15:51:48'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    16,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    NULL,
    7878,
    NULL,
    '2023-01-31 17:44:53',
    '2023-01-31 17:44:53'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    17,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    NULL,
    7878,
    NULL,
    '2023-01-31 17:58:26',
    '2023-01-31 17:58:26'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    18,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675188887442.png',
    7878,
    '1675188887470.png',
    '2023-01-31 18:14:47',
    '2023-01-31 18:14:47'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    19,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675188927464.png',
    7878,
    '1675188927470.png',
    '2023-01-31 18:15:27',
    '2023-01-31 18:15:27'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    20,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675191486449.png',
    7878,
    '1675191486461.png',
    '2023-01-31 18:58:06',
    '2023-01-31 18:58:06'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    21,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675200757620.png',
    7878,
    '1675200757907.png',
    '2023-01-31 21:32:38',
    '2023-01-31 21:32:38'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    22,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675200793730.png',
    7878,
    '1675200793739.png',
    '2023-01-31 21:33:13',
    '2023-01-31 21:33:13'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    23,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675200902506.png',
    7878,
    '1675200902516.png',
    '2023-01-31 21:35:02',
    '2023-01-31 21:35:02'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    24,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675201227813.png',
    7878,
    '1675201227838.png',
    '2023-01-31 21:40:27',
    '2023-01-31 21:40:27'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    25,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675201269122.png',
    7878,
    '1675201269154.png',
    '2023-01-31 21:41:09',
    '2023-01-31 21:41:09'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    26,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675201300756.png',
    7878,
    '1675201300775.png',
    '2023-01-31 21:41:40',
    '2023-01-31 21:41:40'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    27,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675201337535.png',
    7878,
    '1675201337548.png',
    '2023-01-31 21:42:17',
    '2023-01-31 21:42:17'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    28,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675201558652.png',
    7878,
    '1675201558805.png',
    '2023-01-31 21:45:58',
    '2023-01-31 21:45:58'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    29,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675201613148.png',
    7878,
    '1675201613152.png',
    '2023-01-31 21:46:53',
    '2023-01-31 21:46:53'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    30,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675201798952.png',
    7878,
    '1675201798985.png',
    '2023-01-31 21:49:59',
    '2023-01-31 21:49:59'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    31,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675201938207.png',
    7878,
    '1675201938219.png',
    '2023-01-31 21:52:18',
    '2023-01-31 21:52:18'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    32,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202040237.png',
    7878,
    '1675202040454.png',
    '2023-01-31 21:54:00',
    '2023-01-31 21:54:00'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    33,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202053753.png',
    7878,
    '1675202053762.png',
    '2023-01-31 21:54:13',
    '2023-01-31 21:54:13'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    34,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202311301.png',
    7878,
    '1675202311318.png',
    '2023-01-31 21:58:31',
    '2023-01-31 21:58:31'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    35,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202361846.png',
    7878,
    '1675202361870.png',
    '2023-01-31 21:59:21',
    '2023-01-31 21:59:21'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    36,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202400792.png',
    7878,
    '1675202400802.png',
    '2023-01-31 22:00:00',
    '2023-01-31 22:00:00'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    37,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202447152.png',
    7878,
    '1675202447161.png',
    '2023-01-31 22:00:47',
    '2023-01-31 22:00:47'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    38,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202467392.png',
    7878,
    '1675202467411.png',
    '2023-01-31 22:01:07',
    '2023-01-31 22:01:07'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    39,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202482338.png',
    7878,
    '1675202482347.png',
    '2023-01-31 22:01:22',
    '2023-01-31 22:01:22'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    40,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202493369.png',
    7878,
    '1675202493378.png',
    '2023-01-31 22:01:33',
    '2023-01-31 22:01:33'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    41,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202503040.png',
    7878,
    '1675202503044.png',
    '2023-01-31 22:01:43',
    '2023-01-31 22:01:43'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    42,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202573945.png',
    7878,
    '1675202573958.png',
    '2023-01-31 22:02:54',
    '2023-01-31 22:02:54'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    43,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202588179.png',
    7878,
    '1675202588190.png',
    '2023-01-31 22:03:08',
    '2023-01-31 22:03:08'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    44,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202597891.png',
    7878,
    '1675202597906.png',
    '2023-01-31 22:03:17',
    '2023-01-31 22:03:17'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    45,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202653157.png',
    7878,
    '1675202653172.png',
    '2023-01-31 22:04:13',
    '2023-01-31 22:04:13'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    46,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202727045.png',
    7878,
    '1675202727054.png',
    '2023-01-31 22:05:27',
    '2023-01-31 22:05:27'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    47,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202807548.png',
    7878,
    '1675202807558.png',
    '2023-01-31 22:06:47',
    '2023-01-31 22:06:47'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    48,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202829583.png',
    7878,
    '1675202829611.png',
    '2023-01-31 22:07:09',
    '2023-01-31 22:07:09'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    49,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202853722.png',
    7878,
    '1675202853782.png',
    '2023-01-31 22:07:33',
    '2023-01-31 22:07:33'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    50,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675202937673.png',
    7878,
    '1675202937762.png',
    '2023-01-31 22:08:57',
    '2023-01-31 22:08:57'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    51,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675203154380.png',
    7878,
    '1675203154412.png',
    '2023-01-31 22:12:34',
    '2023-01-31 22:12:34'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    52,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675203209839.png',
    7878,
    '1675203209855.png',
    '2023-01-31 22:13:29',
    '2023-01-31 22:13:29'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    53,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675203314148.png',
    7878,
    '1675203314165.png',
    '2023-01-31 22:15:14',
    '2023-01-31 22:15:14'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    54,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675203360941.png',
    7878,
    '1675203360954.png',
    '2023-01-31 22:16:00',
    '2023-01-31 22:16:00'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    55,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675203448138.png',
    7878,
    '1675203448150.png',
    '2023-01-31 22:17:28',
    '2023-01-31 22:17:28'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    56,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675203620159.png',
    7878,
    '1675203620169.png',
    '2023-01-31 22:20:20',
    '2023-01-31 22:20:20'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    57,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675204026790.png',
    7878,
    '1675204026836.png',
    '2023-01-31 22:27:06',
    '2023-01-31 22:27:06'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    58,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675204249189.png',
    7878,
    '1675204249203.png',
    '2023-01-31 22:30:49',
    '2023-01-31 22:30:49'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    59,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675204261976.png',
    7878,
    '1675204261983.png',
    '2023-01-31 22:31:02',
    '2023-01-31 22:31:02'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    60,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675204266946.png',
    7878,
    '1675204266978.png',
    '2023-01-31 22:31:07',
    '2023-01-31 22:31:07'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    61,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675204420481.png',
    7878,
    '1675204420496.png',
    '2023-01-31 22:33:40',
    '2023-01-31 22:33:40'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    62,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675205422653.png',
    7878,
    '1675205422672.png',
    '2023-01-31 22:50:22',
    '2023-01-31 22:50:22'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    63,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675205919800.png',
    7878,
    '1675205919815.png',
    '2023-01-31 22:58:39',
    '2023-01-31 22:58:39'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    64,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675205979957.png',
    7878,
    '1675205979987.png',
    '2023-01-31 22:59:40',
    '2023-01-31 22:59:40'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    65,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675391229593.png',
    7878,
    '1675391229676.png',
    '2023-02-03 02:27:09',
    '2023-02-03 02:27:09'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    66,
    'Ahmad',
    'ahamd@gmail.com',
    1223345,
    'lahore',
    'gujranwala',
    'pakistan',
    '1675395947974.png',
    11222,
    '1675395947995.png',
    '2023-02-03 03:45:48',
    '2023-02-03 03:45:48'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    67,
    'Ahmad1',
    'ahamd@gmail.com',
    1223345,
    'lahore',
    'gujranwala',
    'pakistan',
    '1675395981063.png',
    11222,
    '1675395981068.png',
    '2023-02-03 03:46:21',
    '2023-02-03 03:46:21'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    68,
    'numan',
    'numan@gmail.com',
    3,
    'lahore',
    'gujranwala',
    'india',
    '1675396148468.png',
    7878,
    '1675396148474.png',
    '2023-02-03 03:49:08',
    '2023-02-03 03:49:08'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    69,
    'BILAL',
    'bilal@gmail.com',
    12345,
    '2344',
    '123456',
    'pakistan',
    '1675446559543.png',
    1133,
    '1675446559560.png',
    '2023-02-03 17:49:19',
    '2023-02-03 17:49:19'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    70,
    'BILAL',
    'bilal@gmail.com',
    12345,
    '2344',
    '123456',
    'pakistan',
    '1675446608612.png',
    1133,
    '1675446608629.png',
    '2023-02-03 17:50:08',
    '2023-02-03 17:50:08'
  );
INSERT INTO
  `Applicants` (
    `id`,
    `fullName`,
    `email`,
    `phoneNumber`,
    `address1`,
    `address2`,
    `country`,
    `image`,
    `passportNo`,
    `fileUpload`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    71,
    'hhhh',
    'awais1@gmail.com',
    23453,
    'Lahore',
    '123456',
    'india',
    '1675464744555.png',
    12345,
    '1675464744564.png',
    '2023-02-03 22:52:24',
    '2023-02-03 22:52:24'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ApplicationDetails
# ------------------------------------------------------------

INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    1,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-30 21:56:20',
    '2023-01-30 21:56:20',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    2,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-30 21:58:00',
    '2023-01-30 21:58:00',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    3,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 03:00:53',
    '2023-01-31 03:00:53',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    4,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 03:00:54',
    '2023-01-31 03:00:54',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    5,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 03:00:55',
    '2023-01-31 03:00:55',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    6,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 03:00:56',
    '2023-01-31 03:00:56',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    7,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 03:00:57',
    '2023-01-31 03:00:57',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    8,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 03:00:57',
    '2023-01-31 03:00:57',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    9,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 03:00:58',
    '2023-01-31 03:00:58',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    10,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 03:00:59',
    '2023-01-31 03:00:59',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    11,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 03:01:00',
    '2023-01-31 03:01:00',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    12,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 03:01:01',
    '2023-01-31 03:01:01',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    13,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 03:05:02',
    '2023-01-31 03:05:02',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    14,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 15:11:04',
    '2023-01-31 15:11:04',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    15,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 15:51:52',
    '2023-01-31 15:51:52',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    16,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 17:44:54',
    '2023-01-31 17:44:54',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    17,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 17:58:26',
    '2023-01-31 17:58:26',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    18,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 18:14:47',
    '2023-01-31 18:14:47',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    19,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 18:15:27',
    '2023-01-31 18:15:27',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    20,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 18:58:06',
    '2023-01-31 18:58:06',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    21,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 21:32:40',
    '2023-01-31 21:32:40',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    22,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 21:33:13',
    '2023-01-31 21:33:13',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    23,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 21:35:05',
    '2023-01-31 21:35:05',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    24,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 21:40:27',
    '2023-01-31 21:40:27',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    25,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 21:42:18',
    '2023-01-31 21:42:18',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    26,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 21:46:00',
    '2023-01-31 21:46:00',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    27,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 21:46:54',
    '2023-01-31 21:46:54',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    28,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 21:50:00',
    '2023-01-31 21:50:00',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    29,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 21:52:18',
    '2023-01-31 21:52:18',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    30,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 21:58:31',
    '2023-01-31 21:58:31',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    31,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 21:59:23',
    '2023-01-31 21:59:23',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    32,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:00:01',
    '2023-01-31 22:00:01',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    33,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:00:48',
    '2023-01-31 22:00:48',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    34,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:01:07',
    '2023-01-31 22:01:07',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    35,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:01:22',
    '2023-01-31 22:01:22',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    36,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:01:33',
    '2023-01-31 22:01:33',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    37,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:01:44',
    '2023-01-31 22:01:44',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    38,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:04:13',
    '2023-01-31 22:04:13',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    39,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:05:29',
    '2023-01-31 22:05:29',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    40,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:06:49',
    '2023-01-31 22:06:49',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    41,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:07:09',
    '2023-01-31 22:07:09',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    42,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:07:35',
    '2023-01-31 22:07:35',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    43,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:08:59',
    '2023-01-31 22:08:59',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    44,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:12:34',
    '2023-01-31 22:12:34',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    45,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:13:29',
    '2023-01-31 22:13:29',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    46,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:15:14',
    '2023-01-31 22:15:14',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    47,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:16:01',
    '2023-01-31 22:16:01',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    48,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:17:28',
    '2023-01-31 22:17:28',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    49,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:20:20',
    '2023-01-31 22:20:20',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    50,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:27:06',
    '2023-01-31 22:27:06',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    51,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:33:40',
    '2023-01-31 22:33:40',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    52,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:50:22',
    '2023-01-31 22:50:22',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    53,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:58:39',
    '2023-01-31 22:58:39',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    54,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-01-31 22:59:40',
    '2023-01-31 22:59:40',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    55,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-02-03 02:27:11',
    '2023-02-03 02:27:11',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    56,
    'becholar',
    'master,becholars',
    'punjab school',
    'second Type',
    'punjab University',
    'completion letter',
    'programme ok',
    'health ok',
    'payment ok',
    'proposal ok',
    'refree ok',
    'medium ok',
    'scholorship ok',
    'other documents ok',
    'attestation oka',
    'realease ok',
    'status ok',
    '2023-02-03 03:45:48',
    '2023-02-03 03:45:48',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    57,
    'becholar',
    'master,becholars',
    'punjab school',
    'second Type',
    'punjab University',
    'completion letter',
    'programme ok',
    'health ok',
    'payment ok',
    'proposal ok',
    'refree ok',
    'medium ok',
    'scholorship ok',
    'other documents ok',
    'attestation oka',
    'realease ok',
    'status ok',
    '2023-02-03 03:46:21',
    '2023-02-03 03:46:21',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    58,
    'applicationLevel',
    'interestedProgramme',
    'schoolName',
    'qualificationType',
    'selectUniversity',
    'completionLetter',
    'programmeLevel',
    'healthForm',
    'paymentReceipt',
    'researchProposal',
    'refreeForm',
    'medium',
    'scholorshipForm',
    'otherDocuments',
    'attestationLetter',
    'releaseLetter',
    'done',
    '2023-02-03 03:49:08',
    '2023-02-03 03:49:08',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    59,
    'becholar',
    'master,becholars',
    'punjab school',
    'first type',
    'punjab University',
    'completion letter',
    'programme level',
    'HEALTH FORM',
    'PAYMENT FIELD',
    'PROPOSAL FIELD',
    'REFREE OKAY',
    'MEDIUM OKAY',
    'SCHOLORSHIP OKAY',
    'OTHER D OKAY',
    'ATTESTATION OKAY',
    'RELEASESE OKAY',
    'status ok',
    '2023-02-03 17:49:19',
    '2023-02-03 17:49:19',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    60,
    'becholar',
    'master,becholars',
    'punjab school',
    'first type',
    'punjab University',
    'completion letter',
    'programme level',
    'HEALTH FORM',
    'PAYMENT FIELD',
    'PROPOSAL FIELD',
    'REFREE OKAY',
    'MEDIUM OKAY',
    'SCHOLORSHIP OKAY',
    'OTHER D OKAY',
    'ATTESTATION OKAY',
    'RELEASESE OKAY',
    'status ok',
    '2023-02-03 17:50:08',
    '2023-02-03 17:50:08',
    NULL
  );
INSERT INTO
  `ApplicationDetails` (
    `id`,
    `applicationLevel`,
    `interestedProgramme`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `completionLetter`,
    `programmeLevel`,
    `healthForm`,
    `paymentReceipt`,
    `researchProposal`,
    `refreeForm`,
    `medium`,
    `scholorshipForm`,
    `otherDocuments`,
    `attestationLetter`,
    `releaseLetter`,
    `status`,
    `createdAt`,
    `updatedAt`,
    `ApplicantId`
  )
VALUES
  (
    61,
    'becholar',
    'master,becholars',
    'punjab school',
    'second Type',
    'punjab University',
    'completion letter',
    'programme level',
    'HEALTH FORM',
    'payment ok',
    'proposal ok',
    'REFREE OKAY',
    'medium ok',
    'scholorship ok',
    'other documents ok',
    'ATTESTATION OKAY',
    'RELEASESE OKAY',
    'status ok',
    '2023-02-03 22:52:24',
    '2023-02-03 22:52:24',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: Campuses
# ------------------------------------------------------------

INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    1,
    'ali',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-01-31 22:49:33',
    '2023-01-31 22:49:33',
    44
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    2,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-01-31 22:49:33',
    '2023-01-31 22:49:33',
    44
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    3,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-01-31 22:49:33',
    '2023-01-31 22:49:33',
    44
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    4,
    'ali',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-01-31 22:49:36',
    '2023-01-31 22:49:36',
    45
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    5,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-01-31 22:49:36',
    '2023-01-31 22:49:36',
    45
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    6,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-01-31 22:49:36',
    '2023-01-31 22:49:36',
    45
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    7,
    'ali',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-01 22:04:38',
    '2023-02-01 22:04:38',
    46
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    8,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-01 22:04:38',
    '2023-02-01 22:04:38',
    46
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    9,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-01 22:04:38',
    '2023-02-01 22:04:38',
    46
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    10,
    'ali',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-02 18:28:38',
    '2023-02-02 18:28:38',
    53
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    11,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-02 18:28:38',
    '2023-02-02 18:28:38',
    53
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    12,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-02 18:28:38',
    '2023-02-02 18:28:38',
    53
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    13,
    'ali',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-02 18:28:48',
    '2023-02-02 18:28:48',
    54
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    14,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-02 18:28:48',
    '2023-02-02 18:28:48',
    54
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    15,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-02 18:28:48',
    '2023-02-02 18:28:48',
    54
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    16,
    'ali',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-02 19:08:01',
    '2023-02-02 19:08:01',
    60
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    17,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-02 19:08:01',
    '2023-02-02 19:08:01',
    60
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    18,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-02 19:08:01',
    '2023-02-02 19:08:01',
    60
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    19,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-03 00:15:05',
    '2023-02-03 00:15:05',
    91
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    20,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-03 00:15:05',
    '2023-02-03 00:15:05',
    91
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    21,
    'ali',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-03 00:15:05',
    '2023-02-03 00:15:05',
    91
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    22,
    'ali',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-03 03:48:39',
    '2023-02-03 03:48:39',
    93
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    23,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-03 03:48:39',
    '2023-02-03 03:48:39',
    93
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    24,
    'zaman',
    'as',
    'ss',
    222,
    'email@gmail.com',
    1,
    '2023-02-03 03:48:39',
    '2023-02-03 03:48:39',
    93
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    25,
    'lahore johar town',
    '123453',
    '123456',
    0,
    'admin@gmail.com',
    1,
    '2023-02-03 04:31:21',
    '2023-02-03 04:31:21',
    95
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    26,
    'micro inn technology',
    '2345',
    '4321',
    91,
    'dummy@gmail.com',
    0,
    '2023-02-03 04:31:21',
    '2023-02-03 04:31:21',
    95
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    27,
    'lahore johar town',
    '123453',
    '123456',
    0,
    'admin@gmail.com',
    1,
    '2023-02-03 04:32:12',
    '2023-02-03 04:32:12',
    96
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    28,
    'micro inn technology',
    '2345',
    '4321',
    91,
    'dummy@gmail.com',
    0,
    '2023-02-03 04:32:12',
    '2023-02-03 04:32:12',
    96
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    29,
    'micro inn technologyw',
    '2345',
    '23',
    23,
    'example@gmail.com',
    0,
    '2023-02-03 16:05:00',
    '2023-02-03 16:05:00',
    99
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    30,
    'shine campus',
    'Lahore',
    'gujranwala',
    123455,
    'admin@gmail.com',
    1,
    '2023-02-03 16:32:29',
    '2023-02-03 16:32:29',
    103
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    31,
    'Shine Campus',
    'lahore',
    'gujranwala',
    23,
    'admin@gmail.com',
    1,
    '2023-02-03 17:16:49',
    '2023-02-03 17:16:49',
    104
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    32,
    'shine campus',
    'Lahore',
    'Gujranwala',
    123456,
    'testing@gmail.com',
    1,
    '2023-02-03 17:35:50',
    '2023-02-03 17:35:50',
    106
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    33,
    'Shine campus',
    '1234',
    '2234',
    134567,
    'admin@gmail.com',
    0,
    '2023-02-03 17:35:50',
    '2023-02-03 17:35:50',
    106
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    34,
    'Shine Campus',
    'Lahore',
    'gujranwala',
    123456,
    '23@gmail.com',
    1,
    '2023-02-03 20:42:50',
    '2023-02-03 20:42:50',
    107
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    35,
    'micro inn technologyw',
    '23',
    '4321',
    134567,
    'example2@gmail.com',
    0,
    '2023-02-03 20:42:50',
    '2023-02-03 20:42:50',
    107
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    36,
    'Shine Campus',
    'Gajumata',
    'Lahore Jannah',
    23456,
    'example1@gmail.com',
    1,
    '2023-02-03 22:22:10',
    '2023-02-03 22:22:10',
    108
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    37,
    'Shine Campus',
    'Gajumata',
    'Lahore Jannah',
    23456,
    'example1@gmail.com',
    1,
    '2023-02-03 22:23:29',
    '2023-02-03 22:23:29',
    109
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    38,
    'micro inn technologyw',
    '23',
    '2234',
    23,
    'example2@gmail.com',
    0,
    '2023-02-03 22:56:52',
    '2023-02-03 22:56:52',
    110
  );
INSERT INTO
  `Campuses` (
    `id`,
    `name`,
    `address1`,
    `address2`,
    `phone`,
    `email`,
    `isMain`,
    `createdAt`,
    `updatedAt`,
    `UniversityId`
  )
VALUES
  (
    39,
    'shine campus',
    'lahore',
    'gujranwala',
    23,
    'admin@gmail.com',
    1,
    '2023-02-03 22:59:27',
    '2023-02-03 22:59:27',
    111
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: Leads
# ------------------------------------------------------------

INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    '1675027926329.png',
    'first lead',
    1122,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-01-29 21:32:06',
    '2023-01-29 21:32:06'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    '1675027973094.png',
    'first lead',
    2121,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-01-29 21:32:53',
    '2023-01-29 21:32:53'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    '1675029270740.png',
    'first lead',
    2121,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-01-29 21:54:30',
    '2023-01-29 21:54:30'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    '1675029339328.png',
    'second lead',
    2121,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-01-29 21:55:39',
    '2023-01-29 21:55:39'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    '1675029385250.png',
    'second lead',
    2121,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-01-29 21:56:25',
    '2023-01-29 21:56:25'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    '1675029437078.png',
    'second lead',
    2121,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-01-29 21:57:17',
    '2023-01-29 21:57:17'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    '1675115237813.png',
    'second lead',
    2121,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-01-30 21:47:17',
    '2023-01-30 21:47:17'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    '1675115912426.png',
    'second lead',
    2121,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-01-30 21:58:32',
    '2023-01-30 21:58:32'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    '1675134289100.png',
    'second lead',
    2121,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-01-31 03:04:49',
    '2023-01-31 03:04:49'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    '1675134366406.png',
    'second lead',
    2121,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-01-31 03:06:06',
    '2023-01-31 03:06:06'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    '1675370932878.png',
    'second lead',
    2121,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-02-02 20:48:52',
    '2023-02-02 20:48:52'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    12,
    '1675384900141.png',
    'second lead',
    2121,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-02-03 00:41:40',
    '2023-02-03 00:41:40'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    13,
    '1675390294439.png',
    'test lead',
    1122,
    'Select Group 1',
    'pakistan',
    234567,
    'admin1@gmail.com',
    'refferal namedS',
    'refferalemail@gmail.com',
    '2023-02-03 02:11:34',
    '2023-02-03 02:11:34'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    14,
    '1675391123780.png',
    'testing lead',
    11222,
    'Select Group 2',
    'India',
    2345673,
    'admin3@gmail.com',
    'refferal name',
    'refferal@gmail.com',
    '2023-02-03 02:25:23',
    '2023-02-03 02:25:23'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    15,
    '1675396141406.png',
    'second lead',
    2121,
    'lead group',
    'pakistan',
    7878,
    'user@gmail.com',
    'my refferal name',
    'my refferal email',
    '2023-02-03 03:49:01',
    '2023-02-03 03:49:01'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    16,
    '1675396763057.png',
    'Zaman Mehmood',
    2233,
    'Select Group 2',
    'pakistan',
    234567,
    'saqib@gmail.com',
    'refferal name',
    'refl@gmail.com',
    '2023-02-03 03:59:23',
    '2023-02-03 03:59:23'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    17,
    '1675443662947.png',
    'Zaman Mehmood',
    1122,
    'Select Group 2',
    'pakistan',
    234567,
    'asd@gmail.com',
    'refferal name',
    'testing@gmail.com',
    '2023-02-03 17:01:02',
    '2023-02-03 17:01:02'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    18,
    '1675446067375.png',
    'TEST LEAD',
    12345,
    'Select Group 1',
    'pakistan',
    132356,
    'testing@gmail.com',
    'REFFERAL NAME',
    'refferalemail@gmail.com',
    '2023-02-03 17:41:07',
    '2023-02-03 17:41:07'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    19,
    '1675446138740.png',
    'TEST LEAD',
    12345,
    'Select Group 1',
    'pakistan',
    132356,
    'testing@gmail.com',
    'REFFERAL NAME',
    'refferalemail@gmail.com',
    '2023-02-03 17:42:18',
    '2023-02-03 17:42:18'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    20,
    '1675446271869.png',
    'TEST LEAD',
    12345,
    'Select Group 1',
    'pakistan',
    132356,
    'testing@gmail.com',
    'REFFERAL NAME',
    'refferalemail@gmail.com',
    '2023-02-03 17:44:31',
    '2023-02-03 17:44:31'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    21,
    '1675446284323.png',
    'TEST LEAD',
    12345,
    'Select Group 1',
    'pakistan',
    132356,
    'testing@gmail.com',
    'REFFERAL NAME',
    'refferalemail@gmail.com',
    '2023-02-03 17:44:44',
    '2023-02-03 17:44:44'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    22,
    '1675456577425.png',
    'Zaman Mehmood',
    2233,
    'Select Group 1',
    'pakistan',
    234567,
    'zaman1@gmail.com',
    'REFFERAL NAME',
    'refferalemail@gmail.com',
    '2023-02-03 20:36:17',
    '2023-02-03 20:36:17'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    23,
    '1675462249125.png',
    'NEWLEAD',
    1122,
    'Select Group 1',
    'pakistan',
    234567,
    'example@gmail.com',
    'refferalhammad',
    'refferalhammad@gmail.com',
    '2023-02-03 22:10:49',
    '2023-02-03 22:10:49'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    24,
    '1675462281593.png',
    'NEWLEAD',
    1122,
    'Select Group 1',
    'pakistan',
    234567,
    'example@gmail.com',
    'refferalhammad',
    'refferalhammad@gmail.com',
    '2023-02-03 22:11:21',
    '2023-02-03 22:11:21'
  );
INSERT INTO
  `Leads` (
    `id`,
    `image`,
    `name`,
    `passportNo`,
    `leadGroup`,
    `country`,
    `phoneNo`,
    `email`,
    `refferalName`,
    `refferalEmail`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    25,
    '1675465390168.png',
    'Zaman Mehmood',
    1122,
    'Select Group 2',
    'pakistan',
    234567,
    'zaman1@gmail.com',
    'refferal name',
    'testing@gmail.com',
    '2023-02-03 23:03:10',
    '2023-02-03 23:03:10'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: ProgrameDetails
# ------------------------------------------------------------

INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    1,
    'school name',
    'Becholers',
    'virtual university',
    'computer science',
    'Good',
    'this is cert',
    'first comment',
    '2023-01-29 21:54:30',
    '2023-01-29 21:54:30',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    2,
    'school name',
    'Becholers',
    'virtual university',
    'computer science',
    'Good',
    'this is cert',
    'first comment',
    '2023-01-29 21:55:39',
    '2023-01-29 21:55:39',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    3,
    'school name',
    'Becholers',
    'virtual university',
    'computer science',
    'Good',
    'this is cert',
    'first comment',
    '2023-01-29 21:56:25',
    '2023-01-29 21:56:25',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    4,
    'school name',
    'Becholers',
    'virtual university',
    'computer science',
    'Good',
    'this is cert',
    'first comment',
    '2023-01-29 21:57:17',
    '2023-01-29 21:57:17',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    5,
    'school name',
    'Becholers',
    'virtual university',
    'computer science',
    'Good',
    'this is cert',
    'first comment',
    '2023-01-30 21:47:17',
    '2023-01-30 21:47:17',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    6,
    'school name',
    'Becholers',
    'virtual university',
    'computer science',
    'Good',
    'this is cert',
    'first comment',
    '2023-01-30 21:58:32',
    '2023-01-30 21:58:32',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    7,
    'school name',
    'Becholers',
    'virtual university',
    'computer science',
    'Good',
    'this is cert',
    'first comment',
    '2023-01-31 03:04:49',
    '2023-01-31 03:04:49',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    8,
    'school name',
    'Becholers',
    'virtual university',
    'computer science',
    'Good',
    'this is cert',
    'first comment',
    '2023-01-31 03:06:07',
    '2023-01-31 03:06:07',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    9,
    'school name',
    'Becholers',
    'virtual university',
    'computer science',
    'Good',
    'this is cert',
    'first comment',
    '2023-02-02 20:48:52',
    '2023-02-02 20:48:52',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    10,
    'school name',
    'Becholers',
    'virtual university',
    'computer science',
    'Good',
    'this is cert',
    'first comment',
    '2023-02-03 00:41:40',
    '2023-02-03 00:41:40',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    11,
    'school createds',
    'Masters',
    'virtual University',
    'becholars',
    'Status one',
    'cert ok',
    ' comments okay',
    '2023-02-03 02:11:39',
    '2023-02-03 02:11:39',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    12,
    'school created',
    'Becholars',
    'punjab University',
    'masters',
    'Status second',
    'cert done',
    ' comments okayy!!!',
    '2023-02-03 02:25:23',
    '2023-02-03 02:25:23',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    13,
    'school name',
    'Becholers',
    'virtual university',
    'computer science',
    'Good',
    'this is cert',
    'first comment',
    '2023-02-03 03:49:01',
    '2023-02-03 03:49:01',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    14,
    'punjab school',
    'Masters',
    'virtual University',
    'masters',
    'Status one',
    'cert ok',
    'ok',
    '2023-02-03 03:59:23',
    '2023-02-03 03:59:23',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    15,
    'punjab school',
    'Masters',
    'virtual University',
    'becholars',
    'Status one',
    'cert ok',
    'done',
    '2023-02-03 17:01:03',
    '2023-02-03 17:01:03',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    16,
    'punjab school',
    'Becholars',
    'punjab University',
    'masters',
    'Status one',
    'cert okay',
    'Comments field',
    '2023-02-03 17:41:07',
    '2023-02-03 17:41:07',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    17,
    'punjab school',
    'Becholars',
    'punjab University',
    'masters',
    'Status one',
    'cert okay',
    'Comments field',
    '2023-02-03 17:42:18',
    '2023-02-03 17:42:18',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    18,
    'punjab school',
    'Becholars',
    'punjab University',
    'masters',
    'Status one',
    'cert okay',
    'Comments field',
    '2023-02-03 17:44:31',
    '2023-02-03 17:44:31',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    19,
    'punjab school',
    'Becholars',
    'punjab University',
    'masters',
    'Status one',
    'cert okay',
    'Comments field',
    '2023-02-03 17:44:44',
    '2023-02-03 17:44:44',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    20,
    'school created',
    'Becholars',
    'punjab University',
    'masters',
    'Status one',
    'cert ok',
    'done',
    '2023-02-03 20:36:17',
    '2023-02-03 20:36:17',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    21,
    'punjab school',
    'Becholars',
    'virtual University',
    'masters',
    'Status second',
    'cert',
    'comments',
    '2023-02-03 22:10:55',
    '2023-02-03 22:10:55',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    22,
    'punjab school',
    'Becholars',
    'virtual University',
    'masters',
    'Status second',
    'cert',
    'comments',
    '2023-02-03 22:11:22',
    '2023-02-03 22:11:22',
    NULL
  );
INSERT INTO
  `ProgrameDetails` (
    `id`,
    `schoolName`,
    `qualificationType`,
    `selectUniversity`,
    `interestedProgramme`,
    `status`,
    `cert`,
    `comments`,
    `createdAt`,
    `updatedAt`,
    `leadId`
  )
VALUES
  (
    23,
    'punjab school',
    'Becholars',
    'punjab University',
    'becholars',
    'Status second',
    'cert okay',
    'ok',
    '2023-02-03 23:03:10',
    '2023-02-03 23:03:10',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: Programmes
# ------------------------------------------------------------

INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    1,
    'Becholers',
    'virtual university',
    'Bscs',
    'programe inttake',
    'programme duration',
    'programme category',
    400,
    500,
    'this is english requirement',
    'this is entry requirement',
    '2023-01-29 18:18:14',
    '2023-01-29 18:18:14'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    2,
    'Becholers',
    'virtual university',
    'Bscs',
    'programe inttake',
    'programme duration',
    'programme category',
    400,
    500,
    'this is english requirement',
    'this is entry requirement',
    '2023-01-29 18:21:35',
    '2023-01-29 18:21:35'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    3,
    'Becholers',
    'virtual university',
    'Bscs',
    'programe inttake',
    'programme duration',
    'programme category',
    400,
    500,
    'this is english requirement',
    'this is entry requirement',
    '2023-01-29 18:22:25',
    '2023-01-29 18:22:25'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    4,
    'Becholers',
    'virtual university',
    'Bscs',
    'programe inttake',
    'programme duration',
    'programme category',
    400,
    500,
    'this is english requirement',
    'this is entry requirement',
    '2023-01-29 21:57:10',
    '2023-01-29 21:57:10'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    5,
    'Becholers',
    'virtual university',
    'Bscs',
    'programe inttake',
    'programme duration',
    'programme category',
    400,
    500,
    'this is english requirement',
    'this is entry requirement',
    '2023-01-31 03:04:37',
    '2023-01-31 03:04:37'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    6,
    'Becholers',
    'virtual university',
    'Bscs',
    'programe inttake',
    'programme duration',
    'programme category',
    400,
    500,
    'this is english requirement',
    'this is entry requirement',
    '2023-01-31 22:49:57',
    '2023-01-31 22:49:57'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    7,
    'Becholers',
    'virtual university',
    'Bscs',
    'programe inttake',
    'programme duration',
    'programme category',
    400,
    500,
    'this is english requirement',
    'this is entry requirement',
    '2023-02-02 19:22:16',
    '2023-02-02 19:22:16'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    8,
    'Becholers',
    'virtual university',
    'Bscs',
    'programe inttake',
    'programme duration',
    'programme category',
    400,
    500,
    'this is english requirement',
    'this is entry requirement',
    '2023-02-02 20:49:28',
    '2023-02-02 20:49:28'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    9,
    'Becholers',
    'virtual university',
    'Bscs',
    'programe inttake',
    'programme duration',
    'programme category',
    400,
    500,
    'this is english requirement',
    'this is entry requirement',
    '2023-02-03 00:31:43',
    '2023-02-03 00:31:43'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    10,
    'masteres',
    'University 1',
    'Level 1',
    'intake',
    'Duration 1',
    'Category 1',
    30,
    40,
    'englis',
    'entry',
    '2023-02-03 00:37:46',
    '2023-02-03 00:37:46'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    11,
    'masteres',
    'University 1',
    'Level 1',
    'intake',
    'Duration 1',
    'Category 1',
    30,
    40,
    'englis',
    'entry',
    '2023-02-03 00:40:10',
    '2023-02-03 00:40:10'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    12,
    'Becholers',
    'virtual university',
    'Bscs',
    'programe inttake',
    'programme duration',
    'programme category',
    400,
    500,
    'this is english requirement',
    'this is entry requirement',
    '2023-02-03 03:48:51',
    '2023-02-03 03:48:51'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    13,
    'mosh',
    'University 2',
    'Level 1',
    'programme intake',
    'Duration 2',
    'Category 2',
    30,
    40,
    'ok',
    'ok',
    '2023-02-03 04:01:00',
    '2023-02-03 04:01:00'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    14,
    'Zaman Mehmood',
    'University 1',
    'Level 1',
    'programme intake',
    'Duration 2',
    '',
    400,
    404,
    'ok',
    'ok',
    '2023-02-03 17:22:31',
    '2023-02-03 17:22:31'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    15,
    'Zaman Mehmood',
    'University 1',
    'Level 1',
    'programme intake',
    'Duration 2',
    '',
    400,
    404,
    'ok',
    'ok',
    '2023-02-03 17:24:32',
    '2023-02-03 17:24:32'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    16,
    'Zaman Mehmood',
    'University 1',
    'Level 1',
    'programme intake',
    'Duration 2',
    '',
    400,
    404,
    'ok',
    'ok',
    '2023-02-03 17:25:32',
    '2023-02-03 17:25:32'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    17,
    'MASTERS',
    'University 1',
    '',
    'INTAKE PROGRAMME',
    'Duration 1',
    'Category 2',
    4000,
    3000,
    'ENGLISH OKAY',
    'ENTRY OKAY',
    '2023-02-03 17:37:58',
    '2023-02-03 17:37:58'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    18,
    'Becholers',
    'virtual university',
    'Bscs',
    'programe inttake',
    'programme duration',
    'programme category',
    400,
    500,
    'this is english requirement',
    'this is entry requirement',
    '2023-02-03 18:07:15',
    '2023-02-03 18:07:15'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    19,
    'Zaman Mehmood34',
    'University 2',
    'Level 1',
    'programme intakew',
    'Duration 1',
    'Category 1',
    400,
    404,
    'ok',
    'ok',
    '2023-02-03 22:14:05',
    '2023-02-03 22:14:05'
  );
INSERT INTO
  `Programmes` (
    `id`,
    `name`,
    `selectUniversity`,
    `programmeLevel`,
    `programmeIntake`,
    `programmeDuration`,
    `programmeCategory`,
    `tutionFee`,
    `otherFee`,
    `engRequirement`,
    `entryRequirement`,
    `createdAt`,
    `updatedAt`
  )
VALUES
  (
    20,
    'Becholers',
    'virtual university',
    'Bscs',
    'programe inttake',
    'programme duration',
    'programme category',
    400,
    500,
    'this is english requirement',
    'this is entry requirement',
    '2023-02-04 00:45:24',
    '2023-02-04 00:45:24'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: SequelizeMeta
# ------------------------------------------------------------

INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230127183339-create-user.js');
INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230128195917-create-university.js');
INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230128210831-update-university-model.js');
INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230128220409-create-campus.js');
INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230129124456-create-programme.js');
INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230129210531-create-lead.js');
INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230129211004-create-programe-details.js');
INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230130153947-create-applicants.js');
INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230130154538-create-application-details.js');
INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230203151011-update-uni-column.js');
INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230204003147-create-users.js');
INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230204202846-unnamed-migration.js');
INSERT INTO
  `SequelizeMeta` (`name`)
VALUES
  ('20230207192220-create-acctivity.js');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: Universities
# ------------------------------------------------------------

INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    1,
    '1675015810487.png',
    'punjab university',
    '2023-01-29 18:10:10',
    '2023-01-29 18:10:10',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    2,
    '1675016503057.png',
    'punjab university',
    '2023-01-29 18:21:43',
    '2023-01-29 18:21:43',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    3,
    '1675016533154.png',
    'punjab university',
    '2023-01-29 18:22:13',
    '2023-01-29 18:22:13',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    4,
    '1675017120556.png',
    'punjab university',
    '2023-01-29 18:32:00',
    '2023-01-29 18:32:00',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    5,
    '1675017137442.png',
    'punjab university',
    '2023-01-29 18:32:17',
    '2023-01-29 18:32:17',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    6,
    '1675018003557.png',
    'punjab university',
    '2023-01-29 18:46:43',
    '2023-01-29 18:46:43',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    7,
    '1675018047254.png',
    'punjab university',
    '2023-01-29 18:47:27',
    '2023-01-29 18:47:27',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    8,
    '1675018059606.png',
    'punjab university',
    '2023-01-29 18:47:39',
    '2023-01-29 18:47:39',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    9,
    '1675018251549.png',
    'punjab university',
    '2023-01-29 18:50:51',
    '2023-01-29 18:50:51',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    10,
    '1675018305280.png',
    'punjab university',
    '2023-01-29 18:51:45',
    '2023-01-29 18:51:45',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    11,
    '1675018473787.png',
    'punjab university',
    '2023-01-29 18:54:33',
    '2023-01-29 18:54:33',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    12,
    '1675018679714.png',
    'punjab university',
    '2023-01-29 18:57:59',
    '2023-01-29 18:57:59',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    13,
    '1675020878107.png',
    'punjab university',
    '2023-01-29 19:34:38',
    '2023-01-29 19:34:38',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    14,
    '1675021095316.png',
    'punjab university',
    '2023-01-29 19:38:15',
    '2023-01-29 19:38:15',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    15,
    '1675021139808.png',
    'punjab university',
    '2023-01-29 19:38:59',
    '2023-01-29 19:38:59',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    16,
    '1675021192377.png',
    'punjab university',
    '2023-01-29 19:39:52',
    '2023-01-29 19:39:52',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    17,
    '1675021262701.png',
    'punjab university',
    '2023-01-29 19:41:02',
    '2023-01-29 19:41:02',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    18,
    '1675021316745.png',
    'punjab university',
    '2023-01-29 19:41:56',
    '2023-01-29 19:41:56',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    19,
    '1675021395052.png',
    'punjab university',
    '2023-01-29 19:43:15',
    '2023-01-29 19:43:15',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    20,
    '1675021782964.png',
    'punjab university',
    '2023-01-29 19:49:42',
    '2023-01-29 19:49:42',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    21,
    '1675021795695.png',
    'punjab university',
    '2023-01-29 19:49:55',
    '2023-01-29 19:49:55',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    22,
    '1675021889582.png',
    'punjab university',
    '2023-01-29 19:51:29',
    '2023-01-29 19:51:29',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    23,
    '1675021957821.png',
    'punjab university',
    '2023-01-29 19:52:37',
    '2023-01-29 19:52:37',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    24,
    '1675022002305.png',
    'punjab university',
    '2023-01-29 19:53:22',
    '2023-01-29 19:53:22',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    25,
    '1675022160102.png',
    'punjab university',
    '2023-01-29 19:56:00',
    '2023-01-29 19:56:00',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    26,
    '1675022244898.png',
    'punjab university',
    '2023-01-29 19:57:24',
    '2023-01-29 19:57:24',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    27,
    '1675022281475.png',
    'punjab university',
    '2023-01-29 19:58:01',
    '2023-01-29 19:58:01',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    28,
    '1675022637879.png',
    'punjab university',
    '2023-01-29 20:03:57',
    '2023-01-29 20:03:57',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    29,
    '1675022709036.png',
    'punjab university',
    '2023-01-29 20:05:09',
    '2023-01-29 20:05:09',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    30,
    '1675022749446.png',
    'punjab university',
    '2023-01-29 20:05:49',
    '2023-01-29 20:05:49',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    31,
    '1675022791744.png',
    'punjab university',
    '2023-01-29 20:06:31',
    '2023-01-29 20:06:31',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    32,
    '1675022843243.png',
    'punjab university',
    '2023-01-29 20:07:23',
    '2023-01-29 20:07:23',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    33,
    '1675022993921.png',
    'punjab university',
    '2023-01-29 20:09:53',
    '2023-01-29 20:09:53',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    34,
    '1675023077399.png',
    'punjab university',
    '2023-01-29 20:11:17',
    '2023-01-29 20:11:17',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    35,
    '1675026852696.png',
    'punjab university',
    '2023-01-29 21:14:12',
    '2023-01-29 21:14:12',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    36,
    '1675029423302.png',
    'punjab university',
    '2023-01-29 21:57:03',
    '2023-01-29 21:57:03',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    37,
    '1675109866792.png',
    'punjab university',
    '2023-01-30 20:17:46',
    '2023-01-30 20:17:46',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    38,
    '1675131428693.png',
    'punjab university',
    '2023-01-31 02:17:08',
    '2023-01-31 02:17:08',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    39,
    '1675131444674.png',
    'punjab university',
    '2023-01-31 02:17:24',
    '2023-01-31 02:17:24',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    40,
    '1675131449525.png',
    'punjab university',
    '2023-01-31 02:17:29',
    '2023-01-31 02:17:29',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    41,
    '1675131455229.png',
    'punjab university',
    '2023-01-31 02:17:35',
    '2023-01-31 02:17:35',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    42,
    '1675134248611.png',
    'punjab university',
    '2023-01-31 03:04:08',
    '2023-01-31 03:04:08',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    43,
    '1675201097406.png',
    'punjab university',
    '2023-01-31 21:38:17',
    '2023-01-31 21:38:17',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    44,
    '1675205373189.png',
    'punjab university',
    '2023-01-31 22:49:33',
    '2023-01-31 22:49:33',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    45,
    '1675205376281.png',
    'punjab university',
    '2023-01-31 22:49:36',
    '2023-01-31 22:49:36',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    46,
    '1675289078623.png',
    'punjab university',
    '2023-02-01 22:04:38',
    '2023-02-01 22:04:38',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    47,
    NULL,
    'Zaman Mehmood',
    '2023-02-02 02:42:26',
    '2023-02-02 02:42:26',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    48,
    NULL,
    'Zaman Mehmood',
    '2023-02-02 02:42:28',
    '2023-02-02 02:42:28',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    49,
    NULL,
    'virtual university',
    '2023-02-02 03:07:09',
    '2023-02-02 03:07:09',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    50,
    NULL,
    'virtual university',
    '2023-02-02 03:07:38',
    '2023-02-02 03:07:38',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    51,
    '1675307394901.png',
    'virtual university',
    '2023-02-02 03:09:54',
    '2023-02-02 03:09:54',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    52,
    '1675361508329.png',
    'Zaman Mehmood',
    '2023-02-02 18:11:48',
    '2023-02-02 18:11:48',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    53,
    NULL,
    'punjab university',
    '2023-02-02 18:28:38',
    '2023-02-02 18:28:38',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    54,
    NULL,
    'punjab university',
    '2023-02-02 18:28:48',
    '2023-02-02 18:28:48',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    55,
    NULL,
    'asdf',
    '2023-02-02 18:33:19',
    '2023-02-02 18:33:19',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    56,
    NULL,
    'asdfs',
    '2023-02-02 18:44:09',
    '2023-02-02 18:44:09',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    57,
    NULL,
    'asdfs',
    '2023-02-02 18:50:41',
    '2023-02-02 18:50:41',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    58,
    NULL,
    'asdfs',
    '2023-02-02 18:51:25',
    '2023-02-02 18:51:25',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    59,
    NULL,
    'Univesity of Lahore',
    '2023-02-02 19:07:21',
    '2023-02-02 19:07:21',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    60,
    NULL,
    'punjab university',
    '2023-02-02 19:08:00',
    '2023-02-02 19:08:00',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    61,
    NULL,
    'Univesity of Education',
    '2023-02-02 19:14:27',
    '2023-02-02 19:14:27',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    62,
    NULL,
    'Zaman Mehmood',
    '2023-02-02 21:46:43',
    '2023-02-02 21:46:43',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    63,
    NULL,
    'FRST UNI',
    '2023-02-02 22:05:28',
    '2023-02-02 22:05:28',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    64,
    NULL,
    'FRST UNI',
    '2023-02-02 22:06:32',
    '2023-02-02 22:06:32',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    65,
    NULL,
    'FRST UNI',
    '2023-02-02 22:08:01',
    '2023-02-02 22:08:01',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    66,
    NULL,
    'Mosh',
    '2023-02-02 22:34:51',
    '2023-02-02 22:34:51',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    67,
    NULL,
    'asdf',
    '2023-02-02 22:41:40',
    '2023-02-02 22:41:40',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    68,
    NULL,
    'asdf',
    '2023-02-02 22:46:14',
    '2023-02-02 22:46:14',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    69,
    NULL,
    'asdf',
    '2023-02-02 22:54:06',
    '2023-02-02 22:54:06',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    70,
    NULL,
    'asdf',
    '2023-02-02 22:58:58',
    '2023-02-02 22:58:58',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    71,
    NULL,
    'Zaman Mehmood',
    '2023-02-02 23:04:45',
    '2023-02-02 23:04:45',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    72,
    NULL,
    'ali',
    '2023-02-02 23:17:31',
    '2023-02-02 23:17:31',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    73,
    NULL,
    'ali',
    '2023-02-02 23:18:07',
    '2023-02-02 23:18:07',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    74,
    NULL,
    'ali',
    '2023-02-02 23:18:17',
    '2023-02-02 23:18:17',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    75,
    NULL,
    'ali',
    '2023-02-02 23:19:17',
    '2023-02-02 23:19:17',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    76,
    NULL,
    'ali',
    '2023-02-02 23:20:56',
    '2023-02-02 23:20:56',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    77,
    NULL,
    'ali',
    '2023-02-02 23:22:25',
    '2023-02-02 23:22:25',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    78,
    NULL,
    'ali',
    '2023-02-02 23:24:36',
    '2023-02-02 23:24:36',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    79,
    NULL,
    'ali',
    '2023-02-02 23:24:49',
    '2023-02-02 23:24:49',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    80,
    NULL,
    'ali',
    '2023-02-02 23:25:51',
    '2023-02-02 23:25:51',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    81,
    NULL,
    'ali',
    '2023-02-02 23:28:08',
    '2023-02-02 23:28:08',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    82,
    NULL,
    'ali',
    '2023-02-02 23:29:50',
    '2023-02-02 23:29:50',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    83,
    NULL,
    'burhan university',
    '2023-02-02 23:33:20',
    '2023-02-02 23:33:20',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    84,
    NULL,
    'burhan university',
    '2023-02-02 23:35:01',
    '2023-02-02 23:35:01',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    85,
    NULL,
    'central punjab university',
    '2023-02-02 23:35:46',
    '2023-02-02 23:35:46',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    86,
    NULL,
    'UCP',
    '2023-02-02 23:38:44',
    '2023-02-02 23:38:44',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    87,
    NULL,
    'UNC',
    '2023-02-02 23:47:17',
    '2023-02-02 23:47:17',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    88,
    NULL,
    'MCBs',
    '2023-02-02 23:54:48',
    '2023-02-02 23:54:48',
    NULL,
    NULL,
    NULL,
    'mb@gmail.com',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    89,
    NULL,
    'VUP',
    '2023-02-03 00:00:09',
    '2023-02-03 00:00:09',
    NULL,
    NULL,
    NULL,
    'vusuccessfully@gmail.com',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    90,
    NULL,
    'NewUni',
    '2023-02-03 00:05:40',
    '2023-02-03 00:05:40',
    NULL,
    333,
    NULL,
    'newuni@gmail.com',
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    91,
    NULL,
    'punjab university',
    '2023-02-03 00:15:05',
    '2023-02-03 00:15:05',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    92,
    NULL,
    'university@gmail.com',
    '2023-02-03 00:20:29',
    '2023-02-03 00:20:29',
    2,
    55,
    '23356789',
    'example@gmail.com',
    3233,
    2323,
    2323,
    2
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    93,
    NULL,
    'punjab university',
    '2023-02-03 03:48:39',
    '2023-02-03 03:48:39',
    1,
    55,
    '12345',
    'saqib@gmail.com',
    2000,
    5000,
    40,
    50
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    94,
    NULL,
    'punjab university',
    '2023-02-03 04:29:33',
    '2023-02-03 04:29:33',
    2,
    55,
    '32456528',
    'awais1@gmail.com',
    3233,
    2323,
    2323,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    95,
    NULL,
    'punjab university',
    '2023-02-03 04:31:21',
    '2023-02-03 04:31:21',
    2,
    55,
    '32456528',
    'awais1@gmail.com',
    3233,
    2323,
    2323,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    96,
    NULL,
    'rrrrpunjab university',
    '2023-02-03 04:32:12',
    '2023-02-03 04:32:12',
    2,
    55,
    '32456528',
    'awais1@gmail.com',
    3233,
    2323,
    2323,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    97,
    NULL,
    'Moshd',
    '2023-02-03 15:26:07',
    '2023-02-03 15:26:07',
    2,
    12,
    '03245652547',
    'saqib@gmail.com',
    3233,
    2323,
    2323,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    98,
    NULL,
    'mosh',
    '2023-02-03 16:01:24',
    '2023-02-03 16:01:24',
    2,
    33,
    '233',
    'saqib@gmail.com',
    3233,
    2323,
    2323,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    99,
    NULL,
    'Zaman Mehmood',
    '2023-02-03 16:04:58',
    '2023-02-03 16:04:58',
    2,
    55,
    '03245652547',
    'asd@gmail.com',
    3233,
    2323,
    2323,
    2
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    100,
    NULL,
    'Zaman Mehmood',
    '2023-02-03 16:09:27',
    '2023-02-03 16:09:27',
    1,
    55,
    '032456525',
    'zaman1@gmail.com',
    3233,
    2323,
    2323,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    101,
    NULL,
    'Zaman Mehmood',
    '2023-02-03 16:11:07',
    '2023-02-03 16:11:07',
    1,
    55,
    '032456525',
    'zaman1@gmail.com',
    3233,
    2323,
    2323,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    102,
    NULL,
    'Zaman Mehmood',
    '2023-02-03 16:11:45',
    '2023-02-03 16:11:45',
    1,
    55,
    '032456525',
    'zaman1@gmail.com',
    3233,
    2323,
    2323,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    103,
    NULL,
    'Punjab University!!!',
    '2023-02-03 16:32:27',
    '2023-02-03 16:32:27',
    1,
    32,
    '0324565223',
    'admin@gmail.com',
    40,
    50,
    40,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    104,
    NULL,
    'Ounjab University',
    '2023-02-03 17:16:48',
    '2023-02-03 17:16:48',
    1,
    55,
    '23475',
    'dummy@gmail.com',
    3233,
    2323,
    40,
    2
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    105,
    NULL,
    'mosh',
    '2023-02-03 17:31:58',
    '2023-02-03 17:31:58',
    2,
    32,
    '03245652547',
    'asd@gmail.com',
    3233,
    2323,
    2323,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    106,
    NULL,
    'Testing University',
    '2023-02-03 17:35:50',
    '2023-02-03 17:35:50',
    1,
    33,
    '0324565223',
    'testing@gmail.com',
    23,
    43,
    20,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    107,
    NULL,
    'mosh',
    '2023-02-03 20:42:50',
    '2023-02-03 20:42:50',
    2,
    33,
    '233',
    'mzmnmehmood@gmail.com',
    40,
    2323,
    2323,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    108,
    NULL,
    'R university',
    '2023-02-03 22:22:10',
    '2023-02-03 22:22:10',
    1,
    32,
    '1212',
    'r@gmail.com',
    20,
    20,
    40,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    109,
    NULL,
    'R university',
    '2023-02-03 22:23:29',
    '2023-02-03 22:23:29',
    1,
    32,
    '121256789',
    'r@gmail.com',
    20,
    20,
    40,
    1
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    110,
    NULL,
    'Zaman Mehmood',
    '2023-02-03 22:56:52',
    '2023-02-03 22:56:52',
    2,
    12,
    '0324565223',
    'saqib@gmail.com',
    3233,
    50,
    40,
    2
  );
INSERT INTO
  `Universities` (
    `id`,
    `logo`,
    `name`,
    `createdAt`,
    `updatedAt`,
    `type`,
    `counserllerName`,
    `phone`,
    `email`,
    `visaAppFee`,
    `addmissionFee`,
    `qetcFee`,
    `commisionDuration`
  )
VALUES
  (
    111,
    NULL,
    'Zaman Mehmood',
    '2023-02-03 22:59:27',
    '2023-02-03 22:59:27',
    2,
    12,
    '0324565223',
    'saqib@gmail.com',
    40,
    2323,
    2323,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: Users
# ------------------------------------------------------------


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
