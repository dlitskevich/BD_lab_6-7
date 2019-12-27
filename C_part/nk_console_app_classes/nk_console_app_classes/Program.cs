using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections.Generic;

namespace nk_console_app_classes {
	class Program {
		static void Main (string [] args)
        {
			try
            {
                Console.WriteLine("My DAL app");

                DAL myAccesLayer = new DAL();
                // myAccesLayer.OpenConnection("server=127.0.0.1; uid=root; password=Password; database=alliDB ");
                myAccesLayer.OpenConnectionConsole();
                /*
				myAccesLayer.Display("person", "person_id, cast(aes_decrypt(person_name, 'name')as char) as name");
				myAccesLayer.Display(
					"person natural join cases natural join sentence",
					"person_id," +
					" cast(aes_decrypt(person_name, 'name')as char) as name," +
					" cast(aes_decrypt(person_surname, 'surname')as char) as surname," +
					"case_id," +
					"sentence_text"
					);
				Console.ReadLine();
                /*
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
                /*
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

                
				*/

                List<Cases> caseList = myAccesLayer.getCasesAsList ();
				Console.WriteLine(caseList[1].person_id);

				List<Person> personList = myAccesLayer.getPersonAsList ();
				Console.WriteLine (personList[1].person_name);

				List<Afterlife> afterlifeList = myAccesLayer.getAfterlifeAsList ();
				Console.WriteLine (afterlifeList [1].address);

				Console.ReadLine();
				myAccesLayer.CloseConnection ();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ReadLine();
            }
		
        }
		





    }
}

