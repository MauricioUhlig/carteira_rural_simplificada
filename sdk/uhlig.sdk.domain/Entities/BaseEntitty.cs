namespace uhlig.sdk.domain
{
    public class BaseEntity<TPrimaryKey>
    {
        public TPrimaryKey Id { get; set; }
    }
}