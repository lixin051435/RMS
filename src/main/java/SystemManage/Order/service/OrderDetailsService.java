package SystemManage.Order.service;

import SystemManage.Order.dao.OrderDetailsDao;
import SystemManage.Order.entity.OrderDetails;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 订单详情Service实现类
 *
 * @author Administrator
 */
@Service("orderDetailsService")
public class OrderDetailsService {

    @Resource
    private OrderDetailsDao orderDetailsDao;

    
    public List<OrderDetails> findOrderDetails(Map<String, Object> map, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        return orderDetailsDao.findOrderDetails(map);
    }

    
    public Long getTotalOrderDetails(Map<String, Object> map) {
        return orderDetailsDao.getTotalOrderDetails(map);
    }

    
    public float getTotalPriceByOrderId(int orderId) {
        return orderDetailsDao.getTotalPriceByOrderId(orderId);
    }

}
