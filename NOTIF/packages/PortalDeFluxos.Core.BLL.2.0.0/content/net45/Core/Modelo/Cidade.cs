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
    
    public partial class Cidade : EntidadeDB, IEntidadeDBCore
    {
    	
        public int Id { get; set; }
    	
        public int IdEstado { get; set; }
    	
        public string Nome { get; set; }
    	
        public string SiglaEstado { get; set; }
    	
        public string SiglaPais { get; set; }
    	
        public Nullable<int> CodigoSistemaRBC { get; set; }
    
        public virtual Estado Estado { get; set; }
    }
}
