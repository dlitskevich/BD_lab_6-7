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
				myAccesLayer.OpenConnection("server=127.0.0.1; uid=root; password=Password; database=alliDB ");
				/*
				myAccesLayer.Display("person", "person_id, cast(aes_decrypt(person_name, 'name')as char)");
				myAccesLayer.Display(
					"person natural join cases natural join sentence",
					"person_id," +
					" cast(aes_decrypt(person_name, 'name')as char)," +
					" cast(aes_decrypt(person_surname, 'surname')as char)," +
					"case_id," +
					"sentence_text"
					);
				Console.ReadLine();
				
				myAccesLayer.Display(
					"person",
					"person_id," +
					" cast(aes_decrypt(person_name, 'name')as char)," +
					" cast(aes_decrypt(person_surname, 'surname')as char)",
					"where person_id=16"
					);
				myAccesLayer.UpdateTable("person", "person_name='Flag1'", "person_id=16");
				Console.ReadLine();
				myAccesLayer.Display(
					"person  where person_id=16",
					"person_id," +
					" cast(aes_decrypt(person_name, 'name')as char)," +
					" cast(aes_decrypt(person_surname, 'surname')as char)"
					);
					*/
				myAccesLayer.Display(
					"person  where person_id=16",
					"person_id," +
					" cast(aes_decrypt(person_name, 'name')as char)," +
					" cast(aes_decrypt(person_surname, 'surname')as char)"
					);

				myAccesLayer.UpdateTableConsole();

				myAccesLayer.Display(
					"person  where person_id=16",
					"person_id," +
					" cast(aes_decrypt(person_name, 'name')as char)," +
					" cast(aes_decrypt(person_surname, 'surname')as char)"
					);

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

