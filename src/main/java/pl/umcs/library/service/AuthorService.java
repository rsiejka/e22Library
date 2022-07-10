package pl.umcs.library.service;

import pl.umcs.library.entity.Author;

import java.util.List;

public interface AuthorService {

    List<Author> getAuthors();

    void saveAuthor(Author author);

    Author getAuthor(Long authorId);

    void deleteAuthor(Long authorId);

}
