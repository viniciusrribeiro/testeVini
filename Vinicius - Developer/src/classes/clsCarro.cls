public class clsCarro {

   /*   public clsCarro(){
      Carro__C carro = 
      	 [SELECT ID, name, COR__C, DALTONICO__C, PLACA__C 
       	    	FROM CARRO__c 
          			WHERE id =:ApexPages.currentPage().getParameters().get('id')];
        
    }
   
    public PageReference save(){
         Carro__c car = 
             	[SELECT ID, NAME, COR__C, DALTONICO__C, PLACA__C 
                	FROM CARRO__C 
                	 	WHERE ID=: ApexPages.currentPage().getParameters().get('id')];

        car.Cor__c = car.Cor__c;
        car.Daltonico__c = car.Daltonico__c;
        car.Placa__c = car.Placa__c;
        sdadsada
        update car;   aaaaaaa
        return null;
    } */
    
    public static void mudarCor(Carro__c[] car){
        
       for (Carro__c carro : car){  
            if(carro.daltonico__c == true){
                if (carro.cor__c == 'branco'){
                   	 carro.Cor__c = 'Vermelho';
                }
                else if 
                    (carro.Cor__c == 'Amarelo'){
                        carro.Cor__c = 'Verde';
                    }
           }
            else {
               
            }
        }
    }
    /*
    public static void aprovarCarro(Carro__C[] car){
        for(Carro__c carro : car){ 
               List<Pedido_Compra__c> ped = [SELECT ID, NAME, STATUS__C, CODIGO_PEDIDO__C FROM PEDIDO_COMPRA__C LIMIT 1];
           	   
            	for(Pedido_Compra__c p : ped){
                    if(carro.Aprovado__c =='Em Aprovação'){
                       p.Status__c = 'Aguardando Pagamento';
                    }
                    else if (carro.Aprovado__c == 'Aprovado'){
                       p.Status__c = 'Concluído';
                    }
                    else if (carro.Aprovado__c == 'Reprovado'){
                       p.Status__c = 'Cancelado';
          	 		}		
              }
            
        }
    }
  */  
    
}