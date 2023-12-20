package sinhanDS.first.project.seller.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.delivery.vo.DeliveryVO;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;

@Mapper
public interface SellerOrderMapper {
	List<OrderDetailVO> getOrderNoList_bd(int no);
	List<OrderDetailVO> getOrderNoList_od(int no);
	List<OrderDetailVO> getOrderNoList_ad(int no);
	List<OrderDetailVO> getOrderNoList_rf(int no);
	
	List<OrderDetailVO> getOrderDetails(int no);
	List<OrderDetailVO> getOrderDetails_bd(Map map);
	List<OrderDetailVO> getOrderDetails_od(Map map);
	List<OrderDetailVO> getOrderDetails_ad(Map map);
	List<OrderDetailVO> getOrderDetails_rf(Map map);
	
	OrderMainVO getOrderMainList(int no);
	List<OrderDetailOptionVO> getOrderDetailOptionList(int no);
	
	int delivery_regist(DeliveryVO vo);
	int update_deliveryNo(OrderDetailVO vo);
	
	DeliveryVO getDeliveryVO(int no);
	
	int cancleOrder_seller(int no);
}
