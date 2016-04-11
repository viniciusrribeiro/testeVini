public class csPrimeiroObjeto {
    
    public static void primeiroObjeto (Primeiro_Objeto__c [] primeiro){
        
        for (Primeiro_Objeto__c ps: primeiro){
            if (ps.Name == ps.Teste__c){
                ps.Name  = 'entrou no if teste';
            }
        	else {
            	ps.Name = 'não entrou no if';
            }
        }
     }
}