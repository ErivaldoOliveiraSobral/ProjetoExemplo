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
    
    public partial class TipoProposta : EntidadeDB, IentidadeDBCore
    {
        public TipoProposta()
        {
            this.PropostaDocumento = new HashSet<PropostaDocumento>();
            this.TipoPropostaDocumento = new HashSet<TipoPropostaDocumento>();
            this.AnoContratual = new HashSet<AnoContratual>();
        }
    
    	
        public int IdTipoProposta { get; set; }
    	
        public Nullable<int> IdTipoPropostaPai { get; set; }
    	
        public string Proposta { get; set; }
    
        public virtual ICollection<PropostaDocumento> PropostaDocumento { get; set; }
        public virtual ICollection<TipoPropostaDocumento> TipoPropostaDocumento { get; set; }
        public virtual ICollection<AnoContratual> AnoContratual { get; set; }
    }
}