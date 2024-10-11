using Ecommerce.Client.Application.IServices;
using Ecommerce.Client.Infrastructure.IRepository;
using Ecommerce.Common.Model.Response;
using Microsoft.Extensions.Logging;

namespace Ecommerce.Client.Application.Services
{
    public class ClientService(ILogger<ClientService> logger, IClientRepository clientRepository) : IClientService
    {
        public async Task<Response<string>> GetClientNames()
        {
            return await clientRepository.GetClientNames();
        }
    }
}
