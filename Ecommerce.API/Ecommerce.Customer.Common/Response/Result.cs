using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ecommerce.Common.Model.Response;

namespace Ecommerce.Client.Common.Response
{
    public record Result<T> : Response<T>
    {

    }
}
