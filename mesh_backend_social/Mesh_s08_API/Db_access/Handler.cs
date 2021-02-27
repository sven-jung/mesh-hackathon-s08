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

        public static void getAllTags(string cs)
        {
            using var con = new MySqlConnection(cs);
            con.Open();

            string sql = "SELECT * FROM tags";
            using var cmd = new MySqlCommand(sql, con);

            using MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                rdr.
                Console.WriteLine("{0} {1} {2}", rdr.GetInt32(0), rdr.GetString(1),
                    rdr.GetInt32(2));
            }
        }
    }
}
