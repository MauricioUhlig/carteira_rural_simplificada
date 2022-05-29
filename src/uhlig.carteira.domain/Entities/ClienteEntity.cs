using uhlig.sdk.domain;

namespace uhlig.carteira.domain.Entities
{
    public class ClienteEntity : BaseEntity<int>
    {
        public int ProdutorId { get; set; }
        public string Nome { get; set; }
        public string? Telefone { get; set; }
        public string? Chave { get; set; }

        public ClienteEntity(int produtorId, string nome, string? telefone, string? chave)
        {
            ProdutorId = produtorId;
            Nome = nome;
            Telefone = telefone;
            Chave = chave;
        }

        public ProdutorEntity? Produtor { get; set; }
    }
}