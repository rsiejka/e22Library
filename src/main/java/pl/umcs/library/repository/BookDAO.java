package pl.umcs.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.umcs.library.entity.Book;

@Repository
public interface BookDAO extends JpaRepository<Book, Long> {
}
