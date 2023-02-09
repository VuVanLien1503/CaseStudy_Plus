package controller.product;

import model.product.Category;
import service.IMPL.product.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CategoryServlet", value = "/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    private final CategoryService categoryService;

    public CategoryServlet() {
        categoryService = new CategoryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "insert":
                insertForm(request,response);
                break;
            default:
                showListCategory(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "insert":
                insert(request,response);
                break;
            default:
                showListCategory(request,response);
        }
    }
    private void showListCategory(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/category/list.jsp");
        request.setAttribute("categories", categoryService.selectAll());
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void insertForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher= request.getRequestDispatcher("views/category/insert.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void insert(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        categoryService.insert(new Category(name));
        try {
            response.sendRedirect("/CategoryServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
