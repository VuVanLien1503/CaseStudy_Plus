package controller.product;

import model.product.BookPosition;
import service.IMPL.product.BookPositionService;
import service.MyRegex;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BookPositionServlet", value = "/BookPositionServlet")
public class BookPositionServlet extends HttpServlet {
    MyRegex myRegex= new MyRegex();
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
            case "update":
                showUpdateForm(request,response);
                break;
            case "delete":

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
                updatePosition(request,response);
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
    private void createPosition(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher;
        BookPosition bookPosition = null;
        String name = request.getParameter("name");
        String quantityString = (request.getParameter("quantity"));
        String position = request.getParameter("position");
        String quantityNowString = (request.getParameter("quantityNow"));
        boolean regexName =myRegex.regex(name, myRegex.getPatternName());
        boolean regexQuantity =myRegex.regex(quantityString,myRegex.getPatternNumber());
        boolean regexPosition =myRegex.regex(position, myRegex.getPatternName());
        boolean regexQuantityNow =myRegex.regex(quantityNowString,myRegex.getPatternNumber());
        if (regexName&regexQuantity&regexPosition&regexQuantityNow) {
            int quantity =Integer.parseInt(quantityString);
            int quantityNow = Integer.parseInt(quantityNowString);
            bookPosition = new BookPosition(name, quantity, position, quantityNow);
            bookPositionService.insert(bookPosition);
        }
        if (bookPosition == null) {
            dispatcher = request.getRequestDispatcher("views/book_position/create.jsp");
            request.setAttribute("error", "New creation failed. Review");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                dispatcher = request.getRequestDispatcher("views/book_position/create.jsp");
                request.setAttribute("message", "New position war created");
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

        }
    }
    private void  showUpdateForm(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        BookPosition bookPosition = bookPositionService.selectById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book_position/update.jsp");
        request.setAttribute("update",bookPosition);
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException ex) {
            ex.printStackTrace();
        }
    }
    private void updatePosition(HttpServletRequest request, HttpServletResponse response){
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String position = request.getParameter("position");
            BookPosition bookPosition = new BookPosition(id,name,position);
            bookPositionService.update(bookPosition);
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/book_position/update.jsp");
            request.setAttribute("message","Update successful!");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }catch (NumberFormatException e){
            e.printStackTrace();
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/book_position/update.jsp");
            request.setAttribute("error","New creation failed. Review");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException | IOException ex) {
                ex.printStackTrace();
            }
        }

    }
}
