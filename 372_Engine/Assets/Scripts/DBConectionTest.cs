using UnityEngine;
using MySql.Data.MySqlClient;
using System;

public class MySQLTest : MonoBehaviour
{
    private string connectionString = "Server=your_server_address;Database=your_database_name;User ID=your_username;Password=your_password;";

    void Start()
    {
        TestConnection();
    }

    void TestConnection()
    {
        using (MySqlConnection conn = new MySqlConnection(connectionString))
        {
            try
            {
                conn.Open();
                Debug.Log("Veritaban�na ba�ar�yla ba�lan�ld�.");
            }
            catch (Exception ex)
            {
                Debug.LogError("Ba�lant� hatas�: " + ex.Message);
            }
        }
    }
}
