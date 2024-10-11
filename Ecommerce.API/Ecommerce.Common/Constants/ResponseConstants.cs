using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce.Common.Constants
{
    public static class ResponseConstants
    {
        #region ===================== DB Meta Data Validation Response Constants [Logging purpose only] =====================

        public const string INVALID_PARAM_TABLE_NAME = "Invalid Table Name";
        public const string INVALID_PARAM_SCHEMA_NAME = "Invalid Schema Name";
        public const string INVALID_PARAM_ROW_STATUS = "Invalid Row Status";

        #endregion

        #region ============================== Base Response Constants ==============================

        public const string FAILED = "An error occurred while processing your request.";
        public const string SUCCESS = "Operation successful.";
        public const string FORBIDDEN = "You do not have permission to access this resource.";
        public const string BAD_REQUEST = "Invalid request format or missing required parameters.";
        public const string UNAUTHORIZED = "Please log in to access this resource.";
        public const string USER_NOT_FOUND = "User not found.";
        public const string NO_RECORDS_FOUND = "No matching records found.";
        public const string VALIDATION_FAILED = "Please correct the errors in your input.";
        public const string SOMETHING_WENT_WRONG = "An unexpected error occurred. Please try again later.";
        public const string INTERNAL_SERVER_ERROR = "A server error occurred. Please contact support.";

        #endregion

        #region ============================== Custom Response Constants ==============================

        public const string INVALID_ID = "Invalid Id";
        public const string INVALID_PARAM = "Invalid Param";

        #endregion
    }
}
