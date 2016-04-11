/*********************** Informações de Criação ****************************/
/*
 * Objetivo: Disparar algumas verificações
 * Autor: @ViniciusReis
 * Data de criação: 05/04/2016
 */

/*********************** Atualizações ****************************/
/*
 * Motivo da atualização:
 * Autor: 
 * Data de atualização:
 */

/*********************** Inicio da Trigger ****************************/
/* 
 * Utilizo o before insert para que antes de inserir ele verifique se existe uma conta associada.
 * Acrescentei o before update para que caso precise atualizar, ou seja, o usuário remover a conta ou o contato da conta, 
 * o contato associe diretamente à alguma conta padrão
 */

trigger trgContato on Contact (before update, before insert) {
	
    if(Trigger.isBefore){
     	clsVerificaContato.associaContaContato(Trigger.new);
    }
}