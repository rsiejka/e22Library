package pl.umcs.library.service;

import pl.umcs.library.entity.AppUser;

public interface AppUserService {

    void saveUser(AppUser user);

    AppUser getUser(String username);

}
