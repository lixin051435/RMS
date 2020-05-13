package SystemManage.Customer.service;

import SystemManage.Customer.dao.CustomerLossDao;
import SystemManage.Customer.entity.CustomerLoss;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 客户流失Service实现类
 *
 * @author Administrator
 */
@Service("customerLossService")
public class CustomerLossService {

    @Resource
    private CustomerLossDao customerLossDao;


    public List<CustomerLoss> findCustomerLoss(Map<String, Object> map, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        return customerLossDao.findCustomerLoss(map);
    }


    public Long getTotalCutomerLoss(Map<String, Object> map) {
        return customerLossDao.getTotalCutomerLoss(map);
    }


    public CustomerLoss findById(Integer id) {
        return customerLossDao.findById(id);
    }


    public int updateCustomerLoss(CustomerLoss customerLoss) {
        return customerLossDao.updateCustomerLoss(customerLoss);
    }


    public int addCustomerLoss(CustomerLoss customerLoss) {
        customerLoss.setState(1);
        customerLoss.setCusNo(UUID.randomUUID().toString());
        return customerLossDao.addCustomerLoss(customerLoss);
    }
}
