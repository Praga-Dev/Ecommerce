namespace Ecommerce.Domain.Entities.Auth
{
    public class UserInfo
    {
        public string UserName { get; set; } = string.Empty;
        public string PasswordHash { get; set; } = string.Empty;

        // TODO add other props
    }
}
