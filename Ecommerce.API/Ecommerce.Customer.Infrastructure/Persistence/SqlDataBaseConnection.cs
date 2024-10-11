using Microsoft.Data.SqlClient;
using System.Data;

namespace Ecommerce.Client.Infrastructure.Persistence
{
    public class SqlDataBaseConnection(string connectionString) : IDataBaseConnection
    {
        public IDbConnection Connection { get; } = new SqlConnection(connectionString);
    }
}
