package controller.product;

import model.product.BookPosition;
import service.IMPL.product.BookPositionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookPositionServlet", value = "/BookPositionServlet")
public class BookPositionServlet extends HttpServlet {
    private final BookPositionService bookPositionService;

    public BookPositionServlet() {
        bookPositionService = new BookPositionService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateForm(request,response);
                break;
            case "delete":

                break;
            case "update":
                break;
            default:
                listBookPosition(request,response);
                break;
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
            case "create":
                createPosition(request,response);
                break;
            case "update":
                break;
            case "delete":

                break;
            default:
                break;
        }
    }
    private void listBookPosition(HttpServletRequest request, HttpServletResponse response){
        List<BookPosition> list = bookPositionService.selectAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book_position/list.jsp");
        request.setAttribute("listBookPosition",list );
        try {
            dispatcher.forward(request,response);
        } catch (ServletException| IOException e) {
            e.printStackTrace();
        }
    }
    private void showCreateForm(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book_position/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void createPosition(HttpServletRequest request, HttpServletResponse response){
        try {
            String name = request.getParameter("name");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String position = request.getParameter("position");
            int quantityNow = Integer.parseInt(request.getParameter("quantityNow"));
            BookPosition bookPosition = new BookPosition(name,quantity,position,quantityNow);
            bookPositionService.insert(bookPosition);
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/book_position/create.jsp");
            request.setAttribute("message","New position war created");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }catch (NumberFormatException e){
            e.printStackTrace();
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/book_position/create.jsp");
            request.setAttribute("error","New creation failed. Review");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException | IOException ex) {
                ex.printStackTrace();
            }
        }

    }
}
