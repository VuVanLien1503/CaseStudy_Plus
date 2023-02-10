package controller.user;

import model.user.Users;
import service.IMPL.user.UsersService;
import service.MyRegex;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UsersServlet", value = "/UsersServlet")
public class UsersServlet extends HttpServlet {
    private final MyRegex myRegex;
    private  final UsersService usersService;
    public UsersServlet(){
        myRegex = new MyRegex();
        usersService = new UsersService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":

                break;
            case "update":

                break;
            case "delete":

                break;
            case  "views":

                break;
            default:
                register(response);
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
                createUsers(request,response);
                break;
            case "update":

                break;
            case "delete":

                break;
            case  "views":

                break;
            default:

                break;
        }
    }
    private void register(HttpServletResponse response){
        try {
            response.sendRedirect("login/register.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void createUsers(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher dispatcher = null;
        Users users = null;
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirm =request.getParameter("passwordConfirm");
        boolean regexName = myRegex.regex(name, myRegex.getPatternName());
        boolean regexEmail = myRegex.regex(email, myRegex.getPatternEmail());
        boolean regexPassword = myRegex.regex(password, myRegex.getPatternPassWord());
        boolean regexPasswordConfirm = myRegex.regex(passwordConfirm, myRegex.getPatternPassWord());
        boolean flag = false;
        if (regexName&regexEmail&regexPassword&regexPasswordConfirm){
            for (Users e : usersService.selectAll()) {
                if (e.getEmail().equals(email) | !password.equals(passwordConfirm)){
                    flag =false;
                    break;
                }else {
                    flag =true;
                }
            }
        }
        if (flag){
            users = new Users(name,email,password);
            usersService.insert(users);
        }
        if (users ==null){
            for (Users e : usersService.selectAll()) {
                if (e.getEmail().equals(email)) {
                    dispatcher = request.getRequestDispatcher("login/register.jsp");
                    request.setAttribute("error-email", "Email already exists or is formatted incorrectly.Check again!");
                    try {
                        dispatcher.forward(request,response);
                    } catch (ServletException | IOException ex) {
                        ex.printStackTrace();
                    }
                    break;
                }
            }
            if (!password.equals(passwordConfirm)) {
                dispatcher = request.getRequestDispatcher("login/register.jsp");
                request.setAttribute("error-password", "Passwords do not match or contain special characters.");
                try {
                    dispatcher.forward(request,response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }else {
            try {
                response.sendRedirect("/BookPositionServlet");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
