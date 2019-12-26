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

		public void Display(string table_name)
		{
			MySqlCommand command = new MySqlCommand(String.Format("SELECT * FROM {0}", table_name), connection);
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



		public void UpdateWithParams(string name, int value) {
			MySqlCommand updateCommand = new MySqlCommand (String.Format ("UPDATE studs SET st_value={1} WHERE st_surname='{0}'", name, value), connection);
			int res = updateCommand.ExecuteNonQuery ();
			Console.WriteLine ("{0} rows affected!", res);
		}



		private static void DisplayTable(DataTable dt) {

			for (int curCol = 0; curCol < dt.Columns.Count; curCol++) {
				Console.Write("{0,-25}", dt.Columns[curCol].ColumnName);
			}
			Console.WriteLine("\n  ");

			for (int curRow = 0; curRow < dt.Rows.Count; curRow++) {
				for (int curCol = 0; curCol < dt.Columns.Count; curCol++) {
					Console.Write("{0,-15}", dt.Rows[curRow][curCol].ToString());
				}
				Console.WriteLine();
			}
		}
	}
}

