trigger trgPrimeiroObjeto on Primeiro_Objeto__c (before insert) {
    
    Primeiro_Objeto__c [] primeiro = Trigger.new;
    
    csPrimeiroObjeto.primeiroObjeto(primeiro);
    csPrimeiroObjeto.primeiroObjeto(primeiro);

}