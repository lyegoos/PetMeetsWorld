package seller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { sinhanDS.first.project.config.MvcConfig.class })
@WebAppConfiguration
public class regist {
	@Autowired
	WebApplicationContext ctx;
	MockMvc mock;

	@Before
	public void before() {
		mock = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	/* 왜 안되나... */
	@Test
	@Transactional
	public void regist_product() throws Exception {
		System.out.println("상품등록 시작 ");
		RequestBuilder req = MockMvcRequestBuilders.post("/seller/product/regist.do").param("seller_no", "1").param("name", "테스트로만든상품")
				.param("price", "10001").param("stock", "50").param("category1_list", "0").param("category2_list", "1")
				.param("category1_list", "0").param("category2_list", "2").param("category1_list", "2")
				.param("category2_list", "1").param("company", "daehanminguk").param("brand", "jeju")
				.param("title_list", "사이즈").param("content_list", "small").param("price_list", "500")
				.param("title_list", "사이즈").param("content_list", "middle").param("price_list", "1000")
				.param("title_list", "사이즈").param("content_list", "large").param("price_list", "2000")
				.param("discount", "0")
//				.param("image_url", "")
				.param("description", "");

		mock.perform(req);

	}

//	@Test
//	public void regist_product_zero_option() throws Exception {
//		RequestBuilder req = MockMvcRequestBuilders.post("/seller/product/regist.do").param("seller_no", "1")
//				.param("name", "테스트로만든상품").param("price", "10001").param("stock", "50").param("category1_list", "0")
//				.param("category2_list", "1").param("category1_list", "0").param("category2_list", "2")
//				.param("category1_list", "2").param("category2_list", "1").param("company", "daehanminguk")
//				.param("brand", "jeju").param("discount", "0")
////				.param("image_url", "")
//				.param("description", "");
//
//		mock.perform(req);
//	}

}