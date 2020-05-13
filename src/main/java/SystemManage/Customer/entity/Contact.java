package SystemManage.Customer.entity;

import SystemManage.Common.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.Date;

/**
 * 交往记录
 * @author linSir
 */
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
@Data
public class Contact extends BaseEntity<Integer> {

    private Customer customer; // 所属客户
    private Date contactTime; // 交往时间
    private String address; // 交往地点
    private String overView; // 概要


}