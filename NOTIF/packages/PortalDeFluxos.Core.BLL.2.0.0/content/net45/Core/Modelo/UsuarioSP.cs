//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using Iteris;

namespace PortalDeFluxos.Core.BLL.Modelo
{
    using System;
    using System.Collections.Generic;
    
    public partial class UsuarioSP : EntidadeDB, IEntidadeDBCore
    {
        public UsuarioSP()
        {
            this.GrupoUsuariosSP = new HashSet<GrupoUsuariosSP>();
        }
    
    	
        public int IdUsuarioSP { get; set; }
    	
        public string Nome { get; set; }
    	
        public string LoginComClaims { get; set; }
    	
        public string Login { get; set; }
    	
        public string LookupValue { get; set; }
    	
        public string Email { get; set; }
    	
        public bool SiteAdmin { get; set; }
    	
        public Nullable<bool> ContaSistema { get; set; }
    	
        public bool Ativo { get; set; }
    
        public virtual ICollection<GrupoUsuariosSP> GrupoUsuariosSP { get; set; }
    }
}
