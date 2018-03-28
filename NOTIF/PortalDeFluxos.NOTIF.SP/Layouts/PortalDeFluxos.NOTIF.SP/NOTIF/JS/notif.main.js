var notif = new (function ($) {

	this.reloadEvents = new (function () {
		this.postback = function (sender, args) {
			notif.events.load();
		};
	})();

	this.events = new (function () {
		this.load = function () {
			
			$("input:disabled").not(":checkbox").not(":radio").not('[id$=uppFormularioAprovacao] input').not('[id*=sp_UtilizaZoneamentoPadrao]').prop('readonly', true).removeAttr('disabled');
			$("textarea:disabled").not('[id$=uppFormularioAprovacao] input').not('[id*=sp_UtilizaZoneamentoPadrao]').prop('readonly', true).removeAttr('disabled');
			$('select[id$="bd_Proposta_AprovadoEnvioKit"]').attr('disabled', 'disabled').removeAttr('required').removeClass("raizenError");

			notif.events.loadMercadoEvent();
			notif.proposta.aplicarRegraMercado();

			notif.events.loadTipoNotificacaoEvent();
			notif.proposta.aplicarRegraTipoNotificacao();
		};
		this.loadMercadoEvent = function () {
			$('select[id$="bd_Mercado"]').change(function () {
				notif.proposta.aplicarRegraMercado();
			});
		};
		this.loadTipoNotificacaoEvent = function () {
			$('select[id$="bd_TipoNotificacao"]').change(function () {
				notif.proposta.aplicarRegraTipoNotificacao();
			});
		};
	});

	this.proposta = new (function () {
		this.aplicarRegraMercado = function () {
			
			if ($('select[id$="bd_Mercado"]').val() == "0") {//Varejo
				$('input[id$="bd_Cnpj"]').prop('readonly', true);
				$('input[id$="sp_RazaoSocial"]').prop('readonly', true);

				$(".camposEspVarejo").show();
				$('input[id$="bd_Endereco"]').attr('required', '').show();
				$('input[id$="bd_Cep"]').attr('required', '').show();
				$('input[id$="bd_Bairro"]').attr('required', '').show();
				$('input[id$="bd_UF"]').attr('required', '').show();
				$('input[id$="bd_Cidade"]').attr('required', '').show();
			} else {
				if ($('[id$=btnIniciar]').is(':visible'))
				{
					$('input[id$="bd_Cnpj"]').prop('readonly', false);
					$('input[id$="sp_RazaoSocial"]').prop('readonly', false);
				}				

				$(".camposEspVarejo").hide();
				$('input[id$="bd_Endereco"]').removeAttr('required').removeClass("raizenError").val('').hide();
				$('input[id$="bd_Cep"]').removeAttr('required').removeClass("raizenError").val('').hide();
				$('input[id$="bd_Bairro"]').removeAttr('required').removeClass("raizenError").val('').hide();
				$('input[id$="bd_UF"]').removeAttr('required').removeClass("raizenError").val('').hide();
				$('input[id$="bd_Cidade"]').removeAttr('required').removeClass("raizenError").val('').hide();
			}
		};
		this.aplicarRegraTipoNotificacao = function () {
			var tipoNotificacaoSelecionado = $('select[id$="bd_TipoNotificacao"]').val();
			if (tipoNotificacaoSelecionado == "99") {//Outro
				$(".campoTipoNotificacaoOutro").show();
				$('input[id$="bd_OutroTipoNotificacao"]').attr('required', '');
				
			} else {
				$(".campoTipoNotificacaoOutro").hide();
				$('input[id$="bd_OutroTipoNotificacao"]').removeAttr('required').removeClass("raizenError").val('');				
			}

			$('[id$="divConsumo"]').hide();
			$('[id$="divStatusLoja"]').hide();
			if (tipoNotificacaoSelecionado == "0" || tipoNotificacaoSelecionado == "1")//NTI ou Compra Zero 
				$('[id$="divConsumo"]').show();
			else if (tipoNotificacaoSelecionado == "2")//Fee Dobrado
				$('[id$="divStatusLoja"]').show();

			if ((tipoNotificacaoSelecionado == "0" || tipoNotificacaoSelecionado == "2") && $('[id$="grvNotificacoes"] tr').length > 4)//NTI ou Fee Dobrado
				$('[id$="btnIncluirNoficacao"]').hide();
			else
				$('[id$="btnIncluirNoficacao"]').show();
		};
	});

	this.dadosNotificacao = new (function () {
		this.isValid = function () {
			var retorno = true;

			if ($('[id*=bd_DataNotificacao]').val() == '') {
				retorno = false;
				$('[id*=bd_DataNotificacao]').addClass('raizenError');
			} 
			if ($('[id*=bd_DataInicioContrato]').val() == '') {
				retorno = false;
				$('[id*=bd_DataInicioContrato]').addClass('raizenError');
			}
			if ($('[id*=bd_DataFimContrato]').val() == '') {
				retorno = false;
				$('[id*=bd_DataFimContrato]').addClass('raizenError');
			}

			return retorno;
		};
	});

})(jQuery);

$(document).ready(function () {
	raizenForm.style.loadCustomMaskControls();
	notif.events.load();
	Sys.WebForms.PageRequestManager.getInstance().add_endRequest(notif.reloadEvents.postback);
});