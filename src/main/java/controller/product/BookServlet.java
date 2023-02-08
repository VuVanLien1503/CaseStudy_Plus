package controller.product;
import service.IMPL.product.BookPositionService;
import service.IMPL.product.BookService;
import service.IMPL.product.CategoryService;
import service.IMPL.product.ProducerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BookServlet", value = "/BookServlet")
public class BookServlet extends HttpServlet {
    BookService bookService = new BookService();
    BookPositionService bookPositionService=new BookPositionService();
    CategoryService categoryService=new CategoryService();
    ProducerService producerService=new ProducerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(request,response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws RuntimeException {
        request.setAttribute("listBooks", bookService.selectAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/display.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("listProducer",producerService.selectAll());
    }
}
