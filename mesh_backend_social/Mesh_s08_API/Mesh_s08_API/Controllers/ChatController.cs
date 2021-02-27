using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Primitives;

namespace Mesh_s08_API.Controllers
{
    public class ChatController : Controller
    {
        private readonly UserManager<IdentityUser> _userManager;

        public ChatController(UserManager<IdentityUser> userManager)
        {
            _userManager = userManager;
        }


        [Route("api/chat/send")]
        [HttpPut]
        public async Task<IActionResult> SendMessage(string chatId)
        {

        }
    }
}
