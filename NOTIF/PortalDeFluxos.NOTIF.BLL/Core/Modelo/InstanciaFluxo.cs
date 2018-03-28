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
    
    public partial class InstanciaFluxo : EntidadeDB, IentidadeDBCore
    {
        public InstanciaFluxo()
        {
            this.Tarefa = new HashSet<Tarefa>();
        }
    
    	
        public int IdInstanciaFluxo { get; set; }
    	
        public Nullable<System.Guid> CodigoInstanciaFluxo { get; set; }
    	
        public Nullable<System.Guid> CodigoFluxo { get; set; }
    	
        public System.Guid CodigoLista { get; set; }
    	
        public int CodigoItem { get; set; }
    	
        public Nullable<int> StatusFluxo { get; set; }
    	
        public string NomeFluxo { get; set; }
    	
        public string NomeEtapa { get; set; }
    	
        public string NomeSolicitacao { get; set; }
    	
        public string NomeSolicitante { get; set; }
    	
        public string LoginSolicitante { get; set; }
    	
        public System.DateTime DataInicio { get; set; }
    	
        public Nullable<System.DateTime> DataFinalizado { get; set; }
    	
        public bool Ativo { get; set; }
    	
        public Nullable<int> CodigoInstanceID { get; set; }
    	
        public Nullable<int> CodigoWorkflowProgressID { get; set; }
    	
        public Nullable<int> NumeroTentativaInicio { get; set; }
    	
        public Nullable<System.DateTime> DataAlteracao { get; set; }
    	
        public Nullable<bool> ErroCancelado { get; set; }
    	
        public Nullable<bool> FluxoReprovado { get; set; }
    	
        public Nullable<bool> EtapaParalela { get; set; }
    	
        public string LoginGerenteTerritorio { get; set; }
    	
        public string NomeGerenteTerritorio { get; set; }
    	
        public string EmailGerenteTerritorio { get; set; }
    	
        public string LoginDiretorVendas { get; set; }
    	
        public string NomeDiretorVendas { get; set; }
    	
        public string EmailDiretorVendas { get; set; }
    	
        public string LoginGdr { get; set; }
    	
        public string NomeGdr { get; set; }
    	
        public string EmailGdr { get; set; }
    	
        public string LoginGerenteRegiao { get; set; }
    	
        public string NomeGerenteRegiao { get; set; }
    	
        public string EmailGerenteRegiao { get; set; }
    	
        public string LoginCdr { get; set; }
    	
        public string NomeCdr { get; set; }
    	
        public string EmailCdr { get; set; }
    	
        public Nullable<System.DateTime> DataRestartWorkflow { get; set; }
    
        public virtual Lista Lista { get; set; }
        public virtual ICollection<Tarefa> Tarefa { get; set; }
    }
}