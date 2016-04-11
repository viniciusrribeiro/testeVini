trigger trgPedidoCompra on Pedido_Compra__c (before update, after update) {
    
    if(Trigger.isUpdate){
    
        for(Pedido_compra__c p: Trigger.new){
            
            if(p.Status__c == 'Aguardando Pagamento'){
                
                clsValidacoes.criaAtivo(p.Id);
                clsDisparosEmail.disparaEmailAreaAcionada(p.Codigo_Pedido__c);
            }
            else if(p.Status__c == 'Concluído'){
                
                clsValidacoes.atualizaAtivo(p.id);
            }
        }
    }

}