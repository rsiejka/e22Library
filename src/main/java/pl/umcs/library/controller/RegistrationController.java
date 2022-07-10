package pl.umcs.library.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.umcs.library.entity.AppUser;
import pl.umcs.library.entity.Authority;
import pl.umcs.library.service.AppUserService;

@Controller
@RequiredArgsConstructor
public class RegistrationController {

    private final AppUserService userService;

    @GetMapping(value = {"/register", "/adminregister"})
    public String registerForm(Model model) {
        model.addAttribute("user", new AppUser());
        return "register";
    }

    @PostMapping("/register")
    public String saveUser(@ModelAttribute("user") AppUser user, Model model) {
        String info = info(user);
        if (!info.isEmpty()) {
            model.addAttribute("info", info);
            return "register";
        }
        user.getAuthorities().add(new Authority(user, "ROLE_USER"));
        user.setEnabled(Boolean.FALSE);
        userService.saveUser(user);
        return "redirect:/login";
    }

    @PostMapping("/adminregister")
    public String saveAdmin(@ModelAttribute("user") AppUser user, Model model) {
        String info = info(user);
        if (!info.isEmpty()) {
            model.addAttribute("info", info);
            return "register";
        }
        user.getAuthorities().add(new Authority(user, "ROLE_ADMIN"));
        user.setEnabled(Boolean.TRUE);
        userService.saveUser(user);
        return "redirect:/login";
    }

    private String info(AppUser user) {
        if (userService.getUser(user.getUsername()) != null) {
            return "użytkownik o takiej nazwie istnieje";
        } else if (user.getUsername().isEmpty() || user.getPassword().isEmpty()) {
            return "wypełnij wszystkie pola";
        }
        return "";
    }

}
