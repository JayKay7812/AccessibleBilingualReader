/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : accessible_reader

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 19/04/2022 13:14:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fileindex
-- ----------------------------
DROP TABLE IF EXISTS `fileindex`;
CREATE TABLE `fileindex`  (
  `file_id` int(0) NOT NULL AUTO_INCREMENT,
  `file_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_lan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tar_lan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fileindex
-- ----------------------------
INSERT INTO `fileindex` VALUES (1, '测试项目：仅zh src与机翻en tar', 'srconly', 'zh', 'en');
INSERT INTO `fileindex` VALUES (2, '测试项目：仅en src与机翻zh tar', 'srconly', 'en', 'zh');
INSERT INTO `fileindex` VALUES (3, '测试项目：仅en src与机翻zh tar', 'srconly', 'en', 'zh');
INSERT INTO `fileindex` VALUES (4, '测试项目：仅en src与机翻zh tar', 'srconly', 'en', 'zh');
INSERT INTO `fileindex` VALUES (5, '测试项目：仅en src与机翻zh tar', 'srconly', 'en', 'zh');
INSERT INTO `fileindex` VALUES (6, '测试项目：仅en src与机翻zh tar', 'srconly', 'en', 'zh');

-- ----------------------------
-- Table structure for sentencepool
-- ----------------------------
DROP TABLE IF EXISTS `sentencepool`;
CREATE TABLE `sentencepool`  (
  `sentence_id` int(0) NOT NULL AUTO_INCREMENT,
  `sentence_sequence` int(0) NULL DEFAULT NULL,
  `sentence` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sentence_type` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `file_id` int(0) NOT NULL,
  PRIMARY KEY (`sentence_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 275 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sentencepool
-- ----------------------------
INSERT INTO `sentencepool` VALUES (1, 0, '无障碍（Accessibility），又称可及性、可访问性等，是用于描述环境、设施、信息与服务等各类主体的一种属性，具有该属性的主体应考虑到所有可能的用户与受众：包括残疾人、老年人以及出于各种原因无法以较普遍的方式参与相关活动的人群，通过更具适配性的设计与实现以让所有人都能更容易地行为与活动。', 'src', 1);
INSERT INTO `sentencepool` VALUES (2, 0, 'Accessibility refers to an attribute used to describe the environment, facilities, information, and services. A subject with this attribute should consider all possible users and audiences: Including the disabled, the elderly and for various reasons can not participate in the relevant activities in a more common way, through more adaptable design and implementation to make it easier for all people to conduct and activities.', 'tar', 1);
INSERT INTO `sentencepool` VALUES (3, 1, '本研究与设计主要聚焦于无障碍领域下的“信息无障碍”与“Web无障碍”，致力于结合翻译学习中扮演重要角色的双语语料阅读以及无障碍在Web应用中的实现，开发一款带有无障碍阅读辅助功能的，以web应用为基础的双语语料阅读器。', 'src', 1);
INSERT INTO `sentencepool` VALUES (4, 1, 'This research and design mainly focus on the barrier-free under the domain of \"information barrier-free\" and the \"Web accessibility\", is committed to play an important role in the translation study of bilingual corpora reading and barrier-free implementation in the Web application development with a barrier-free reading auxiliary function, on the basis of the Web application of bilingual corpora reader.', 'tar', 1);
INSERT INTO `sentencepool` VALUES (5, 2, '根据2007年公布的《第二次全国残疾人抽样调查主要数据公报》，我国约有残疾人口8296万人。', 'src', 1);
INSERT INTO `sentencepool` VALUES (6, 2, 'According to the Main Data bulletin of the Second National Sample Survey on Persons with Disabilities released in 2007, there are 82.96 million people with disabilities in China.', 'tar', 1);
INSERT INTO `sentencepool` VALUES (7, 3, '结合2010年第六次全国人口普查以及2020年第七次全国人口普查的数据，推算我国现有残疾人8742万人左右。', 'src', 1);
INSERT INTO `sentencepool` VALUES (8, 3, 'Based on the data from the sixth national census in 2010 and the seventh national census in 2020, it is estimated that there are 87.42 million disabled people in China.', 'tar', 1);
INSERT INTO `sentencepool` VALUES (9, 4, 'Really?', 'src', 1);
INSERT INTO `sentencepool` VALUES (10, 4, 'Really?', 'tar', 1);
INSERT INTO `sentencepool` VALUES (11, 5, 'IDK Idon think so......', 'src', 1);
INSERT INTO `sentencepool` VALUES (12, 5, 'IDK Idon think so......', 'tar', 1);
INSERT INTO `sentencepool` VALUES (13, 6, '在信息时代，如何保证如此庞大的残疾人同胞能够从网络获取信息、学习知识是亟待解决的一大问题。', 'src', 1);
INSERT INTO `sentencepool` VALUES (14, 6, 'In the information age, how to ensure that such a large number of disabled compatriots can obtain information and learn knowledge from the Internet is a major problem to be solved urgently.', 'tar', 1);
INSERT INTO `sentencepool` VALUES (15, 7, '同时，第七次全国人口普查的数据显示，我国60岁以上人口有26402万，占总人口的18.', 'src', 1);
INSERT INTO `sentencepool` VALUES (16, 7, 'Meanwhile, data from the seventh national census showed that there were 264.02 million people over the age of 60 in China, accounting for 18 percent of the total population.', 'tar', 1);
INSERT INTO `sentencepool` VALUES (17, 8, '70%，如何推进互联网应用的适老化也是社会关注一大议题。', 'src', 1);
INSERT INTO `sentencepool` VALUES (18, 8, '70%, how to promote the aging of Internet applications is also a major social concern.', 'tar', 1);
INSERT INTO `sentencepool` VALUES (19, 9, 'This is just a test paragaraph......', 'src', 1);
INSERT INTO `sentencepool` VALUES (20, 9, 'This is just a test paragaraph......', 'tar', 1);
INSERT INTO `sentencepool` VALUES (21, 10, 'with a lot of different stuff!', 'src', 1);
INSERT INTO `sentencepool` VALUES (22, 10, 'with a lot of different stuff!', 'tar', 1);
INSERT INTO `sentencepool` VALUES (23, 11, 'To be concern about?', 'src', 1);
INSERT INTO `sentencepool` VALUES (24, 11, 'To be concern about?', 'tar', 1);
INSERT INTO `sentencepool` VALUES (25, 12, 'I guess:)', 'src', 1);
INSERT INTO `sentencepool` VALUES (26, 12, 'I guess:)', 'tar', 1);
INSERT INTO `sentencepool` VALUES (27, 0, 'Accessibility, also known as accessibility, accessibility, etc.', 'src', 2);
INSERT INTO `sentencepool` VALUES (28, 0, '易访问性又称易访问性、易访问性等。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (29, 1, ', is an attribute used to describe all types of subjects such as environments, facilities, information and services, etc.', 'src', 2);
INSERT INTO `sentencepool` VALUES (30, 1, '是用来描述环境、设施、信息和服务等各类主体的属性。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (31, 2, 'Subjects with this attribute should consider all possible users and audiences: including people with disabilities, the elderly, and people who for various reasons cannot participate in related activities in a more general way, through more adaptive design and implementation to make behaviors and activities more accessible to all.', 'src', 2);
INSERT INTO `sentencepool` VALUES (32, 2, '具有这一属性的主体应考虑到所有可能的用户和受众:包括残疾人、老年人以及由于各种原因无法更普遍地参与相关活动的人群，通过更具有适应性的设计和实施，使行为和活动更容易为所有人所接受。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (33, 3, 'This research and design focuses on \"information accessibility\" and \"web accessibility\" in the field of accessibility, and aims to combine the bilingual corpus reading, which plays an important role in translation learning, and the implementation of accessibility in web applications.', 'src', 2);
INSERT INTO `sentencepool` VALUES (34, 3, '本研究围绕可及性领域中的“信息可及性”和“网页可及性”展开，旨在将在翻译学习中发挥重要作用的双语语料库阅读与可及性在网络应用中的实现相结合。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (35, 4, 'It is dedicated to developing a bilingual corpus reader based on web application with the function of accessibility reading aid.', 'src', 2);
INSERT INTO `sentencepool` VALUES (36, 4, '致力于开发一种基于web应用的具有无障碍阅读功能的双语语料库阅读器。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (37, 5, 'According to the \"Second National Sample Survey on Persons with Disabilities\" published in 2007, there are 82.', 'src', 2);
INSERT INTO `sentencepool` VALUES (38, 5, '根据2007年公布的“第二次全国残疾人抽样调查”，全国共有82个残疾人。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (39, 6, '96 million persons with disabilities in China.', 'src', 2);
INSERT INTO `sentencepool` VALUES (40, 6, '中国有9600万残疾人。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (41, 7, 'Combined with the data from the sixth national census in 2010 and the seventh national census in 2020, it is projected that there are about 87.', 'src', 2);
INSERT INTO `sentencepool` VALUES (42, 7, '结合2010年第六次全国人口普查和2020年第七次全国人口普查的数据，预计约有87个。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (43, 8, '42 million people with disabilities in China.', 'src', 2);
INSERT INTO `sentencepool` VALUES (44, 8, '中国有4200万残疾人。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (45, 9, 'Really?', 'src', 2);
INSERT INTO `sentencepool` VALUES (46, 9, '真的吗?', 'tar', 2);
INSERT INTO `sentencepool` VALUES (47, 10, 'IDK ID think so......', 'src', 2);
INSERT INTO `sentencepool` VALUES (48, 10, 'IDK ID认为可以......', 'tar', 2);
INSERT INTO `sentencepool` VALUES (49, 11, 'In the information age, how to ensure that such a large number of people with disabilities can obtain information and learn from the Internet is a major problem that needs to be solved.', 'src', 2);
INSERT INTO `sentencepool` VALUES (50, 11, '在信息时代，如何保证如此众多的残疾人能够从互联网上获取信息和学习，是一个需要解决的重大问题。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (51, 12, 'At the same time, the data of the seventh national census shows that there are 264.', 'src', 2);
INSERT INTO `sentencepool` VALUES (52, 12, '与此同时，第七次全国人口普查数据显示，有264人。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (53, 13, '02 million people over 60 years old in China, accounting for 18.', 'src', 2);
INSERT INTO `sentencepool` VALUES (54, 13, '中国60岁以上人口200万，占18。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (55, 14, '70% of the total population, so how to promote the ageing of Internet applications is also a major social concern.', 'src', 2);
INSERT INTO `sentencepool` VALUES (56, 14, '中国人口占总人口的70%，因此如何促进互联网应用的老龄化也是一个重大的社会问题。', 'tar', 2);
INSERT INTO `sentencepool` VALUES (57, 15, 'This is just a test paragaraph.....', 'src', 2);
INSERT INTO `sentencepool` VALUES (58, 15, '这只是一个测试段落.....', 'tar', 2);
INSERT INTO `sentencepool` VALUES (59, 16, '有很多不同的内容 To be concern about?', 'src', 2);
INSERT INTO `sentencepool` VALUES (60, 16, '有很多不同的内容担忧?', 'tar', 2);
INSERT INTO `sentencepool` VALUES (61, 17, 'I guess :)', 'src', 2);
INSERT INTO `sentencepool` VALUES (62, 17, '我猜:)', 'tar', 2);
INSERT INTO `sentencepool` VALUES (63, 0, 'Accessibility, also known as accessibility, accessibility, etc.', 'src', 3);
INSERT INTO `sentencepool` VALUES (64, 0, '易访问性又称易访问性、易访问性等。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (65, 1, ', is an attribute used to describe all types of subjects such as environments, facilities, information and services, etc.', 'src', 3);
INSERT INTO `sentencepool` VALUES (66, 1, '是用来描述环境、设施、信息和服务等各类主体的属性。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (67, 2, 'Subjects with this attribute should consider all possible users and audiences: including people with disabilities, the elderly, and people who for various reasons cannot participate in related activities in a more general way, through more adaptive design and implementation to make behaviors and activities more accessible to all.', 'src', 3);
INSERT INTO `sentencepool` VALUES (68, 2, '具有这一属性的主体应考虑到所有可能的用户和受众:包括残疾人、老年人以及由于各种原因无法更普遍地参与相关活动的人群，通过更具有适应性的设计和实施，使行为和活动更容易为所有人所接受。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (69, 3, 'This research and design focuses on \"information accessibility\" and \"web accessibility\" in the field of accessibility, and aims to combine the bilingual corpus reading, which plays an important role in translation learning, and the implementation of accessibility in web applications.', 'src', 3);
INSERT INTO `sentencepool` VALUES (70, 3, '本研究围绕可及性领域中的“信息可及性”和“网页可及性”展开，旨在将在翻译学习中发挥重要作用的双语语料库阅读与可及性在网络应用中的实现相结合。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (71, 4, 'It is dedicated to developing a bilingual corpus reader based on web application with the function of accessibility reading aid.', 'src', 3);
INSERT INTO `sentencepool` VALUES (72, 4, '致力于开发一种基于web应用的具有无障碍阅读功能的双语语料库阅读器。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (73, 5, 'According to the \"Second National Sample Survey on Persons with Disabilities\" published in 2007, there are 82.', 'src', 3);
INSERT INTO `sentencepool` VALUES (74, 5, '根据2007年公布的“第二次全国残疾人抽样调查”，全国共有82个残疾人。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (75, 6, '96 million persons with disabilities in China.', 'src', 3);
INSERT INTO `sentencepool` VALUES (76, 6, '中国有9600万残疾人。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (77, 7, 'Combined with the data from the sixth national census in 2010 and the seventh national census in 2020, it is projected that there are about 87.', 'src', 3);
INSERT INTO `sentencepool` VALUES (78, 7, '结合2010年第六次全国人口普查和2020年第七次全国人口普查的数据，预计约有87个。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (79, 8, '42 million people with disabilities in China.', 'src', 3);
INSERT INTO `sentencepool` VALUES (80, 8, '中国有4200万残疾人。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (81, 9, 'Really?', 'src', 3);
INSERT INTO `sentencepool` VALUES (82, 9, '真的吗?', 'tar', 3);
INSERT INTO `sentencepool` VALUES (83, 10, 'IDK ID think so......', 'src', 3);
INSERT INTO `sentencepool` VALUES (84, 10, 'IDK ID认为可以......', 'tar', 3);
INSERT INTO `sentencepool` VALUES (85, 11, 'In the information age, how to ensure that such a large number of people with disabilities can obtain information and learn from the Internet is a major problem that needs to be solved.', 'src', 3);
INSERT INTO `sentencepool` VALUES (86, 11, '在信息时代，如何保证如此众多的残疾人能够从互联网上获取信息和学习，是一个需要解决的重大问题。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (87, 12, 'At the same time, the data of the seventh national census shows that there are 264.', 'src', 3);
INSERT INTO `sentencepool` VALUES (88, 12, '与此同时，第七次全国人口普查数据显示，有264人。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (89, 13, '02 million people over 60 years old in China, accounting for 18.', 'src', 3);
INSERT INTO `sentencepool` VALUES (90, 13, '中国60岁以上人口200万，占18。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (91, 14, '70% of the total population, so how to promote the ageing of Internet applications is also a major social concern.', 'src', 3);
INSERT INTO `sentencepool` VALUES (92, 14, '中国人口占总人口的70%，因此如何促进互联网应用的老龄化也是一个重大的社会问题。', 'tar', 3);
INSERT INTO `sentencepool` VALUES (93, 15, 'This is just a test paragaraph.....', 'src', 3);
INSERT INTO `sentencepool` VALUES (94, 15, '这只是一个测试段落.....', 'tar', 3);
INSERT INTO `sentencepool` VALUES (95, 16, '有很多不同的内容 To be concern about?', 'src', 3);
INSERT INTO `sentencepool` VALUES (96, 16, '有很多不同的内容担忧?', 'tar', 3);
INSERT INTO `sentencepool` VALUES (97, 17, 'I guess :)', 'src', 3);
INSERT INTO `sentencepool` VALUES (98, 17, '我猜:)', 'tar', 3);
INSERT INTO `sentencepool` VALUES (99, 0, 'Accessibility, also known as accessibility, accessibility, etc.', 'src', 4);
INSERT INTO `sentencepool` VALUES (100, 0, '易访问性又称易访问性、易访问性等。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (101, 1, ', is an attribute used to describe all types of subjects such as environments, facilities, information and services, etc.', 'src', 4);
INSERT INTO `sentencepool` VALUES (102, 1, '是用来描述环境、设施、信息和服务等各类主体的属性。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (103, 2, 'Subjects with this attribute should consider all possible users and audiences: including people with disabilities, the elderly, and people who for various reasons cannot participate in related activities in a more general way, through more adaptive design and implementation to make behaviors and activities more accessible to all.', 'src', 4);
INSERT INTO `sentencepool` VALUES (104, 2, '具有这一属性的主体应考虑到所有可能的用户和受众:包括残疾人、老年人以及由于各种原因无法更普遍地参与相关活动的人群，通过更具有适应性的设计和实施，使行为和活动更容易为所有人所接受。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (105, 3, 'This research and design focuses on \"information accessibility\" and \"web accessibility\" in the field of accessibility, and aims to combine the bilingual corpus reading, which plays an important role in translation learning, and the implementation of accessibility in web applications.', 'src', 4);
INSERT INTO `sentencepool` VALUES (106, 3, '本研究围绕可及性领域中的“信息可及性”和“网页可及性”展开，旨在将在翻译学习中发挥重要作用的双语语料库阅读与可及性在网络应用中的实现相结合。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (107, 4, 'It is dedicated to developing a bilingual corpus reader based on web application with the function of accessibility reading aid.', 'src', 4);
INSERT INTO `sentencepool` VALUES (108, 4, '致力于开发一种基于web应用的具有无障碍阅读功能的双语语料库阅读器。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (109, 5, 'According to the \"Second National Sample Survey on Persons with Disabilities\" published in 2007, there are 82.', 'src', 4);
INSERT INTO `sentencepool` VALUES (110, 5, '根据2007年公布的“第二次全国残疾人抽样调查”，全国共有82个残疾人。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (111, 6, '96 million persons with disabilities in China.', 'src', 4);
INSERT INTO `sentencepool` VALUES (112, 6, '中国有9600万残疾人。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (113, 7, 'Combined with the data from the sixth national census in 2010 and the seventh national census in 2020, it is projected that there are about 87.', 'src', 4);
INSERT INTO `sentencepool` VALUES (114, 7, '结合2010年第六次全国人口普查和2020年第七次全国人口普查的数据，预计约有87个。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (115, 8, '42 million people with disabilities in China.', 'src', 4);
INSERT INTO `sentencepool` VALUES (116, 8, '中国有4200万残疾人。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (117, 9, 'Really?', 'src', 4);
INSERT INTO `sentencepool` VALUES (118, 9, '真的吗?', 'tar', 4);
INSERT INTO `sentencepool` VALUES (119, 10, 'IDK ID think so......', 'src', 4);
INSERT INTO `sentencepool` VALUES (120, 10, 'IDK ID认为可以......', 'tar', 4);
INSERT INTO `sentencepool` VALUES (121, 11, 'In the information age, how to ensure that such a large number of people with disabilities can obtain information and learn from the Internet is a major problem that needs to be solved.', 'src', 4);
INSERT INTO `sentencepool` VALUES (122, 11, '在信息时代，如何保证如此众多的残疾人能够从互联网上获取信息和学习，是一个需要解决的重大问题。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (123, 12, 'At the same time, the data of the seventh national census shows that there are 264.', 'src', 4);
INSERT INTO `sentencepool` VALUES (124, 12, '与此同时，第七次全国人口普查数据显示，有264人。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (125, 13, '02 million people over 60 years old in China, accounting for 18.', 'src', 4);
INSERT INTO `sentencepool` VALUES (126, 13, '中国60岁以上人口200万，占18。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (127, 14, '70% of the total population, so how to promote the ageing of Internet applications is also a major social concern.', 'src', 4);
INSERT INTO `sentencepool` VALUES (128, 14, '中国人口占总人口的70%，因此如何促进互联网应用的老龄化也是一个重大的社会问题。', 'tar', 4);
INSERT INTO `sentencepool` VALUES (129, 15, 'This is just a test paragaraph.....', 'src', 4);
INSERT INTO `sentencepool` VALUES (130, 15, '这只是一个测试段落.....', 'tar', 4);
INSERT INTO `sentencepool` VALUES (131, 16, '有很多不同的内容 To be concern about?', 'src', 4);
INSERT INTO `sentencepool` VALUES (132, 16, '有很多不同的内容担忧?', 'tar', 4);
INSERT INTO `sentencepool` VALUES (133, 17, 'I guess :)', 'src', 4);
INSERT INTO `sentencepool` VALUES (134, 17, '我猜:)', 'tar', 4);
INSERT INTO `sentencepool` VALUES (135, 0, 'Accessibility, also known as accessibility, accessibility, etc.', 'src', 5);
INSERT INTO `sentencepool` VALUES (136, 0, '易访问性又称易访问性、易访问性等。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (137, 1, ', is an attribute used to describe all types of subjects such as environments, facilities, information and services, etc.', 'src', 5);
INSERT INTO `sentencepool` VALUES (138, 1, '是用来描述环境、设施、信息和服务等各类主体的属性。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (139, 2, 'Subjects with this attribute should consider all possible users and audiences: including people with disabilities, the elderly, and people who for various reasons cannot participate in related activities in a more general way, through more adaptive design and implementation to make behaviors and activities more accessible to all.', 'src', 5);
INSERT INTO `sentencepool` VALUES (140, 2, '具有这一属性的主体应考虑到所有可能的用户和受众:包括残疾人、老年人以及由于各种原因无法更普遍地参与相关活动的人群，通过更具有适应性的设计和实施，使行为和活动更容易为所有人所接受。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (141, 3, 'This research and design focuses on \"information accessibility\" and \"web accessibility\" in the field of accessibility, and aims to combine the bilingual corpus reading, which plays an important role in translation learning, and the implementation of accessibility in web applications.', 'src', 5);
INSERT INTO `sentencepool` VALUES (142, 3, '本研究围绕可及性领域中的“信息可及性”和“网页可及性”展开，旨在将在翻译学习中发挥重要作用的双语语料库阅读与可及性在网络应用中的实现相结合。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (143, 4, 'It is dedicated to developing a bilingual corpus reader based on web application with the function of accessibility reading aid.', 'src', 5);
INSERT INTO `sentencepool` VALUES (144, 4, '致力于开发一种基于web应用的具有无障碍阅读功能的双语语料库阅读器。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (145, 5, 'According to the \"Second National Sample Survey on Persons with Disabilities\" published in 2007, there are 82.', 'src', 5);
INSERT INTO `sentencepool` VALUES (146, 5, '根据2007年公布的“第二次全国残疾人抽样调查”，全国共有82个残疾人。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (147, 6, '96 million persons with disabilities in China.', 'src', 5);
INSERT INTO `sentencepool` VALUES (148, 6, '中国有9600万残疾人。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (149, 7, 'Combined with the data from the sixth national census in 2010 and the seventh national census in 2020, it is projected that there are about 87.', 'src', 5);
INSERT INTO `sentencepool` VALUES (150, 7, '结合2010年第六次全国人口普查和2020年第七次全国人口普查的数据，预计约有87个。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (151, 8, '42 million people with disabilities in China.', 'src', 5);
INSERT INTO `sentencepool` VALUES (152, 8, '中国有4200万残疾人。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (153, 9, 'Really?', 'src', 5);
INSERT INTO `sentencepool` VALUES (154, 9, '真的吗?', 'tar', 5);
INSERT INTO `sentencepool` VALUES (155, 10, 'IDK ID think so......', 'src', 5);
INSERT INTO `sentencepool` VALUES (156, 10, 'IDK ID认为可以......', 'tar', 5);
INSERT INTO `sentencepool` VALUES (157, 11, 'In the information age, how to ensure that such a large number of people with disabilities can obtain information and learn from the Internet is a major problem that needs to be solved.', 'src', 5);
INSERT INTO `sentencepool` VALUES (158, 11, '在信息时代，如何保证如此众多的残疾人能够从互联网上获取信息和学习，是一个需要解决的重大问题。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (159, 12, 'At the same time, the data of the seventh national census shows that there are 264.', 'src', 5);
INSERT INTO `sentencepool` VALUES (160, 12, '与此同时，第七次全国人口普查数据显示，有264人。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (161, 13, '02 million people over 60 years old in China, accounting for 18.', 'src', 5);
INSERT INTO `sentencepool` VALUES (162, 13, '中国60岁以上人口200万，占18。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (163, 14, '70% of the total population, so how to promote the ageing of Internet applications is also a major social concern.', 'src', 5);
INSERT INTO `sentencepool` VALUES (164, 14, '中国人口占总人口的70%，因此如何促进互联网应用的老龄化也是一个重大的社会问题。', 'tar', 5);
INSERT INTO `sentencepool` VALUES (165, 15, 'This is just a test paragaraph.....', 'src', 5);
INSERT INTO `sentencepool` VALUES (166, 15, '这只是一个测试段落.....', 'tar', 5);
INSERT INTO `sentencepool` VALUES (167, 16, '有很多不同的内容 To be concern about?', 'src', 5);
INSERT INTO `sentencepool` VALUES (168, 16, '有很多不同的内容担忧?', 'tar', 5);
INSERT INTO `sentencepool` VALUES (169, 17, 'I guess :)', 'src', 5);
INSERT INTO `sentencepool` VALUES (170, 17, '我猜:)', 'tar', 5);
INSERT INTO `sentencepool` VALUES (171, 0, 'Accessibility, also known as accessibility, accessibility, etc.', 'src', 6);
INSERT INTO `sentencepool` VALUES (172, 0, '易访问性又称易访问性、易访问性等。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (173, 1, ', is an attribute used to describe all types of subjects such as environments, facilities, information and services, etc.', 'src', 6);
INSERT INTO `sentencepool` VALUES (174, 1, '是用来描述环境、设施、信息和服务等各类主体的属性。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (175, 2, 'Subjects with this attribute should consider all possible users and audiences: including people with disabilities, the elderly, and people who for various reasons cannot participate in related activities in a more general way, through more adaptive design and implementation to make behaviors and activities more accessible to all.', 'src', 6);
INSERT INTO `sentencepool` VALUES (176, 2, '具有这一属性的主体应考虑到所有可能的用户和受众:包括残疾人、老年人以及由于各种原因无法更普遍地参与相关活动的人群，通过更具有适应性的设计和实施，使行为和活动更容易为所有人所接受。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (177, 3, 'This research and design focuses on \"information accessibility\" and \"web accessibility\" in the field of accessibility, and aims to combine the bilingual corpus reading, which plays an important role in translation learning, and the implementation of accessibility in web applications.', 'src', 6);
INSERT INTO `sentencepool` VALUES (178, 3, '本研究围绕可及性领域中的“信息可及性”和“网页可及性”展开，旨在将在翻译学习中发挥重要作用的双语语料库阅读与可及性在网络应用中的实现相结合。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (179, 4, 'It is dedicated to developing a bilingual corpus reader based on web application with the function of accessibility reading aid.', 'src', 6);
INSERT INTO `sentencepool` VALUES (180, 4, '致力于开发一种基于web应用的具有无障碍阅读功能的双语语料库阅读器。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (181, 5, 'According to the \"Second National Sample Survey on Persons with Disabilities\" published in 2007, there are 82.', 'src', 6);
INSERT INTO `sentencepool` VALUES (182, 5, '根据2007年公布的“第二次全国残疾人抽样调查”，全国共有82个残疾人。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (183, 6, '96 million persons with disabilities in China.', 'src', 6);
INSERT INTO `sentencepool` VALUES (184, 6, '中国有9600万残疾人。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (185, 7, 'Combined with the data from the sixth national census in 2010 and the seventh national census in 2020, it is projected that there are about 87.', 'src', 6);
INSERT INTO `sentencepool` VALUES (186, 7, '结合2010年第六次全国人口普查和2020年第七次全国人口普查的数据，预计约有87个。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (187, 8, '42 million people with disabilities in China.', 'src', 6);
INSERT INTO `sentencepool` VALUES (188, 8, '中国有4200万残疾人。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (189, 9, 'Really?', 'src', 6);
INSERT INTO `sentencepool` VALUES (190, 9, '真的吗?', 'tar', 6);
INSERT INTO `sentencepool` VALUES (191, 10, 'IDK ID think so......', 'src', 6);
INSERT INTO `sentencepool` VALUES (192, 10, 'IDK ID认为可以......', 'tar', 6);
INSERT INTO `sentencepool` VALUES (193, 11, 'In the information age, how to ensure that such a large number of people with disabilities can obtain information and learn from the Internet is a major problem that needs to be solved.', 'src', 6);
INSERT INTO `sentencepool` VALUES (194, 11, '在信息时代，如何保证如此众多的残疾人能够从互联网上获取信息和学习，是一个需要解决的重大问题。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (195, 12, 'At the same time, the data of the seventh national census shows that there are 264.', 'src', 6);
INSERT INTO `sentencepool` VALUES (196, 12, '与此同时，第七次全国人口普查数据显示，有264人。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (197, 13, '02 million people over 60 years old in China, accounting for 18.', 'src', 6);
INSERT INTO `sentencepool` VALUES (198, 13, '中国60岁以上人口200万，占18。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (199, 14, '70% of the total population, so how to promote the ageing of Internet applications is also a major social concern.', 'src', 6);
INSERT INTO `sentencepool` VALUES (200, 14, '中国人口占总人口的70%，因此如何促进互联网应用的老龄化也是一个重大的社会问题。', 'tar', 6);
INSERT INTO `sentencepool` VALUES (201, 15, 'This is just a test paragaraph.....', 'src', 6);
INSERT INTO `sentencepool` VALUES (202, 15, '这只是一个测试段落.....', 'tar', 6);
INSERT INTO `sentencepool` VALUES (203, 16, '有很多不同的内容 To be concern about?', 'src', 6);
INSERT INTO `sentencepool` VALUES (204, 16, '有很多不同的内容担忧?', 'tar', 6);
INSERT INTO `sentencepool` VALUES (205, 17, 'I guess :)', 'src', 6);
INSERT INTO `sentencepool` VALUES (206, 17, '我猜:)', 'tar', 6);

SET FOREIGN_KEY_CHECKS = 1;
