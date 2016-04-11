trigger trgCaso on Case (after update, before update, before insert){

	if(trigger.isUpdate){
		if(trigger.isAfter){
			clsAlertas.alertaFechamentoCaso(Trigger.new);
			clsAlertas.alertaFechamentoCasoIndevido(Trigger.new, Trigger.old);
			
		}

		else if (trigger.isBefore){

			clsBusinessHours.calculaTempoAtendimento(Trigger.new);
		}
	}

	else if(trigger.isInsert){

		if(trigger.isbefore){

			clsBusinessHours.calculaTempoAtendimento(Trigger.new);		
		}
	}
}