using uhlig.sdk.domain;

namespace uhlig.carteira.domain.Entities
{
    public class UsuarioEntity : BaseEntity<int>
    {
        public string Nickname { get; set; }
        public string Senha { get; set; }
        public UsuarioEntity(string nickname, string senha)
        {
            Nickname = nickname;
            Senha = senha;
        }
    }
}