namespace Ecommerce.Common.Model.Base
{
    public abstract class BaseInfo : RowInfo
    {
        public UserBaseInfo? CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public UserBaseInfo? ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
