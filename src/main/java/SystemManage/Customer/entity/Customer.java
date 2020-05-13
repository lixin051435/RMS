package SystemManage.Customer.entity;

import SystemManage.Common.entity.BaseEntity;
import lombok.Data;

/**
 * 客户实体
 *
 */
@Data
public class Customer extends BaseEntity<Integer> {

    private String khno; // 客户编号 动态生成
    private String name; // 客户名称
    private String area; // 客户地区
    private String cusManager; // 客户经理
    private String level; // 客户等级
    private String myd; // 客户满意度
    private String xyd; // 客户信用度
    private String address; // 客户地址
    private String postCode; // 邮政编码
    private String phone; // 联系电话
    private String fax; // 传真
    private String webSite; // 网址
    private String yyzzzch; // 营业执照注册号
    private String fr; // 法人
    private String zczj; // 注册资金(万元)
    private String nyye; // 年营业额
    private String khyh; // 开户银行
    private String khzh; // 开户帐号
    private String dsdjh; // 地税登记号
    private String gsdjh; // 国税登记号
    private int state; // 客户状态 0 正常  1 客户流失


}