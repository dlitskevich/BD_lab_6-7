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


                List<Cases> caseList = myAccesLayer.getCasesAsList();
                Console.WriteLine(caseList[1].person_id);

                List<Afterlife> afterlifeList = myAccesLayer.getAfterlifeAsList ();
				Console.WriteLine (afterlifeList [1].address);

               
                List<Person> personList = myAccesLayer.getPersonAsList();
                personList[1].person_name = "New_NAme";
                personList[1].person_surname = "New_Surname";
                personList[1].address = "Grodno Pobedy";

                Console.WriteLine(personList[1].person_name);

                myAccesLayer.UpdatePersonByList(personList);

                myAccesLayer.Display(
                     "person",
                     "person_id," +
                     " cast(aes_decrypt(person_name, 'name')as char) as name," +
                     " cast(aes_decrypt(person_surname, 'surname')as char) as surname,"+
                     " cast(aes_decrypt(address, 'address')as char) as address"
                     );

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

