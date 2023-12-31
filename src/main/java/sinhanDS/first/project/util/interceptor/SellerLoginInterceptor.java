package sinhanDS.first.project.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import sinhanDS.first.project.seller.vo.SellerVO;


public class SellerLoginInterceptor  implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, 
							HttpServletResponse response, 
							Object handler)
							throws Exception {
		HttpSession sess = request.getSession();
		SellerVO login = (SellerVO)sess.getAttribute("sellerLoginInfo");
		if (login == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 후 사용가능합니다.');");
			out.print("location.href='/seller/login.do';");
			out.print("</script>");
			out.close();
			return false;
		}
		return true;
	}
}
