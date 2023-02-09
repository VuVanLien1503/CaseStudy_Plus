package controller.product;

import model.product.Producer;
import service.IMPL.product.ProducerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;



@WebServlet(name = "ProducerServlet", value = "/ProducerServlet")
public class ProducerServlet extends HttpServlet {
    private final ProducerService producerService;

    public ProducerServlet() {
        producerService = new ProducerService() ;
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
                case "create":
//                    showCreateForm(request, response);
                    break;
                case "edit":
//                    showEditForm(request, response);
                    break;
                case "delete":
//                    showDeleteForm(request, response);
                    break;
                case "view":
//                    viewProducer(request, response);
                    break;
                default:
                    listProducer(request, response);
                    break;
            }
        }

//    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
//        Producer producer = producerService.
//        RequestDispatcher dispatcher;
//        dispatcher;
//        if(producer == null){
//            dispatcher = request.getRequestDispatcher("error-404.jsp");
//        } else {
//            request.setAttribute("producer", producer);
//            dispatcher = request.getRequestDispatcher("producer/delete.jsp");
//        }
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }


    private void  listProducer(HttpServletRequest request, HttpServletResponse response) {
        List<Producer> producerList= producerService.selectAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/producer/list.jsp");
        request.setAttribute("listProducer", producerList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
