using uhlig.sdk.domain;

namespace uhlig.carteira.domain.Entities
{
    public class ProdutoEntity : BaseEntity<int>
    {
        public int ProdutorId { get; set; }
        public string Nome { get; set; }
        public string? Descricao { get; set; }
        public byte MetricaId { get; set; }

        public ProdutoEntity(int produtorId, string nome, string? descricao, byte metricaId)
        {
            ProdutorId = produtorId;
            Nome = nome;
            Descricao = descricao;
            MetricaId = metricaId;
        }

        public ProdutorEntity Produtor { get; set; }
        public MetricaEntity Metrica { get; set; }

    }
}