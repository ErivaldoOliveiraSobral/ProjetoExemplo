using PortalDeFluxos.Core.BLL.Dados;
using PortalDeFluxos.Core.BLL.Modelo;
using PortalDeFluxos.Core.BLL.Utilitario;
using System;
using System.Collections.Generic;
using System.Linq;
using Iteris;
using Microsoft.SharePoint.Client;

namespace PortalDeFluxos.Core.BLL.Negocio
{
    public static class NegocioRezoneamento
    {
        public static void Rezonear()
        {
            DadosRezoneamento.ObterEstruturasComerciaisModificadas();

            List<EstruturaComercial_Modificada> estruturasComerciaisModificadas = new EstruturaComercial_Modificada().Consultar(_ => _.Processado == false);
            List<Lista> listasRezoneamento = new Lista().Consultar(_ => _.Ambiente2007 == false);
            Usuario gerenteRegiaoAtual = null;
            Usuario gerenteTerritorioAtual = null;
            Usuario diretorVendasAtual = null;
            Usuario cdrAtual = null;
            Usuario gdrAtual = null;
            Boolean devQAS = PortalWeb.ContextoWebAtual.Url.ToLower().Contains("dev") || PortalWeb.ContextoWebAtual.Url.ToLower().Contains("qas");

            foreach (EstruturaComercial_Modificada estruturaComercial in estruturasComerciaisModificadas)
            {
                try
                {
                    #region [Obter Estrutura Comercial]

                    String mensagemObterEstrutura = String.Empty;
                    Boolean grCorreto = true;
                    Boolean gtCorreto = true;
                    Boolean dvCorreto = true;
                    Boolean cdrCorreto = true;
                    Boolean gdrCorreto = true;

                    gerenteRegiaoAtual = ObterResponsavel(estruturaComercial.GR, ref grCorreto, ref mensagemObterEstrutura);
                    gerenteTerritorioAtual = ObterResponsavel(estruturaComercial.GT, ref gtCorreto, ref mensagemObterEstrutura);
                    diretorVendasAtual = ObterResponsavel(estruturaComercial.DV, ref dvCorreto, ref mensagemObterEstrutura);
                    cdrAtual = ObterResponsavel(estruturaComercial.CDR, ref cdrCorreto, ref mensagemObterEstrutura);
                    gdrAtual = ObterResponsavel(estruturaComercial.GDR, ref gdrCorreto, ref mensagemObterEstrutura);

                    #endregion

                    Int32 _ibm = 0;
                    int.TryParse(estruturaComercial.IBM, out _ibm);
                    Int32 _siteCode = 0;
                    int.TryParse(estruturaComercial.SiteCode, out _siteCode);
                    Int32? ibm = _ibm; //Os filtros de busca devem ser nullables
                    Int32? siteCode = _siteCode;

                    foreach (Lista lista in listasRezoneamento)
                    {
                        List<EntidadePropostaSP> propostas = null;

                        if (ibm > 0) //A prioridade é rezonear por IBM
                        {
                            propostas = NegocioComum.ConsultarProposta(lista.CodigoLista, _ => _.Ibm == ibm);
                        }
                        else //Mas caso seja uma proposta sem IBM (Embandeiramento, NOTIF ou NTR), rezonear pelo Site Code.
                        {
                            if (siteCode > 0)
                            {
                                propostas = NegocioComum.ConsultarProposta(lista.CodigoLista, _ => _.SiteCode == siteCode);
                            }
                        }

                        if (propostas != null)
                        {
                            propostas.Where(_ => _.UtilizaZoneamentoPadrao == false).ToList().ForEach(proposta =>
                            {
                                proposta.GerenteTerritorio = gtCorreto && proposta.UtilizaZoneamentoGT == true ? gerenteTerritorioAtual : proposta.GerenteTerritorio;
                                proposta.GerenteRegiao = grCorreto && proposta.UtilizaZoneamentoGR == true ? gerenteRegiaoAtual : proposta.GerenteRegiao;
                                proposta.DiretorVendas = dvCorreto && proposta.UtilizaZoneamentoDiretor == true ? diretorVendasAtual : proposta.DiretorVendas;
                                proposta.Cdr = cdrCorreto && proposta.UtilizaZoneamentoCdr == true ? cdrAtual : proposta.Cdr;
                                proposta.Gdr = gdrCorreto && proposta.UtilizaZoneamentoGdr == true ? gdrAtual : proposta.Gdr;
                            });
                            propostas.Where(_ => _.UtilizaZoneamentoPadrao == true).ToList().ForEach(proposta =>
                            {
                                proposta.GerenteTerritorio = gtCorreto ? gerenteTerritorioAtual : proposta.GerenteTerritorio;
                                proposta.GerenteRegiao = grCorreto ? gerenteRegiaoAtual : proposta.GerenteRegiao;
                                proposta.DiretorVendas = dvCorreto ? diretorVendasAtual : proposta.DiretorVendas;
                                proposta.Cdr = cdrCorreto ? cdrAtual : proposta.Cdr;
                                proposta.Gdr = gdrCorreto ? gdrAtual : proposta.Gdr;
                            });
                            propostas.Atualizar(lista.CodigoLista);
                        }
                    }

                    estruturaComercial.Processado = true;
                    estruturaComercial.Atualizar();
                }
                catch (Exception ex)
                {
                    new Log().Inserir("NegocioRezoneamento", "Rezonear", ex);
                }
            }

            DadosRezoneamento.AtualizarEstruturaComercial();
            DadosRezoneamento.LimparEstruturaComercialModificada();
        }

        /// <summary>
        /// Atualiza a tabela EstruturaComercial_Salesforce com os dados encontrados no WS
        /// </summary>
        /// <param name="estruturasComerciaisSF_"></param>
        public static void AtualizarDadosSalesforce(List<DadosComercialSalesForce> estruturasComerciaisSF_)
        {
            DadosRezoneamento.LimparEstruturaComercialSalesForce();

            foreach (var estruturaComercial in estruturasComerciaisSF_)
            {
                try
                {
                    new EstruturaComercial_Salesforce()
                    {
                        IBM = estruturaComercial.Ibm,
                        SiteCode = estruturaComercial.SiteCode,
                        GT = estruturaComercial.GerenteTerritorio,
                        GR = estruturaComercial.GerenteRegiao,
                        DV = estruturaComercial.DiretorVendas,
                        CDR = estruturaComercial.Cdr,
                        GDR = estruturaComercial.Gdr
                    }.Inserir();
                }
                catch (Exception ex)
                {
                    new Log().Inserir(Origem.Servico, "AtualizarDadosSalesForce",
                        String.Format("IBM:{0},SiteCode:{1},GT:{2},GR:{3},DV:{4},CDR:{5},GDR:{6}"
                        , estruturaComercial.Ibm
                        , estruturaComercial.SiteCode
                        , estruturaComercial.GerenteTerritorio
                        , estruturaComercial.GerenteRegiao
                        , estruturaComercial.DiretorVendas
                        , estruturaComercial.Cdr
                        , estruturaComercial.Gdr), ex);
                }

            }
        }

        public static Usuario ObterResponsavel(String email, ref Boolean usuarioValido, ref String mensagem)
        {
            Usuario usuario = PortalWeb.ContextoWebAtual.BuscarUsuarioPorEmail(email, true,false);

            if (usuario ==  null)
            {
                usuarioValido = false;
                mensagem += "Email Incorreto:" + email + ";";
            }

            return usuario;
        }
    }
}
