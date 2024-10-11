using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce.Common.Enums
{
    public enum ResultTypeEnum
    {
        Success = HttpStatusCode.OK,
        Failed = HttpStatusCode.InternalServerError,
        ValidationError = HttpStatusCode.UnprocessableContent,
        NotFound = HttpStatusCode.NotFound,
        UnAuthorized = HttpStatusCode.Unauthorized,
        Forbidden = HttpStatusCode.Forbidden
    }
}
