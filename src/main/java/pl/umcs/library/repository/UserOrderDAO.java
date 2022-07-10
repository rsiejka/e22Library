package pl.umcs.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pl.umcs.library.entity.UserOrder;
import pl.umcs.library.enumerate.OrderStatus;

import java.util.List;

@Repository
public interface UserOrderDAO extends JpaRepository<UserOrder, Long> {

    @Query("select distinct o from UserOrder o left join fetch o.books " +
            "where o.user.username=:username order by o.creationTimestamp desc")
    List<UserOrder> findUserOrdersByUsername(String username);

    @Modifying
    @Transactional
    @Query("update UserOrder set status = :orderStatus where id = :id")
    void updateOrderStatusById(Integer id, OrderStatus orderStatus);

}
