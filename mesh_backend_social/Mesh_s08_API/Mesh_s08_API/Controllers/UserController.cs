using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Db_access;
using Db_access.TableModels;
using Mesh_s08_API.Models;
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
        public async Task<IActionResult> EditTags(string[] Tags)
        {
            string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            if (Handler.UpdateUserTags(userId, Tags, _configuration.GetConnectionString("DefaultConnection")))
            {
                return Ok();
            }

            return BadRequest();
        }

        [Route("api/user/edit/name")]
        [HttpPut]
        [Authorize]
        public async Task<IActionResult> EditName(string name)
        {
            string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            if (Handler.setUserName(userId, name, _configuration.GetConnectionString("DefaultConnection")))
            {
                return Ok();
            }
            return BadRequest();
        }

        [Route("api/create/user")]
        [HttpPut]
        [Authorize]
        public async Task<IActionResult> create()
        {
            string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            if (Handler.createUser(userId, _configuration.GetConnectionString("DefaultConnection")))
            {
                return Ok();
            }
            return BadRequest();
        }

        [Route("api/user/edit/type")]
        [HttpPut]
        [Authorize]
        public async Task<IActionResult> EditType(int type)
        {
            string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            if (Handler.setUserType(userId, type, _configuration.GetConnectionString("DefaultConnection")))
            {
                return Ok();
            }

            return BadRequest();
        }

        [Route("api/get/user")]
        [HttpGet]
        [Authorize]
        public async Task<UserModel> getcurrUser()
        {
            string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var user = Handler.getUser(userId, _configuration.GetConnectionString("DefaultConnection"));
            var tags = Handler.getUserTags(userId, _configuration.GetConnectionString("DefaultConnection"));


            return new UserModel
            {
                type = user.type,
                description = user.description,
                name = user.name,
                Tags = tags.ToArray()
                
            };
        }
    }
}
