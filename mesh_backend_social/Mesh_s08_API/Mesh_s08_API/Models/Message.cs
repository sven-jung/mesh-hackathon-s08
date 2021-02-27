using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mesh_s08_API.Models
{
    public class Message
    {
        public string ID { get; set; }
        public string Value { get; set; }
        public DateTime Time { get; set; }
        public string Receiver { get; set; }
    }
}
