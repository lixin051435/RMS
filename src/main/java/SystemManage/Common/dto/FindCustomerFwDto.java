package SystemManage.Common.dto;

import SystemManage.Customer.entity.CustomerFw;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author linSir
 * @version V1.0
 * @Description: (用一句话描述该文件做什么)
 * @Date 2020/1/10 20:50
 */
@Data
public class FindCustomerFwDto {
    //服务类型
    List<String> serveType = new ArrayList<String>();
    //客户服务分析实体
    List<CustomerFw> customerFw = new ArrayList<CustomerFw>();
    //数据模型
    List<EchartsDto> echartsDto = new ArrayList<EchartsDto>();
}
