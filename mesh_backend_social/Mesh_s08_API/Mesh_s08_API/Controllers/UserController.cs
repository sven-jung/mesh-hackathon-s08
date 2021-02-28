using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Mesh_s08_API.Controllers
{
    public class UserController : Controller
    {
        [Route("api/user/edit/tags")]
        [HttpPut]
        [Authorize]
        public async Task<IActionResult> EditTags(string[] tasks)
        {
            return Ok();

            //update data base
        }

        [Route("api/user/edit/name")]
        [HttpPut]
        [Authorize]
        public async Task<IActionResult> EditName(string name)
        {
            return Ok();

            //update DB
        }

        [Route("api/user/edit/type")]
        [HttpPut]
        [Authorize]
        public async Task<IActionResult> EditType(int type)
        {
            return Ok();

            //update DB
        }
    }
}
