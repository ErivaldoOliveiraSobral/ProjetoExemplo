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
    
    public partial class SAEParametros : EntidadeDB, IEntidadeDBCore
    {
    	
        public int ID { get; set; }
    	
        public string Sistema { get; set; }
    	
        public Nullable<int> Direcao { get; set; }
    	
        public string Celula { get; set; }
    	
        public string Planilha { get; set; }
    	
        public string CampoSistema { get; set; }
    	
        public string TipoInformacao { get; set; }
    }
}
