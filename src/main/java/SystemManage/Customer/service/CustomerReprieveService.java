package SystemManage.Customer.service;

import SystemManage.Customer.dao.CustomerReprieveDao;
import SystemManage.Customer.entity.CustomerReprieve;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 客户流失暂缓措施Service接口实现类
 * @author Administrator
 *
 */
@Service("customerReprieveService")
public class CustomerReprieveService {

	@Resource
	private CustomerReprieveDao customerReprieveDao;
	
	
	public List<CustomerReprieve> findCustomerReprieve(Map<String, Object> map) {
		return customerReprieveDao.findCustomerReprieve(map);
	}

	
	public Long getTotalCustomerReprieve(Map<String, Object> map) {
		return customerReprieveDao.getTotalCustomerReprieve(map);
	}

	
	public int addCustomerReprieve(CustomerReprieve customerReprieve) {
		return customerReprieveDao.addCustomerReprieve(customerReprieve);
	}

	
	public int updateCustomerReprieve(CustomerReprieve customerReprieve) {
		return customerReprieveDao.updateCustomerReprieve(customerReprieve);
	}

	
	public int deleteCustomerReprieve(Integer id) {
		return customerReprieveDao.deleteCustomerReprieve(id);
	}

}
