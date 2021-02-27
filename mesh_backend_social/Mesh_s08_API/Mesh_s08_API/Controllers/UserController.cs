using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Mesh_s08_API.Controllers
{
    public class UserController : Controller
    {
        [Route("api/user/edit/tags")]
        [HttpPut]
        public async Task<IActionResult> EditTask(string[] tasks)
        {
            //update data base
        }
    }
}
