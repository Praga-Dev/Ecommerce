using Ecommerce.Client.Application.IServices;
using Ecommerce.Client.Application.Services;
using Ecommerce.Client.Infrastructure.Persistence;
using Microsoft.Extensions.DependencyInjection;

namespace Ecommerce.Client.Application.Configuration
{
    public static class CustomerServiceDependencyInjection
    {
        public static IServiceCollection AddCustomerApplication(this IServiceCollection services, string sqlConnectionString)
        {
            // DB Connection
            services.AddTransient<IDataBaseConnection, SqlDataBaseConnection>(con => new(sqlConnectionString));
            
            // Inject other services
            services.AddTransient<IClientService, ClientService>();

            return services;
        }
    }
}
