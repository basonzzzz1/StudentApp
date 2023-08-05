package controller;


import Sevice.UserSevice;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UserController", value = "/User")
public class UserController extends HttpServlet {
    private UserSevice userSevice = new UserSevice();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "login":
                showLoginForm(request, response);
                break;
            case "logout":
                logOut(request, response);
                break;
        }
    }

    private void logOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("/User?action=login");
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "login":
                try {
                    login(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws Exception, ServletException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        if (userSevice.checkUser(userName, password)) {
            int id = userSevice.getIdUser(userName, password);
            HttpSession session = request.getSession();
            session.setAttribute("idUser", id);
            response.sendRedirect("/students?action=findAll");
        } else {
            response.sendRedirect("/User?action=login");
        }
    }
}