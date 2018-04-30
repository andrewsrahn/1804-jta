import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.bank.model.Product;
import com.bank.model.User;
import com.bank.service.ProductService;
import com.bank.service.UserService;

public class junit {

	User user = new User();
	Product product = new Product();
	
	@Test
	public void testUserInsertion() {
		user = new User("Firstname", "Lastname", "Password");
		assertTrue(UserService.insertUser(user));
	}

	@Test
	public void testProductInsertion() {
		product = new Product("Twinkies", .59, 200);
		assertTrue(ProductService.insertProduct(product));
	}
	
	@Test
	public void testProductRetrieval(){
		for (Product p : ProductService.getAllProducts()) {
			System.out.println(p);
		}		
	}

}
