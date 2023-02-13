package controller.product;

import model.product.Book;
import model.product.Position;
import service.IMPL.product.PositionService;
import service.IMPL.product.BookService;
import service.IMPL.product.CategoryService;
import service.IMPL.product.ProducerService;
import service.MyRegex;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/BookServlet")
public class BookServlet extends HttpServlet {
    BookService bookService = new BookService();
    PositionService positionService = new PositionService();
    CategoryService categoryService = new CategoryService();
    ProducerService producerService = new ProducerService();
    MyRegex myRegex = new MyRegex();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "detail":
                detail(request, response);
                break;
            case "delete":
                showDelete(request, response);
                break;
            case "create":
                showCreate(request, response);
                break;
            case "edit":
                ShowEdit(request, response);
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
            case "search":
                search(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "create":
                create(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
        }

    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String value = request.getParameter("search");
        List<Book> list = bookService.selectName(value);
        int totalPages = (int) Math.ceil(list.size() / 4);
        String currentPageStr = request.getParameter("page");
        int currentPage = (currentPageStr != null) ? Integer.parseInt(currentPageStr) : 1;
        if (currentPage > totalPages + 1) {
            currentPage = 1;
        } else {
            if (currentPage < 1) {
                currentPage = totalPages + 1;
            }
        }
        int startIndex = (currentPage - 1) * 4;
        int endIndex = Math.min(startIndex + 4, list.size());
        List<Book> currentPageProducts = list.subList(startIndex, endIndex);
        request.setAttribute("listBooks", currentPageProducts);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        request.setAttribute("listProducer", producerService.selectAll());
        request.setAttribute("listCategory", categoryService.selectAll());
        request.setAttribute("listPosition", positionService.selectAll());

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/book/display.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }


    }

    private void detail(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("listBooks", bookService.selectById(id));
        request.setAttribute("listProducer", producerService.selectAll());
        request.setAttribute("listCategory", categoryService.selectAll());
        request.setAttribute("listPosition", positionService.selectAll());

        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/view.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        bookService.delete(id);
        request.setAttribute("message", "Xóa Thành Công");
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/delete.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("listProducer", producerService.selectAll());
        request.setAttribute("listCategory", categoryService.selectAll());
        request.setAttribute("listPosition", positionService.selectAll());
        request.setAttribute("book", bookService.selectById(id));
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/delete.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        String pathViews = "views/book/edit.jsp";
        int number = 0;
        String nameOut = null;
        String pathImage = null;
        boolean status_book = false;
        boolean check = false;
        boolean checkQuantity = false;
        int quantity = 0;
        int id = Integer.parseInt(request.getParameter("id"));
        String path = "../../image/imageBook/lapTrinh/";
        String name = request.getParameter("name");
        String descriptions = request.getParameter("descriptions");
        String image = request.getParameter("imagePath");

        String status = request.getParameter("status_book");

        String quantityString = request.getParameter("quantity");
        int producer_id = Integer.parseInt(request.getParameter("producer"));
        int category_id = Integer.parseInt(request.getParameter("category"));
        int position_id = Integer.parseInt(request.getParameter("position"));
        if (name == "" || descriptions == "" || quantityString == "" || image == "" || status == null) {
            if (status == null) {
                request.setAttribute("message", "Chưa Chọn Loại Sách Mới Hay Cũ");
                RequestDispatcher dispatcher = request.getRequestDispatcher(pathViews);
                request.setAttribute("listProducer", producerService.selectAll());
                request.setAttribute("listCategory", categoryService.selectAll());
                request.setAttribute("listPosition", positionService.selectAll());
                request.setAttribute("book", bookService.selectById(id));

                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {

                request.setAttribute("message", "Các Trường Không Được Để Trống");
                RequestDispatcher dispatcher = request.getRequestDispatcher(pathViews);
                request.setAttribute("listProducer", producerService.selectAll());
                request.setAttribute("listCategory", categoryService.selectAll());
                request.setAttribute("listPosition", positionService.selectAll());
                request.setAttribute("book", bookService.selectById(id));

                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        } else {
            boolean isName = myRegex.regex(name, myRegex.getPatternViet());
            if (isName) {
                boolean isDescription = myRegex.regex(descriptions, myRegex.getPatternViet());
                if (isDescription) {
                    boolean isQuantity = myRegex.regex(quantityString, myRegex.getPatternNumber());
                    if (isQuantity) {
                        quantity = Integer.parseInt(quantityString);
                        if (quantity > 0) {
                            boolean isImage = myRegex.regex(image, myRegex.getPatternFile());
                            if (isImage) {
                                for (Position p : positionService.selectAll()) {
                                    if (p.getId() == position_id) {
                                        number = p.getQuantity() - p.getQuantityNow();
                                        if (quantity > number) {
                                            checkQuantity = true;
                                            nameOut = p.getPosition();
                                            break;
                                        }
                                    }
                                }
                                if (checkQuantity) {
                                    request.setAttribute("message", "Vị Trí " + nameOut + " Chỉ Còn Chứa được " + number);
                                    RequestDispatcher dispatcher = request.getRequestDispatcher(pathViews);
                                    request.setAttribute("listProducer", producerService.selectAll());
                                    request.setAttribute("listCategory", categoryService.selectAll());
                                    request.setAttribute("listPosition", positionService.selectAll());
                                    request.setAttribute("book", bookService.selectById(id));

                                    try {
                                        dispatcher.forward(request, response);
                                    } catch (ServletException | IOException e) {
                                        e.printStackTrace();
                                    }
                                } else {
                                    status_book = Boolean.parseBoolean(status);
                                    pathImage = path + image;
                                    check = true;
                                }

                            } else {
                                request.setAttribute("message", "Đường Dẫn Ảnh Sai");
                                RequestDispatcher dispatcher = request.getRequestDispatcher(pathViews);
                                request.setAttribute("listProducer", producerService.selectAll());
                                request.setAttribute("listCategory", categoryService.selectAll());
                                request.setAttribute("listPosition", positionService.selectAll());
                                request.setAttribute("book", bookService.selectById(id));

                                try {
                                    dispatcher.forward(request, response);
                                } catch (ServletException | IOException e) {
                                    e.printStackTrace();
                                }
                            }
                        } else {
                            request.setAttribute("message", "Số Lượng Phải Lớn Hơn Số 0 ");
                            RequestDispatcher dispatcher = request.getRequestDispatcher(pathViews);
                            request.setAttribute("listProducer", producerService.selectAll());
                            request.setAttribute("listCategory", categoryService.selectAll());
                            request.setAttribute("listPosition", positionService.selectAll());
                            request.setAttribute("book", bookService.selectById(id));

                            try {
                                dispatcher.forward(request, response);
                            } catch (ServletException | IOException e) {
                                e.printStackTrace();
                            }
                        }

                    } else {
                        request.setAttribute("message", "Số Lượng Nhập Không Chính Xác (Chỉ Nhập Số)");
                        RequestDispatcher dispatcher = request.getRequestDispatcher(pathViews);
                        request.setAttribute("listProducer", producerService.selectAll());
                        request.setAttribute("listCategory", categoryService.selectAll());
                        request.setAttribute("listPosition", positionService.selectAll());
                        request.setAttribute("book", bookService.selectById(id));

                        try {
                            dispatcher.forward(request, response);
                        } catch (ServletException | IOException e) {
                            e.printStackTrace();
                        }
                    }
                } else {
                    request.setAttribute("message", "Mô Tả Phải Từ 4-16 Ký Tự");
                    RequestDispatcher dispatcher = request.getRequestDispatcher(pathViews);
                    request.setAttribute("listProducer", producerService.selectAll());
                    request.setAttribute("listCategory", categoryService.selectAll());
                    request.setAttribute("listPosition", positionService.selectAll());
                    request.setAttribute("book", bookService.selectById(id));

                    try {
                        dispatcher.forward(request, response);
                    } catch (ServletException | IOException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                request.setAttribute("message", "Tên Từ 4-16 Ký Tự");
                RequestDispatcher dispatcher = request.getRequestDispatcher(pathViews);
                request.setAttribute("listProducer", producerService.selectAll());
                request.setAttribute("listCategory", categoryService.selectAll());
                request.setAttribute("listPosition", positionService.selectAll());
                request.setAttribute("book", bookService.selectById(id));

                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
        if (check) {
            Book book = new Book(id, name, descriptions, image, status_book, quantity, producer_id, category_id, position_id);
            bookService.update(book);
            request.setAttribute("message1", "Cập Nhật Thành Công...!");
            RequestDispatcher dispatcher = request.getRequestDispatcher(pathViews);
            request.setAttribute("listProducer", producerService.selectAll());
            request.setAttribute("listCategory", categoryService.selectAll());
            request.setAttribute("listPosition", positionService.selectAll());
            request.setAttribute("book", bookService.selectById(id));

            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        int number = 0;
        String nameOut = null;
        String pathImage = null;
        boolean status_book = false;
        boolean check = false;
        boolean checkQuantity = false;
        int quantity = 0;
        String path = "../../image/imageBook/lapTrinh/";
        String name = request.getParameter("name");
        String descriptions = request.getParameter("descriptions");
        String image = request.getParameter("imagePath");

        String status = request.getParameter("status_book");

        String quantityString = request.getParameter("quantity");
        int producer_id = Integer.parseInt(request.getParameter("producer"));
        int category_id = Integer.parseInt(request.getParameter("category"));
        int position_id = Integer.parseInt(request.getParameter("position"));
        if (name == "" || descriptions == "" || quantityString == "" || image == "" || status == "") {
            request.setAttribute("message", "Các Trường Không Được Để Trống");
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/create.jsp");
            request.setAttribute("listProducer", producerService.selectAll());
            request.setAttribute("listCategory", categoryService.selectAll());
            request.setAttribute("listBookPosition", positionService.selectAll());

            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            boolean isName = myRegex.regex(name, myRegex.getPatternViet());
            if (isName) {
                boolean isDescription = myRegex.regex(descriptions, myRegex.getPatternViet());
                if (isDescription) {
                    boolean isQuantity = myRegex.regex(quantityString, myRegex.getPatternNumber());
                    if (isQuantity) {
                        quantity = Integer.parseInt(quantityString);
                        if (quantity > 0) {
                            boolean isImage = myRegex.regex(image, myRegex.getPatternFile());
                            if (isImage) {

                                for (Position p : positionService.selectAll()) {
                                    if (p.getId() == position_id) {
                                        number = p.getQuantity() - p.getQuantityNow();
                                        if (quantity > number) {
                                            checkQuantity = true;
                                            nameOut = p.getPosition();
                                            break;
                                        }
                                    }
                                }
                                if (checkQuantity) {
                                    request.setAttribute("message", "Vị Trí " + nameOut + " Chỉ Còn Chứa được " + number);
                                    RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/create.jsp");
                                    request.setAttribute("listProducer", producerService.selectAll());
                                    request.setAttribute("listCategory", categoryService.selectAll());
                                    request.setAttribute("listBookPosition", positionService.selectAll());
                                    try {
                                        dispatcher.forward(request, response);
                                    } catch (ServletException | IOException e) {
                                        e.printStackTrace();
                                    }
                                } else {
                                    status_book = Boolean.parseBoolean(status);
                                    pathImage = path + image;
                                    check = true;
                                }

                            } else {
                                request.setAttribute("message", "Đường Dẫn Ảnh Sai");
                                RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/create.jsp");
                                request.setAttribute("listProducer", producerService.selectAll());
                                request.setAttribute("listCategory", categoryService.selectAll());
                                request.setAttribute("listBookPosition", positionService.selectAll());
                                try {
                                    dispatcher.forward(request, response);
                                } catch (ServletException | IOException e) {
                                    e.printStackTrace();
                                }
                            }
                        } else {
                            request.setAttribute("message", "Số Lượng Phải Lớn Hơn Số 0 ");
                            RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/create.jsp");
                            request.setAttribute("listProducer", producerService.selectAll());
                            request.setAttribute("listCategory", categoryService.selectAll());
                            request.setAttribute("listBookPosition", positionService.selectAll());
                            try {
                                dispatcher.forward(request, response);
                            } catch (ServletException | IOException e) {
                                e.printStackTrace();
                            }
                        }

                    } else {
                        request.setAttribute("message", "Số Lượng Nhập Không Chính Xác (Chỉ Nhập Số)");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/create.jsp");
                        request.setAttribute("listProducer", producerService.selectAll());
                        request.setAttribute("listCategory", categoryService.selectAll());
                        request.setAttribute("listBookPosition", positionService.selectAll());

                        try {
                            dispatcher.forward(request, response);
                        } catch (ServletException | IOException e) {
                            e.printStackTrace();
                        }
                    }
                } else {
                    request.setAttribute("message", "Mô Tả Phải Từ 4-16 Ký Tự");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/create.jsp");
                    request.setAttribute("listProducer", producerService.selectAll());
                    request.setAttribute("listCategory", categoryService.selectAll());
                    request.setAttribute("listBookPosition", positionService.selectAll());

                    try {
                        dispatcher.forward(request, response);
                    } catch (ServletException | IOException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                request.setAttribute("message", "Tên Từ 4-16 Ký Tự");
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/create.jsp");
                request.setAttribute("listProducer", producerService.selectAll());
                request.setAttribute("listCategory", categoryService.selectAll());
                request.setAttribute("listBookPosition", positionService.selectAll());

                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
        if (check) {
            Book book = new Book(name, descriptions, pathImage, status_book, quantity, producer_id, category_id, position_id);
            bookService.insert(book);
            request.setAttribute("message1", "Đăng Ký Thành Công");
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/create.jsp");
            request.setAttribute("listProducer", producerService.selectAll());
            request.setAttribute("listCategory", categoryService.selectAll());
            request.setAttribute("listBookPosition", positionService.selectAll());

            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void ShowEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("book", bookService.selectById(id));
        request.setAttribute("listProducer", producerService.selectAll());
        request.setAttribute("listCategory", categoryService.selectAll());
        request.setAttribute("listPosition", positionService.selectAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) throws RuntimeException {
        List<Book> list = bookService.selectAll();
        int totalPages = (int) Math.ceil(list.size() / 4);
        String currentPageStr = request.getParameter("page");
        int currentPage = (currentPageStr != null) ? Integer.parseInt(currentPageStr) : 1;
        if (currentPage > totalPages + 1) {
            currentPage = 1;
        } else {
            if (currentPage < 1) {
                currentPage = totalPages + 1;
            }
        }
        int startIndex = (currentPage - 1) * 4;
        int endIndex = Math.min(startIndex + 4, list.size());
        List<Book> currentPageProducts = list.subList(startIndex, endIndex);
        request.setAttribute("listBooks", currentPageProducts);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        request.setAttribute("listProducer", producerService.selectAll());
        request.setAttribute("listCategory", categoryService.selectAll());
        request.setAttribute("listPosition", positionService.selectAll());

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
        request.setAttribute("listBookPosition", positionService.selectAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
