using Ecommerce.Common.Model.Response;

namespace Ecommerce.Client.Infrastructure.IRepository
{
    public interface IClientRepository
    {
        Task<Response<string>> GetClientNames();
    }
}
