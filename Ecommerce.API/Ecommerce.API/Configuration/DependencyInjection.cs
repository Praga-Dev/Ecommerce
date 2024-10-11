

using Ecommerce.Client.Application.Configuration;
using Ecommerce.Client.Infrastructure.Configuration;

namespace Ecommerce.Client.API.Configuration
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddInfrastructure(this IServiceCollection services, string sqlConnectionString)
        {
            services.AddCustomerInfrastructure(sqlConnectionString);
            services.AddCustomerApplication(sqlConnectionString);

            return services;
        }
    }
}
