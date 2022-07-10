package pl.umcs.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.umcs.library.entity.AppUser;


@Repository
public interface AppUserDAO extends JpaRepository<AppUser, Long> {

    AppUser findAppUserByUsername(String username);

}
