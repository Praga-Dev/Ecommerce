using Dapper;
using Ecommerce.Client.Common.Response;
using Ecommerce.Client.Infrastructure.IRepository;
using Ecommerce.Client.Infrastructure.Persistence;
using Ecommerce.Common.Constants;
using Ecommerce.Common.Model.Response;
using Microsoft.Extensions.Logging;
using System.Data;
using System.Xml.Linq;

namespace Ecommerce.Client.Infrastructure.Repository
{
    internal class ClientRepository(ILogger<ClientRepository> logger, IDataBaseConnection db) : IClientRepository
    {
        public async Task<Response<string>> GetClientNames()
        {
            Response<string> response = new Response<string>().GetFailedResponse(ResponseConstants.NO_RECORDS_FOUND);

            try
            { 
                var returnValue = await db.Connection.QueryAsync<string>("SELECT TOP 1 RowStatus FROM [PaisakanakuDB].[Lookups].[RowStatusInfo]");

                if (returnValue != null && returnValue.Any())
                {
                    var data = returnValue.FirstOrDefault();
                    return response.GetSuccessResponse(data);
                }
                return response;
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "Error in ClientRepository.GetClientNames()");
                response = response.GetFailedResponse(ResponseConstants.INTERNAL_SERVER_ERROR);
                return response;
            }
        }
    }
}
