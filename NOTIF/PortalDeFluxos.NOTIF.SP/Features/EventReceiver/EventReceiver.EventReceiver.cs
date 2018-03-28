using System;
using System.Runtime.InteropServices;
using Microsoft.SharePoint;
using System.Threading;
using PortalDeFluxos.Core.BLL;
using PortalDeFluxos.Core.BLL.Modelo;
using PortalDeFluxos.Core.BLL.Negocio;
using Microsoft.SharePoint.WebPartPages;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint.Client;
using System.Linq;

namespace PortalDeFluxos.NOTIF.SP.Features.EventReceiver
{
	/// <summary>
	/// This class handles events raised during feature activation, deactivation, installation, uninstallation, and upgrade.
	/// </summary>
	/// <remarks>
	/// The GUID attached to this class may be used during packaging and should not be modified.
	/// </remarks>

	[Guid("aa847a5a-5f11-453f-93d1-ef5a62979fa0")]
	public class EventReceiverEventReceiver : SPFeatureReceiver
	{
		// Uncomment the method below to handle the event raised after a feature has been activated.

		public override void FeatureActivated(SPFeatureReceiverProperties properties)
		{
			SPWeb web = GetFeatureWeb(properties);
			try
			{
				String nomeLista = "NOTIF";

				web.AllowUnsafeUpdates = true;
				//System.Diagnostics.Debugger.Launch();
				if (properties == null || web == null)
					return;

				SPList list = web.Lists.TryGetList(nomeLista);
				if (list != null)
				{
					list.ContentTypesEnabled = true;
					list.Update();

					#region [Adiciona o Script na webpart list]
					for (int i = 0; i < list.Views.Count; i++)
					{
						String urlPagina = web.Url + "/" + list.Views[i].Url;
						SPFile page = web.GetFile(urlPagina);

						using (SPLimitedWebPartManager lwpm = page.GetLimitedWebPartManager(PersonalizationScope.Shared))
						{
							try
							{
								// Enable the Update
								lwpm.Web.AllowUnsafeUpdates = true;

								// Check out the file, if not checked out
								SPFile file = lwpm.Web.GetFile(urlPagina);
								if (file.CheckOutType == SPFile.SPCheckOutType.None)
									file.CheckOut();

								foreach (System.Web.UI.WebControls.WebParts.WebPart wp in lwpm.WebParts)
								{
									if (wp is Microsoft.SharePoint.WebPartPages.XsltListViewWebPart)
									{
										Microsoft.SharePoint.WebPartPages.XsltListViewWebPart lfwp =
											(Microsoft.SharePoint.WebPartPages.XsltListViewWebPart)wp.WebBrowsableObject;
										lfwp.JSLink = "/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/JS/notif.List.js";
										lwpm.SaveChanges(lfwp);
									}
								}

								// Update the file
								file.Update();
								file.CheckIn("Atualização JSLink - NOTIF");

								// Disable the Unsafe Update
								lwpm.Web.AllowUnsafeUpdates = false;
							}
							finally
							{
								if (lwpm.Web != null)
								{
									lwpm.Web.Dispose(); // SPLimitedWebPartManager.Web object Dispose() called manually
								}
							}
						}
					}
					#endregion

				}
			}
			catch (Exception ex)
			{
				using (PortalWeb pweb = new PortalWeb(web.Url))
				{
					new Log().Inserir("RNIP", "EventReceiverEventReceiver", ex);
				}
			}
			finally
			{
				web.AllowUnsafeUpdates = false;
			}
		}

		private static SPWeb GetFeatureWeb(SPFeatureReceiverProperties properties)
		{
			SPWeb web = null;

			if (properties == null)
				throw new ArgumentNullException("properties");

			web = properties.Feature.Parent as SPWeb;

			// Defines the thread culture to match the current web culture. This is necessary to avoid issues on renaming
			// fields and list, as discussed here:
			// http://www.sharepointblues.com/2011/11/14/splist-title-property-spfield-displayname-property-not-updating/
			if (web != null)
				Thread.CurrentThread.CurrentUICulture = web.UICulture;

			return web;
		}

		// Uncomment the method below to handle the event raised before a feature is deactivated.

		//public override void FeatureDeactivating(SPFeatureReceiverProperties properties)
		//{
		//}


		// Uncomment the method below to handle the event raised after a feature has been installed.

		//public override void FeatureInstalled(SPFeatureReceiverProperties properties)
		//{
		//}


		// Uncomment the method below to handle the event raised before a feature is uninstalled.

		//public override void FeatureUninstalling(SPFeatureReceiverProperties properties)
		//{
		//}

		// Uncomment the method below to handle the event raised when a feature is upgrading.

		//public override void FeatureUpgrading(SPFeatureReceiverProperties properties, string upgradeActionName, System.Collections.Generic.IDictionary<string, string> parameters)
		//{
		//}
	}
}
