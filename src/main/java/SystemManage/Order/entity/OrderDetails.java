package SystemManage.Order.entity;

import SystemManage.Common.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

/**
 * 订单购买商品
 *
 * @author linSir
 */
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
@Data
public class OrderDetails extends BaseEntity<Integer> {

    private Order order; // 所属订单
    private String goodsName; // 商品名称
    private int goodsNum; // 商品数量
    private String unit; // 单位
    private float price; // 价格
    private float sum; // 总金额


}
