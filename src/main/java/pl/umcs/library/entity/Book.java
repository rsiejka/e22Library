package pl.umcs.library.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Getter
@Setter
@Entity
@NoArgsConstructor
public class Book {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "publisher")
    private String publisher;

    @Column(name = "price")
    private BigDecimal price;

    @ManyToMany
    @JoinTable(
            name = "authors_books",
            joinColumns = @JoinColumn(name = "book_id"),
            inverseJoinColumns = @JoinColumn(name = "author_id")
    )
    private Set<Author> authors = new HashSet<>();

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToMany(mappedBy = "books", cascade = CascadeType.ALL)
    private Set<UserOrder> orders = new HashSet<>();

    public Book(String name, String publisher, BigDecimal price) {
        this.name = name;
        this.publisher = publisher;
        this.price = price;
    }

    public void addAuthor(Author author) {
        authors.add(author);
        author.addBook(this);
    }

    public void removeAuthor(Author author) {
        if (authors.remove(author)) {
            author.removeBook(this);
        }
    }

    public void addOrder(UserOrder order) {
        orders.add(order);
    }

    public void removeOrder(UserOrder order) {
        orders.remove(order);
    }

    public String authorsToString() {
        return Optional.ofNullable(authors)
                .map(a -> a.toString().replaceAll("^\\[", "").replaceAll("]$", ""))
                .orElse("");
    }

    public String toText() {
        return ">>> tytuł: " + name +
                ", autorzy: " + authorsToString() +
                ", kategoria: " + category +
                ", wydawnictwo: " + publisher +
                ", cena: " + price;
    }

    @Override
    public String toString() {
        return name;
    }

}
