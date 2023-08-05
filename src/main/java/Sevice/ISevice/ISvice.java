package Sevice.ISevice;

import java.sql.SQLException;
import java.util.List;

public interface ISvice <E>{
    void add(E e) throws SQLException;
    int findById(int id);
    void delete(int id) throws SQLException;
    void edit(int id , E e) throws SQLException;
    List<E> findAll() throws SQLException;
}
