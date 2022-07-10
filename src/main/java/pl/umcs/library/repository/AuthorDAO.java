package pl.umcs.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.umcs.library.entity.Author;

@Repository
public interface AuthorDAO extends JpaRepository<Author, Long> {
}
