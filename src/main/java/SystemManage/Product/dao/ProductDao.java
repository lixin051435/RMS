package SystemManage.Product.dao;



import SystemManage.Product.entity.Product;

import java.util.List;
import java.util.Map;

/**
 * 产品Dao接口
 * @author Administrator
 *
 */
public interface ProductDao {

	/**
	 * 查询产品
	 * @param map
	 * @return
	 */
	public List<Product> findProduct(Map<String, Object> map);

	/**
	 * 查询产品记录数
	 * @param map
	 * @return
	 */
	public Long getTotalProduct(Map<String, Object> map);
	
	
}
