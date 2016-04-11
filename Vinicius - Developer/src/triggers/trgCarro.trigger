trigger trgCarro on Carro__c (before insert, after insert, after update, before update) {
    
   /*
    * Autor: Vinícius
    * Objetivo: Construção de um workflow com disparos de e-mail verificando listas relacionadas
    * Data de construção: 08/03/2016
    */ 
    	
  		for (Carro__c c : Trigger.new){
            //Salvamos o id do registro - Objeto Carro
            String carroId = c.id; 
            
            if(Trigger.isUpdate){
                //Validamos para verificar se já existe um produto de compra atrelado
                if(clsValidacoes.verificaPedidoCompra(carroid) == true){                   
                    //Se houver, dispara o workflow
                    if(c.Aprovado__c != Trigger.oldMap.get(c.Id).Aprovado__c && c.Aprovado__c == 'Aprovado'){
						//Metodo que dispara e-mail para a área acionada
                        clsDisparosEmail.disparaEmailAreaAcionada(carroId);
                    }
                }
            	// Se tentar aprovar um carro sem pedido de compra, avisa o usuário
                else{
				
                     if(c.Aprovado__c != Trigger.oldMap.get(c.Id).Aprovado__c && c.Aprovado__c == 'Aprovado'){    
                            c.addError(' Não é possível aprovar sem um Pedido de compra');
                    }
                }
            }
            
            else if(Trigger.isInsert){
                 // Se o carro for novo
                if (clsValidacoes.verificaPedidoCompra(carroid) == false && c.Aprovado__c == 'Novo' ){                
                    
                    clsEnviaEmail.enviaEmail('viniciusrr96@gmail.com', 'Foi gerado um novo carro, favor criar o pedido!', 'else if' );
                }
   		 } 	
     }
}