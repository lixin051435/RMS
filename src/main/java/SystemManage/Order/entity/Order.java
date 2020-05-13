package SystemManage.Order.entity;

import SystemManage.Common.entity.BaseEntity;
import SystemManage.Customer.entity.Customer;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.Date;

/**
 * 订单实体
 *
 * @author linSir
 */
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
@Data
public class Order extends BaseEntity<Integer> {

    private Customer customer; // 所属客户
    private String orderNo; // 订单号
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date orderDate; // 订购日期
    private String address; // 送货地址
    private int state; // 状态 0 未回款 2 已回款


}
