package Sevice;

import Sevice.ISevice.ISeviceUser;
import model.User;

import java.util.ArrayList;

public class UserSevice implements ISeviceUser<User> {
    ArrayList <User> users = new ArrayList<>();
    @Override
    public void add(User user) {
    this.users.add(user);
    }

    public UserSevice() {
        this.users.add(new User(1,"admin","admin","admin"));
        this.users.add(new User(2,"member","member","member"));
    }

    @Override
    public boolean checkUser(String userName, String password) {
        for (int i = 0; i < users.size(); i++) {
            if (userName.equals(users.get(i).getUsername()) && password.equals(users.get(i).getPassword())) {
                return true;
            }
        }
        return false;
    }

    @Override
    public int getIdUser(String userName, String password) {
        for (int i = 0; i < users.size(); i++) {
            if (userName.equals(users.get(i).getUsername()) && password.equals(users.get(i).getPassword())) {
                return users.get(i).getId();
            }
        }
        return -1;
    }
}
