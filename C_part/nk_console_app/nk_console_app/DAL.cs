using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;

namespace nk_console_app {

	class DAL {
		private MySqlConnection connection;

		public DAL() {
			connection = null;
		}

		public void OpenConnection(string conStr) {
			connection = new MySqlConnection (conStr);
			connection.Open ();
		}

		public void CloseConnection() {
			connection.Close ();
		}

		public void Display(string table_name, string fields="*", string where="")
		{
			MySqlCommand command = new MySqlCommand(String.Format("SELECT {1} FROM {0} {2}", table_name, fields, where), connection);
			DataTable restable = new DataTable();
			using (MySqlDataReader dr = command.ExecuteReader()) {
				if (dr.HasRows) {
					Console.WriteLine(String.Format("Table {0}\n", table_name));
					restable.Load(dr);
					DisplayTable(restable);
				} else {
					Console.WriteLine(String.Format("Table {0} is empty\n", table_name));
				}
				
			}
		}

		private static void DisplayTable(DataTable dt) {

			for (int column = 0; column < dt.Columns.Count; column++) {
				Console.Write("{0,-15}", dt.Columns[column].ColumnName);
			}
			Console.WriteLine("\n  ");

			for (int row = 0; row < dt.Rows.Count; row++) {
				for (int column = 0; column < dt.Columns.Count; column++) {
					Console.Write("{0,-15}", dt.Rows[row][column].ToString());
				}
				Console.WriteLine();
			}
		}



		public void UpdateTable(string table, string set, string where) {
			MySqlCommand updateCommand = new MySqlCommand(String.Format("UPDATE {0} SET {1} WHERE {2}", table, set, where), connection);
			int res = updateCommand.ExecuteNonQuery();
			Console.WriteLine("{0} rows affected!", res);
		}

		public void UpdateTableConsole() {
			Console.WriteLine("Enter table name");
			string table = Console.ReadLine();
			
			Console.WriteLine(table);
			DataTable dt = getTableAsDataTable(table);
			string set = "";
			string set_value = "";

			for (int column = 0; column < dt.Columns.Count; column++) {
				Console.WriteLine("Enter "+ dt.Columns[column].ColumnName);
				set_value = Console.ReadLine();
				if (set_value == "") {
					continue;
				} else {
					set += dt.Columns[column].ColumnName +"='"+ set_value + "',";
				}
			}
			set = set.Remove(set.Length - 1);
			Console.WriteLine(set);

			Console.WriteLine("Enter where clause");
			string where = Console.ReadLine();

			UpdateTable(table, set, where);
		}

		private DataTable getTableAsDataTable(string table, string field = "*") {
			MySqlCommand cmd = new MySqlCommand(String.Format("SELECT {1} FROM {0} ", table, field), connection);
			DataTable res_table = new DataTable();
			using (MySqlDataReader dr = cmd.ExecuteReader()) {
				res_table.Load(dr);
			}
			return res_table;
		}

	}
}

