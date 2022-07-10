package pl.umcs.library.session;

import lombok.Getter;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

import java.util.HashSet;
import java.util.Set;

@Getter
@Component
@SessionScope
public class Cart {

    private final Set<Long> bookIds = new HashSet<>();

    public void addBookId(Long id) {
        bookIds.add(id);
    }

    public void deleteBookId(Long id) {
        bookIds.remove(id);
    }
}
