using System;
using System.Collections.Generic;
using System.Text;

namespace Db_access.TableModels
{
    public class card
    {
        public string[] Tags { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Location { get; set; }
        public string ImageBase64 { get; set; }
        public string Description { get; set; }
        public string MainTag { get; set; }
    }
}

