package pl.umcs.library.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.umcs.library.entity.Book;
import pl.umcs.library.service.AuthorService;
import pl.umcs.library.service.BookService;
import pl.umcs.library.service.CategoryService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/books")
public class BookController {

    private final AuthorService authorService;
    private final BookService bookService;
    private final CategoryService categoryService;

    @GetMapping("/list")
    public String listBooks(Model model) {
        model.addAttribute("books", bookService.getBooks());
        return "bookslist";
    }

    @GetMapping("/formadd")
    public String addForm(Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("authors", authorService.getAuthors());
        model.addAttribute("categories", categoryService.getCategories());
        return "addbookform";
    }

    @PostMapping("/saveBook")
    public String saveBook(@ModelAttribute("book") Book book) {
        bookService.saveBook(book);
        return "redirect:/books/list";
    }

    @GetMapping("/updateBookForm")
    public String updateBookForm(@RequestParam("bookId") Long bookId, Model model) {
        model.addAttribute("book", bookService.getBook(bookId));
        model.addAttribute("authors", authorService.getAuthors());
        model.addAttribute("categories", categoryService.getCategories());
        return "addbookform";
    }

    @GetMapping("/deleteBookForm")
    public String deleteBookForm() {
        return "delete";
    }

    @PostMapping("/deleteBookForm")
    public String deleteBook(@RequestParam("bookId") Long bookId) {
        bookService.deleteBook(bookId);
        return "redirect:/books/list";
    }
}
