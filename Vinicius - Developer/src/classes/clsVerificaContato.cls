/*
 * Objetivo: Criar verificações para Conta e Contato
 * Autor: @ViniciusReis
 */

public class clsVerificaContato {
    
    /*
     * Método: associaContaContato
     * Objetivo: Associar uma conta padrão ao contato caso no momento da criação não seja associada nenhuma conta
     * Autor: @ViniciusReis
     * Data de criação: 05/04/2016
     */ 
    
    public static void associaContaContato(List<Contact> lstContatos){
        
        for(Contact c: lstContatos){
            
            Account ac = [SELECT ID FROM ACCOUNT WHERE CONTA_PADRAO__C = TRUE LIMIT 1];
            
            if(c.AccountId == null){
               	c.AccountId = ac.id;
              
            }           
        }
    }
    
    public static void verificaOportunidade(List<Opportunity> lstOpp){
        
        for(Opportunity opp : lstOpp){
            
           List<Opportunity> newListOpp = new List<Opportunity>();
            
            if(opp.AccountId != null){
                
                opp.Possui_conta__c = true;
                
                newListOpp.add(opp);
            }
           insert newListOpp;
        }
    }
}