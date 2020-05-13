package SystemManage.Common.dto;

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
public class FindCustomerGcDto {
    //客户等级
    List<String> customerLevel = new ArrayList<String>();
    //客户数量
    List<Integer> customerNum = new ArrayList<Integer>();
}
