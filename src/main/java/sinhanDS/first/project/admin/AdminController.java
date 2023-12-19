package sinhanDS.first.project.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.UserVO;


@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {
	@Autowired
	private AdminService service;
	
	@GetMapping("")
	public String index() {
		return "/admin/login";
	}
	@GetMapping("/")
	public String index2() {
		return "/admin/login";
	}
	@GetMapping("/index.do")
	public String index3() {
		return "/admin/login";
	}
	
	@PostMapping("/login.do")
	public String login(@RequestParam String id, @RequestParam String pwd, HttpSession sess) {
		if("admin".equals(id) && "admin".equals(pwd)) {
			sess.setAttribute("adminLoginInfo", "adminLoginInfo");
			log.debug("loginSession: " + (String)sess.getAttribute("adminLoginInfo"));
			
			sess.removeAttribute("sellerLoginInfo");
			sess.removeAttribute("userLoginInfo");
			
			return "redirect:/admin/userList.do"; 
		}
		return "/admin/login";
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession sess) {
		sess.removeAttribute("userLoginInfo");
		sess.removeAttribute("sellerLoginInfo");
		return "redirect:/admin/";
	}
	@GetMapping("userList.do")
	public String userList(Model model, ProductSearchVO svo) {
		svo.setNumberOfProductInPage(svo.getNumberInPage_UserVO());
		log.debug("review_svo: " + svo);
		int count = service.getNumberOfUser();
		int totalPage = count / svo.getNumberOfProductInPage();
		if(count % svo.getNumberOfProductInPage() > 0) totalPage++;
		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		
		int endPage = (int)(Math.ceil(svo.getPage()/(float)svo.getNumberOfPageInIndexList()) * svo.getNumberOfPageInIndexList());
		int startPage = endPage - (svo.getNumberOfPageInIndexList() - 1);
		if( endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1;
		boolean next = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
        
		List<UserVO> userlist = service.getUserList(svo);
		log.debug("list: " + userlist);
		
		model.addAttribute("list", userlist);
        model.addAttribute("paging", map);
        model.addAttribute("svo", svo);
		return "/admin/user/list";
	}
	
	@GetMapping("sellerList.do")
	public String sellerList(Model model, ProductSearchVO svo) {
		svo.setNumberOfProductInPage(svo.getNumberInPage_UserVO());
		log.debug("review_svo: " + svo);
		int count = service.getNumberOfSeller();
		int totalPage = count / svo.getNumberOfProductInPage();
		if(count % svo.getNumberOfProductInPage() > 0) totalPage++;
		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		
		int endPage = (int)(Math.ceil(svo.getPage()/(float)svo.getNumberOfPageInIndexList()) * svo.getNumberOfPageInIndexList());
		int startPage = endPage - (svo.getNumberOfPageInIndexList() - 1);
		if( endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1;
		boolean next = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
        
		List<SellerVO> sellerlist = service.getSellerList(svo);
		log.debug("list: " + sellerlist);
		
		model.addAttribute("list", sellerlist);
        model.addAttribute("paging", map);
        model.addAttribute("svo", svo);
		return "/admin/seller/list";
	}
	
	@GetMapping("goUser.do")
	public String goUser(HttpSession sess, UserVO vo) {
		sess.setAttribute("userLoginInfo", vo);
		log.debug("로그인세션체크: " + (UserVO)sess.getAttribute("userLoginInfo"));
		return "redirect:/user/edit.do";
	}
}
