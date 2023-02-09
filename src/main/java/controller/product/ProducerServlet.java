package controller.product;

import model.product.Producer;
import service.IMPL.product.ProducerService;
import service.MyRegex;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;



@WebServlet(name = "ProducerServlet", value = "/ProducerServlet")
public class ProducerServlet extends HttpServlet {
    private final ProducerService producerService;
    private final MyRegex myRegex;

    public ProducerServlet() {
        producerService = new ProducerService() ;
        myRegex = new MyRegex();
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
                    showCreateForm(request, response);
                    break;
                case "update":
                    showEditForm(request, response);
                    break;
                case "delete":
                    showDeleteForm(request, response);
                    break;
                case "view":
                    viewProducer(request, response);
                    break;
                default:
                    listProducer(request, response);
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
                create(request, response);
                break;
            case "update":
                update(request, response);
                break;
            default:
                listProducer(request, response);
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        RequestDispatcher dispatcher;
        boolean regexName = myRegex.regex(name,myRegex.getPatternName());
        if (regexName){
            try {
                producerService.insert(new Producer(name));
                response.sendRedirect("/ProducerServlet");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("message", "không thành công");
            dispatcher = request.getRequestDispatcher("views/producer/create.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
    }


    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        RequestDispatcher dispatcher;
        boolean regexName = myRegex.regex(name,myRegex.getPatternName());
        producerService.update(new Producer(id,name));
        if (regexName){
            try {
                producerService.insert(new Producer(name));
                response.sendRedirect("/ProducerServlet");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("message", "không thành công");
            dispatcher = request.getRequestDispatcher("views/producer/update.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }


    }

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

    private void viewProducer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/producer/view.jsp");
        request.setAttribute("producer", producerService.selectById(id));
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("producer", producerService.selectById(id));
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/producer/update.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/producer/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        producerService.delete(id);
        try {
            response.sendRedirect("/ProducerServlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
