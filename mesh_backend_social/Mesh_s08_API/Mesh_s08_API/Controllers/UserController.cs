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
        public async Task<IActionResult> EditTags(string[] tasks)
        {
            return BadRequest();

            //update data base
        }

        [Route("api/user/edit/name")]
        [HttpPut]
        public async Task<IActionResult> EditName(string name)
        {
            return BadRequest();

            //update DB
        }

        [Route("api/user/edit/type")]
        [HttpPut]
        public async Task<IActionResult> EditType(int type)
        {
            return BadRequest();

            //update DB
        }
    }
}
