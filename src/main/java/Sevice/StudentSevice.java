package Sevice;



import Sevice.ISevice.ISvice;
import model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;


public class StudentSevice implements ISvice<Student> {
    Connection connection = ConnectionToMySQL.getConnection();
    public StudentSevice() {
    }
    public List<Student> search(String name) throws SQLException {
        List<Student> searchResults = new ArrayList<>();
        String query = "SELECT * FROM student WHERE LOWER(name) LIKE ?;";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, "%" + name.toLowerCase() + "%");
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String studentName = resultSet.getString("name");
            int age = resultSet.getInt("age");
            String address = resultSet.getString("address");
            String image = resultSet.getString("image");
            Student student = new Student(id, studentName, age, address, image);
            searchResults.add(student);
        }
        return searchResults;
    }
    ArrayList <Student> students = new ArrayList<>();
    @Override
    public void add(Student student) throws SQLException {
        String query = "insert into student( name, age, address, image) values (?, ?, ?, ?);";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, student.getName());
        statement.setInt(2,student.getAge());
        statement.setString(3,student.getAddress());
        statement.setString(4,student.getImage());
        statement.executeUpdate();
    }

    @Override
    public int findById(int id) {
       for(int i = 0 ;i < students.size();i++){
           if(students.get(i).getId() == id){
               return i;
           }
       }
       return -1;
    }

    @Override
    public void delete(int id) throws SQLException {
         String query = "delete from student where id = ?;";
         PreparedStatement statement = connection.prepareStatement(query);
         statement.setInt(1,id);
         statement.executeUpdate();
    }

    @Override
        public void edit(int id, Student student) throws SQLException {
            String query = "UPDATE student SET name = ?, age = ?, address = ?, image = ? WHERE id = ?;";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(5,student.getId());
            statement.setString(1, student.getName());
            statement.setInt(2, student.getAge());
            statement.setString(3, student.getAddress());
            statement.setString(4, student.getImage());
            statement.executeUpdate();
        }

    @Override
    public List<Student> findAll() throws SQLException {
        List<Student> students = new ArrayList<>();
        String query = "select * from student;";
        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            int age = resultSet.getInt("age");
            String address = resultSet.getString("address");
            String image = resultSet.getString("image");
            Student student = new Student(id,name,age,address,image);
            students.add(student);
        }
        return students;
    }
}
