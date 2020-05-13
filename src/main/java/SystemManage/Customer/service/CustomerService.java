package SystemManage.Customer.service;

import SystemManage.Customer.dao.CustomerDao;
import SystemManage.Customer.dao.CustomerLossDao;
import SystemManage.Customer.entity.*;
import SystemManage.Order.dao.OrderDao;
import SystemManage.Order.entity.Order;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 客户Service实现类
 *
 * @author Administrator
 */
@Service("customerService")
public class CustomerService {

    @Resource
    private CustomerDao customerDao;

    @Resource
    private CustomerLossDao customerLossDao;

    @Resource
    private OrderDao orderDao;


    public List<Customer> findCustomer(Map<String, Object> map, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        return customerDao.findCustomer(map);
    }


    public Long getTotalCustomer(Map<String, Object> map) {
        return customerDao.getTotalCustomer(map);
    }


    public int addCustomer(Customer customer) {
        return customerDao.addCustomer(customer);
    }


    public int updateCustomer(Customer customer) {
        return customerDao.updateCustomer(customer);
    }


    public int deleteCustomer(Integer id) {
        return customerDao.deleteCustomer(id);
    }


    public Customer findById(Integer id) {
        return customerDao.findById(id);
    }


    public void checkCustomerLoss() {
        List<Customer> customerList = customerDao.findLossCustomer(); // 查找流失客户
        for (Customer c : customerList) {
            CustomerLoss customerLoss = new CustomerLoss(); // 定义客户流失实体
            customerLoss.setCusNo(c.getKhno()); // 客户编号
            customerLoss.setCusName(c.getName()); // 客户名称
            customerLoss.setCusManager(c.getCusManager()); // 客户经理
            Order order = orderDao.findLastByCusId(c.getId()); // 查找指定客户最近的订单
            customerLoss.setLastOrderTime(order.getOrderDate()); // 设置最近的下单时间
            customerLossDao.addCustomerLoss(customerLoss); // 添加到客户流失表
        }
    }


    public List<CustomerGx> findCutomerGx(Map<String, Object> map, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        return customerDao.findCutomerGx(map);
    }


    public Long getTotalCustomerGx(Map<String, Object> map) {
        return customerDao.getTotalCustomerGx(map);
    }


    public List<CustomerGc> findCustomerGc() {
        return customerDao.findCustomerGc();
    }


    public List<CustomerFw> findCustomerFw() {
        return customerDao.findCustomerFw();
    }

}
