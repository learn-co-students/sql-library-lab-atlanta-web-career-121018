
# series (id, title, author_id, subgenre_id)
# subgenres (id, name)
# authors (id, name)
# books (id, title, year, series_id)
# characters (id, name, motto, species, author_id, series_id)
# character_books (id, book_id, character_id)

# -- SELECT
# -- FROM
# -- JOIN
# -- ON
# -- WHERE
# -- GROUP BY
# -- HAVING
# -- ORDER BY
# -- LIMIT

def select_books_titles_and_years_in_first_series_order_by_year
    "SELECT books.title, books.year
    FROM books
    JOIN series
    ON books.series_id = series.id
    WHERE books.series_id = 1
    ORDER BY books.year;"
end
# => [["Game of Thrones", 1996], ["A Clash of Kings", 1998], ["A Storm of Swords", 2000]]

def select_name_and_motto_of_char_with_longest_motto
    "SELECT characters.name, characters.motto
    FROM characters
    ORDER BY LENGTH(characters.motto) DESC LIMIT 1;"
end
# => [["Tyrion Lannister", "A Lannister always pays his debts"]]

def select_value_and_count_of_most_prolific_species
    "SELECT characters.species, COUNT(characters.species)
    FROM characters
    GROUP BY characters.species
    ORDER BY COUNT(characters.species) DESC LIMIT 1;"
end
# => [["human", 4]]

def select_name_and_series_subgenres_of_authors
    "SELECT authors.name, subgenres.name
    FROM authors
    JOIN series
    ON authors.id = series.author_id
    JOIN subgenres
    ON subgenres.id = series.subgenre_id;"
end
# => [["George R. R. Martin", "medieval"], ["Second Author", "space opera"]]

def select_series_title_with_most_human_characters
    "SELECT series.title
    FROM series
    JOIN characters
    ON series.id = characters.series_id
    WHERE characters.species = 'human'
    GROUP BY series.title
    ORDER BY COUNT(characters.species) DESC LIMIT 1;"
end
# => [["A Song of Ice and Fire"]]

def select_character_names_and_number_of_books_they_are_in
    "SELECT characters.name, COUNT(books.title)
    FROM characters
    JOIN character_books
    ON characters.id = character_books.character_id
    JOIN books
    ON books.id = character_books.book_id
    GROUP BY characters.name
    ORDER BY COUNT(books.title) DESC;"
end
# =>[["Character Three", 3], ["Character Two", 3], ["Daenerys Targaryen", 3], ["Tyrion Lannister", 3],
#   ["Character Four", 1], ["Character One", 1], ["Eddard Stark", 1], ["Lady", 1]]

# Could not use lines below for second join....ask why.
# JOIN character_books
# ON character_books.book_id = books.id



# series (id, title, author_id, subgenre_id)
# (1, "A Song of Ice and Fire", 1, 1),
# (2, "Second Series", 2, 2);
#
# subgenres (id, name)
# (1, "medieval"),
# (2, "space opera");
#
# authors (id, name)
# (1, "George R. R. Martin"),
# (2, "Second Author");
#
# books (id, title, year, series_id)
# (1, "Game of Thrones", 1996, 1),
# (2, "A Clash of Kings", 1998, 1),
# (3, "A Storm of Swords", 2000, 1),
# (4, "First Book", 2002, 2),
# (5, "Second Book", 2003, 2),
# (6, "Third Book", 2005, 2);
#
# characters (id, name, motto, species, author_id, series_id)
# (1, "Lady", "Woof Woof", "direwolf", 1, 1),
# (2, "Tyrion Lannister", "A Lannister always pays his debts", "human", 1, 1),
# (3, "Daenerys Targaryen", "If I look back I am lost", "human", 1, 1),
# (4, "Eddard Stark", "Winter is coming", "human", 1, 1);
#
# characters (id, name, motto, species, author_id, series_id)
# (5, "Character One", "motto one", "cylon", 2, 2),
# (6, "Character Two", "motto two", "human", 2, 2),
# (7, "Character Three", "motto three", "cylon", 2, 2),
# (8, "Character Four", "motto four", "cylon", 2, 2);
#
# character_books (id, book_id, character_id)
# (1, 1, 1),
# (2, 1, 2),
# (3, 2, 2),
# (4, 3, 2),
# (5, 1, 3),
# (6, 2, 3),
# (7, 3, 3),
# (8, 1, 4);
#
# character_books (id, book_id, character_id)
# (9, 4, 5),
# (10, 4, 6),
# (11, 5, 6),
# (12, 6, 6),
# (13, 4, 7),
# (14, 5, 7),
# (15, 6, 7),
# (16, 4, 8);
