package pl.umcs.library.service;

import pl.umcs.library.entity.Category;

import java.util.List;

public interface CategoryService {

    List<Category> getCategories();

    void saveCategory(Category category);

    Category getCategory(Long categoryId);

    void deleteCategory(Long categoryId);

}
