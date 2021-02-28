using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Db_access;
using Db_access.TableModels;
using Mesh_s08_API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;

namespace Mesh_s08_API.Controllers
{
    public class SwipeController : Controller
    {
        private readonly IConfiguration _configuration;

        public SwipeController(IConfiguration configuration)
        {
            _configuration = configuration;
        }


        [Route("api/swiped")]
        [HttpPut]
        public async Task<IActionResult> swiped(bool Liked, string CardId)
        {
            return BadRequest();
        }

        [Route("api/swipe/cards")]
        [HttpGet]
        public async Task<card[]> getCards(FilerModel filter,int size = 5)
        {
            //call the db with the filter
            string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            var userAge = Handler.getUserAge(userId, _configuration.GetConnectionString("DefaultConnection"));
            List<card> Cards = Handler.getCards(filter.Tags, (int)filter.Type, _configuration.GetConnectionString("DefaultConnection"));

            List<card> Result = new List<card>();

            Dictionary<int, List<card>> map = new Dictionary<int, List<card>>();

            foreach (var card in Cards)
            {
                int value = 0;
                for (var i = 0; i < card.Tags.Length; i++)
                {
                    if (filter.Tags.Contains(card.Tags[i]))
                    {
                        value++;
                    }
                }

                if (map.ContainsKey(value))
                {
                    map[value].Add(card);
                }
                else
                {
                    map.Add(value, new List<card> {card});
                }
            }
            foreach (var keyValuePair in map.OrderBy(x=> x.Key).Reverse())
            {
                Result.AddRange(keyValuePair.Value.OrderBy(x => x.Age - userAge));
                if (Result.Count >= size)
                {
                    break;
                }
            }

            while (Result.Count > size)
            {
                Result.RemoveAt(Result.Count-1);
            }
            
            return Result.ToArray();
        }
    }
}
