package SystemManage.Product.entity;

import SystemManage.Common.entity.BaseEntity;
import lombok.Data;

/**
 * 产品实体
 *
 * @author Administrator
 */
@Data
public class Product extends BaseEntity<Integer> {

    private String productName; // 产品名称
    private String model; // 型号
    private String unit; // 单位
    private Float price; // 价格
    private Integer store; // 库存
    private String remark; // 备注


}
