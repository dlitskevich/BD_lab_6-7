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

        public string getValue(int field)
        {
            switch (field)
            {
                case 1:
                    return person_id.ToString();
                case 2:
                    return person_name;
                case 3:
                    return person_surname;
                case 4:
                    return address;
                case 5:
                    return birth;
                case 6:
                    return death;
                case 7:
                    return gender;
                case 8:
                    return bio;
                default:
                    return "";
                    // break;
            }
        }

        public string getFieldName(int field)
        {
            switch (field)
            {
                case 1:
                    return "person_id";
                case 2:
                    return "person_name";
                case 3:
                    return "person_surname";
                case 4:
                    return "address";
                case 5:
                    return "birth";
                case 6:
                    return "death";
                case 7:
                    return "gender";
                case 8:
                    return "biography";
                default:
                    return "";
                    // break;
            }
        }
    }
}
