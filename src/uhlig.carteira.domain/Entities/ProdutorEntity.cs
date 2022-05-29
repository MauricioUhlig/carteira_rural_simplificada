using uhlig.sdk.domain;

namespace uhlig.carteira.domain.Entities
{
    public class ProdutorEntity : BaseEntity<int>
    {
        public string Nome { get; set; }
        public string? Telefone { get; set; }
        public int UsuarioId { get; set; }

        public UsuarioEntity Usuario { get; set; }
    }
}