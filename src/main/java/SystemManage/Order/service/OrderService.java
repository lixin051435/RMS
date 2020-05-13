package SystemManage.Order.service;


import SystemManage.Order.dao.OrderDao;
import SystemManage.Order.entity.Order;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 订单Service实现类
 *
 * @author Administrator
 */
@Service("orderService")
public class OrderService {

    @Resource
    private OrderDao orderDao;

  
    public List<Order> findOrder(Map<String, Object> map, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        return orderDao.findOrder(map);
    }

  
    public Long getTotalOrder(Map<String, Object> map) {
        return orderDao.getTotalOrder(map);
    }

  
    public Order findById(Integer id) {
        return orderDao.findById(id);
    }

}
