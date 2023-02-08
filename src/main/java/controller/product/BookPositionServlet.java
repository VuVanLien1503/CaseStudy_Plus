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
            case "delete":

                break;
            case "create":

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
            case "delete":

                break;
            case "create":

                break;
            case "update":
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
}
