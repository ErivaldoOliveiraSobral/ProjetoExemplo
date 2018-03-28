using System;
using System.Security.Permissions;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using Microsoft.SharePoint.Workflow;
using PortalDeFluxos.Core.BLL.Negocio;
using PortalDeFluxos.NOTIF.BLL.Modelo;

namespace PortalDeFluxos.NOTIF.SP.EventReceiver.SincronizarBD
{
    /// <summary>
    /// List Item Events
    /// </summary>
    public class SincronizarBD : SPItemEventReceiver
    {
        /// <summary>
        /// An item was updated.
        /// </summary>
        public override void ItemUpdated(SPItemEventProperties properties)
        {
            base.ItemUpdated(properties);

            //Efetua a sincronização da lista
            NegocioSincronizacao.SincronizarLista<ListaNOTIF>(properties, NegocioSincronizacao.Operacao.Atualizar, _ => _.CodigoItem == properties.ListItemId);
        }

        /// <summary>
        /// An item was deleted.
        /// </summary>
        public override void ItemDeleted(SPItemEventProperties properties)
        {
            base.ItemDeleted(properties);

            //Efetua a sincronização da lista
            NegocioSincronizacao.SincronizarLista<ListaNOTIF>(properties, NegocioSincronizacao.Operacao.Excluir, _ => _.CodigoItem == properties.ListItemId);
        }


    }
}