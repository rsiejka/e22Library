package pl.umcs.library.configuration;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception{
        http.authorizeRequests()
                .antMatchers("/authors/*").hasRole("ADMIN")
                .antMatchers("/cart").hasRole("USER")
                .antMatchers("/books/*").hasAnyRole("USER", "ADMIN")
                .antMatchers("/categories/*").hasRole("ADMIN")
                .antMatchers("/orders/*").hasAnyRole("ADMIN", "USER")
                .antMatchers("/orders").hasAnyRole("ADMIN", "USER")
                .antMatchers("/adminregister").hasRole("ADMIN")
                .and()
                .formLogin().permitAll()
                .and()
                .logout().permitAll();
    }
}