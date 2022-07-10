package pl.umcs.library.service.implementation;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.umcs.library.entity.Author;
import pl.umcs.library.repository.AuthorDAO;
import pl.umcs.library.service.AuthorService;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AuthorServiceImpl implements AuthorService {

    private final AuthorDAO authorDAO;

    @Override
    public List<Author> getAuthors() {
        return authorDAO.findAll();
    }

    @Override
    public void saveAuthor(Author author) {
        authorDAO.save(author);
    }

    @Override
    public Author getAuthor(Long authorId) {
        return authorDAO.findById(authorId).orElse(null);
    }

    @Override
    public void deleteAuthor(Long authorId) {
        authorDAO.deleteById(authorId);
    }

}
