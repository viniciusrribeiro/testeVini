trigger trgCaso on Case (after update, before update, before insert){

	if(trigger.isUpdate){
		if(trigger.isAfter){
			clsAlertas.alertaFechamentoCaso(Trigger.new);
			clsAlertas.alertaFechamentoCasoIndevido(Trigger.new, Trigger.old);
		}
		else if (trigger.isBefore){
			clsValidacoes.calculaTempoAtendimento(Trigger.new);
			clsEscalonaCasos.escalonaFilaAtendimento(Trigger.new);
		}
	}
	else if(trigger.isInsert){
		if(trigger.isbefore){
			clsValidacoes.calculaTempoAtendimento(Trigger.new);		
		}
	}
}