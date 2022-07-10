package pl.umcs.library.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.data.mapping.AccessOptions;
import pl.umcs.library.enumerate.OrderStatus;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import static java.math.BigDecimal.ZERO;
import static javax.persistence.EnumType.STRING;
import static javax.persistence.GenerationType.IDENTITY;
import static org.apache.commons.lang3.StringUtils.EMPTY;

@Getter
@Setter
@Entity
@NoArgsConstructor
public class UserOrder {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "price")
    private BigDecimal price;

    @Enumerated(STRING)
    @Column(name = "status")
    private OrderStatus status;

    @Column(name = "creation_timestamp")
    private LocalDateTime creationTimestamp;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private AppUser user;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "user_order_books",
            joinColumns = @JoinColumn(name = "order_id"),
            inverseJoinColumns = @JoinColumn(name = "book_id")
    )
    private Set<Book> books = new HashSet<>();


    public void setBooks(Set<Book> books) {
        this.books = books;
        price = books.stream().map(Book::getPrice).reduce(ZERO, BigDecimal::add);
    }

    public void addBook(Book book) {
        books.add(book);
        book.addOrder(this);
        price = price.add(book.getPrice());
    }

    public void removeBook(Book book) {
        if (books.remove(book)) {
            book.removeOrder(this);
            price = price.subtract(book.getPrice());
        }
    }

    public String booksToString() {
        return Optional.ofNullable(books)
                .map(b -> b.toString().replaceAll("^\\[", "").replaceAll("]$", ""))
                .orElse("");
    }

    public String timestampToString() {
        return Optional.ofNullable(creationTimestamp)
                .map(timestamp -> DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(timestamp))
                .orElse(EMPTY);
    }

}
