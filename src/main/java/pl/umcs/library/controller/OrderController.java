package pl.umcs.library.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.umcs.library.entity.UserOrder;
import pl.umcs.library.service.BookService;
import pl.umcs.library.service.UserOrderService;
import pl.umcs.library.session.Cart;
import pl.umcs.library.repository.AppUserDAO;

import java.util.HashSet;

import static pl.umcs.library.enumerate.OrderStatus.ORDERED;

@Controller
@RequiredArgsConstructor
@RequestMapping("/orders")
public class OrderController {

    private final Cart cart;
    private final BookService bookService;
    private final UserOrderService orderService;
    private final AppUserDAO appUserDAO;

    @GetMapping
    public String listOrders(Model model, Authentication authentication) {
        if (isAdmin(authentication)) {
            model.addAttribute("orders", orderService.getUserOrders());
        } else {
            model.addAttribute("orders", orderService.getUserOrders(authentication.getName()));
        }
        return "orders";
    }

    @PostMapping
    public String saveOrder(Authentication authentication){
        UserOrder order = new UserOrder();
        order.setStatus(ORDERED);
        order.setUser(appUserDAO.findAppUserByUsername(authentication.getName()));
        order.setBooks(new HashSet<>(bookService.getBooks(cart.getBookIds())));
        orderService.saveUserOrder(order);
        cart.getBookIds().clear();
        return "redirect:/orders";
    }

    @PostMapping("/complete")
    public String completeOrder(@RequestParam(name = "orderId") Long id) {
        orderService.completeUserOrder(id);
        return "redirect:/orders";
    }

    private boolean isAdmin(Authentication authentication) {
        return authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .anyMatch("ROLE_ADMIN"::equals);
    }

}
