using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Mesh_s08_API.Controllers
{
    public class IdeaController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
