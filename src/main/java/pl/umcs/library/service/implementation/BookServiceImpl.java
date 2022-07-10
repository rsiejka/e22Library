package pl.umcs.library.service.implementation;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.umcs.library.entity.Book;
import pl.umcs.library.repository.BookDAO;
import pl.umcs.library.service.BookService;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import static java.util.function.Predicate.not;

@Service
@RequiredArgsConstructor
public class BookServiceImpl implements BookService {

    private final BookDAO bookDAO;

    @Override
    public List<Book> getBooks() {
        return bookDAO.findAll();
    }

    @Override
    public List<Book> getBooks(Set<Long> ids) {
        return Optional.ofNullable(ids)
                .filter(not(Set::isEmpty))
                .map(bookDAO::findAllById)
                .orElseGet(Collections::emptyList);
    }

    @Override
    public void saveBook(Book book) {
        bookDAO.save(book);
    }

    @Override
    public Book getBook(Long bookId) {
        return bookDAO.findById(bookId).orElse(null);
    }

    @Override
    public void deleteBook(Long bookId) {
        bookDAO.deleteById(bookId);
    }

}
