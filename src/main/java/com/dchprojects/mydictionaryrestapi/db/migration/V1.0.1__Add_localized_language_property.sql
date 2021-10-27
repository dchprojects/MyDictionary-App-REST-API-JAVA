LOCK TABLES `languages` WRITE;
ALTER TABLE languages
    ADD localized_language VARCHAR(255) NOT NULL
        AFTER language_name;
UNLOCK TABLES;

LOCK TABLES `languages` WRITE;
INSERT INTO `languages` (localized_language) VALUES ('Español'),
                                                    ('English'),
                                                    ('हिन्दी'),
                                                    ('العَرَبِيَّة'),
                                                    ('Português'),
                                                    ('বাংলা'),
                                                    ('Русский'),
                                                    ('日本語'),
                                                    ('ਪੰਜਾਬੀ'),
                                                    ('Deutsch'),
                                                    ('Basa Jawa'),
                                                    ('Wu'),
                                                    ('Bahasa Melayu'),
                                                    ('తెలుగు'),
                                                    ('Tiếng Việt'),
                                                    ('한국어'),
                                                    ('Français'),
                                                    ('मराठी'),
                                                    ('தமிழ்'),
                                                    ('اُردُو'),
                                                    ('Türkçe'),
                                                    ('Italiano'),
                                                    ('Yue'),
                                                    ('ไทย'),
                                                    ('ગુજરાતી'),
                                                    ('Jin'),
                                                    ('Southern Min'),
                                                    ('Persian'),
                                                    ('Polski'),
                                                    ('Pashto'),
                                                    ('ಕನ್ನಡ'),
                                                    ('Xiang'),
                                                    ('മലയാളം'),
                                                    ('Sundanese'),
                                                    ('هَوُسَ'),
                                                    ('Odia'),
                                                    ('Burmese'),
                                                    ('Hakka'),
                                                    ('Українська'),
                                                    ('Bhojpuri'),
                                                    ('Tagalog'),
                                                    ('Ede Yorùbá'),
                                                    ('Maithili'),
                                                    ('Oʻzbek'),
                                                    ('Sindhi'),
                                                    ('Amharic'),
                                                    ('Fula'),
                                                    ('Limba română'),
                                                    ('Oromo'),
                                                    ('Ásụ̀sụ̀'),
                                                    ('Azərbaycan dili'),
                                                    ('Awadhi'),
                                                    ('Gan'),
                                                    ('Cebuano'),
                                                    ('Nederlands'),
                                                    ('Kurdish'),
                                                    ('Serbo-Croatian'),
                                                    ('Malagasy'),
                                                    ('Saraiki'),
                                                    ('Nepali'),
                                                    ('සිංහල'),
                                                    ('Chittagonian'),
                                                    ('Zhuang'),
                                                    ('ខ្មែរ,'),
                                                    ('Turkmen'),
                                                    ('Assamese'),
                                                    ('Madurese'),
                                                    ('Soomaali'),
                                                    ('Marwari'),
                                                    ('Magahi'),
                                                    ('Haryanvi'),
                                                    ('Magyar'),
                                                    ('Chhattisgarhi'),
                                                    ('ελληνικά'),
                                                    ('Chewa'),
                                                    ('Deccan'),
                                                    ('Akan'),
                                                    ('қазақ тілі'),
                                                    ('Northern Min'),
                                                    ('Sylheti'),
                                                    ('isiZulu'),
                                                    ('český'),
                                                    ('Kinyarwanda'),
                                                    ('Dhundhari'),
                                                    ('Kreyol Ayisyen'),
                                                    ('Eastern Min'),
                                                    ('Ilocano'),
                                                    ('Quechua'),
                                                    ('Kirundi'),
                                                    ('Sverige'),
                                                    ('Hmong'),
                                                    ('Shona'),
                                                    ('Uyghur'),
                                                    ('Hiligaynon/Ilonggo'),
                                                    ('Mossi'),
                                                    ('Xhosa'),
                                                    ('Беларусский'),
                                                    ('Balochi'),
                                                    ('Konkani');
UNLOCK TABLES;