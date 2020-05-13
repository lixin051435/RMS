package SystemManage.Customer.service;

import SystemManage.Customer.dao.LinkManDao;
import SystemManage.Customer.entity.LinkMan;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 联系人Service实现类
 * @author Administrator
 *
 */
@Service("linkManService")
public class LinkManService  {

	@Resource
	private LinkManDao linkManDao;
	
	
	public List<LinkMan> findLinkMan(Map<String, Object> map) {
		return linkManDao.findLinkMan(map);
	}

	
	public Long getTotalLinkMan(Map<String, Object> map) {
		return linkManDao.getTotalLinkMan(map);
	}

	
	public int addLinkMan(LinkMan cusDevPlan) {
		return linkManDao.addLinkMan(cusDevPlan);
	}

	
	public int updateLinkMan(LinkMan cusDevPlan) {
		return linkManDao.updateLinkMan(cusDevPlan);
	}

	
	public int deleteLinkMan(Integer id) {
		return linkManDao.deleteLinkMan(id);
	}

	
	public LinkMan findById(Integer id) {
		return linkManDao.findById(id);
	}

}
