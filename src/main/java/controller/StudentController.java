package controller;


import Sevice.StudentSevice;
import filter.SessionUser;
import model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "StudentController", value = "/students")
public class StudentController extends HttpServlet {
    StudentSevice studentSevice = new StudentSevice();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean check = SessionUser.checkUser(request);
        if(check){
            String action = request.getParameter("action");
            switch (action) {
                case "findAll":
                    try {
                        showAll(request, response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                case "create":
                    showFormAdd(request, response);
                    break;
                case "delete":
                    try {
                        deleteStudent(request, response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                case"edit":
                    showFormEdit(request , response);
                    break;
                case "search":
                    try {
                        searchStudent(request , response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
            }
        }else{
            response.sendRedirect("/User?action=login");
        }
    }
    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
        dispatcher.forward(request, response);
    }


    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        this.studentSevice.delete(id);
        response.sendRedirect("/students?action=findAll");
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("create.jsp");
        dispatcher.forward(request, response);
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Student> students = studentSevice.findAll();
        request.setAttribute("students", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }
    private void searchStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String name = request.getParameter("nameSearch");
        List<Student> students = studentSevice.search(name);
        request.setAttribute("searchResults", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                try {
                    createStudent(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "edit":
                try {
                    editStudent(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

/*
- git nhánh là - git branch <tên nhánh> câu lệnh này dùng để tạo nhánh
-git checkout <tên nhánh> câu lệnh chuyển nhánh
câu lệnh gộp 2 nhánh -git checkout -b <tên nhánh> câu lệnh dùng để tạo và chuyển nhánh
git check out hao câu lệnh để gộp các câu lệnh tạo và chuyển nhánh
nhánh to nhất nhánh master dùng chỉ được đẩy lên khi đã hoàn thành project và đưa cho khách hàng
nhánh thứ 2 là dev nhánh dùng để git lên cho trưởng nhóm
nhánh thứ 3 là nhánh thành viên để các thành viên viết code cà gửi lên cho dev
câu lệnh kéo về nhánh dev git merge <tên nhánh>
 */

    private void editStudent(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        String image = request.getParameter("image");
        int index = Integer.parseInt(request.getParameter("id"));
        Student student = new Student(name, age, address, image);
        studentSevice.edit(id , student);
        response.sendRedirect("/students?action=findAll");
    }
    private void createStudent(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
//        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        String image = request.getParameter("image");
        Student student = new Student(name, age, address, image);
        studentSevice.add(student);
        response.sendRedirect("/students?action=findAll");
    }
}