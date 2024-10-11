using Ecommerce.Common.Model.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce.Client.Application.IServices
{
    public interface IClientService
    {
        Task<Response<string>> GetClientNames();
    }
}
