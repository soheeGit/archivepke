package controller;

import java.io.IOException;
import org.apache.commons.beanutils.BeanUtils;

import product.Product;
import product.ProductDAO;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class productController
 */
@WebServlet("/pControl")
public class productController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Product product;
	ProductDAO dao;
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		dao = new ProductDAO();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String view = "";
		if(action == null) {
			getServletContext().getRequestDispatcher("/pControl?action=list")
			.forward(request, response);
		}else{
			switch(action) {
			case "list": view = list(request, response); break;
			case "listMember": view = listMember(request, response); break;
			}
			getServletContext().getRequestDispatcher("/product/"+view)
			.forward(request, response);
		}
	}
	public String listMember(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("products", dao.getAll());
		return "product_member.jsp";
	}
	public String list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("products", dao.getAll());
		return "product.jsp";
	}
}
