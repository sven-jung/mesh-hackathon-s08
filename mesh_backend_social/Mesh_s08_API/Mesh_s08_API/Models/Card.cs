using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Security.AccessControl;
using System.Threading.Tasks;

namespace Mesh_s08_API.Models
{
    public class Card
    {
        
        public string[] Tags { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Location { get; set; }
        public cardType Type { get; set; }
        public string ImageBase64 { get; set; }
        public string Description { get; set; }
    }
}
