package controller.product;

import model.product.Position;
import service.IMPL.product.PositionService;
import service.MyRegex;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "BookPositionServlet", value = "/BookPositionServlet")
public class PositionServlet extends HttpServlet {
    private final  MyRegex myRegex;
    private final PositionService positionService;

    public PositionServlet() {
        positionService = new PositionService();
        myRegex = new MyRegex();
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
                showDeleteForm(request,response);
                break;
            case  "views":
                showPosition(request,response);
                break;
            default:
                listPosition(request,response);
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
                deletePosition(request,response);
                break;
            default:
                break;
        }
    }
    private void listPosition(HttpServletRequest request, HttpServletResponse response){
        List<Position> list = positionService.selectAll();
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
        Position bookPosition = null;
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
            if (quantityNow<=quantity){
                bookPosition = new Position(name, quantity, position, quantityNow);
                positionService.insert(bookPosition);
            }
        }
        if (bookPosition == null) {
            dispatcher = request.getRequestDispatcher("views/book_position/create.jsp");
            request.setAttribute("error", "New creation failed. Review");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                dispatcher = request.getRequestDispatcher("views/book_position/create.jsp");
                request.setAttribute("message", "New position war created");
                dispatcher.forward(request, response);
            } catch (ServletException |IOException e) {
                e.printStackTrace();
            }

        }
    }
    private void  showUpdateForm(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Position bookPosition = positionService.selectById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book_position/update.jsp");
        request.setAttribute("update",bookPosition);
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException ex) {
            ex.printStackTrace();
        }
    }
    private void updatePosition(HttpServletRequest request, HttpServletResponse response){
        Position bookPosition = null;
        RequestDispatcher dispatcher;
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        boolean regexName = myRegex.regex(name,myRegex.getPatternName());
        boolean regexPosition = myRegex.regex(position,myRegex.getPatternName());
        if (regexName&regexPosition){
            bookPosition = new Position(id,name,position);
            positionService.update(bookPosition);
        }
        if (bookPosition == null){
            dispatcher = request.getRequestDispatcher("views/book_position/update.jsp");
            request.setAttribute("error", "New creation failed. Review");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }else {
            dispatcher = request.getRequestDispatcher("views/book_position/update.jsp");
            request.setAttribute("message","Update successful!");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }
    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Position bookPosition = positionService.selectById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book_position/delete.jsp");
        request.setAttribute("delete",bookPosition);
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
           e.printStackTrace();
        }
    }
    private void deletePosition(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        positionService.delete(id);
        try {
            response.sendRedirect("/BookPositionServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showPosition(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Position bookPosition = positionService.selectById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book_position/detail.jsp");
        request.setAttribute("views",bookPosition);
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
