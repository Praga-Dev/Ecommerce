using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce.Client.API.DTO.Auth
{
    public class UserDTO
    {
        public required string UserName { get; set; }
        public required string Password { get; set; }
    }
}
