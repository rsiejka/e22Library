package pl.umcs.library.service.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pl.umcs.library.entity.AppUser;
import pl.umcs.library.repository.AppUserDAO;

@Service
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    private AppUserDAO userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        AppUser user = userRepository.findAppUserByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException(username);
        }


        return new MyUserPrincipal(user);
    }


}