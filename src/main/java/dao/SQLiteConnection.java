package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLiteConnection {
	// Change the URL to the database location (I have placed it in the folder)
	private static final String URL = "jdbc:sqlite:c:/Users/User/eclipse-workspace/LoginDemos/login_app.db";


    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL);
    }
}