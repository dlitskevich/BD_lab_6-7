using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace nk_console_app_classes
{
    class Cases
    {
        int case_id;
		public int person_id;
        int article_id;
        public string start_date;
        public string end_date;
        public string authority;
        int sentence_id;
        int times;

        public Cases(int id, int person, int article, string start, string end, string auth, int sentence, int time)
        {
            case_id = id;
            person_id = person;
            article_id = article;
            start_date = start;
            end_date = end;
            authority = auth;
            sentence_id = sentence;
            times = time;
        }

        
    }
}
