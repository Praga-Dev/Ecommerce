using Ecommerce.Common.Enums;

namespace Ecommerce.Common.Model.Response
{
    public record Response<T>
    {
        public T? Data { get; set; }

        public bool IsSuccess { get; set; }

        public ResultTypeEnum StatusCode { get; set; }

        public string? Message { get; set; }

        public List<string> ValidationErrorMessages { get; set; } = [];

        public bool HasValidationErrorMessages => ValidationErrorMessages.Count > 0;

        public bool IsValidResponse() => Data != null && IsSuccess && StatusCode == ResultTypeEnum.Success && !HasValidationErrorMessages;

        public Response<T> GetUnAuthorizedResponse() => new() { StatusCode = ResultTypeEnum.UnAuthorized, Message = ResponseConstants.UNAUTHORIZED };
        
        public Response<T> GetForbiddenResponse() => new() { StatusCode = ResultTypeEnum.Forbidden, Message = ResponseConstants.FORBIDDEN };

        public Response<T> GetNotFoundResponse() => new() { StatusCode = ResultTypeEnum.NotFound, Message = ResponseConstants.NO_RECORDS_FOUND };

        public Response<T> GetFailedResponse(string errorMessage) => new() { StatusCode = ResultTypeEnum.Failed, Message = errorMessage };

        public Response<T> GetValidationFailedResponse() => new() { StatusCode = ResultTypeEnum.ValidationError, Message = ResponseConstants.VALIDATION_FAILED, ValidationErrorMessages = this.ValidationErrorMessages };

        public Response<T> GetSuccessResponse(T data) => new() { Data = data, StatusCode = ResultTypeEnum.Success, IsSuccess = true, Message = ResponseConstants.SUCCESS };
    }
}
