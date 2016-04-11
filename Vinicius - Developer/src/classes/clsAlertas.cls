public class clsAlertas{

	/*
	*	Quando o caso é fechado, o usuário proprietário é notificado
	*
	*/
	public static void alertaFechamentoCaso(List<Case> lstCasos){

		for(Case c : lstCasos){

			if(c.status == 'Fechado'){

				User emailUser = [SELECT EMAIL FROM USER WHERE ID =: c.OwnerId LIMIT 1];

				String emailUsuario  = String.valueof(emailUser.EMAIL);
				String assunto = 'Caso encerrado: nº caso' + String.valueof(c.casenumber);
				String descricao = 'O caso nº: ' + String.valueof(c.casenumber) + ' foi encerrado';

				clsEnviaEmail.enviaEmail(emailUsuario, assunto, descricao); 
			}
		}

	}

	/*
	*	Se o status antigo do caso for New e o usuário tentar encerrar, disparar um erro.
	*
	*/

	public static void alertaFechamentoCasoIndevido (List<Case> lstCasos, List<Case> listOldCases){

		for(Case c: lstCasos){
			//Set<ID> casesIds = new Set<ID>();
			for(Case cs : listOldCases){
				if(c.status == 'Fechado' && cs.status == 'New'){
					/*User emailUser = [SELECT EMAIL FROM USER WHERE ID =: c.OwnerId LIMIT 1];

					String emailUsuario  = String.valueof(emailUser.EMAIL);
					String assunto = 'Tentativa de encerrar caso indevidamente: nº caso' + String.valueof(c.casenumber);
					String descricao = 'O caso ' + String.valueof(c.casenumber) + ' foi encerrado indevidamente';

					clsEnviaEmail.enviaEmail(emailUsuario, assunto, descricao); */

					c.addError(' Você tentou encerrar um caso sem atualizações de status. Por gentileza atualize antes de encerrar');

				}
				
			}

		}
	}

	
}