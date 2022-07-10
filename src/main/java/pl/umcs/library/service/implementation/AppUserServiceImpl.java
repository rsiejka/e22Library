package pl.umcs.library.service.implementation;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pl.umcs.library.entity.AppUser;
import pl.umcs.library.repository.AppUserDAO;
import pl.umcs.library.service.AppUserService;

@Service
@RequiredArgsConstructor
public class AppUserServiceImpl implements AppUserService {

    private final AppUserDAO userDAO;
    private final PasswordEncoder passwordEncoder;

    @Override
    public void saveUser(AppUser user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userDAO.save(user);
    }

    @Override
    public AppUser getUser(String username) {
        return userDAO.findAppUserByUsername(username);
    }

}
