using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Mesh_s08_API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Mesh_s08_API.Controllers
{
    public class SwipeController : Controller
    {
        public SwipeController()
        {

        }


        [Route("api/swiped")]
        [HttpPut]
        public async Task<IActionResult> swiped(bool Liked, string CardId)
        {
            return BadRequest();
        }

        [Route("api/swipe/cards")]
        [HttpGet]
        public async Task<Card[]> getCards(FilerModel filter,int size = 5)
        {
            //call the db with the filter
            var userAge = 18;
            filter = new FilerModel
            {
                Tags = new[] {"pc", "rl", "angular"},
            };
            
            List<Card> Result = new List<Card>();

            List<Card> Cards = new List<Card>
            {
                new Card {Age = 21, Tags = new[] {"pc", "rl", "angular"}},
                new Card {Age = 23, Tags = new[] {"pc", "rl", "angular"}},
                new Card {Age = 25, Tags = new[] {"pc", "angular"}},
                new Card {Age = 27, Tags = new[] {"pc", "rl"}}
            };
            Dictionary<int, List<Card>> map = new Dictionary<int, List<Card>>();

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
                    map.Add(value, new List<Card>{card});
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
