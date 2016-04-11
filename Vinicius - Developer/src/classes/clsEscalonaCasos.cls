/*
* Descrição: Classe para escalonamento
* Autor: @ViniciusReis
* Data de criação: 11/04/2016
*/
public with sharing class clsEscalonaCasos {
	
/*
* Descrição: metodo que escalona para fila de acordo com as infos do caso
* Autor: @ViniciusReis
* Data de criação: 11/04/2016
*/
	
	public static void escalonaFilaAtendimento (List<Case> lstCasos){
		
		for(Case c : lstCasos){			
			if(c.escalonar__c == true && c.status != 'Fechado'){
				if(c.escalonar_para__c != null){
					Area_Responsavel__c [] ar = [SELECT ID, Area_responsa__c FROM Area_Responsavel__c WHERE ID =: c.escalonar_para__c LIMIT 1];
					String arp = ar[0].Area_responsa__c;
					
					Group [] fila = [SELECT ID FROM GROUP WHERE NAME =: arp LIMIT 1];
					
					c.ownerId = fila[0].id;
					
					clsDisparosEmail.disparaEmailAreaAcionadaCaso(ar, c.casenumber);		
				}
			}
		}
	}
    
}