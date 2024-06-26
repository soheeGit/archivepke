package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.Product;
import product.ProductDAO;

/**
 * Servlet implementation class productDetailController
 */
@WebServlet("/pdControl")
public class productDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	Product product;
	ProductDAO dao;
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		product = new Product();
		dao = new ProductDAO();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		int pId = Integer.parseInt(request.getParameter("pId"));
		String view = "";
		product=dao.selectById(pId);
		if(pId == product.getpId()){
			switch(action) {
			case "m": view = detailMember(request, response); break;
			case "nm": view = detail(request, response); break;
			}
			getServletContext().getRequestDispatcher("/product/"+view)
			.forward(request, response);
		}
	}
	public String detailMember(HttpServletRequest request, HttpServletResponse response) {
		int pId = Integer.parseInt(request.getParameter("pId"));
		request.setAttribute("products", dao.selectById(pId));
		return "productDetail_member.jsp";
	}
	public String detail(HttpServletRequest request, HttpServletResponse response) {
		int pId = Integer.parseInt(request.getParameter("pId"));
		request.setAttribute("products", dao.selectById(pId));
		return "productDetail.jsp";
	}
}
