package controller;

import model.product.Book;
import model.user.Users;
import service.IMPL.product.BookService;
import service.IMPL.user.UsersService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/HomeServlet")
public class HomeServlet extends HttpServlet {
    BookService bookService = new BookService();
    UsersService usersService=new UsersService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "??":
                login(request, response);
                break;
            default:
                showList(request, response);
                break;
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action=request.getParameter("action");
            if (action==null){
                action="";
            }
            switch (action){
                case "login":
                    login(request, response);
                    break;
                default:

                    break;
            }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws RuntimeException {
        Users users = null;
        users = (Users) request.getSession().getAttribute("objectName");
        request.setAttribute("Name_User", users);

        String path = "home/img/img_";
        List<Book>list=bookService.selectAll();
        int totalPages = (int) Math.ceil(list.size() / 6);
        String currentPageStr = request.getParameter("page");
        int currentPage = (currentPageStr != null) ? Integer.parseInt(currentPageStr) : 1;
                if (currentPage>totalPages+1){
                    currentPage=1;
                }else {
                    if (currentPage<1){
                        currentPage=totalPages+1;
                    }
                }
        int startIndex = (currentPage - 1) * 6;
        int endIndex = Math.min(startIndex + 6, list.size());

        List<Book> currentPageProducts = list.subList(startIndex, endIndex);

        request.setAttribute("listBooks", currentPageProducts);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("path", path);

//        request.setAttribute("Name_User", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("home/home.jsp");


        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        Users users = null;
        users = (Users) request.getSession().getAttribute("objectName");
        request.setAttribute("Name_User", users);
        String path = "home/img/img_";
        request.setAttribute("path", path);
        request.setAttribute("listBooks", bookService.selectAll());

//        request.setAttribute("info_user",);

        RequestDispatcher dispatcher = request.getRequestDispatcher("home/home.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }


}
