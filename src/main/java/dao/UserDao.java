package dao;

import java.sql.*;
import model.*;
import util.DBUtil;

public class UserDao {
    public User getUser(String username, String password) {
    	// Initialize database variables and statements
        User user = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = SQLiteConnection.getConnection();
            statement = connection.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            statement.setString(1, username);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            // Stores the values inside the 'user' and display it on the welcome.jsp
            if (resultSet.next()) {
                user = new User();
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setName(resultSet.getString("name"));
                user.setRole(resultSet.getString("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, statement, resultSet);
        }
        return user;
    }
}