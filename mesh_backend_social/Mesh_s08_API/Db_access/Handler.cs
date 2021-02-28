using System;
using System.Collections.Generic;
using System.Text;
using MySql.Data.MySqlClient;

namespace Db_access
{
    class Handler
    {
        public static void getCards(string cs )
        {
            //string cs = @"server=localhost;userid=dbuser;password=s$cret;database=testdb";

            using var con = new MySqlConnection(cs);
            con.Open();

            string sql = "SELECT * FROM cars";
            using var cmd = new MySqlCommand(sql, con);

            using MySqlDataReader rdr = cmd.ExecuteReader();
        }
        

        public static bool createUser(string authID, string cs)
        {
            using var con = new MySqlConnection(cs);
            con.Open();

            using var cmd = new MySqlCommand();
            cmd.Connection = con;

            cmd.CommandText = $"INSERT INTO users(id_users, name, description, type) VALUES('{authID}','','',)";
            cmd.ExecuteNonQuery();
        }

        public static bool setUserName(string authID, string name, string cs)
        {
            using var con = new MySqlConnection(cs);
            con.Open();

            using var cmd = new MySqlCommand();
            cmd.Connection = con;

            cmd.CommandText = $"UPDATE users SET name = '{name}',  email = 'mary.hill@classicmodelcars.com' WHERE  employeeNumber = 1056; INSERT INTO users(id_users, name, description, type) VALUES('{authID}','','',)";
            cmd.ExecuteNonQuery();
        }

        public static void getAllTags(string cs)
        {
            using var con = new MySqlConnection(cs);
            con.Open();

            string sql = "SELECT * FROM tags";
            using var cmd = new MySqlCommand(sql, con);

            using MySqlDataReader rdr = cmd.ExecuteReader();

            //while (rdr.Read())
            //{
            //    rdr.
            //    Console.WriteLine("{0} {1} {2}", rdr.GetInt32(0), rdr.GetString(1),
            //        rdr.GetInt32(2));
            //}
        }

        public static void updateUserTags(int userId, string[] tags, string cs)
        {
            string queryString = "DELETE FROM tags WHERE users_id_users ='" + userId + "';";

            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                MySqlCommand command = new MySqlCommand(queryString, connection);
                connection.Open();
                MySqlDataReader reader = command.ExecuteReader();
                reader.Close();
                string queryStringAdd;
                for (int i = 0; i < tags.Length; i++)
                {
                    string id_tags = Guid.NewGuid().ToString();
                    queryStringAdd = $"INSERT INTO `mesh_db`.`tags` (`id_tags`, `users_id_users`, `value`) VALUES('{id_tags}','{userId}','{tags[i]}');";
                    MySqlCommand cAdd = new MySqlCommand(queryStringAdd, connection);
                    MySqlDataReader r = cAdd.ExecuteReader();
                    r.Close();
                }
            }

        }
    }
    
}
