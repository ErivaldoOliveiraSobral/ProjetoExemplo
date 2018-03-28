var aprovacaoDelegacaoTarefaNOTIF = new (function ($) {

    this.reloadEvents = new (function () {
        this.postback = function (sender, args) {
            aprovacaoDelegacaoTarefaNOTIF.events.load();
        };
    })();

    this.events = new (function () {

        this.load = function () {
        	aprovacaoDelegacaoTarefaNOTIF.events.loadGestaoNotificacoesEvent();
        	aprovacaoDelegacaoTarefaNOTIF.events.loadConfirmacaoRecebimentoEvent();
        };

        this.loadGestaoNotificacoesEvent = function () {
            if ($('select[id$="ddlFinalizarAcompanhamento"]').val() == "-1")
            	aprovacaoDelegacaoTarefaNOTIF.validation.aplicarRegraGestaoNotificacoes();

            $('select[id$="ddlFinalizarAcompanhamento"]').change(function () {
            	aprovacaoDelegacaoTarefaNOTIF.validation.aplicarRegraGestaoNotificacoes();
            });
        };

        this.loadConfirmacaoRecebimentoEvent = function () {

        	aprovacaoDelegacaoTarefaNOTIF.validation.aplicarRegraConfirmacaoRecebimento();

        	$('input[name$=rblOutcomes]:radio').change(function () {
        		aprovacaoDelegacaoTarefaNOTIF.validation.aplicarRegraConfirmacaoRecebimento();
        	});
        };
    });

    this.validation = new (function () {

    	this.aplicarRegraGestaoNotificacoes = function () {

    		var finalizarAcompanhamento = $('select[id$="ddlFinalizarAcompanhamento"]').val();

    		if (finalizarAcompanhamento == "False")
    			$(".gestao-notificacao").show();
    		else
    			$(".gestao-notificacao").hide();
    	}

    	this.aplicarRegraConfirmacaoRecebimento = function () {

    		var outcome = $('input[name$=rblOutcomes]:radio:checked').val();
    		
    		if (outcome == "Aprovar")
    			$('[id*=divConfirmacaoRecebimento]').show();
    		else
    			$('[id*=divConfirmacaoRecebimento]').hide();
    	};

        this.validarFormularioAprovacao = function () {
            var validacaoDefault = aprovacaoDelegacaoTarefa.validation.validarFormularioAprovacao();

            var divNotificacaoPadrao = $('[id*=divNotificacaoPadrao]').is(':visible');
            var ddlNotificacaoPadrao = $('[id*=ddlNotificacaoPadrao] option:selected').val();

            var divConfirmacaoRecebimento = $('[id*=divConfirmacaoRecebimento]').is(':visible');
            var ddlConfirmacaoRecebimento = $('[id*=ddlConfirmacaoRecebimento] option:selected').val();

            var divGestaoNotificacoes = $('[id*=divGestaoNotificacoes]').is(':visible');
            var ddlFinalizarAcompanhamento = $('[id*=ddlFinalizarAcompanhamento] option:selected').val();
            var ddlNotificacoes = $('[id*=ddlNotificacoes] option:selected').val();
            
            if (divNotificacaoPadrao == true) {
                if (ddlNotificacaoPadrao == "-1") {
                    $('#NotificacaoPadraoObrigatoria').show();
                    validacaoDefault = false;
                } else {
                    $('#NotificacaoPadraoObrigatoria').hide();
                }
            } else if (divConfirmacaoRecebimento == true) {
                if (ddlConfirmacaoRecebimento == "-1") {
                    $('#ConfirmacaoRecebimentoObrigatoria').show();
                    validacaoDefault = false;
                } else {
                    $('#ConfirmacaoRecebimentoObrigatoria').hide();
                }
            } else if (divGestaoNotificacoes == true) {

                if (ddlFinalizarAcompanhamento == "-1") {
                    $('#FinalizarAcompanhamentosObrigatoria').show();
                    validacaoDefault = false;
                } else if (ddlNotificacoes == "-1" && ddlFinalizarAcompanhamento == "False") {
                    $('#FinalizarAcompanhamentosObrigatoria').hide();
                    $('#SelecionarNotificacaoObrigatoria').show();
                    validacaoDefault = false;                
                } else {
                    $('#FinalizarAcompanhamentosObrigatoria').hide();
                    $('#SelecionarNotificacaoObrigatoria').hide();
                }
            }

            return validacaoDefault;
        };
    });
})(jQuery);

$(document).ready(function () {
    aprovacaoDelegacaoTarefaNOTIF.events.load();
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(aprovacaoDelegacaoTarefaNOTIF.reloadEvents.postback);
});