package pl.umcs.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.umcs.library.entity.Category;

@Repository
public interface CategoryDAO extends JpaRepository<Category, Long> {

    Category findCategoryById(Long id);

    void deleteCategoryById(Long id);
}
