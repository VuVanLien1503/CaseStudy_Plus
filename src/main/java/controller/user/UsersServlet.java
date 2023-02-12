package controller.user;

import model.user.Users;
import service.IMPL.user.UsersService;
import service.MyRegex;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "UsersServlet", value = "/UsersServlet")
public class UsersServlet extends HttpServlet {
    private final MyRegex myRegex;
    private final UsersService usersService;

    public UsersServlet() {
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
            case "edit":
                showEdit(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            case "create":
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
            case "checkLogin":
                checkLogin(request, response);
                break;
            case "create":
                createUsers(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            default:

                break;
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        Date date1 = null;
        String path = "../../image/imageUser/";
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String date = request.getParameter("birthDay");
        String phone = request.getParameter("phone");
        String image = path + request.getParameter("image");

        if (name != null & email != null & password != null & date != null & phone != null & image != null) {

            if (password.equals(confirm)) {
                boolean isName = myRegex.regex(name, myRegex.getPatternViet());
                boolean isEmail = myRegex.regex(email, myRegex.getPatternEmail());
                boolean isPassWord = myRegex.regex(password, myRegex.getPatternName());
                boolean isDate = myRegex.regex(date, myRegex.getPatternDate());
                boolean isPhone = myRegex.regex(phone, myRegex.getPatternPhone());
                if (isPhone & isName & isEmail & isPassWord & isDate) {
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        date1 = format.parse(date);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    Users users = new Users(id, name, email, password, date1, phone, image);
                    usersService.update(users);
                    request.setAttribute("message", "Cập Nhật Thành Công");
                    request.setAttribute("user", users);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login/edit.jsp");
                    try {
                        dispatcher.forward(request, response);
                    } catch (ServletException | IOException e) {
                        e.printStackTrace();
                    }

                } else {
                    request.setAttribute("message", "Lỗi Kiểu Dữ Liệu");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login/edit.jsp");
                    request.setAttribute("user", usersService.selectById(id));
                    try {
                        dispatcher.forward(request, response);
                    } catch (ServletException | IOException e) {
                        e.printStackTrace();
                    }
                }

            } else {
                request.setAttribute("message", "Mật Khẩu Không Trùng Nhau");
                RequestDispatcher dispatcher = request.getRequestDispatcher("login/edit.jsp");
                request.setAttribute("user", usersService.selectById(id));
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }

        } else {
            request.setAttribute("message", "Các Trường Không Được Để Trống");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login/edit.jsp");
            request.setAttribute("user", usersService.selectById(id));
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }


    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("user", usersService.selectById(id));
        RequestDispatcher dispatcher = request.getRequestDispatcher("login/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.invalidate();
        try {
            response.sendRedirect("/login/login.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void checkLogin(HttpServletRequest request, HttpServletResponse response) {
        boolean check = false;
        boolean checkEmail = false;
        Users users = null;
        RequestDispatcher dispatcher;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean regexEmail = myRegex.regex(email, myRegex.getPatternEmail());
        if (regexEmail) {
            for (Users u : usersService.selectAll()) {
                if (u.getEmail().equals(email)) {
                    if (u.getPassword().equals(password)) {
                        check = true;
                        users = u;
                        break;
                    } else {
                        checkEmail = true;
                        break;
                    }
                } else {
                    check = false;
                }
            }
        } else {
            request.setAttribute("error-email", "Email invalidate");
            dispatcher = request.getRequestDispatcher("login/login.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }

        }
        if (check) {
            request.getSession().setAttribute("objectName", users);
            dispatcher = request.getRequestDispatcher("/HomeServlet?action=login");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            if (checkEmail) {
                request.setAttribute("error-password", "Mật Khẩu Không Đúng ");
                dispatcher = request.getRequestDispatcher("login/login.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                request.setAttribute("error-email", "Email Không Tồn Tại");
                dispatcher = request.getRequestDispatcher("login/login.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void register(HttpServletResponse response) {
        try {
            response.sendRedirect("login/register.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createUsers(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = null;
        Users users = null;
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordConfirm");
        boolean regexName = myRegex.regex(name, myRegex.getPatternName());
        boolean regexEmail = myRegex.regex(email, myRegex.getPatternEmail());
        boolean regexPassword = myRegex.regex(password, myRegex.getPatternPassWord());
        boolean regexPasswordConfirm = myRegex.regex(passwordConfirm, myRegex.getPatternPassWord());
        boolean flag = false;
        if (regexName & regexEmail & regexPassword & regexPasswordConfirm) {
            for (Users e : usersService.selectAll()) {
                if (e.getEmail().equals(email) | !password.equals(passwordConfirm)) {
                    flag = false;
                    break;
                } else {
                    flag = true;
                }
            }
        }
        if (flag) {
            users = new Users(name, email, password);
            usersService.insert(users);
        }
        if (users == null) {
            for (Users e : usersService.selectAll()) {
                if (e.getEmail().equals(email)) {
                    dispatcher = request.getRequestDispatcher("login/register.jsp");
                    request.setAttribute("error-email", "Email already exists or is formatted incorrectly.Check again!");
                    try {
                        dispatcher.forward(request, response);
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
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        } else {
            try {
                response.sendRedirect("/BookPositionServlet");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
