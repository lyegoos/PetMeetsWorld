package sinhanDS.first.project.user;

import java.util.List;

import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.user.vo.CartOptionVO;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.PaymentVO;
import sinhanDS.first.project.user.vo.SaveBoxVO;
import sinhanDS.first.project.user.vo.UserAddressVO;
import sinhanDS.first.project.user.vo.UserVO;

public interface UserService {
	UserVO login(UserVO vo);
	UserVO detail(UserVO vo);
	int edit(UserVO vo);
	int user_regist(UserVO vo);
	boolean check_password(UserVO vo);
	boolean initaddr_regist(UserAddressVO vo);
	boolean dupId(String id);
	
	List<UserAddressVO> exist_addr(UserVO vo);
	int insert_addr(UserAddressVO vo);
	int modify_addr(UserAddressVO vo);
	int delete_addr(int no);
	
	List<PaymentVO> exist_payment(UserVO vo);
	int insert_payment(PaymentVO vo);
	int modify_payment(PaymentVO vo);
	int delete_payment(int no);
	
	List<CartVO> exist_cart(UserVO vo);
	List<ProductVO> search_cart_product(List<CartVO> volist);
	List<List<CartOptionVO>> cart_option_number(List<CartVO> vo);
	List<List<ProductOptionVO>> get_product_option(List<List<CartOptionVO>> vo);
	
	int getNumberOfZZIMPage(ProductSearchVO svo);
	int getNumberOfReviewPage(ProductSearchVO svo);
	int getNumberOfWritableReviewPage(ProductSearchVO svo);
	
	List<SaveBoxVO> zzim_list (ProductSearchVO svo);
	List<UserVO> user_list (int user_no);
	List<ProductVO> product_list(int product_no);
	List<ProductVO> getProductListWithProductSearchVO(List<SaveBoxVO> zzim_list, ProductSearchVO svo);
	
	List<ReviewVO> review_list(ProductSearchVO svo);
	List<OrderDetailVO> order_detail(OrderDetailVO odvo);
	List<OrderDetailOptionVO> order_detail_option(OrderDetailOptionVO odovo);
	
	List<OrderDetailVO> possible_write_review(ProductSearchVO svo);
	List<String> product_image_list(List<OrderDetailVO> review_list);
	
	UserVO findId(UserVO vo);
	int findPwd(UserVO vo);
	
	int withdrawal(int userNo);
}
