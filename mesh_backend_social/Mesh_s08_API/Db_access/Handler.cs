using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using Db_access.TableModels;
using MySql.Data.MySqlClient;

namespace Db_access
{
    public class Handler
    {
        public static void getCards(string[] tags, int filterTypeIndex, string cs )
        {
            //string cs = @"server=localhost;userid=dbuser;password=s$cret;database=testdb";

            string sql = "SELECT * FROM cars";
            
            if (filterTypeIndex <= 1)
            {

            }
            else
            {

            }
            using var con = new MySqlConnection(cs);
            con.Open();

            //string sql = "SELECT * FROM cars";
            using var cmd = new MySqlCommand(sql, con);

            using MySqlDataReader rdr = cmd.ExecuteReader();
        }
        

        public static bool createUser(string authID, string cs)
        {
            using var con = new MySqlConnection(cs);
            con.Open();

            using var cmd = new MySqlCommand();
            cmd.Connection = con;

            cmd.CommandText = $"INSERT INTO users(id_users, name, description, type) VALUES('{authID}','','','{ Enum.GetName(typeof(type), 0) }')";
            cmd.ExecuteNonQuery();

            return false;
        }

        public static bool setUserType(string authID, int typeIndex, string cs)
        {
            try
            {

                using var con = new MySqlConnection(cs);
                con.Open();

                using var cmd = new MySqlCommand();
                cmd.Connection = con;

                cmd.CommandText = $"UPDATE users SET type = '{Enum.GetName(typeof(type), typeIndex)}'WHERE  id_users = '{authID}'";
                cmd.ExecuteNonQuery();

                return true;

            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static bool setUserName(string authID, string name, string cs)
        {
            try
            {

                using var con = new MySqlConnection(cs);
                con.Open();

                using var cmd = new MySqlCommand();
                cmd.Connection = con;

                cmd.CommandText = $"UPDATE users SET name = '{name}'WHERE  id_users = '{authID}'";
                cmd.ExecuteNonQuery();

                return true;

            }
            catch (Exception e)
            {
                return false;
            }
        }


        public static List<users> getAllUsers(string cs)
        {
            using var con = new MySqlConnection(cs);
            con.Open();

            string sql = "SELECT *  FROM users";
            using var cmd = new MySqlCommand(sql, con);

            using MySqlDataReader rdr = cmd.ExecuteReader();

            List<users> result = new List<users>();
            while (rdr.Read())
            {
                result.Add(new users
                {
                    id_users = rdr.GetString(0),
                    name = rdr.GetString(1),
                    description = rdr.GetString(2)
                });
                
                var test = rdr.GetValue(3);

            }

            return result;
        }
        public static users getUser(string authID, string cs)
        {

            var t = getAllUsers(cs);
            using var con = new MySqlConnection(cs);
            con.Open();

            string sql = $"SELECT * FROM users WHERE  id_users = '{authID}'";
            using var cmd = new MySqlCommand(sql, con);

            using MySqlDataReader rdr = cmd.ExecuteReader();

            users result = new users(); 
            while (rdr.Read())
            {
                result = new users
                {
                    id_users = rdr.GetString(0),
                    name = rdr.GetString(1),
                    description = rdr.GetString(2),
                    type = (type)Enum.Parse(typeof(type), rdr.GetValue(3).ToString(), true)
                };
                
            }

            return result;
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
            string value;

            string queryString = "DELETE tags WHERE value != ' " + tags[0] + "' ";

            for (int i = 1; i < tags.Length; i++)
            {
                value = tags[i];
                queryString += " AND value != '" + value + "'";

            }

            queryString += " AND users_id_users = '" + userId + "';";

            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                MySqlCommand command = new MySqlCommand(queryString, connection);

                connection.Open();
                MySqlDataReader reader = command.ExecuteReader();
            }

        }
    }
    
}
