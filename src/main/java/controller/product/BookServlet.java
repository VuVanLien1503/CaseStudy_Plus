package controller.product;

import model.product.Book;
import service.IMPL.product.BookPositionService;
import service.IMPL.product.BookService;
import service.IMPL.product.CategoryService;
import service.IMPL.product.ProducerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/BookServlet")
public class BookServlet extends HttpServlet {
    BookService bookService = new BookService();
    BookPositionService bookPositionService = new BookPositionService();
    CategoryService categoryService = new CategoryService();
    ProducerService producerService = new ProducerService();

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
                showCreate(request, response);
                break;
            case "edit":
                ShowEdit(request,response);
                break;
            default:
                showList(request, response);
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
            case "edit":
                edit(request,response);
                break;
        }

    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        String path="../../image/imageBook/lapTrinh/";
        String name = request.getParameter("name");
        String descriptions = request.getParameter("descriptions");
        String image = path+request.getParameter("imagePath");
        boolean status_book= Boolean.parseBoolean(request.getParameter("status_book"));
        int quantity= Integer.parseInt(request.getParameter("quantity"));
        int producer_id= Integer.parseInt(request.getParameter("producer"));
        int category_id = Integer.parseInt(request.getParameter("category"));
        int book_position = Integer.parseInt(request.getParameter("book_position"));
        Book book=new Book(name,descriptions,image,status_book,quantity,producer_id,category_id,book_position);
        bookService.update(book);
        try {
            response.sendRedirect("/BookServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String path="../../image/imageBook/lapTrinh/";
        String name = request.getParameter("name");
        String descriptions = request.getParameter("descriptions");
        String image = path+request.getParameter("imagePath");
        boolean status_book= Boolean.parseBoolean(request.getParameter("status_book"));
        int quantity= Integer.parseInt(request.getParameter("quantity"));
        int producer_id= Integer.parseInt(request.getParameter("producer"));
        int category_id = Integer.parseInt(request.getParameter("category"));
        int book_position = Integer.parseInt(request.getParameter("book_position"));
        Book book=new Book(name,descriptions,image,status_book,quantity,producer_id,category_id,book_position);
        bookService.insert(book);
        try {
            response.sendRedirect("/BookServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void ShowEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("book",bookService.selectById(id));
        request.setAttribute("listProducer", producerService.selectAll());
        request.setAttribute("listCategory", categoryService.selectAll());
        request.setAttribute("listPosition", bookPositionService.selectAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) throws RuntimeException {
        List<Book> list=bookService.selectAll();
        int totalPages = (int) Math.ceil(list.size() / 4);
        String currentPageStr = request.getParameter("page");
        int currentPage = (currentPageStr != null) ? Integer.parseInt(currentPageStr) : 1;
        if (currentPage>totalPages+1){
            currentPage=1;
        }else {
            if (currentPage<1){
                currentPage=totalPages+1;
            }
        }
        int startIndex = (currentPage - 1) * 4;
        int endIndex = Math.min(startIndex + 4, list.size());
        List<Book> currentPageProducts = list.subList(startIndex, endIndex);
        request.setAttribute("listBooks", currentPageProducts);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        request.setAttribute("listProducer",producerService.selectAll());
        request.setAttribute("listCategory",categoryService.selectAll());
        request.setAttribute("listPosition",bookPositionService.selectAll());

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/book/display.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("listProducer", producerService.selectAll());
        request.setAttribute("listCategory", categoryService.selectAll());
        request.setAttribute("listBookPosition", bookPositionService.selectAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
