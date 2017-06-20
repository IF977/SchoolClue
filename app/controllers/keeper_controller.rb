class KeeperController < ApplicationController
  
  def index
  end

  def form
  end

  def rank
    @keeper = Keeper.new
    @schools_in_range = @keeper.google(params)
    @schools_in_open_data = @keeper.dadosAbertos
    @schools_final_list = Array.new
    
    for school_in_google in @schools_in_range
      @discipline_list = Array.new
      for school_in_dados in @schools_in_open_data
        if comparestring( ActiveSupport::Inflector.transliterate(school_in_google["name"]).downcase, ActiveSupport::Inflector.transliterate(school_in_dados["nome"]).downcase)
          @discipline_list.push(school_in_dados)
        end
      end
      school_in_google["atividades_complementares"] = @discipline_list
      @schools_final_list.push(school_in_google)
    end
    @schools_final_list = @schools_final_list.sort_by{ |v| (params.keys & (v["atividades_complementares"].map{|x|x["nome_atividade"]})).empty? ? v["geometry"]["location"]["distance"] : 0.0 }
  end
  
  def contato
  end
  
  private
  require 'active_support/inflector'
  def comparestring(s1, s2)
    @count=0
    if s1.split.length>=s2.split.length
        @smaior=s1
        @smenor=s2
        @tamanho = s2.split.length
    else
       @smaior = s2
       @smenor = s1
       @tamanho = s1.split.length
    end
    for x in @smenor.split
        if @smaior.include?x
        @count +=1
        end
    end
  
    if @count == @tamanho
        return true
    else
        return false
        
    end
  end
end

