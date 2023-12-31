package sinhanDS.first.project.admin;

import java.util.List;

import sinhanDS.first.project.admin.vo.SettlementVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.UserVO;

public interface AdminService {
	public List<UserVO> getUserList(ProductSearchVO svo);
	public List<SellerVO> getSellerList(ProductSearchVO svo);
	public List<ProductVO> getProductList(ProductSearchVO svo);
	public List<OrderMainVO> getOrderMainList(ProductSearchVO svo);
	public List<OrderDetailVO> getOrderDetailList(ProductSearchVO svo);
	public List<OrderDetailVO> getCancleAndRefound(ProductSearchVO svo);
	public List<OrderDetailVO> getNeedConfirmationList();
	public int getNumberOfUser(ProductSearchVO svo);
	public int getNumberOfSeller(ProductSearchVO svo);
	public int getNumberOfProduct(ProductSearchVO svo);
	public int getNumberOfOrderMain(ProductSearchVO svo);
	public int getNumberOfOrderDetail(ProductSearchVO svo);
	public int getNumberOfCancleAndRefound(ProductSearchVO svo);
	
	
	public void confirmOrderDetail(int[] no);
	
	public List<SettlementVO> getSettlementReqList();
	public List<SettlementVO> getSettlementComList();
	public boolean updateSettlement(int no);
	public boolean updateAllSettlement(List<Integer> list);
	
	public List<SellerVO> getWithdrawalSellerBeforeYear();
	public List<SellerVO> getWithdrawalSellerAfterYear();
	
	public void removeSeller(int seller_no);
	public void restoreSeller(int seller_no);
}
