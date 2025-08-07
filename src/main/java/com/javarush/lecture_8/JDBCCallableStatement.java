package com.javarush.lecture_8;

import java.sql.*;

public class JDBCCallableStatement {
    private static final String url = "jdbc:postgresql://localhost:5434/postgres";
    private static final String user = "postgres";
    private static final String password = "postgres";

    public static void main(String[] args) {
        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            String sql = "{CALL get_user_info(?,?,?,?)}";
            try (CallableStatement callableStatement = connection.prepareCall(sql)) {
                callableStatement.setString(1, "Anna");
                callableStatement.registerOutParameter(2, Types.INTEGER);
                callableStatement.registerOutParameter(3, Types.INTEGER);
                callableStatement.registerOutParameter(4, Types.VARCHAR);

                callableStatement.execute();

                boolean found = true;
                int id = callableStatement.getInt(2);
                int age = callableStatement.getInt(3);
                String bio = callableStatement.getString(4);

                if(callableStatement.wasNull()) {
                    found = false;
                }

                if(found) {
                    System.out.println(id + " " + age + " " + bio);
                } else {
                    System.out.println("Пользователь не найден");
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
