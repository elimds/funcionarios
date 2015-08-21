class AutenticacaoFilters {
 
    def Filters = {
        FiltroAcesso(controller:'*',action:"(create|edit|update|delete|save|index|show)"){
            before = {
                if(!session.user && !actionName.equals('login')){
                    redirect(controller:'user', action:'login')
                    return false
                }
                return true
            }
        }
    }
}