package pl.umcs.library.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.umcs.library.entity.Author;
import pl.umcs.library.service.AuthorService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/authors")
public class AuthorController {

    private final AuthorService authorService;

    @GetMapping("/list")
    public String listAuthors(Model model) {
        model.addAttribute("authors", authorService.getAuthors());
        return "authorslist";
    }

    @GetMapping("/formadd")
    public String addForm(Model model) {
        model.addAttribute("author", new Author());
        return "addauthorform";
    }

    @PostMapping("/saveAuthor")
    public String saveAuthor(@ModelAttribute("author") Author author) {
        authorService.saveAuthor(author);
        return "redirect:/authors/list";
    }

    @GetMapping("/updateAuthorForm")
    public String updateAuthorForm(@RequestParam("authorId") Long authorId, Model model) {
        model.addAttribute("author", authorService.getAuthor(authorId));
        return "addauthorform";
    }

    @GetMapping("/deleteAuthorForm")
    public String deleteAuthorForm() {
        return "delete";
    }

    @PostMapping("/deleteAuthorForm")
    public String deleteAuthor(@RequestParam("authorId") Long authorId) {
        authorService.deleteAuthor(authorId);
        return "redirect:/authors/list";
    }

}
