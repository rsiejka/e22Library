package pl.umcs.library.service.implementation;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.umcs.library.entity.Category;
import pl.umcs.library.repository.CategoryDAO;
import pl.umcs.library.service.CategoryService;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    private final CategoryDAO categoryDAO;

    @Override
    public List<Category> getCategories() {
        return categoryDAO.findAll();
    }

    @Override
    public void saveCategory(Category category) {
        categoryDAO.save(category);
    }

    @Override
    public Category getCategory(Long categoryId) {
        return categoryDAO.findById(categoryId).orElse(null);
    }

    @Override
    public void deleteCategory(Long categoryId) {
        categoryDAO.deleteById(categoryId);
    }

}
