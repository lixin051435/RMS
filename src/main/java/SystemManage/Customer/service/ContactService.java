package SystemManage.Customer.service;

import SystemManage.Customer.dao.ContactDao;
import SystemManage.Customer.entity.Contact;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 联系人Service实现类
 * @author Administrator
 *
 */
@Service("contactService")
public class ContactService {

	@Resource
	private ContactDao contactDao;
	
	
	public List<Contact> findContact(Map<String, Object> map) {
		return contactDao.findContact(map);
	}

	
	public Long getTotalContact(Map<String, Object> map) {
		return contactDao.getTotalContact(map);
	}

	
	public int addContact(Contact contact) {
		return contactDao.addContact(contact);
	}

	
	public int updateContact(Contact contact) {
		return contactDao.updateContact(contact);
	}

	
	public int deleteContact(Integer id) {
		return contactDao.deleteContact(id);
	}

	
	public Contact findById(Integer id) {
		return contactDao.findById(id);
	}

}
