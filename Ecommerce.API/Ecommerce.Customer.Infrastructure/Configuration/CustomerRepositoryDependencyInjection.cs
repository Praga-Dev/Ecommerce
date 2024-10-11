using Ecommerce.Client.Infrastructure.IRepository;
using Ecommerce.Client.Infrastructure.Persistence;
using Ecommerce.Client.Infrastructure.Repository;
using Microsoft.Extensions.DependencyInjection;

namespace Ecommerce.Client.Infrastructure.Configuration
{
    public static class CustomerRepositoryDependencyInjection
    {
        public static IServiceCollection AddCustomerInfrastructure(this IServiceCollection services, string sqlConnectionString)
        {
            // DB Connection
            services.AddTransient<IDataBaseConnection, SqlDataBaseConnection>(con => new(sqlConnectionString));

            // Inject other services
            services.AddTransient<IClientRepository, ClientRepository>();

            return services;
        }
    }
}
