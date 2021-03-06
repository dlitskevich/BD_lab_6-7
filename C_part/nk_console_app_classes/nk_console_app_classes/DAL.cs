﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;

namespace nk_console_app_classes
{

    class DAL
    {
        private MySqlConnection connection;

		public DAL ()
		{
			connection = null;
		}

        public void OpenConnectionConsole(string server= "127.0.0.1", string database= "alliDB")
        {
            try
            {
                Console.WriteLine("Enter user id");
                string uid = Console.ReadLine();
                if (uid == "")
                {
                    uid = "root";
                }

                Console.WriteLine("Enter password");
                string password = Console.ReadLine();
                if (password == "")
                {
                    password = "Password";
                }

                string connString = string.Format("server={0}; " +
                                                  "uid={2}; " +
                                                  "password={3}; " +
                                                  "database={1}", server, database, uid, password);

                OpenConnection(connString);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine("Wanna try again?");
                string try_again = Console.ReadLine();
                if (try_again=="")
                {
                    OpenConnectionConsole(server, database);
                }
            }
        }

        public void OpenConnection (string conStr)
		{
			connection = new MySqlConnection (conStr);
			connection.Open ();
		}

		public void CloseConnection ()
		{
			connection.Close ();
		}

		public void Display (string table_name, string fields = "*", string where = "")
		{
			MySqlCommand command = new MySqlCommand (String.Format ("SELECT {1} FROM {0} {2}", table_name, fields, where), connection);
			DataTable restable = new DataTable ();
			using (MySqlDataReader dr = command.ExecuteReader ()) {
				if (dr.HasRows) {
					Console.WriteLine (String.Format ("Table {0}\n", table_name));
					restable.Load (dr);
					DisplayTable (restable);
				} else {
					Console.WriteLine (String.Format ("Table {0} is empty\n", table_name));
				}

			}
		}

		private static void DisplayTable (DataTable dt)
		{

			for (int column = 0; column < dt.Columns.Count; column++) {
				Console.Write ("{0,-15}", dt.Columns [column].ColumnName);
			}
			Console.WriteLine ("\n  ");

			for (int row = 0; row < dt.Rows.Count; row++) {
				for (int column = 0; column < dt.Columns.Count; column++) {
					Console.Write ("{0,-15}", dt.Rows [row] [column].ToString ());
				}
				Console.WriteLine ();
			}
		}



		public void UpdateTable (string table, string set, string where)
		{
			MySqlCommand updateCommand = new MySqlCommand (String.Format ("UPDATE {0} SET {1} WHERE {2}", table, set, where), connection);
			int res = updateCommand.ExecuteNonQuery ();
			Console.WriteLine ("{0} rows affected!", res);
		}

		public void UpdateTableConsole ()
		{
			Console.WriteLine ("Enter table name");
			string table = Console.ReadLine ();

			Console.WriteLine (table);
			DataTable dt = getTableAsDataTable (table);
			string set = "";
			string set_value = "";

			for (int column = 0; column < dt.Columns.Count; column++) {
				Console.WriteLine ("Enter " + dt.Columns [column].ColumnName);
				set_value = Console.ReadLine ();
				if (set_value == "") {
					continue;
				} else {
					set += dt.Columns [column].ColumnName + "='" + set_value + "',";
				}
			}
			set = set.Remove (set.Length - 1);
			Console.WriteLine (set);

			Console.WriteLine ("Enter where clause");
			string where = Console.ReadLine ();

			UpdateTable (table, set, where);
		}

		private DataTable getTableAsDataTable (string table, string field = "*")
		{
			MySqlCommand cmd = new MySqlCommand (String.Format ("SELECT {1} FROM {0} ", table, field), connection);
			DataTable res_table = new DataTable ();
			using (MySqlDataReader dr = cmd.ExecuteReader ()) {
				res_table.Load (dr);
			}
			return res_table;
		}


		public List<Cases> getCasesAsList() {
            List<Cases> resList = new List<Cases>();
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM cases", connection);
            using (MySqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
					// Console.WriteLine (String.Format("{0}", dr["start_date"].ToString()));
                    resList.Add(new Cases(
                                          (int)dr["case_id"],
                                          (int)dr["person_id"],
										  (int)dr["article_id"],
                                          dr["start_date"].ToString(),
                                          dr["end_date"].ToString (),
                                          dr["authority"].ToString (),
                                          (int)dr["sentence_id"],
                                          (int)dr["times"]
                                          )
                                );
                }
            }
            return resList;
        }

		public List<Person> getPersonAsList ()
		{
			List<Person> resList = new List<Person> ();
			MySqlCommand cmd = new MySqlCommand ("SELECT " +
													"person_id, " +
													" cast(aes_decrypt(person_name, 'name')as char) as name," +
													" cast(aes_decrypt(person_surname, 'surname')as char) as surname," +
													" cast(aes_decrypt(address, 'address')as char) as address," +
													" cast(aes_decrypt(birth, 'birth')as char) as birth," +
													" cast(aes_decrypt(death, 'death')as char) as death," +
													" cast(aes_decrypt(gender, 'gender')as char) as gender," +
													" cast(aes_decrypt(biography, 'biography')as char) as bio FROM person",
													connection);
			using (MySqlDataReader dr = cmd.ExecuteReader ()) {
				while (dr.Read ()) {
					// Console.WriteLine (String.Format ("{0}", dr ["name"].ToString ()));
					resList.Add (new Person (
										  (int)dr ["person_id"],
										  dr ["name"].ToString (),
										  dr ["surname"].ToString (),
										  dr ["address"].ToString (),
										  dr ["birth"].ToString (),
										  dr ["death"].ToString (),
										  dr ["gender"].ToString (),
										  dr ["bio"].ToString ()
										  )
								);
				}
			}
			return resList;
		}

		public List<Afterlife> getAfterlifeAsList() {
			List<Afterlife> resList = new List<Afterlife> ();
			MySqlCommand cmd = new MySqlCommand ("SELECT * FROM afterlife",
													connection);
			using (MySqlDataReader dr = cmd.ExecuteReader ()) {
				while (dr.Read ()) {
					// Console.WriteLine (String.Format ("{0}", dr ["name"].ToString ()));
					resList.Add (new Afterlife (
										  (int)dr ["afterlife_id"],
										  (int)dr ["person_id"],
										  (int)dr ["case_id"],
										  dr ["address"].ToString (),
										  dr ["occupation"].ToString (),
										  dr ["biography"].ToString (),
										  dr ["afterlife_start_date"].ToString ()
										  )
								);
				}
			}
			return resList;
		}

        public void UpdatePersonByList(List<Person> new_list)
        {
            List<Person> old_list = getPersonAsList();

            for (int row = 0; row < new_list.Count; row++)
            {
                for (int field = 1; field < 8; field++)
                {
                    if (new_list[row].getValue(field) != old_list[row].getValue(field))
                    {
                        UpdateTable("person",
                                    string.Format("{0}='{1}'", new_list[row].getFieldName(field), new_list[row].getValue(field)),
                                    string.Format("person_id={0}", new_list[row].getValue(1))
                                    );
                                    
                        //Console.WriteLine(new_list[row].getValue(field) + new_list[row].getFieldName(field));
                    }
                    
                }
                
            }
        }
	}
}

