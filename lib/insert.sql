INSERT INTO series (id, title, author_id, subgenre_id) VALUES (1, "Lord of the Rings", 1, 1), (2, "Game of Thrones", 2, 2);

INSERT INTO subgenres (id, name) VALUES (1, "epic fantasy"), (2, "dark fantasy");

INSERT INTO authors (id, name) VALUES (1, "J. R. R. Tolkien"), (2, "George R. R. Martin");

INSERT INTO books (id, title, year, series_id) VALUES (1, "Fellowship of the Ring", 2001, 1), (2, "The Two Towers", 2002, 1), (3, "The Return of the King", 2003, 1), (4, "A Game of Thrones", 1996, 2), (5, "A Clash of Kings", 1998, 2), (6, "A Storm of Swords", 2000, 2);

INSERT INTO characters (id, name, motto, species, author_id, series_id) VALUES (1, "Gandalf the Grey", "Fly, you fools!", "wizard", 1, 1), (2, "Samwise Gamgee", "Come, Mr. Frodo!", "hobbit", 1, 1), (3, "Aragorn", "What does your heart tell you?", "human", 1, 1), (4, "Legolas", "Oft hope is born when all is forlorn.", "elf", 1, 1);

INSERT INTO characters (id, name, motto, species, author_id, series_id) VALUES (5, "Tyrion Lanister", "A Lanister always pays his debts.", "human", 2, 2), (6, "Arya Stark", "A girl is Arya Stark of Winterfell.", "human", 2, 2), (7, "Eddard Stark", "Winter is coming.", "human", 2, 2), (8, "Drogon", "screech!!!", "dragon", 2, 2);

INSERT INTO character_books (id, book_id, character_id) VALUES (1, 1, 1), (2, 1, 2), (3, 2, 2), (4, 3, 2), (5, 1, 3), (6, 2, 3), (7, 3, 3), (8, 1, 4);

INSERT INTO character_books (id, book_id, character_id) VALUES (9, 4, 5), (10, 4, 6), (11, 5, 6), (12, 6, 6), (13, 4, 7), (14, 5, 7), (15, 6, 7), (16, 4, 8);
