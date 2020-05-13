package SystemManage.Customer.dao;


import SystemManage.Customer.entity.LinkMan;

import java.util.List;
import java.util.Map;

/**
 * 联系人Dao接口
 * @author Administrator
 *
 */
public interface LinkManDao {

	/**
	 * 查询联系人
	 * @param map
	 * @return
	 */
	public List<LinkMan> findLinkMan(Map<String, Object> map);

	/**
	 * 查询联系人记录数
	 * @param map
	 * @return
	 */
	public Long getTotalLinkMan(Map<String, Object> map);
	
	/**
	 * 添加联系人
	 * @param linkMan
	 * @return
	 */
	public int addLinkMan(LinkMan linkMan);
	
	/**
	 * 修改联系人
	 * @param linkMan
	 * @return
	 */
	public int updateLinkMan(LinkMan linkMan);
	
	/**
	 * 删除联系人
	 * @param id
	 * @return
	 */
	public int deleteLinkMan(Integer id);
	
	/**
	 * 通过id查找实体
	 * @param id
	 * @return
	 */
	public LinkMan findById(Integer id);
}
