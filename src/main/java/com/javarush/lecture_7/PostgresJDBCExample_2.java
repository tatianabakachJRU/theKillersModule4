package com.javarush.lecture_7;

import java.sql.*;

public class PostgresJDBCExample_2 {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5434/postgres";
        String user = "postgres";
        String password = "postgres";

        try (Connection connection = DriverManager.getConnection(url, user, password);
        Statement statement = connection.createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
        );
        ResultSet resultSet = statement.executeQuery("SELECT id, name, email FROM users"))
        {
            if(!resultSet.isBeforeFirst()){
                System.out.println("Heт данных в ResultSet");
                return;
            }

            resultSet.beforeFirst();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                System.out.println(id + " " + name + " " + email);
            }

            if(resultSet.isAfterLast()){
                System.out.println("Курсор находиться после последней строки");
            }

            resultSet.first();
            System.out.println("Первая строка: " + resultSet.getString("name"));

            resultSet.absolute(3);
            System.out.println("Третья строка: " + resultSet.getString("name"));

            resultSet.relative(-1);
            System.out.println("Предыдущая строка: " + resultSet.getString("name"));

        } catch (SQLException e) {
            System.out.println("Ошибка при работе с БД");
            e.printStackTrace();
        }
    }
}
