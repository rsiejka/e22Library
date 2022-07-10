package pl.umcs.library.service;


import pl.umcs.library.entity.UserOrder;

import java.util.List;

public interface UserOrderService {

    List<UserOrder> getUserOrders();

    List<UserOrder> getUserOrders(String username);

    void saveUserOrder(UserOrder order);

    void completeUserOrder(Long orderId);

}
