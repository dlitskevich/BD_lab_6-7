using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace nk_console_app_classes
{
    class Afterlife
    {
        int afterlife_id;
        int person_id;
        int case_id;
        public string address;
        public string occupation;
        public string bio;
        public string afterlife_start_date;

        public Afterlife(int id, int person, int case_, string addr, string job, string biogr, string start_date)
        {
            afterlife_id = id;
            person_id = person;
            case_id = case_;
			address = addr;
			afterlife_start_date = start_date;
            occupation = job;
            bio = biogr;
        }
    }
}
