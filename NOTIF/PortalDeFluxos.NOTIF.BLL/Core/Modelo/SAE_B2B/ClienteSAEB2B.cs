﻿using System;
using System.Collections.Generic;
using System.Text;

namespace PortalDeFluxos.Core.BLL.Core.Modelo.SAEB2B
{
    public class ClienteSAEB2B
    {
        public string IBM { get; set; }
        public string RazaoSocial { get; set; }
        public string CNPJ { get; set; }
        public string Cidade { get; set; }
        public string UF { get; set; }
        public decimal MediaGasolinaComum { get; set; }
        public decimal MediaGasolinaAditivada { get; set; }
        public decimal MediaEtanolComum { get; set; }
        public decimal MediaEtanolAditivado { get; set; }
        public decimal MediaDieselComum { get; set; }
        public decimal MediaFormulaDiesel { get; set; }
        public decimal VolumeGNV { get; set; }
        public decimal VolumeLubrificantes { get; set; }
        public decimal MediaMargemVenda { get; set; }
        public string DiretorVenda { get; set; }
        public string GerenteVenda { get; set; }
        public string ConsultorVenda { get; set; }
        public string PlataformaAtual { get; set; }
        public decimal VolumeTotal { get; set; }
    }
}
