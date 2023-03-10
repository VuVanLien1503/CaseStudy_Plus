package controller.product;

import model.product.Category;
import service.IMPL.product.CategoryService;
import service.MyRegex;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CategoryServlet", value = "/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    private final CategoryService categoryService;
    public MyRegex myRegex = new MyRegex();

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
                insertForm(request, response);
                break;
            case "edit":
                updateForm(request, response);
                break;
            case "delete":
                deleteForm(request, response);
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
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "insert":
                insert(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                showListCategory(request, response);
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/category/insert.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = null;
        String name = request.getParameter("name");
        if(myRegex.regex(name,myRegex.getPatternViet())){
            categoryService.insert(new Category(name));
            try {
                dispatcher = request.getRequestDispatcher("views/category/list.jsp");
                request.setAttribute("categories", categoryService.selectAll());
                request.setAttribute("message2", "Insert Successful");
                dispatcher.forward(request, response);
            } catch (IOException | ServletException e) {
                e.printStackTrace();
            }
        }else{
            dispatcher = request.getRequestDispatcher("views/category/insert.jsp");
            request.setAttribute("message", "Wrong name format");
            request.setAttribute("categories", categoryService.selectAll());
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void updateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/category/update.jsp");
        request.setAttribute("category", categoryService.findById(id));
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = null;
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Category category =new Category(id, name);
        if (myRegex.regex(name, myRegex.getPatternViet())) {
            categoryService.update(category);
            try {
                dispatcher = request.getRequestDispatcher("views/category/list.jsp");
                request.setAttribute("categories", categoryService.selectAll());
                request.setAttribute("message1", "Update Successful");
                dispatcher.forward(request, response);
            } catch (IOException | ServletException e) {
                e.printStackTrace();
            }
        } else {
            dispatcher = request.getRequestDispatcher("views/category/update.jsp");
            request.setAttribute("message", "Wrong name format");
            request.setAttribute("category",category);
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        categoryService.delete(id);
        try {
            response.sendRedirect("/CategoryServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryService.findById(id);
        request.setAttribute("category", category);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/category/delete.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
