package SystemManage.Customer.dao;




import SystemManage.Customer.entity.CustomerService;

import java.util.List;
import java.util.Map;


/**
 * 客户服务Dao接口
 * @author Administrator
 *
 */
public interface CustomerServiceDao {

	/**
	 * 查询客户服务
	 * @param map
	 * @return
	 */
	public List<CustomerService> findCustomerService(Map<String, Object> map);

	/**
	 * 查询客户服务记录数
	 * @param map
	 * @return
	 */
	public Long getTotalCustomerService(Map<String, Object> map);
	
	/**
	 * 添加客户服务
	 * @param customerService
	 * @return
	 */
	public int addCustomerService(CustomerService customerService);
	
	/**
	 * 修改客户服务
	 * @param customerService
	 * @return
	 */
	public int updateCustomerService(CustomerService customerService);
	
	/**
	 * 删除客户服务
	 * @param id
	 * @return
	 */
	public int deleteCustomerService(Integer id);
	
	/**
	 * 通过ID查找实体
	 * @param id
	 * @return
	 */
	public CustomerService findById(Integer id);
	
	
}
