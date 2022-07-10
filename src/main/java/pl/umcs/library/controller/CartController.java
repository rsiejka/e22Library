package pl.umcs.library.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.umcs.library.entity.Book;
import pl.umcs.library.service.BookService;
import pl.umcs.library.session.Cart;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    private final Cart cart;
    private final BookService bookService;

    @GetMapping
    public String cart(Model model) {
        List<Book> books = bookService.getBooks(cart.getBookIds());
        log.info("Get books: {}", books);
        model.addAttribute("books", books);
        return "cart";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam(name = "bookId") Long id) {
        log.info("add book: {} to cart", id);
        cart.addBookId(id);
        return "redirect:/cart";
    }

    @PostMapping("/delete")
    public String deleteFromCart(@RequestParam(name = "bookId") Long id) {
        cart.deleteBookId(id);
        return "redirect:/cart";
    }

}
