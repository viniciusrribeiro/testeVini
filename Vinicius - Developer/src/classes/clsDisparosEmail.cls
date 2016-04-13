public class clsDisparosEmail {

	public static void disparaEmailAreaAcionada (String id){

 		List <Pedido_compra__c> p = [SELECT AREA_EMAIL__c FROM PEDIDO_COMPRA__C WHERE CODIGO_PEDIDO__C =: id];      
        //Carrego uma variável para conseguir buscar os resultados da query
        Pedido_compra__c ped = p[0];                       
        // exibe a area que será acionada
        System.debug('>>>>>>>' + ped);
        // Carrega a lista de parâmetros de e-mail de acordo com a área acionada
        List <Area_responsavel__c> area = new LIST <Area_Responsavel__c>([SELECT EMAIL_AREA__c,Area_responsa__c, CORPO_EMAIL__C FROM AREA_RESPONSAVEL__c WHERE ID =: PED.Area_Email__c LIMIT 1]);                    
        
        System.debug('Debug da Area Responsavel:'+ area);
       
       // Percorro o objeto e atribuo à classe de envio de e-mails, os parâmetros da área
        for(Area_responsavel__c resp : area){
       		if(resp.Area_responsa__c != null){
            	String email = String.valueof(resp.Email_Area__c);
                String corpoEmail = String.valueOf(resp.Corpo_Email__c);
                clsEnviaEmail.enviaEmail(email,'Carro aprovado:  ' +  id, corpoEmail);
            }
        }		
	}
	
	public static void disparaEmailAreaAcionadaCaso (List<Area_Responsavel__c> aResp, Case casenumber){

        for(Area_responsavel__c resp : aResp){
       		if(resp.Area_responsa__c != null){
            	String email = String.valueof(resp.Email_Area__c);
                String corpoEmail = String.valueOf(resp.Corpo_Email__c);
                String assunto = 'Você tem um caso escalonado,  nº ' + String.valueof(casenumber.CaseNumber);
                clsEnviaEmail.enviaEmail(email,assunto, corpoEmail);
            }
        }		
	}	
}