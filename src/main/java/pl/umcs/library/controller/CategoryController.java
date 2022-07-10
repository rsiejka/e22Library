package pl.umcs.library.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.umcs.library.entity.Category;
import pl.umcs.library.service.CategoryService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/categories")
public class CategoryController {

    private final CategoryService categoryService;

    @GetMapping("/list")
    public String listCategories(Model model) {
        model.addAttribute("categories", categoryService.getCategories());
        return "categorieslist";
    }

    @GetMapping("/formadd")
    public String addForm(Model model) {
        model.addAttribute("category", new Category());
        return "addcategoryform";
    }

    @PostMapping("/saveCategory")
    public String saveCategory(@ModelAttribute("category") Category category) {
        categoryService.saveCategory(category);
        return "redirect:/categories/list";
    }

    @GetMapping("/updateCategoryForm")
    public String updateCategoryForm(@RequestParam("categoryId") Long categoryId, Model model) {
        model.addAttribute("category", categoryService.getCategory(categoryId));
        return "addcategoryform";
    }

    @GetMapping("/deleteCategoryForm")
    public String deleteCategoryForm() {
        return "delete";
    }

    @PostMapping("/deleteCategoryForm")
    public String deleteCategory(@RequestParam("categoryId") Long categoryId) {
        categoryService.deleteCategory(categoryId);
        return "redirect:/categories/list";
    }

}
