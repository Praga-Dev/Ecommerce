using Ecommerce.Client.API.DTO.Auth;
using Ecommerce.Domain.Entities.Auth;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Ecommerce.Client.API.Controllers.Auth
{
    public class AuthController(IConfiguration configuration) : Controller
    {
        public static UserInfo CurrentUser = new();


        [HttpPost("register")]
        public ActionResult<UserInfo> Register(UserDTO user)
        {
            string passwordHash = BCrypt.Net.BCrypt.HashPassword(user.Password);

            CurrentUser.UserName = user.UserName;
            CurrentUser.PasswordHash = passwordHash;

            return Ok(CurrentUser);
        }

        [HttpPost("login")]
        public ActionResult<UserInfo> Login(UserDTO user)
        {
            if (user.UserName != CurrentUser.UserName
                || !BCrypt.Net.BCrypt.Verify(user.Password, CurrentUser.PasswordHash))
            {
                return BadRequest("Username or Password is wrong !!");
            }

            string token = CreateToken(CurrentUser);
            return Ok(token);
        }

        private string CreateToken(UserInfo user)
        {
            List<Claim> claims =
            [
                new(ClaimTypes.Name, user.UserName)

                // TODO add other claims
            ];

            string jwtToken = configuration.GetSection("Auth:JwtToken").Value
                           ?? throw new ArgumentNullException("JwtToken is null");

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtToken));

            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256Signature);

            JwtSecurityToken token = new(
                claims: claims,
                expires: DateTime.Now.AddDays(1),
                signingCredentials: credentials);

            var jwt = new JwtSecurityTokenHandler().WriteToken(token);

            return jwt;
        }
    }
}
