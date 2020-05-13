package SystemManage.Customer.service;

import SystemManage.Customer.dao.CustomerServiceDao;
import SystemManage.Customer.entity.CustomerService;
import cn.hutool.core.util.ObjectUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import SystemManage.Customer.entity.CustomerService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 客户服务Service实现类
 *
 * @author Administrator
 */
@Service("customerServiceService")
public class CustomerServiceService {

    @Resource
    private CustomerServiceDao customerServiceDao;


    public List<CustomerService> findCustomerService(Map<String, Object> map, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        return customerServiceDao.findCustomerService(map);
    }


    public Long getTotalCustomerService(Map<String, Object> map) {
        return customerServiceDao.getTotalCustomerService(map);
    }


    public int addCustomerService(CustomerService customerService) {
        if (ObjectUtil.isNull(customerService)) {
            throw new RuntimeException("参数异常");
        }
        //封装默认值
        customerService.setState("新创建");
        return customerServiceDao.addCustomerService(customerService);
    }


    public int updateCustomerService(CustomerService customerService) {
        return customerServiceDao.updateCustomerService(customerService);
    }


    public int deleteCustomerService(Integer id) {
        if (id != null && id > 0) {
            return customerServiceDao.deleteCustomerService(id);
        }
        throw new RuntimeException("参数异常");
    }


    public CustomerService findById(Integer id) {
        return customerServiceDao.findById(id);
    }

}
