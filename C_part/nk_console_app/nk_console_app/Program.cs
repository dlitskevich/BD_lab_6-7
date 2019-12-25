using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;

namespace nk_console_app {
	class Program {
		static void Main(string [] args) {
			Console.WriteLine("My first DB app");
			try {
				Console.WriteLine("My DAL app");
				DAL myAccesLayer = new DAL();
				myAccesLayer.OpenConnection("server=127.0.0.1; uid=root; password=Password; database=mmf2019 ");
				myAccesLayer.Display("student");
				myAccesLayer.CloseConnection();

				//Console.ReadLine();
			}
			catch (Exception ex) {
				Console.WriteLine(ex.Message);
				Console.ReadLine();
			}
		}

		


	}
}

