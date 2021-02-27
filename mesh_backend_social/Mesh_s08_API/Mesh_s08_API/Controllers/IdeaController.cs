using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mesh_s08_API.Models;
using Microsoft.AspNetCore.Mvc;

namespace Mesh_s08_API.Controllers
{
    public class IdeaController : Controller
    {
        [Route("api/add/idea/")]
        [HttpPost]
        public async Task<IActionResult> createIdea(Ideas IdeaModel)
        {
            for (int i = 0; i < IdeaModel.Tags.Length; i++)
            {
                IdeaModel.Tags[i] = IdeaModel.Tags[i].ToLower();
            }
            //add to db
        }
    }
}
