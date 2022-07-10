package pl.umcs.library.service.implementation;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.umcs.library.entity.UserOrder;
import pl.umcs.library.enumerate.OrderStatus;
import pl.umcs.library.repository.UserOrderDAO;
import pl.umcs.library.service.UserOrderService;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserOrderServiceImpl implements UserOrderService {

    private final UserOrderDAO orderDAO;

    @Override
    public List<UserOrder> getUserOrders() {
        return orderDAO.findAll();
    }

    @Override
    public List<UserOrder> getUserOrders(String username) {
        return orderDAO.findUserOrdersByUsername(username);
    }

    @Override
    public void saveUserOrder(UserOrder order) {
        orderDAO.save(order);
    }

    @Override
    public void completeUserOrder(Long orderId) {

        int a = orderId.intValue();
        orderDAO.updateOrderStatusById(a, OrderStatus.FINISHED);

    }

}
