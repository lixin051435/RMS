package SystemManage.Product.service;

import SystemManage.Product.dao.ProductDao;
import SystemManage.Product.entity.Product;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 产品Service实现类
 *
 * @author Administrator
 */
@Service("productService")
public class ProductService {

    @Autowired
    private ProductDao productDao;

    public List<Product> findProduct(Map<String, Object> map, Integer page, Integer limit) {
        //引入分页
        PageHelper.startPage(page, limit);
        return productDao.findProduct(map);
    }

    public Long getTotalProduct(Map<String, Object> map) {
        return productDao.getTotalProduct(map);
    }


}
