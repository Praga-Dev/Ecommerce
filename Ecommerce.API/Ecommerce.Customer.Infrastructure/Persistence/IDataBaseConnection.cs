using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce.Client.Infrastructure.Persistence
{
    public interface IDataBaseConnection
    {
        IDbConnection Connection { get; }
    }
}
