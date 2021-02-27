using System;
using System.Collections.Generic;
using System.Text;

namespace Db_access.TableModels
{
    public class users
    {
        public string id_users { get; set; }
        public string name { get; set; }
        public string description { get; set; }
    }

    public enum type { 
        investor, founder
    }
}
