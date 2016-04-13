public class clsValidacoes {
    
   /*
    * Autor: Vinícius
    * Objetivo: Construir validações
    * Data de construção: 08/03/2016
	*/
    
    private static final clsValidacoes instance = new clsValidacoes();    

    private clsValidacoes(){}
     
    public static clsValidacoes getInstance() {
        return instance;
    }
    
    public static Boolean verificaPedidoCompra (String id){

		String idCarro = id;
		List <Pedido_Compra__c> pedidos = [SELECT ID, NAME FROM Pedido_Compra__c WHERE Codigo_Pedido__c =:idCarro];
		if (!pedidos.isEmpty()){
			return true;
		}
		else{
			return false;
		}
	}
    
    // Cria um caso caso o Pedido de compra esteja com status "Aguardando Pagamento"
    public static void criaAtivo (String id){
        
        //Instancio uma lista de casos
        List<Case> cs = new List<Case>();
        //Crio um caso vinculando o pedido de compra e alterando o assunto
        Case c;  //w Case (pedido_de_compra__c = id, Subject = 'Criando Ativo');
		c.pedido_de_compra__c = id;
        c.Subject = 'Criando Ativo';
       	//Adiciono a instancia criada em uma lista
        cs.add(c);
   		//Insiro a lista
        insert cs; 
       
    }
    
    // Atualiza os casos, caso existe um Pedido de compra com status "Concluído"
    public static void atualizaAtivo (String ids){
     		//instancio uma variavel do tipo Case e populo com as informações
       		Case caseids = [SELECT ID, Subject, Status FROM CASE WHERE pedido_de_compra__c =: ids LIMIT 1];
			//Atualizo os casos
            caseids.Subject = 'Caso Concluído';
            caseids.Status = 'Closed';
            update caseids;
    }

    //Calcula o prazo estimado que o atendente tem que realizar o encerramento do caso
    public static void calculaTempoAtendimento (List<Case> lstCasos){

        for(Case cs : lstCasos){
        	
        	if(cs.prazo__c != null){       	
	        	//Retorna o próximo dia util à partir do prazo estabelecido no caso            
	            cs.data_encerramento__c = ClsBusinessHours.retornaProximoDiaUtil(cs.prazo__c);
        	} 
                
        }
    }
}