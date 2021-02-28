using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Db_access;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace Mesh_s08_API.Controllers
{
    public class UserController : Controller
    {
        private readonly IConfiguration _configuration;

        public UserController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
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
            string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            if (Handler.setUserName(userId, name, _configuration.GetConnectionString("DefaultConnection")))
            {

            }
            return Ok();

            //update DB
        }

        [Route("api/create/user")]
        [HttpPut]
        [Authorize]
        public async Task<IActionResult> create()
        {
            string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            if (Handler.createUser(userId, _configuration.GetConnectionString("DefaultConnection")))
            {

            }
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
