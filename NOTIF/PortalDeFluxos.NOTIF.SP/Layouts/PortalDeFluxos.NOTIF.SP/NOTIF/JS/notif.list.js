var raizenListNotif = new (function () {
	this.events = new (function () {
		this.LoadViewCustomizada = function (ctx) {
			var fieldOverride = {};
			fieldOverride.Templates = {};
			fieldOverride.Templates.Fields =
			{
				'Farol':
				{
					'View': raizenListNotif.events.LoadFarolCustomizado
				}
			};

			// Register the rendering template
			SPClientTemplates.TemplateManager.RegisterTemplateOverrides(fieldOverride);
		};
		this.LoadFarolCustomizado = function (ctx) {

			var _farol = ctx.CurrentItem.Farol;

			if (_farol == 'Amarelo') {
				return "<img src='/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/Img/FarolAmarelo.png'/>";
			}

			if (_farol == 'Verde') {
				return "<img src='/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/Img/FarolVerde.png'/>";
			}

			if (_farol == 'Vermelho') {
				return "<img src='/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/Img/FarolVermelho.png'/>";
			}

			if (_farol == 'Branco') {
				return "";
			}

			return ctx.CurrentItem.Priority;
		};
	});
});

raizenListNotif.events.LoadViewCustomizada();
