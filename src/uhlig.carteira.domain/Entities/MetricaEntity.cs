using uhlig.sdk.domain;

namespace uhlig.carteira.domain.Entities
{
    public class MetricaEntity : BaseEntity<byte>
    {
        public string Nome { get; set; }
        public string Simbolo { get; set; }

        public MetricaEntity(string nome, string simbolo)
        {
            Nome = nome;
            Simbolo = simbolo;
        }
    }
}