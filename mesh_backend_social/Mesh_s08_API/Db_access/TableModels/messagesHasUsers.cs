using System;
using System.Collections.Generic;
using System.Text;

namespace Db_access.TableModels
{
    public class messagesHasUsers
    {
        public string messages_id_messages { get; set; }
        public string users_id_users { get; set; }
    }

    public enum user_type
    {
        sender,receiver
    }
}
