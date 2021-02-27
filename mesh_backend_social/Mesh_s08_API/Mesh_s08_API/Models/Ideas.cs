using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Threading.Tasks;

namespace Mesh_s08_API.Models
{
    public class Ideas
    {
        public string[] Tags { get; set; }
        public string Description { get; set; }
        public string Owner { get; set; }
        public string ImageBase64 { get; set; }
    }
}
