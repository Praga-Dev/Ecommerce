using Ecommerce.Client.Application.IServices;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;

namespace Ecommerce.API.Controllers
{
    [ApiController]
    //[Route("[controller]")]
    public class WeatherForecastController(ILogger<WeatherForecastController> logger, IClientService clientService) : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        [HttpGet("api/get-summary")]
        public async Task<IActionResult> Get()
        {
            var data = await clientService.GetClientNames();
            return Ok(data);
        }
    }
}
