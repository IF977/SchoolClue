class Dados
   def initialize
       @response = HTTParty.get("http://dados.recife.pe.gov.br/api/action/datastore_search_sql?sql=SELECT%20DISTINCT%20CE.nome%20,%20AC.nome_atividade%20,%20CE.telefone%20,%20CE.email%20from%20%221a6c0999-7ae4-428f-9020-d60186d6dc01%22%20CT%20,%20%22bb8b70d4-4204-40d3-bc77-409a1651b8b9%22%20CE%20,%20%22bb1183a0-dac1-474a-8579-3137294ef942%22%20AC%20WHERE%20CT.inep_escola%20=%20CE.inep_escola%20and%20AC.codigo_atividade%20=%20CT.codigo_atividade1")
       #print(@response)
       #return JSON.parse @response.body
   end
   def results
       return (JSON.parse @response.body)["results"]
   end
end
