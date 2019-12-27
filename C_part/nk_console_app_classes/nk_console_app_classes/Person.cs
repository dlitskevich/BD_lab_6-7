using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace nk_console_app_classes
{
    class Person
    {
        int person_id;
        public string person_name;
        public string person_surname;
        public string address;
        public string birth;
        public string death;
        public string gender;
        public string bio;

        public Person(int id, string name, string surname, string addr, string birthday, string deathday, string sex, string biogr)
        {
            person_id = id;
            person_name = name;
            person_surname = surname;
            address = addr;
            birth = birthday;
            death = deathday;
            gender = sex;
            bio = biogr;
        }
    }
}
