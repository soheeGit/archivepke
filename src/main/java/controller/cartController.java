package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.ServletConfig;
import cart.Cart;
import cart.CartDAO;


/**
 * Servlet implementation class cartController
 */
@WebServlet("/cControl")
public class cartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Cart cart;
	CartDAO dao;
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		cart = new Cart();
		dao = new CartDAO();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String mId = (String)request.getSession().getAttribute("mId");
		String view = "";
		cart=dao.selectBymId(mId);
		if(mId.equals(cart.getmId())){
			view = listMember(request, response);
			getServletContext().getRequestDispatcher("/cart/"+view)
			.forward(request, response);
		}
	}
	public String listMember(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("carts", dao.getAll((String)request.getSession().getAttribute("mId")));
		return "cart.jsp";
	}
}
