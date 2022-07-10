package pl.umcs.library.service;

import pl.umcs.library.entity.Book;

import java.util.List;
import java.util.Set;

public interface BookService {

    List<Book> getBooks();

    List<Book> getBooks(Set<Long> ids);

    void saveBook(Book book);

    Book getBook(Long bookId);

    void deleteBook(Long bookId);

}
