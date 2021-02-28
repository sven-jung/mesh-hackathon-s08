using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Db_access.TableModels;

namespace Mesh_s08_API.Models
{
    public class UserModel
    {
        public string name { get; set; }
        public string description { get; set; }
        public type type { get; set; }
        public string[] Tags { get; set; }
        public string img { get; set; }
    }
}
