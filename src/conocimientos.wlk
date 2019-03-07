object programacionBasica { method commitsPorHora() = 5 }

object objetos { method commitsPorHora() = 12 }

object css { method commitsPorHora() = 40 }

object basesDeDatos { method commitsPorHora() = 8 }

object html { method commitsPorHora() = 18 }

object disenioConObjetos { method commitsPorHora() = 10 }

object manejoDeGrupos { method commitsPorHora() = 0 }

object instalacionLinux { method commitsPorHora() = 2 }

object cumbre{

	var participantes=[]

	const paisesAuspiciantes=[]

	var commits

	method paisesAuspiciantes(paises){
		paisesAuspiciantes.add(paises)
	}

	method registrarIngreso(_participante){
		participantes.add(_participante)
	}	

	method paisesParticipantes(){
		return participantes.map{p=>p.pais()}
	}

	method cantParticipantesPais(pais){
		return participantes.filter({p=>p.pais()==pais}).size()
	}

	method paisConMasParticipantes(){
		return participantes.max({p=>p.pais()})
	}

	method conjDeParticipantesExtranj(){
		return participantes.filter{p=>p.pais()!=(paisesAuspiciantes)}
	}

	method esRelevante(){
		return participantes.all{p=>p.escape()}
	}

	method esConflictivo(pais){
		return paisesAuspiciantes==pais.paisRegistrado()
	}

	method paisesAuspiciantes(){
		return paisesAuspiciantes
	}

	method requisitoDeAcceso(){
		return 0 
	}

	method setCantCommits(_commits){
		commits=_commits
	}

	method cantCommits(){
		return commits
	}
	method accesoRestringido(participante){
		return 0
	}
	method puedeIngresar(){
		return 0
	}
	method participantesConflictivos(participante){
		return participante.pais()!=paisesAuspiciantes
	}

}
	
class Pais{

	var pais
	
	
	
	method registrarConflicto(_pais){
		pais=_pais
	}
	method paisResgistrado(){
		return pais
	}
}

class Participante{

	var pais
	
	var conocimientos=[]
	
	var commits
	
	method setPais(_pais){
		pais=_pais
	}
	
	method pais(){
		return pais
	}
	
	method conocimientos(_conocimientos){
		conocimientos.add(_conocimientos)
	}
	
	method setCommits(_commits){
		commits=_commits
	}
	
	method commits(){
		return commits
	}
	
	method escape(){
		return 0
	}
		
	method requisitoDeAcceso(cumbre){
		return conocimientos.contains({p=>p.programacionBasica()})
	}
	
}

class Programador inherits Participante{
	
	override method escape(){
		return (commits>500)
	}
	
	override method requisitoDeAcceso(cumbre){
		return super(cumbre) 
		and cumbre.cantCommits() <= commits}
}
class Especialista inherits Programador{
	
	override method escape(){
		return (conocimientos.size()>2)
	}
	
	override method requisitoDeAcceso(cumbre){
		return super(cumbre)-100 
		and conocimientos.contains({p=>p.disenioConObjetos()}) 
		
	}
}

class Gerente inherits Participante{
	
	var empresa
	
	
	override method escape(){
		return empresa.progEscapo()
	}
	
	method trabajaen(_empresa){
		empresa=_empresa
	}
	
		
	//override method escape(){}
}
class Empresa{
	var pais=[]
	method addpais(paises){
		pais.add(paises)		
	}
	method progEscapo(){
		return pais.size()>3
	}
}