package com.javarush.lecture_7;

import java.sql.*;

public class PostgresJDBCExample_3 {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5434/postgres";
        String user = "postgres";
        String password = "postgres";

        try (Connection connection = DriverManager.getConnection(url, user, password);
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT id, name, email FROM users"))
        {
            System.out.println("Получаем метаданные");

            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            System.out.println("Количеcтво колонок: " + columnCount);

            for (int i = 1; i <= columnCount; i++) {
                String columnName = metaData.getColumnName(i);
                String columnTypeName = metaData.getColumnTypeName(i);
                int nullable = metaData.isNullable(i);

                System.out.println("Колонка: " + columnName + " " + columnTypeName + " " + nullable);
            }

        } catch (SQLException e) {
            System.out.println("Ошибка при работе с БД");
            e.printStackTrace();
        }
    }
}
